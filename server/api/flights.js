import { Router } from 'express'
var connection = require('../configs/sequelize')

const router = Router()

/* GET users listing. */
router.get('/flights', function (req, res, next) {
  console.log ("Retrieving flights...");
  const query = 'SELECT * FROM airplane_4; '
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(users => {
      console.log(users)
      res.json(users)
    })
})

export default router
