const express = require('express');

const router = express.Router();

const { getClassement } = require('../models/Classement');

router.get('/', async (req, res) => {
  const QUIZZES = await getClassement();
  res.json(QUIZZES);
});

module.exports = router;
