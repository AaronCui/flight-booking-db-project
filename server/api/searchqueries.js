import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

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
      res.status(404).json({
          error: e
      })
    })
})

router.get('/search/:flightno/:airline/:date', function (req, res, next) {
  console.log('Listing flights...');
  const flight_no = req.params.flightno;
  const airline = req.params.airline;
  const date = req.params.date;
  const query =
    'SELECT * ' +
    'FROM landsat_takesoff_flight LTF, has_seats_1 HS1, has_seats_4 HS4 ' +
    'WHERE LTF.flight_no = :flight_no AND ' +
      'HS4.flight_no = LTF.flight_no AND ' +
      'HS4.seat_no = HS1.seat_no AND ' +
      'LTF.airline = :airline AND ' +
      'LTF.date = :date;';
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
      res.status(404).json({
        error: e
      })
    })
})

export default router