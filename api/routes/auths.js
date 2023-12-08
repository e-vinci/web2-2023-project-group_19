const express = require('express');
const { register, login } = require('../models/users');

const router = express.Router();

/* Register a user */
router.post('/register', async (req, res) => {
  console.log(JSON.stringify(req.body));
  const email = req?.body?.username?.length !== 0 ? req.body.username : undefined;
  const username = req?.body?.username?.length !== 0 ? req.body.username : undefined;
  const registerPassword = req?.body?.username?.length !== 0 ? req.body.username : undefined;
  const registerConfPassword = req?.body?.username?.length !== 0 ? req.body.username : undefined;

  // eslint-disable-next-line max-len
  if (!email || !username || !registerPassword || !registerConfPassword) return res.sendStatus(400); // 400 Bad Request

  const authenticatedUser = register(email, username, registerPassword, registerConfPassword);

  if (!authenticatedUser) return res.sendStatus(409); // 409 Conflict

  return res.sendStatus(authenticatedUser);
});

/* Login a user */
router.post('/login', (req, res) => {
  const username = req?.body?.username?.length !== 0 ? req.body.username : undefined;
  const password = req?.body?.password?.length !== 0 ? req.body.password : undefined;

  if (!username || !password) return res.sendStatus(400); // 400 Bad Request

  const authenticatedUser = login(username, password);

  if (!authenticatedUser) return res.sendStatus(401); // 401 Unauthorized

  return res.json(authenticatedUser);
});

module.exports = router;
