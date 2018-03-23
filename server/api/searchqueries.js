import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

router.post('/search/destdate', bodyParser.json(), function (req, res, next) {
  console.log ("Searching flight by destination and date");
  console.log("Destination: " + req.body.data.destination + " " + "Date: " + req.body.data.date);
  const destination = req.body.data.destination;
  const date = req.body.data.date;
  const query =
      'SELECT flight_no, airline, takesoff_airport ' +
      'FROM landsat_takesoff_flight ' +
      'WHERE landsat_airport = :destination AND date = :date;';
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        destination: destination,
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