const express = require('express');

const router = express.Router();

const {
  createQuizz,
  createQuestion,
  createProposition,
  lastQuizz,
} = require('../models/CreationQuizz');

router.get('/', async (req, res) => {
  const QUIZZESQuizz = await createQuizz();
  const QUIZZESQuestion = await createQuestion();
  const QUIZZESProposition = await createProposition();
  const QUIZZESLastQuizz = await lastQuizz();

  res.json(QUIZZESQuizz);
  res.json(QUIZZESQuestion);
  res.json(QUIZZESProposition);
  res.json(QUIZZESLastQuizz);
});

module.exports = router;
