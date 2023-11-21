const express = require('express');

const router = express.Router();

const {
  readAllQuizzes,
  readOneQuizzContent,
} = require('../models/quizzes');

/* GET users listing. */
router.get('/', async (req, res) => {
  const category = req?.query?.categorie;
  const QUIZZES = await readAllQuizzes(category);
  res.json(QUIZZES);
});

router.get('/:id', async (req, res) => {
  const quizzId = Number(req.params.id);
  const QUIZZ = await readOneQuizzContent(quizzId);
  res.json(QUIZZ);
});

module.exports = router;
