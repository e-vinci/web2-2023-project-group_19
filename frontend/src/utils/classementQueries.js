async function getClassement() {
    let quizz;
    try {
      const response = await fetch(`/api/classement/`);
  
      if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);
  
      quizz = await response.json();
    } catch (err) {
      // eslint-disable-next-line no-console
      console.error('HomePage::error: ', err);
    }
  
    return quizz;
  }

export default getClassement; 