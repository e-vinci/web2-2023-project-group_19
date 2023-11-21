const express = require('express');

const router = express.Router();

const { getAllQuizzes } = require('../models/quizzes');

/* GET users listing. */
router.get('/', async (req, res) => {
  const QUIZZES = await getAllQuizzes();
  res.json({ QUIZZES });
});

module.exports = router;
