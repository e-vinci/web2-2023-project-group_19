const { client } = require('../utils/dbConnect');

async function createOneUser(email, username, password) {
  const requestString = `
    INSERT INTO QUIZZLER.users (email, username, mdp )
    VALUES ( '${email}', '${username}', '${password}' )
    RETURNING users.id_user;
  `;
  const result = await client.query(requestString);
  return result.rows[0];
}

async function readOneUserFromEmail(email) {
  const requestString = `
    SELECT *
    FROM QUIZZLER.users
    WHERE email = '${email}'
  `;
  const result = await client.query(requestString);
  return result.rows[0];
}

async function deleteOneUser(username) {
  const requestString = `DELETE FROM QUIZZLER.users WHERE username = '${username}' ;`;
  const result = await client.query(requestString);
  return result;
}

async function readOneUserFromUsername(username) {
  const requestString = `
    SELECT id_user, username, nbr_points, mdp, isadmin
    FROM QUIZZLER.users
    WHERE username = '${username}'
  `;
  const result = await client.query(requestString);
  return result.rows[0];
}

async function getLeaderboard() {
  const requestString = `
  SELECT us.id_user, us.username, us.nbr_points
  FROM QUIZZLER.users us
  ORDER BY us.nbr_points DESC`;
  const result = await client.query(requestString);
  return result.rows;
}

async function updateUserPoints(userId, points) {
  const requestString = `
  UPDATE QUIZZLER.users
  SET nbr_points = nbr_points + ${points}
  WHERE id_user = ${userId}
  RETURNING nbr_points;`;
  const result = await client.query(requestString);
  return result.rows[0];
}

module.exports = {
  createOneUser,
  readOneUserFromUsername,
  readOneUserFromEmail,
  getLeaderboard,
  updateUserPoints,
  deleteOneUser,
};
