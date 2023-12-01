const { client } = require('../utils/dbConnect');

async function createQuizz(difficultee, categorie) {
  const requestString = `
    insert into QUIZZLER.quizzes(difficultee, categorie)
    VALUES (${difficultee},${categorie});
    `;
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

async function lastQuizz() {
  const requestString = `
    SELECT max(qu.id_quizz)
    FROM QUIZZLER.quizzes qu
      `;
  const result = await client.query(requestString);
  return result.rows;
}

module.exports = {
  createQuizz,
  createQuestion,
  createProposition,
  lastQuizz,
};
