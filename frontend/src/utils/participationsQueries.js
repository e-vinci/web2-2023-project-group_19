async function createParticipation( userId, quizzId, countQuestionsSucceeded ) {

    const options = {
        method: 'POST',
        body: JSON.stringify({
        userId,
        quizzId,
        countQuestionsSucceeded
        }),
        headers: {
        'Content-Type': 'application/json',
        },
    };

    let quizz;
    try {
        const response = await fetch(`/api/quizzes/createParticipation`, options);

        if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

        quizz = await response.json();
    } catch (err) {
        // eslint-disable-next-line no-console
        console.error('createParticipation::error: ', err);
    }

    return quizz;
}

async function getParticipation( userId, quizzId ) {

    const options = {
        method: 'POST',
        body: JSON.stringify({
        userId,
        quizzId
        }),
        headers: {
        'Content-Type': 'application/json',
        },
    };

    let quizz;
    try {
        const response = await fetch(`/api/quizzes/getParticipation`, options);

        if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

        quizz = await response.json();
    } catch (err) {
        // eslint-disable-next-line no-console
        console.error('getParticipation::error: ', err);
    }

    return quizz;
}

async function updateParticipation( userId, quizzId, countQuestionsSucceeded ) {

    const options = {
        method: 'POST',
        body: JSON.stringify({
        userId,
        quizzId,
        countQuestionsSucceeded
        }),
        headers: {
        'Content-Type': 'application/json',
        },
    };

    let quizz;
    try {
        const response = await fetch(`/api/quizzes/updateParticipation`, options);

        if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);

        quizz = await response.json();
    } catch (err) {
        // eslint-disable-next-line no-console
        console.error('updateParticipation::error: ', err);
    }

    return quizz;
}

module.exports = {
    createParticipation,
    getParticipation,
    updateParticipation,
}