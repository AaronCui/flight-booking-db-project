import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* GET phone numbers of customers who have ordered all promotion items */
router.get('/analytics/divide', function (req, res, next) {
  console.log('Division query...');
  const query = 'SELECT C.phone_no ' +
    'FROM Customer C ' +
    'WHERE C.email IN ' +
    '(SELECT R.email ' +
    'FROM Reserves_Occupies_Reservation R ' +
    'WHERE NOT EXISTS ' +
    '(SELECT P.promotion_id ' +
    'FROM Promotion_Item P ' +
    'EXCEPT ' +
    'SELECT I.promotion_id ' +
    'FROM Reserves_Promotion_Item I ' +
    'WHERE I.reservation_id = R.reservation_id));';

  connection.query(query, {
    type: connection.QueryTypes.SELECT
  })
    .then((result) => {
      console.log(result);
      res.json(result);
    })
    .catch((e) => {
      console.log(e);
      res.status(400).send(e.message);
    })
})

/* INSERT new promotion item */
router.post('/analytics/newpromo', bodyParser.json(), function (req, res, next) {
  console.log('Inserting new promo item...');
  const promotion_id = req.body.data.promotion_id;
  const promotion_item = req.body.data.promotion_item;
  const query = 'INSERT INTO promotion_item(promotion_id, promotion_item) ' +
    'VALUES (:promotion_id, :promotion_item);';

  connection.query(query, {
    type: connection.QueryTypes.INSERT,
    replacements: {
      promotion_id: promotion_id,
      promotion_item: promotion_item
    }
  })
    .then((result) => {
      console.log(result);
      res.status(200).send('Promotion item successfully added.');
    })
    .catch((e) => {
      console.log(e);
      res.status(400).send('Failed to add promotion item. Please try again.');
    })
})

/* Search minimum average price of all flight seats of some class and date range between 
2 locations grouped by date to show which dates are cheapest on average */,
router.post('/analytics/minavg', bodyParser.json(), function (req, res, next) {
  console.log('Finding minimum average price of all flight seats of some class')
  const start_date = req.body.data.start_date;
  const end_date = req.body.data.end_date;
  const seat_class = req.body.data.seat_class;
  const source = req.body.data.source;
  const destination = req.body.data.destination;

  const query = 'SELECT LTF.date, AVG(HS3.seat_price) ' +
    'FROM LandsAt_TakesOff_Flight LTF ' +
    'INNER JOIN Has_Seats_3 HS3 ' +
    'ON LTF.date = HS3.date ' +
    'AND LTF.flight_no = HS3.flight_no ' +
    'AND LTF.airline = HS3.airline ' +
    'WHERE HS3.date >= :start_date ' +
    'AND HS3.date <= :end_date ' +
    'AND LTF.takesOff_airport = :source ' +
    'AND LTF.landsAt_airport = :destination ' +
    'AND HS3.seat_class = :seat_class ' +
    'GROUP BY LTF.date ' +
    'HAVING AVG(HS3.seat_price) <= ALL( ' +
    'SELECT AVG(HS3.seat_price) ' +
    'FROM LandsAt_TakesOff_Flight LTF ' +
    'INNER JOIN Has_Seats_3 HS3 ' +
    'ON LTF.date = HS3.date ' +
    'AND LTF.flight_no = HS3.flight_no ' +
    'AND LTF.airline = HS3.airline ' +
    'WHERE HS3.date >= :start_date ' +
    'AND HS3.date <= :end_date ' +
    'AND LTF.takesOff_airport = :source ' +
    'AND LTF.landsAt_airport = :destination ' +
    'AND HS3.seat_class = :seat_class ' +
    'GROUP BY LTF.date) '

  connection.query(query, {
    type: connection.QueryTypes.SELECT,
    replacements: {
      start_date: start_date,
      end_date: end_date,
      source: source,
      destination: destination,
      seat_class: seat_class
    }
  })
    .then((result) => {
      console.log(result);
      res.json(result)
    })
    .catch((e) => {
      console.log(e);
      res.status(400).send(e.message)
    })
})

/* Search maximum average price of all flight seats of some class and date range between 
2 locations grouped by date to show which dates are cheapest on average */,
router.post('/analytics/maxavg', bodyParser.json(), function (req, res, next) {
  console.log('Finding minimum average price of all flight seats of some class')
  const start_date = req.body.data.start_date;
  const end_date = req.body.data.end_date;
  const seat_class = req.body.data.seat_class;
  const source = req.body.data.source;
  const destination = req.body.data.destination;

  const query = 'SELECT LTF.date, AVG(HS3.seat_price) ' +
    'FROM LandsAt_TakesOff_Flight LTF ' +
    'INNER JOIN Has_Seats_3 HS3 ' +
    'ON LTF.date = HS3.date ' +
    'AND LTF.flight_no = HS3.flight_no ' +
    'AND LTF.airline = HS3.airline ' +
    'WHERE HS3.date >= :start_date ' +
    'AND HS3.date <= :end_date ' +
    'AND LTF.takesOff_airport = :source ' +
    'AND LTF.landsAt_airport = :destination ' +
    'AND HS3.seat_class = :seat_class ' +
    'GROUP BY LTF.date ' +
    'HAVING AVG(HS3.seat_price) >= ALL( ' +
    'SELECT AVG(HS3.seat_price) ' +
    'FROM LandsAt_TakesOff_Flight LTF ' +
    'INNER JOIN Has_Seats_3 HS3 ' +
    'ON LTF.date = HS3.date ' +
    'AND LTF.flight_no = HS3.flight_no ' +
    'AND LTF.airline = HS3.airline ' +
    'WHERE HS3.date >= :start_date ' +
    'AND HS3.date <= :end_date ' +
    'AND LTF.takesOff_airport = :source ' +
    'AND LTF.landsAt_airport = :destination ' +
    'AND HS3.seat_class = :seat_class ' +
    'GROUP BY LTF.date) '

  connection.query(query, {
    type: connection.QueryTypes.SELECT,
    replacements: {
      start_date: start_date,
      end_date: end_date,
      source: source,
      destination: destination,
      seat_class: seat_class
    }
  })
    .then((result) => {
      console.log(result);
      res.json(result)
    })
    .catch((e) => {
      console.log(e);
      res.status(400).send(e.message)
    })
})

/*Find the sum of counts of seats grouped by reserved status over a date range
 to see the total number of reserved and open seats over a date range. */
router.post('/analytics/sumcount', bodyParser.json(), function (req, res, next) {
  console.log('Finding the sum of all counts of seats grouped by ' +
    'reserved status over a date range')
  const start_date = req.body.data.start_date;
  const end_date = req.body.data.end_date;

  const query = 'SELECT Temp.reserved, SUM(Temp.count)' +
    'FROM (SELECT HS4.date, HS4.reserved, COUNT(*) ' +
    'FROM Has_Seats_4 HS4 ' +
    'GROUP BY HS4.date, HS4.reserved) Temp ' +
    'WHERE Temp.date >= :start_date ' +
    'AND Temp.date <= :end_date ' +
    'GROUP BY Temp.reserved '

  connection.query(query, {
    type: connection.QueryTypes.SELECT,
    replacements: {
      start_date: start_date,
      end_date: end_date
    }
  })
    .then((result) => {
      console.log(result);
      res.json(result)
    })
    .catch((e) => {
      console.log(e);
      res.status(400).send(e.message)
    })
})

export default router
