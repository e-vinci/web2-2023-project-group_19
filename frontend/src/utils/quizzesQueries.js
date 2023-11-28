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

module.exports = {
  getOneQuizzContent,
  getAllQuizzes
}