import { Router } from 'express'
var connection = require('../configs/sequelize')

const router = Router()

router.get('/reservations/:email', function (req, res, next) {
  const email = req.params.email
  const query = 'SELECT * FROM reserves_occupies_reservation R '+
                'INNER JOIN LandsAt_TakesOff_Flight F ON '+
                '(R.flight_no = F.flight_no AND R.airline = F.airline) '+
                'WHERE email = :email ;'
  console.log('retrieving reservations... for ' + email)
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        email: email
      }
    })
    .then(reservations => {
      console.log (reservations)
      if (reservations.length > 0) {
        res.send(reservations)
      } else {
        res.status(404).json({})
      }
    })
    .catch(e => {
      res.status(404).json({})
    })
})

router.get('/reservations/cancel/:reservation', function (req, res, next) {
  const reservation_id = req.params.reservation

  const updateSeatsQRY = 'UPDATE Has_Seats_4 SET Reserved = 0 ' +
                         'WHERE (seat_no, flight_no, airline) in ' +
                            '(SELECT seat_no, flight_no, airline ' +
                             'FROM Reserves_Occupies_Reservation WHERE reservation_id = :reservation_id);'

  connection.query(updateSeatsQRY,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        reservation_id: reservation_id
      }
    })
    .then(result => {
      console.log('has_seats_4 update successful')
    })
    .catch(e => {
      res.send(e) //assert that no errors occured while updating has_seats_4
    })

  const query = 'DELETE FROM reserves_occupies_reservation WHERE reservation_id = :reservation_id ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        reservation_id: reservation_id
      }
    })
    .then(result => {
      if (result) {
        res.send(result)
      } else {
        res.status(404).json({})
      }
    })
})

// Employee if they need to see all reservations (but this may be massive)
router.get('/reservations/all', function (req, res, next) {
  const query = 'SELECT * FROM reserves_occupies_reservation; '
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
    })
    .then(reservations => {
      if (reservations) {
        res.json(reservations)
      } else {
        res.status(404).json({})
      }
    })
})

export default router
