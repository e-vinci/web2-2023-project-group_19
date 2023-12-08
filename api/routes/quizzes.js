const express = require('express');

const router = express.Router();

const {
  readAllQuizzes,
  readOneQuizzContent,
  getLastQuizzId,
  getLastQuestionId,
} = require('../models/quizzes');

/* GET users listing. */
router.get('/', async (req, res) => {
  const category = req?.query?.categorie;
  const QUIZZES = await readAllQuizzes(category);
  res.json(QUIZZES);
});

router.get('/getLastQuizzId', async (req, res) => {
  console.log('Aaa');
  const lastQuizzId = await getLastQuizzId();
  const response = lastQuizzId;
  res.json(response);
});

router.get('/getLastQuestionId', async (req, res) => {
  const lastQuizzId = await getLastQuestionId();
  const response = lastQuizzId;
  res.json(response);
});

router.get('/:id', async (req, res) => {
  console.log('bbb');
  const quizzId = Number(req.params.id);
  const QUIZZ = await readOneQuizzContent(quizzId);
  res.json(QUIZZ);
});

router.post('/createQuizz', async (req, res) => {
  // const QUIZZESQuizz = await createQuizz(req, '');
  // const QUIZZESQuestion = await createQuestion('', '', '');
  // const QUIZZESProposition = await createProposition('', '', '', '', '');
  // const QUIZZESLastQuizz = await lastQuizz();
  // const QUIZZESLastQuestion = await lastQuestion();

  /* const response = {
    QUIZZESQuizz,
    QUIZZESQuestion,
    QUIZZESProposition,
    QUIZZESLastQuizz,
    QUIZZESLastQuestion,
  }; */
  // res.json(response);
  res.json('OK');
});

router.post('/createQuestion', async (req, res) => {
  // const QUIZZESQuizz = await createQuizz(req, '');
  // const QUIZZESQuestion = await createQuestion('', '', '');
  // const QUIZZESProposition = await createProposition('', '', '', '', '');
  // const QUIZZESLastQuizz = await lastQuizz();
  // const QUIZZESLastQuestion = await lastQuestion();

  /* const response = {
    QUIZZESQuizz,
    QUIZZESQuestion,
    QUIZZESProposition,
    QUIZZESLastQuizz,
    QUIZZESLastQuestion,
  }; */
  // res.json(response);
  res.json('OK');
});

router.post('/createProposition', async (req, res) => {
  // const QUIZZESQuizz = await createQuizz(req, '');
  // const QUIZZESQuestion = await createQuestion('', '', '');
  // const QUIZZESProposition = await createProposition('', '', '', '', '');
  // const QUIZZESLastQuizz = await lastQuizz();
  // const QUIZZESLastQuestion = await lastQuestion();

  /* const response = {
    QUIZZESQuizz,
    QUIZZESQuestion,
    QUIZZESProposition,
    QUIZZESLastQuizz,
    QUIZZESLastQuestion,
  }; */
  // res.json(response);
  res.json('OK');
});

module.exports = router;
