async function getOneQuizzContent(quizzId) {
  let quizz;
  try {
    const response = await fetch(`/api/quizzes/${quizzId}`);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizz = await response.json();
  } catch (err) {
    console.error('HomePage::error: ', err);
  }

  return quizz;
}

async function getAllQuizzes(category) {
  let quizzes;
  try {
    const response = await fetch(`/api/quizzes?categorie=${category}`);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizzes = await response.json();
  } catch (err) {
    console.error('HomePage::error: ', err);
  }

  return quizzes;
}

async function createQuizz() {
  let quizz;
  try {
    const response = await fetch(`/api/quizzes/createQuizz`);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizz = await response.json();
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('createQuizz::error: ', err);
  }

  return quizz;
}

async function createQuestion() {
  let quizz;
  try {
    const response = await fetch(`/api/quizzes/createQuestion`);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizz = await response.json();
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('createQuestion::error: ', err);
  }

  return quizz;
}

async function createProposition() {
  let quizz;
  try {
    const response = await fetch(`/api/quizzes/createProposition`);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizz = await response.json();
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('createProposition::error: ', err);
  }

  return quizz;
}

async function getLastQuizzId() {
  let quizz;
  try {
    const response = await fetch(`/api/creationQuizz/getLastQuizzId/`);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizz = await response.json();
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('getLastQuizzId::error: ', err);
  }

  return quizz;
}

async function getLastQuestionId() {
  let quizz;
  try {
    const response = await fetch(`/api/creationQuizz/getLastQuestionId/`);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizz = await response.json();
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('getLastQuestionId::error: ', err);
  }

  return quizz;
}


module.exports = {
  getOneQuizzContent,
  getAllQuizzes,
  createQuizz,
  createQuestion,
  createProposition,
  getLastQuizzId,
  getLastQuestionId
}