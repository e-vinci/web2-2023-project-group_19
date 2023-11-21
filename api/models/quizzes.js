const { client, connectDb, disconnectDb } = require('../utils/dbConnect');

async function getAllQuizzes() {
  await connectDb();
  const result = await client.query('SELECT * FROM QUIZZLER.quizzes');
  console.log(result.rows);
  await disconnectDb();
  return result;
}

getAllQuizzes();
