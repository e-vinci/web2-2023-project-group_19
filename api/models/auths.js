const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const { readOneUserFromEmail, readOneUserFromUsername, createOneUser } = require('./users');

const jwtSecret = 'quizzler!';
const lifetimeJwt = 24 * 60 * 60 * 1000; // in ms : 24 * 60 * 60 * 1000 = 24h

const saltRounds = 10;

async function loginUser(username, password) {
  const userFound = await readOneUserFromUsername(username);
  if (!userFound) return undefined;

  const passwordMatch = bcrypt.compareSync(password, userFound.mdp);
  if (!passwordMatch) return undefined;

  const token = jwt.sign({ username }, jwtSecret, { expiresIn: lifetimeJwt });

  const authenticatedUser = {
    username,
    isAdmin: userFound.isadmin,
    token,
  };

  return authenticatedUser;
}

async function registerUser(email, username, password) {
  const userFoundFromUsername = await readOneUserFromUsername(username);
  console.log(`userFoundFromUsername : ${userFoundFromUsername}`);
  if (userFoundFromUsername) return 'Username already registered';

  const userFoundFromEmail = await readOneUserFromEmail(username);
  console.log(`userFoundFromEmail : ${userFoundFromEmail}`);
  if (userFoundFromEmail) return 'Email already registered';

  const encryptedPassword = bcrypt.hashSync(password, saltRounds);
  const createdUser = await createOneUser(email, username, encryptedPassword);

  console.log(`createdUser : ${JSON.stringify(createdUser)}`);

  const token = jwt.sign({ username }, jwtSecret, { expiresIn: lifetimeJwt });

  const authenticatedUser = {
    username,
    isAdmin: createdUser.isadmin,
    token,
  };

  return authenticatedUser;
}

module.exports = {
  registerUser,
  loginUser,
};
