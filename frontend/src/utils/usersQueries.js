async function getLeaderboard() {
  let quizz;
  try {
    const response = await fetch(`/api/users/leaderboard`);

    if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

    quizz = await response.json();
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('HomePage::error: ', err);
  }

  return quizz;
}

async function getUserFromUsername( username ) {

  let userFound;
  try {
      const response = await fetch(`/api/users?username=${username}`);

      if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

      userFound = await response.json();
  } catch (err) {
      // eslint-disable-next-line no-console
      console.error('updateParticipation::error: ', err);
  }

  return userFound;
}

module.exports = {
  getLeaderboard,
  getUserFromUsername,
}; 