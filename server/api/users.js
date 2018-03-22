import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()
const roles=['Customer', 'Staff', 'Admin']

/* GET users listing. */
router.get('/users', function (req, res, next) {
  console.log ("Retrieving users...");
  const query = 'SELECT * FROM Users;'
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
  const query = 'SELECT password, role FROM Users WHERE email = :email and password = :password;'
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
        res.send('/users/' + roles[result[0].role])
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
  // const userid = req.body.data.userid
  const username = req.body.data.username
  const password = req.body.data.password
  const role = req.body.data.role

  const query = 'UPDATE Users SET password = :password, role = :role WHERE email = :username ;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        username: username,
        password: password,
        role: role
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/users')
    })
})

router.post('/users/add', bodyParser.json(), function (req, res, next) {
  const userid = req.body.data.userid
  const username = req.body.data.username
  const password = req.body.data.password
  const role = req.body.data.role

  const query = 'INSERT INTO Users (email, password, role) VALUES (:username, :password, :role) ;'
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        username: username,
        password: password,
        role: role
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/users')
    })
})

export default router
