const express = require('express');

const router = express.Router();

const { getAllQuizzes, getQuizzContentById } = require('../models/quizzes');

/* GET users listing. */
router.get('/', async (req, res) => {
  const QUIZZES = await getAllQuizzes();
  res.json({ QUIZZES });
});

router.get('/:id', async (req, res) => {
  const quizzId = Number(req.params.id);
  const QUIZZ = await getQuizzContentById(quizzId);
  res.json({ QUIZZ });
});

module.exports = router;
