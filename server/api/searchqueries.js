import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

router.post('/search/destdate', bodyParser.json(), function (req, res, next) {
  console.log ("Searching flight...");
  let select = req.body.data.colsSelected;
  select = select.join(", ");
  // console.log("Destination: " + req.body.data.destination + " " + "Date: " + req.body.data.date);
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

export default router