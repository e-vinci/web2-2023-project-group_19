const { client } = require('../utils/dbConnect');

async function readAllQuizzes(categorie) {
  const requestString = `
      SELECT *
      FROM QUIZZLER.quizzes q
      ORDER BY q.id_quizz
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

  const quizzObject = quizzData.rows[0];

  const questionsArray = await getQuizzQuestions(quizzId);

  for (let i = 0; i < questionsArray.length; i += 1) {
    const question = questionsArray[i];

    // eslint-disable-next-line no-await-in-loop
    const propositionsArray = await getQuizzQuestionPropositions(quizzId, question.id_question);
    question.propositions = propositionsArray;
  }

  quizzObject.questions = questionsArray;

  return quizzObject;
}

async function getLastQuizzId() {
  const requestString = `
    SELECT max(qu.id_quizz) as lastQuizzId
    FROM QUIZZLER.quizzes qu
      `;
  const result = await client.query(requestString);
  return result.rows[0];
}
async function getLastQuestionId() {
  const requestString = `
    SELECT max(que.id_question) as lastQuestionId
    FROM QUIZZLER.questions que
      `;
  const result = await client.query(requestString);
  return result.rows[0];
}

async function createQuizz(difficultee, categorie) {
  // eslint-disable-next-line no-console
  console.log(difficultee, categorie);
  const requestString = `
      insert into QUIZZLER.quizzes(difficultee,categorie)
      VALUES (${difficultee},'${categorie}')
      RETURNING quizzes.id_quizz;
      `;
  // eslint-disable-next-line no-console
  console.log(requestString);
  const result = await client.query(requestString);
  return result.rows[0];
}

async function createQuestion(quizz, numero, intitule) {
  const requestString = `
      insert into QUIZZLER.questions(quizz, numero, intitule) 
      VALUES (${quizz},${numero},'${intitule}')
      RETURNING questions.id_question;
      `;
  const result = await client.query(requestString);
  return result.rows[0];
}

async function createProposition(propositions, question) {
  const propositionsId = { propositionsId: [] };

  for (let i = 0; i < propositions.length; i += 1) {
    const { intitule, isReponse } = propositions[i];
    const requestString = `
    insert into QUIZZLER.propositions(intitule, isreponse, question) 
    VALUES ('${intitule}',${isReponse},${question})
    RETURNING propositions.id_proposition;
    `;

    // eslint-disable-next-line no-await-in-loop
    const propositionId = await client.query(requestString);
    propositionsId.propositionsId.push(propositionId.rows[0].id_proposition);
  }

  for (let i = 0; i < propositionsId.length; i += 1) {
    console.log(`propositionId : ${propositionsId[i]}`);
  }
  return propositionsId;
}

module.exports = {
  readAllQuizzes,
  readOneQuizzContent,
  getLastQuizzId,
  getLastQuestionId,
  createQuizz,
  createQuestion,
  createProposition,
};
