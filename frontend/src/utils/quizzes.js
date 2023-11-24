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

module.exports = {
    getOneQuizzContent,
}