const express = require('express');

const router = express.Router();

const { getAllUsers } = require('../models/users');

/* GET users listing. */
router.get('/', async (req, res) => {
  const USERS = await getAllUsers();
  res.json(USERS);
});

module.exports = router;
