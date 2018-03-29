import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

router.post('/book/confirm', bodyParser.json(), function (req, res, next) {
  console.log('Booking flight...');
  const d = new Date()
  // ideally we'd add more specific data like user email to avoid collision, but it gets too long, need to change db
  // Or simply use a library for UUID generator
  const reservation_id = d.getDate() + d.getMinutes() + d.getSeconds() + d.getMilliseconds()
  const email = req.body.data.email;
  const seat_no = req.body.data.seat_no;
  const flight_no = req.body.data.flight_no;
  const airline = req.body.data.airline;
  const date = req.body.data.date;
  const luggages = req.body.data.luggages;
  const mealpref = req.body.data.meal_pref;

  const query =
    'INSERT INTO reserves_occupies_reservation(reservation_id, email, seat_no, flight_no, airline, date, luggages, meal_pref) ' +
    'VALUES (:reservation_id, :email, :seat_no, :flight_no, :airline, :date, :luggages, :meal_pref);';
  connection.query(query, {
    type: connection.QueryTypes.INSERT,
    replacements: {
      reservation_id: reservation_id,
      email: email,
      seat_no: seat_no,
      flight_no: flight_no,
      airline: airline,
      date: date,
      luggages: luggages,
      meal_pref: mealpref
    }
  })
    .then((result) => {
      console.log(result);
      res.send('Booking successful!')
    })
    .catch((e) => {
      console.log(e);
      res.send('Unable to book your seat. Please try again.');
    })
})

router.post('/book/update-seat', bodyParser.json(), function (req, res, next) {
  console.log('Updating a booked seat...')
  const flight_no = req.body.data.flight_no
  const airline = req.body.data.airline
  const date = req.body.data.date
  const seat_no = req.body.data.seat_no
  const reserved = req.body.data.reserved

  const query =
    'UPDATE has_seats_4 ' +
    'SET reserved = :reserved ' +
    'WHERE flight_no = :flight_no AND airline = :airline AND date = :date AND seat_no = :seat_no;';
  connection.query(query, {
    type: connection.QueryTypes.UPDATE,
    replacements: {
      flight_no: flight_no,
      airline: airline,
      date: date,
      seat_no: seat_no,
      reserved: reserved
    }
  })
    .then((result) => {
      console.log(result)
      res.send('Seat reservation successful!')
    })
    .catch((e) => {
      console.log(e)
      res.send('Unable to reserve your seat. Please try again.')
    })
})

export default router
