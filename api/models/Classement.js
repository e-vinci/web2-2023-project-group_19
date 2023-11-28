const { client } = require('../utils/dbConnect');

async function getClassement() {
  const requestString = `
  SELECT us.id_user, us.username, us.nbr_points
  FROM QUIZZLER.users us
  ORDER BY us.nbr_points DESC`;
  const result = await client.query(requestString);
  return result.rows;
}

module.exports = { getClassement };
