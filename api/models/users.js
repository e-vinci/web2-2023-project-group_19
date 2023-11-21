const { client } = require('../utils/dbConnect');

async function getAllUsers() {
  const result = await client.query('SELECT * FROM QUIZZLER.users');
  console.log(result.rows);
  return result;
}

getAllUsers();
