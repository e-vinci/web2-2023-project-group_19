/* eslint-disable no-param-reassign */
import { createQuizz /* createQuestion,createProposition */ } from '../../utils/quizzesQueries';

const numberMaxSteps = 11;

const creationQuizz = () => {
  let currentStepCreation = sessionStorage.getItem('currentStepCreation');

  if (currentStepCreation === null) {
    initializeSessionData();
  }

  currentStepCreation = Number(sessionStorage.getItem('currentStepCreation'));

  renderQuizzCreation(currentStepCreation);
  makeReactiveForm(currentStepCreation);
};

function createQuizzContainer(content, title, stepText, currentStepCreation) {
  return `
        <div id="creationQuizzContainer">
            <div id="creationQuizzContainer2">
                <div class="form-container2 creation-quizz">
                    <form id="questionForm">
                        <h5 class="classe-titre">${title}</h5>
                        ${content}
                    </form>
                </div>
                <div class="toggler-container">
                    <div class="toggle">
                        <div class="toggle-panel toggle-left">
                            <h4 class="classe-titre4">${stepText}</h4>
                            <h3>Etape ${currentStepCreation}/${numberMaxSteps}</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>`;
}

function renderQuizzCreation(currentStepCreation) {
  const main = document.querySelector('main');

  if (currentStepCreation === 1) {
    const content = `
            <span> Catégorie de quizz : </span>
            <input type="text" id="categorieQuizz" class="regularInput" placeholder="histoire/geographie/sciences" required>
            <span> Niveau de difficulté </span>
            <input type="number" min="1" max="3" class="regularInput" id="niveauDifQuizz" placeholder="Niveau de difficulté" required>
            <input type="submit" id="boutonQuizz" class="Next-question regularInput" Next-question>`;

    main.innerHTML = createQuizzContainer(
      content,
      'Creation Quizz',
      'Bienvenue sur la page de création d’un quizz !',
      currentStepCreation,
    );
  } else {
    const content = `
            <span> Question : </span>
            <input type="text" id="questionQuizz" class="regularInput" placeholder="Intitule de la question" required>
            <span> Propositions : </span>
            <div style="display:inline-flex;width:100%;">
                <input type="text" id="proposition1" class="propositionsInput" placeholder="Proposition n°1" value="Proposition n°1" required>
                <input type="radio" name="proposition" id="radio1" required>
            </div>
            <div style="display:flex;width:100%;">
                <input type="text" id="proposition2" class="propositionsInput" placeholder="Proposition n°2" value="Proposition n°2" required>
                <input type="radio" name="proposition" id="radio2">
            </div>
            <div style="display:flex;width:100%;">
                <input type="text" id="proposition3" class="propositionsInput" placeholder="Proposition n°3" value="Proposition n°3" required>
                <input type="radio" name="proposition" id="radio3">
            </div>
            <span> Réponse correcte </span>
            <input type="text" id="reponseQuizz" style="cursor:default;" class="regularInput" placeholder="Réponse correcte" readonly>
            <input type="submit" id="boutonQuizz" class="Next-question regularInput" value="Question suivante">`;

    main.innerHTML = createQuizzContainer(
      content,
      'Creation Quizz',
      'Création du quizz...',
      currentStepCreation,
    );
  }
}

function makeReactiveForm(currentStepCreation) {
  const formulaire = document.querySelector('#questionForm');
  const boutonSubmit = document.querySelector('#boutonQuizz');
  if (currentStepCreation === 11) {
    boutonSubmit.value = 'Terminer le quizz';
  }
  formulaire.addEventListener('submit', onAddQuestionQuizz);

  if (currentStepCreation > 1) {
    const proposition1 = document.getElementById('proposition1');
    const proposition2 = document.getElementById('proposition2');
    const proposition3 = document.getElementById('proposition3');

    proposition1.onchange = checkPropisitionsNotEquals;
    proposition2.onchange = checkPropisitionsNotEquals;
    proposition3.onchange = checkPropisitionsNotEquals;

    setAnswerProposition('proposition1', 'radio1');
    setAnswerProposition('proposition2', 'radio2');
    setAnswerProposition('proposition3', 'radio3');
  }
}

async function onAddQuestionQuizz(e) {
  e.preventDefault();
  const currentStepCreation = Number(sessionStorage.getItem('currentStepCreation'));

  if (currentStepCreation === 1) {
    const categorieQuizz = document.querySelector('#categorieQuizz').value;
    const difficultee = document.querySelector('#niveauDifQuizz').value;

    const createdQuizz = await createQuizz(difficultee, categorieQuizz);

    // eslint-disable-next-line no-console
    console.log(`createdQuizz : ${createdQuizz}`);
  } else {
    const question = document.querySelector('#questionQuizz').value;
    // const proposition1 = document.querySelector("#proposition1");
    // const proposition2 = document.querySelector("#proposition2");
    // const proposition3 = document.querySelector("#proposition3");

    // TODO : créer la question et les propositions

    // eslint-disable-next-line no-console
    console.log(`question : ${question}`);
  }

  if (currentStepCreation > 1 && !checkPropisitionsNotEquals()) return false;

  if ( currentStepCreation === 11 ) {

    // TODO : rediriger vers une page ou bien montrer les infos du quizz
    
    console.log( "END" );
    
  } else {

    sessionStorage.setItem('currentStepCreation', currentStepCreation + 1);

    creationQuizz();

  }

  return true;
}

function checkPropisitionsNotEquals() {
  const proposition1 = document.getElementById('proposition1').value;
  const proposition2 = document.getElementById('proposition2').value;
  const proposition3 = document.getElementById('proposition3').value;

  // TODO : afficher un message d'erreur / montrer les inputs égaux

  if (
    proposition1 === proposition2 ||
    proposition1 === proposition3 ||
    proposition2 === proposition3
  ) {
    alert('Input text values cannot be equal. Please try again.');
    return false;
  }

  return true;
}

function setAnswerProposition(propositionId, radioId) {
  const inputElement = document.getElementById(propositionId);
  const radioElement = document.getElementById(radioId);

  if (inputElement && radioElement) {
    radioElement.onchange = () => {
      document.getElementById('reponseQuizz').value = inputElement.value;
    };
  }
}

function initializeSessionData(currentQuizzId) {
  sessionStorage.setItem('quizzId', currentQuizzId);

  sessionStorage.setItem('currentStepCreation', 1);
}

export default creationQuizz;