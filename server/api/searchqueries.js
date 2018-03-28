import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/* display Flights based on search params */
router.post('/search/flights', bodyParser.json(), function (req, res, next) {
  console.log ("Searching flight...");
  let select = req.body.data.colsSelected;
  select = select.join(", ");
  const queryParams = req.body.data.queryParams;
  const where = Object.keys(queryParams).map(function (x) {return x + ' = ' + queryParams[x]}).join(' AND ');
  const query =
      'SELECT ' + select + ' ' +
      'FROM landsat_takesoff_flight ' +
      'WHERE ' + where + ';';
  console.log(query);
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT
    })
    .then(result => {
      res.json(result)
      console.log(result)
    })
    .catch(e => {
      res.status(400).send(e.message)
    })
})

/* get all open seats given some flight information */
router.get('/search/open-seats', function (req, res, next) {
  console.log('Listing flights...');
  const flight_no = req.query.flightno;
  const airline = req.query.airline;
  const date = req.query.date;
  const query =
    /*
     * LTF primary key: (flight_no, airline, date)
     * HS1 primary key: seat_no
     * HS3 primary key: (seat_class, flight_no, airline, date)
     * HS4 primary key: (seat_no, flight_no, airline, date)
     */

    'SELECT * ' +
    'FROM landsat_takesoff_flight LTF NATURAL JOIN has_seats_1 HS1 NATURAL JOIN has_seats_4 HS4 NATURAL JOIN has_seats_3 HS3 ' +
    'WHERE flight_no = :flight_no AND airline = :airline AND date = :date AND reserved = 0';

  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        flight_no: flight_no,
        airline: airline,
        date: date
      }
    })
    .then(result => {
      res.json(result)
      console.log(result)
    })
    .catch(e => {
      res.status(400).send(e.message)
    })
})

/* get MIN/MAX/AVG aggregation over available seats */
router.get('/search/aggregation', function (req, res, next) {
  console.log('Computing aggregation...');
  const flight_no = req.query.flightno;
  const airline = req.query.airline;
  const date = req.query.date;
  const aggregator = req.query.aggregator;

  const query =
    `SELECT ${aggregator}(seat_price) ` +
    `FROM landsat_takesoff_flight LTF NATURAL JOIN has_seats_1 HS1 NATURAL JOIN has_seats_4 HS4 NATURAL JOIN has_seats_3 HS3 ` +
    `WHERE flight_no = :flight_no AND airline = :airline AND date = :date AND reserved = 0;`;

  connection.query(query, {
    type: connection.QueryTypes.SELECT,
    replacements: {
      flight_no: flight_no,
      airline: airline,
      date: date
    }
  })
    .then(result => {
      res.json(Object.values(result[0])[0])
    })
    .catch(e => {
      console.log(e)
      res.status(400).send(e.message)
    })
})

/* display flights and seat search results */
router.post('/search/additional/lookup', bodyParser.json(), function (req, res, next) {
  console.log('Additional search for flights and seats...');
  const queryParams = req.body.data.queryParams;

  let seat_price_upper = req.body.data.seat_price_upper;
  const seat_price_lower = req.body.data.seat_price_lower * 100;
  let upper_price_string = '';
  if (seat_price_upper !== '') {
    seat_price_upper *= 100;
    upper_price_string = `AND seat_price <= ${seat_price_upper}`;
  }

  const where = Object.keys(queryParams).map(function (x) {return x + ' = ' + queryParams[x]}).join(' AND ');
  const connector = where === '' ? '' : ' AND ';
  const query =
    'SELECT flight_no, airline, date, seat_no, seat_class, seat_price ' +
    'FROM LandsAt_TakesOff_Flight NATURAL JOIN Has_Seats_1 NATURAL JOIN Has_Seats_4 NATURAL JOIN Has_Seats_3 HS3 ' +
    'WHERE reserved = 0 AND ' +
    where + connector +
    `seat_price >= ${seat_price_lower}` +
    upper_price_string + ';';

  connection.query(query, {
    type: connection.QueryTypes.SELECT,
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

export default router
