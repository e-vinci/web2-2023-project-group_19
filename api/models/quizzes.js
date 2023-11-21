const client = require('../utils/dbConnect');

async function getAllQuizzes() {
  const result = await client.query('SELECT * FROM QUIZZLER.quizzes');
  console.log(result.rows);
  return result;
}

getAllQuizzes();
