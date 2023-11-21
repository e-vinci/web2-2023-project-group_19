const { client, connectDb, disconnectDb } = require('../utils/dbConnect');

async function getAllUsers() {
  await connectDb();
  const result = await client.query('SELECT * FROM QUIZZLER.users');
  console.log(result.rows);
  await disconnectDb();
  return result;
}

getAllUsers();
