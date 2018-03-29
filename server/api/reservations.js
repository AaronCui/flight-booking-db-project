import { Router } from 'express'
var connection = require('../configs/sequelize')

const router = Router()

router.get('/reservations/:email', function (req, res, next) {
  const email = req.params.email
  const query = 'SELECT * FROM reserves_occupies_reservation WHERE email = :email ;'
  console.log('retrieving reservations... for ' + email)
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        email: email
      }
    })
    .then(reservations => {
      if (reservations) {
        console.log('Retrieved first reservation is ' + reservations[0].reservation_id)
        res.json(reservations)
      } else {
        res.status(404).json({})
      }
    })
})

router.get('/reservations/cancel/:reservation', function (req, res, next) {
  const reservation_id = req.params.reservation_id
  const query = 'DELETE FROM reserves_occupies_reservation WHERE reservation_id = :reservation_id ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        reservation_id: reservation_id
      }
    })
    .then(res => {
      if (reservations) {
        res.json(reservations)
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
