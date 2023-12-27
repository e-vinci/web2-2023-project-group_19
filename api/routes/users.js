const express = require('express');

const router = express.Router();

const {
  getLeaderboard,
  readOneUserFromUsername,
  updateUserPoints,
  deleteInParticipationById,
  deleteInUsersById,
} = require('../models/users');

const { authorize } = require('../utils/auths');

router.get('/leaderboard', async (req, res) => {
  if (!authorize) {
    res.sendStatus(400);
  }
  const leaderboard = await getLeaderboard();
  res.json(leaderboard);
});

router.get('/', async (req, res) => {
  const username = req?.query?.username?.length !== 0 ? req.query.username : undefined;
  if (!username) return res.sendStatus(400);
  const userFound = await readOneUserFromUsername(username);
  if (!userFound) return undefined;
  return res.json(userFound);
});

router.post('/updateUserPoints', async (req, res) => {
  if (!authorize) {
    res.sendStatus(400);
  }
  const countPointsToAdd = req?.body?.countPointsToAdd ? req.body.countPointsToAdd : undefined;
  const userId = req?.body?.userId ? req.body.userId : undefined;
  if (!countPointsToAdd || !userId) return res.sendStatus(400);
  const currentCountPoints = await updateUserPoints(userId, countPointsToAdd);
  return res.json(currentCountPoints);
});

router.post('/deleteParticipationById', async (req, res) => {
  if (!authorize) {
    res.sendStatus(400);
  }
  const userId = req?.body?.userId ? req.body.userId : undefined;
  if (!userId) return res.sendStatus(400);
  const deleteParticipationUsers = await deleteInParticipationById(userId);
  return res.json(deleteParticipationUsers);
});

router.post('/deleteUsersById', async (req, res) => {
  if (!authorize) {
    res.sendStatus(400);
  }
  const userId = req?.body?.userId ? req.body.userId : undefined;
  if (!userId) return res.sendStatus(400);
  const deleteUsersID = await deleteInUsersById(userId);
  return res.json(deleteUsersID);
});

module.exports = router;
