const express = require('express');

const router = express.Router();

const bcrypt = require('bcrypt');
const Users = require('../models/users');

const saltRounds = 10;

// const validator = require('validator');

/* GET users listing. */
router.get('/', async (req, res) => {
  const USERS = await Users.getAllUsers();
  res.json(USERS);
});

module.exports = router;
