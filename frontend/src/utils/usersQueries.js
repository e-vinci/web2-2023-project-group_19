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

async function updateUserPoints( userId, points ) {

  const options = {
    method: 'POST',
    body: JSON.stringify({
    userId,
    points,
    }),
    headers: {
    'Content-Type': 'application/json',
    },
};

  let updateCountPoints;
  try {
      const response = await fetch(`/api/users/updateUserPoints`, options);

      if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

      updateCountPoints = await response.json();
  } catch (err) {
      // eslint-disable-next-line no-console
      console.error('updateParticipation::error: ', err);
  }

  return updateCountPoints;
}

module.exports = {
  getLeaderboard,
  getUserFromUsername,
  updateUserPoints,
}; 