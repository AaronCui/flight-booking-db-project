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

export default router