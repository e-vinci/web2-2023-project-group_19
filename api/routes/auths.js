const express = require('express');
const { loginUser, registerUser } = require('../models/auths');

const router = express.Router();

/* Login a user */
router.post('/login', async (req, res) => {
  const username = req?.body?.username?.length !== 0 ? req.body.username : undefined;
  const password = req?.body?.password?.length !== 0 ? req.body.password : undefined;

  console.log(username, password);

  if (!username || !password) return res.sendStatus(400);

  const authenticatedUser = await loginUser(username, password);

  if (!authenticatedUser) return res.sendStatus(401);

  return res.json(authenticatedUser);
});

/* Register a user */
router.post('/register', async (req, res) => {
  const email = req?.body?.email?.length !== 0 ? req.body.email : undefined;
  const username = req?.body?.username?.length !== 0 ? req.body.username : undefined;
  const password = req?.body?.password?.length !== 0 ? req.body.password : undefined;

  // La verification de la confirmation du password se fera dans le frontend

  if (!email || !username || !password) return res.sendStatus(400);

  const authenticatedUser = await registerUser(
    email,
    username,
    password,
  );

  console.log(authenticatedUser);

  if (!authenticatedUser) return res.sendStatus(409);

  return res.json(authenticatedUser);
});
// VALIDATOR UTILISE DANS LE FRONTEND
// const validator = require('validator');

module.exports = router;
