const { client } = require('../utils/dbConnect');

async function readAllQuizzes(category) {
  const requestString = `
    SELECT * 
    FROM QUIZZLER.quizzes quizz
  `;
  const result = await client.query(requestString);

  if (category) {
    return filterByCategory(result, category);
  }

  return result.rows;
}

function filterByCategory(result, categorie) {
  return result.rows.filter((x) => x.categorie === categorie);
}

async function getAllQuizzesByCategory(category) {
  const requestString = `
    SELECT * 
    FROM QUIZZLER.quizzes quizz
    WHERE quizz.categorie = ${category}
  `;
  const result = await client.query(requestString);
  return result.rows;
}

async function readOneQuizzContent(quizzId) {
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

module.exports = { readAllQuizzes, readOneQuizzContent, getAllQuizzesByCategory };
