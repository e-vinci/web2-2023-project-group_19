const express = require('express');

const router = express.Router();

const {
  getLeaderboard,
} = require('../models/users');

router.get('/leaderboard', async (req, res) => {
  const leaderboard = await getLeaderboard();
  res.json(leaderboard);
});

module.exports = router;
