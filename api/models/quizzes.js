const { client } = require('../utils/dbConnect');

async function getAllQuizzes() {
  const requestString = `
    SELECT * 
    FROM QUIZZLER.quizzes quizz
  `;
  const result = await client.query(requestString);
  return result.rows;
}

async function getQuizzContentById(quizzId) {
  const requestString = `
    SELECT * 
    FROM QUIZZLER.quizzes quizz, 
      QUIZZLER.propositions propo, 
      QUIZZLER.questions quest
    WHERE quest.quizz = quizz.id_quizz
      AND propo.question = quest.id_question
      AND quizz.id_quizz = ${quizzId}
  `;
  const result = await client.query(requestString);
  return result.rows;
}

module.exports = { getAllQuizzes, getQuizzContentById };
