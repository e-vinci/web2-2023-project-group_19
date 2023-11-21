const { client } = require('../utils/dbConnect');

async function getAllUsers() {
  const result = await client.query('SELECT * FROM QUIZZLER.users');
  return result.rows;
}

module.exports = {
  getAllUsers,
};
