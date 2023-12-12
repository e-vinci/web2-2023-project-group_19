const express = require('express');

const router = express.Router();

const {
  getLeaderboard,
  readOneUserFromUsername,
} = require('../models/users');

router.get('/leaderboard', async (req, res) => {
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

module.exports = router;
