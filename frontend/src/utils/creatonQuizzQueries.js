async function createQuizz() {
    let quizz;
    try {
      const response = await fetch(`/api/creationQuizz/`);
  
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
      const response = await fetch(`/api/creationQuizz/`);
  
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
      const response = await fetch(`/api/creationQuizz/`);
  
      if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);
  
      quizz = await response.json();
    } catch (err) {
      // eslint-disable-next-line no-console
      console.error('createProposition::error: ', err);
    }
  
    return quizz;
  }

  async function lastQuizz() {
    let quizz;
    try {
      const response = await fetch(`/api/creationQuizz/`);
  
      if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);
  
      quizz = await response.json();
    } catch (err) {
      // eslint-disable-next-line no-console
      console.error('lastQuizz::error: ', err);
    }
  
    return quizz;
  }

  export default { createQuizz,createQuestion,createProposition,lastQuizz }; 