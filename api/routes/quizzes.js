const express = require('express');

const router = express.Router();

const { authorize } = require('../utils/auths');

const {
  readAllQuizzes,
  readOneQuizzContent,
  getLastQuizzId,
  getLastQuestionId,
  createQuizz,
  createQuestion,
  createProposition,
  createParticipation,
  getParticipation,
  updateParticipation,
} = require('../models/quizzes');

const { isAdmin } = require('../utils/auths');

/* GET users listing. */
router.get('/', async (req, res) => {
  const category = req?.query?.categorie?.length !== 0 ? req.query.categorie : undefined;
  if (!category) return res.sendStatus(400);
  const QUIZZES = await readAllQuizzes(category);
  return res.json(QUIZZES);
});

router.get('/getLastQuizzId', async (req, res) => {
  if (!isAdmin) {
    return res.sendStatus(400);
  }
  const lastQuizzId = await getLastQuizzId();
  const response = lastQuizzId;
  return res.json(response);
});

router.get('/getLastQuestionId', async (req, res) => {
  if (!isAdmin) {
    return res.sendStatus(400);
  }
  const lastQuizzId = await getLastQuestionId();
  const response = lastQuizzId;
  return res.json(response);
});

router.post('/createQuizz', async (req, res) => {
  if (!isAdmin) {
    return res.sendStatus(400);
  }
  const difficultee = req?.body?.difficultee;
  const categorie = req?.body?.categorie?.length !== 0 ? req.body.categorie : undefined;
  if (!difficultee || !categorie) return res.sendStatus(400);
  const createdQuizz = await createQuizz(difficultee, categorie);
  return res.json(createdQuizz);
});

router.post('/createQuestion', async (req, res) => {
  if (!isAdmin) {
    return res.sendStatus(400);
  }
  const quizzId = req?.body?.quizzId;
  const questionNumero = req?.body?.questionNumero;
  // eslint-disable-next-line max-len
  const questionIntitule = req?.body?.questionIntitule?.length !== 0 ? req.body.questionIntitule : undefined;
  if (!quizzId || !questionNumero || !questionIntitule) return res.sendStatus(400);
  const createdQuestion = await createQuestion(quizzId, questionNumero, questionIntitule);
  return res.json(createdQuestion);
});

router.post('/createProposition', async (req, res) => {
  if (!isAdmin) {
    return res.sendStatus(400);
  }
  const proposition = req?.body?.proposition;
  const questionId = req?.body?.questionId;
  const reponse = req?.body?.reponse;
  if (!proposition || !questionId) return res.sendStatus(400);
  const createdProposition = await createProposition(proposition, reponse, questionId);
  return res.json(createdProposition);
});

router.post('/createParticipation', async (req, res) => {
  if (!authorize) {
    res.sendStatus(400);
  }
  const userId = req?.body?.userId;
  const quizzId = req?.body?.quizzId;
  const countQuestionsSucceeded = req?.body?.countQuestionsSucceeded;
  if (!userId || !quizzId || !countQuestionsSucceeded) return res.sendStatus(400);
  const createdParticipation = await createParticipation(quizzId, userId, countQuestionsSucceeded);
  return res.json(createdParticipation);
});

router.get('/getParticipation', async (req, res) => {
  if (!authorize) {
    res.sendStatus(400);
  }
  const userId = req?.query?.userId;
  const quizzId = req?.query?.quizzId;
  if (!userId || !quizzId) return res.sendStatus(400);
  const participation = await getParticipation(quizzId, userId);
  return res.json(participation);
});

router.post('/updateParticipation', async (req, res) => {
  if (!authorize) {
    res.sendStatus(400);
  }
  const userId = req?.body?.userId;
  const quizzId = req?.body?.quizzId;
  const countQuestionsSucceeded = req?.body?.countQuestionsSucceeded;
  if (!userId || !quizzId || !countQuestionsSucceeded) return res.sendStatus(400);
  const updatedParticipation = await updateParticipation(userId, quizzId, countQuestionsSucceeded);
  return res.json(updatedParticipation);
});

router.get('/:id', async (req, res) => {
  const quizzId = req?.params?.id;
  if (!quizzId) return res.sendStatus(400);
  const QUIZZ = await readOneQuizzContent(Number(quizzId));
  return res.json(QUIZZ);
});

module.exports = router;
