import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()
const access_levels=['Customer', 'Staff', 'Admin']

/* GET users listing. */
router.get('/users', function (req, res, next) {
  console.log ("Retrieving users...");
  const query = 'SELECT * FROM users; '
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(users => {
      console.log(users)
      res.json(users)
    })
})

/* Authenticate USER login. */
router.post('/users/auth', bodyParser.json(), function (req, res, next) {
  console.log ("Validating Login for:" + req.body.email);
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
      if (result.length != 1)
        res.status(404).json({})  //assert that 1 user was found
      if (result[0].password == password){
        res.send('/users/' + access_levels[result[0].access_level])
      }
    })
})

/* GET user by ID. */
router.get('/users/:username', function (req, res, next) {
  const username = req.params.username
  const query = 'SELECT * FROM Users WHERE email = :username ;'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        username: username
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

router.post('/users/update', bodyParser.json(), function (req, res, next) {
  console.log(req.body.data)
  const username = req.body.data.username
  const password = req.body.data.password
  const access_level = req.body.data.access_level

  const query = 'UPDATE Users SET password = :password, role = :role WHERE email = :username ;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        username: username,
        password: password,
        access_level: access_level
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/users')
    })
})

router.post('/users/add', bodyParser.json(), function (req, res, next) {
  const username = req.body.data.username
  const password = req.body.data.password
  const access_level = req.body.data.access_level

  const query = 'INSERT INTO Users (email, password, access_level) VALUES (:username, :password, :access_level) ;'
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        username: username,
        password: password,
        access_level: access_level
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/users')
    })
})

export default router
