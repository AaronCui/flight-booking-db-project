import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()
const access_levels=['customer', 'staff']

/* GET users listing. */
router.get('/users', function (req, res, next) {
  console.log ("Retrieving users...")
  const query = 'SELECT * FROM users;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(users => {
      console.log(users)
      res.json(users)
    })
})

/* Authenticate USER login. */
router.post('/users/auth', bodyParser.json(), function (req, res, next) {
  console.log ("Validating Login for:" + req.body.email)
  const email = req.body.email
  const password = req.body.password
  const query = 'SELECT password, access_level FROM Users WHERE email = :email and password = :password;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        email: email,
        password: password
      }
    })
    .then(result => {
      if (result.length !== 1) {
        res.status(404).json({}) // assert that 1 user was found
      }
      if (result[0].password === password) {
        res.send('/users/' + email)
      }
    })
})

/* GET user by ID. */
router.get('/users/:email', function (req, res, next) {
  const email = req.params.email
  const query = 'SELECT * FROM Users WHERE email = :email ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        email: email
      }
    })
    .then(user => {
      if (user.length === 1) {
        res.json(user[0])
      } else {
        res.status(404).json({})
      }
    })
})

router.get('/users/customer/:email', function (req, res, next) {
  const email = req.params.email
  const query = 'SELECT * FROM Customer WHERE email = :email ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        email: email
      }
    })
    .then(user => {
      if (user.length === 1) {
        res.json(user[0])
      } else {
        res.status(404).json({})
      }
    })
})

router.post('/users/updatepw', bodyParser.json(), function (req, res, next) {
  console.log(req.body.data)
  const email = req.body.data.email
  const password = req.body.data.password

  const query = 'UPDATE Users SET password = :password WHERE email = :email ;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        email: email,
        password: password,
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/users/' + email)
    })
})

router.post('/users/updatephone', bodyParser.json(), function (req, res, next) {
  const email = req.body.data.email
  const phone_no = req.body.data.phone_no

  const query = 'UPDATE Customer SET phone_no = :phone_no WHERE email = :email ;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        email: email,
        phone_no: phone_no,
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/users/' + email)
    })
    .catch(e=>{
      res.send(e)
    })
})

router.post('/users/deleteAcct', bodyParser.json(), function (req, res, next) {
  const email = req.body.data.email

  const query = ';'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        email: email
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/users/' + email)
    })
    .catch(e=>{
      res.send(e)
    })
})

// For users of type **CUSTOMER**
router.post('/users/add', bodyParser.json(), function (req, res, next) {
  const email = req.body.data.email
  const password = req.body.data.password
  const first_name = req.body.data.first_name
  const last_name = req.body.data.last_name
  const phone_no = req.body.data.phone_no
  const access_level = 0

  const queryUsers = 'INSERT INTO Users (email, password, first_name, last_name, access_level) VALUES (:email, :password, :first_name, :last_name, :access_level) ;'
  connection.query(queryUsers,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        email: email,
        password: password,
        first_name:first_name,
        last_name:last_name,
        phone_no:phone_no,
        access_level:access_level
      }
    })
  const queryCustomer = 'INSERT INTO Customer (email, phone_no, freq_flyer_miles ) VALUES(:email, :phone_no, 0);'
  connection.query(queryCustomer,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        email: email,
        phone_no:phone_no
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/users/' + email)
    })
})

export default router
