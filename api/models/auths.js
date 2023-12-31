const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const { readOneUserFromEmail, readOneUserFromUsername, createOneUser } = require('./users');

const jwtSecret = 'quizzler!';
const lifetimeJwt = 24 * 60 * 60 * 1000; // in ms : 24 * 60 * 60 * 1000 = 24h

const saltRounds = 10;

async function loginUser(username, password) {
  const userFound = await readOneUserFromUsername(username);
  if (!userFound) return 'Username not found';

  const passwordMatch = bcrypt.compareSync(password, userFound.mdp);
  if (!passwordMatch) return 'Password does not match';

  const token = jwt.sign({ username }, jwtSecret, { expiresIn: lifetimeJwt });

  const authenticatedUser = {
    username,
    isAdmin: userFound.isadmin,
    token,
  };

  return authenticatedUser;
}

async function registerUser(email, username, password) {
  const userFoundFromEmail = await readOneUserFromEmail(email);
  if (userFoundFromEmail) return 'Email already registered';

  const userFoundFromUsername = await readOneUserFromUsername(username);
  if (userFoundFromUsername) return 'Username already registered';

  const encryptedPassword = bcrypt.hashSync(password, saltRounds);
  await createOneUser(email, username, encryptedPassword);

  const token = jwt.sign({ username }, jwtSecret, { expiresIn: lifetimeJwt });

  const authenticatedUser = {
    username,
    token,
  };

  return authenticatedUser;
}

module.exports = {
  registerUser,
  loginUser,
};
