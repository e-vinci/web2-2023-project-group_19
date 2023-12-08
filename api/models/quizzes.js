const { client } = require('../utils/dbConnect');

async function readAllQuizzes(categorie) {
  const requestString = `
    SELECT * 
    FROM QUIZZLER.quizzes quizz
  `;
  const result = await client.query(requestString);

  if (categorie) {
    return filterByCategory(result, categorie);
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

async function getQuizzQuestions(quizzId) {
  const requestQuestionsData = `
    SELECT quest.id_question, quest.numero, quest.intitule
      FROM QUIZZLER.questions quest
      WHERE quest.quizz = ${quizzId};
  `;

  const questionsData = await client.query(requestQuestionsData);

  const questionsArray = questionsData.rows;

  return questionsArray;
}

async function getQuizzQuestionPropositions(quizzId, questionId) {
  const requestQuestionPropositionData = `
    SELECT DISTINCT propo.id_proposition, propo.intitule, propo.isreponse, propo.question
      FROM QUIZZLER.questions quest, QUIZZLER.propositions propo
      WHERE quest.quizz = ${quizzId}
          AND propo.question = ${questionId};
  `;

  const questionPropositionsData = await client.query(requestQuestionPropositionData);

  return questionPropositionsData.rows;
}

async function readOneQuizzContent(quizzId) {
  const requestQuizzData = `
    SELECT quizz.id_quizz, difficultee, categorie, points_rapportes
      FROM QUIZZLER.quizzes quizz
      WHERE quizz.id_quizz = ${quizzId};
  `;

  const quizzData = await client.query(requestQuizzData);

  /**
   * quizzObject = {
   *    id_quizz,
   *    difficultee,
   *    categorie,
   *    points_rapportes,
   *    nbr_points_reussies
   * }
   *  */

  const quizzObject = quizzData.rows[0];

  /**
   * questionArray = [
   *    { id_question : 1, numero : 1, intitule : "Question 1" },
   *    { id_question : 2, numero : 2, intitule : "Question 2" },
   *    ...
   *    { id_question : 10, numero : 10, intitule : "Question 10" }
   * ]
   *  */

  const questionsArray = await getQuizzQuestions(quizzId);

  for (let i = 0; i < questionsArray.length; i += 1) {
    const question = questionsArray[i];
    /**
     * propositionsArray = [
     *    { id_proposition : 1, intitule : "Proposition 1", isreponse : true, question : 1 },
     *    { id_proposition : 2, intitule : "Proposition 2", isreponse : false, question : 1 },
     *    { id_proposition : 3, intitule : "Proposition 3", isreponse : false, question : 1 }
     * ]
     *  */

    // eslint-disable-next-line no-await-in-loop
    const propositionsArray = await getQuizzQuestionPropositions(quizzId, question.id_question);
    question.propositions = propositionsArray;
  }

  /**
   * questionArray = [
   *    { id_question : 1, numero : 1, intitule : "Question 1", propositions : [] },
   *    { id_question : 2, numero : 2, intitule : "Question 2", propositions : [] },
   *    ...
   *    { id_question : 10, numero : 10, intitule : "Question 10", propositions : [] }
   * ]
   *  */

  quizzObject.questions = questionsArray;

  return quizzObject;
}

async function createQuizz(difficultee, categorie) {
  // eslint-disable-next-line no-console
  console.log(difficultee, categorie);
  const requestString = `
    insert into QUIZZLER.quizzes(difficultee,categorie)
    VALUES (${difficultee},${categorie});
    `;
  // eslint-disable-next-line no-console
  console.log(requestString);
  const result = await client.query(requestString);
  return result.rows;
}

async function createQuestion(quizz, numero, intitule) {
  const requestString = `
    insert into QUIZZLER.questions(quizz, numero, intitule) 
    VALUES (${quizz},${numero},'${intitule}');
    `;
  const result = await client.query(requestString);
  return result.rows;
}

async function createProposition(intitule1, intitule2, intitule3, response, question) {
  // eslint-disable-next-line max-len
  // pour reponse on va vérifier la reponse et si elle est = a une proposition on change l'intituler de la reponse en true et si ce n'est pas le cas on le change en false
  const requestString = `
    insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES (${intitule1},${response},${question});
    insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES (${intitule2},${response},${question});
    insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES (${intitule3},${response},${question});
    `;
  const result = await client.query(requestString);
  return result.rows;
}

async function getLastQuizzId() {
  const requestString = `
    SELECT max(qu.id_quizz) as lastQuizzId
    FROM QUIZZLER.quizzes qu
      `;
  const result = await client.query(requestString);
  return result.rows;
}
async function getLastQuestionId() {
  const requestString = `
    SELECT max(que.id_question) as lastQuestionId
    FROM QUIZZLER.questions que
      `;
  const result = await client.query(requestString);
  return result.rows;
}

module.exports = {
  readAllQuizzes,
  readOneQuizzContent,
  getAllQuizzesByCategory,
  createQuizz,
  createQuestion,
  createProposition,
  getLastQuizzId,
  getLastQuestionId,
};
