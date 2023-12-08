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

async function createQuizz( difficultee, categorie ) {

  const options = {
    method: 'POST',
    body: JSON.stringify({
      difficultee,
      categorie
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  };

  let quizz;
  try {
    const response = await fetch(`/api/quizzes/createQuizz`, options);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizz = await response.json();
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('createQuizz::error: ', err);
  }

  return quizz;
}

async function createQuestion( quizzId, questionNumero, questionIntitule ) {
  const options = {
    method: 'POST',
    body: JSON.stringify({
      quizzId,
      questionNumero,
      questionIntitule
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  };
  let quizz;
  try {
    const response = await fetch(`/api/quizzes/createQuestion`, options);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizz = await response.json();
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('createQuestion::error: ', err);
  }

  return quizz;
}

async function createPropositions( propositions, questionId ) {
  const options = {
    method: 'POST',
    body: JSON.stringify({
      propositions,
      questionId
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  };
  let quizz;
  try {
    const response = await fetch(`/api/quizzes/createProposition`, options);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizz = await response.json();
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('createProposition::error: ', err);
  }

  return quizz;
}

module.exports = {
  getOneQuizzContent,
  getAllQuizzes,
  createQuizz,
  createQuestion,
  createPropositions,
}