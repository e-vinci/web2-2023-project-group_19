const { client, connectDb, disconnectDb } = require('../utils/dbConnect');

async function getAllQuizzes() {
  await connectDb();
  const result = await client.query('SELECT * FROM QUIZZLER.quizzes');
  await disconnectDb();
  return result;
}

module.exports = { getAllQuizzes };
