const express = require('express');

const router = express.Router();

const {
  readAllQuizzes,
  readOneQuizzContent,
  getLastQuizzId,
  getLastQuestionId,
  createQuizz,
  createQuestion,
  createPropositions,
} = require('../models/quizzes');

/* GET users listing. */
router.get('/', async (req, res) => {
  const category = req?.query?.categorie;
  const QUIZZES = await readAllQuizzes(category);
  res.json(QUIZZES);
});

router.get('/getLastQuizzId', async (req, res) => {
  console.log('getLastQuizzId');
  const lastQuizzId = await getLastQuizzId();
  const response = lastQuizzId;
  res.json(response);
});

router.get('/getLastQuestionId', async (req, res) => {
  console.log('getLastQuestionId');
  const lastQuizzId = await getLastQuestionId();
  const response = lastQuizzId;
  res.json(response);
});

router.post('/createQuizz', async (req, res) => {
  const difficultee = req?.body?.difficultee;
  const categorie = req?.body?.categorie;
  const createdQuizz = await createQuizz(difficultee, categorie);
  res.json(createdQuizz);
});

router.post('/createQuestion', async (req, res) => {
  const quizzId = req?.body?.quizzId;
  const questionNumero = req?.body?.questionNumero;
  const questionIntitule = req?.body?.questionIntitule;
  const createdQuestion = await createQuestion(quizzId, questionNumero, questionIntitule);
  res.json(createdQuestion);
});

router.post('/createPropositions', async (req, res) => {
  const propositions = req?.body?.propositions;
  const questionId = req?.body?.questionId;
  const createdProposition = await createPropositions(propositions, questionId);
  res.json(createdProposition);
});

router.get('/:id', async (req, res) => {
  console.log('id');
  const quizzId = Number(req.params.id);
  const QUIZZ = await readOneQuizzContent(quizzId);
  res.json(QUIZZ);
});

module.exports = router;
