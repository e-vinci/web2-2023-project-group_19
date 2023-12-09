/* eslint-disable no-param-reassign */
import { createQuizz, /* createQuestion,createProposition */ } from '../../utils/quizzesQueries';

const numberMaxSteps = 11;

const creationQuizz = () => {
    let currentStepCreation = sessionStorage.getItem('currentStepCreation');

    if ( currentStepCreation === null ) {
        initializeSessionData();
    }

    currentStepCreation = Number(sessionStorage.getItem('currentStepCreation'));

    // eslint-disable-next-line no-console
    console.log( currentStepCreation );

    renderForm( currentStepCreation );
    makeReactiveForm( currentStepCreation );
};

function renderForm( currentStepCreation ) {

    const main = document.querySelector('main');

    if ( currentStepCreation === 1 ) {

        main.innerHTML = `
        <div id="all">
            <div class="container2" id="container2">
                <div class="form-container2 creation-quizz">
                    <form id="questionForm">
                        <h5 class="classe-titre"> Creation Quizz </h5>
                        <span> Catégorie de quizz : </span>
                        <input type="text" id="categorieQuizz" class="regularInput" placeholder="histoire/geographie/sciences">
                        <span> Niveau de difficulté </span>
                        <input type="number" min="1" max="3" class="regularInput" id="niveauDifQuizz"placeholder="Niveau de difficulté">
                        <input type="submit" id="boutonQuizz" class="Next-question regularInput" Next-question>
                    </form>
                </div>
                <div class="toggler-container">
                    <div class="toggle">
                        <div class="toggle-panel toggle-left">
                            <h4 class=" classe-titre4 ">
                                Bienvenue sur la page de création d’un quizz
                            </h4>
                            <h3 classe=" classe-titre3 ">${currentStepCreation}/${numberMaxSteps} </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>`;

    } else {

        main.innerHTML = `
        <div id="all">
            <div class="container2" id="container2">
                <div class="form-container2 creation-quizz">
                    <form id="questionForm">
                        <h5 class="classe-titre"> Creation Quizz </h5>
                        <span> Question : </span>
                        <input type="text" id="questionQuizz" class="regularInput" placeholder="Intitule de la question" required>
                        <span> Propositions : </span>

                        <div style="display:inline-flex;width:100%;">
                        <input type="text" id="proposition1" class="propositionsInput" placeholder="Proposition n°1" required>
                        <input type="radio" name="proposition" required>
                        </div>
                        <div style="display:flex;width:100%;">
                        <input type="text"id="proposition2" class="propositionsInput" placeholder="Proposition n°2" required>
                        <input type="radio" name="proposition">
                        </div>
                        <div style="display:flex;width:100%;">
                        <input type="text" id="proposition3" class="propositionsInput" placeholder="Proposition n°3" required>
                        <input type="radio" name="proposition">
                        </div>
                        
                        <span> Réponse correcte </span>
                        <input type="text" id="reponseQuizz" style="cursor:default;" class="regularInput" placeholder="Réponse correcte" readonly>
                        <input type="submit" id="boutonQuizz" class="Next-question regularInput" Next-question>
                    </form>
                </div>
                <div class="toggler-container">
                    <div class="toggle">
                        <div class="toggle-panel toggle-left">
                            <h4 class=" classe-titre4 ">
                                Vous êtes à l'étape ${currentStepCreation}/${numberMaxSteps} de la création du quizz
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>`;

    }

}
 function makeReactiveForm( currentStepCreation ) {

  const formulaire = document.querySelector('#questionForm');
  const boutonFinish = document.querySelector('#boutonQuizz');
  if( currentStepCreation === 11){
    boutonFinish.innerHTML = "Terminer le quizz";
  };
  formulaire.addEventListener('submit', onAddQuizz );

    /* if(!categorieQuizzId || !question || !proposition1 || !proposition2 || !proposition3 ||!difficultee || !reponse){
        // eslint-disable-next-line no-console
        console.log("un des params n'est pas bon");
        return Error(404);
    }
    // eslint-disable-next-line no-console
    console.log("before functions");
    await createQuizz(difficultee, categorieQuizzId);
    await createQuestion(idQuizz, i, question);    
    await createProposition(proposition1, proposition2, proposition3, reponse, idQuestion);
    // eslint-disable-next-line no-console
    console.log("after functions");
    */
  
}

async function onAddQuizz(){
    const currentStepCreation = Number(sessionStorage.getItem('currentStepCreation'));

    if ( currentStepCreation === 1 ) {

        const categorieQuizz = document.querySelector("#categorieQuizz").value;
        const difficultee = document.querySelector("#niveauDifQuizz").value;

        // eslint-disable-next-line no-console
        console.log(`categorieQuizz : ${categorieQuizz}`);
        // eslint-disable-next-line no-console
        console.log(`difficultee : ${difficultee}`);

        const createdQuizz = await createQuizz(difficultee, categorieQuizz);

        // eslint-disable-next-line no-console
        console.log(`createdQuizz : ${createdQuizz}`);

    } else {

        const question = document.querySelector("#questionQuizz").value;
        const proposition1 = document.querySelector("#proposition1").value;
        const proposition2 = document.querySelector("#proposition2").value;
        const proposition3 = document.querySelector("#proposition3").value;
        let reponse = document.querySelector("#reponseQuizz").value;
        
        if (reponse === proposition1) {
            reponse = proposition1;
        }
        if (reponse === proposition2) {
            reponse = proposition2;
        } 
        if(reponse === proposition3){
            reponse = proposition3;
        }

        // eslint-disable-next-line no-console
        console.log(`question : ${question}`);

    };
    
    sessionStorage.setItem('currentStepCreation', currentStepCreation+1);

    creationQuizz();

    /**
     * {
     *  categorie : "Histoire",
     *  difficultee : 1,
     *  questions : [
     *  { 
     *      intitule : "Question 1",
     *      propositions : [
     *           { 
     *              "intitule", "Proposition 1",
     *              "isReponse" : true
     *           }
     *      ]
     *  }
     * ]
     * }
     */

    /* const options = {

        method: 'POST',
    
        body: JSON.stringify({
    
          categorieQuizzId,
          question,
          proposition1,
          proposition2,
          proposition3,
          difficultee,
          reponse      
        }),
    
        headers: {
    
          'Content-Type': 'application/json',
    
        },
    
      }; */

  }

function initializeSessionData ( currentQuizzId ) {

    sessionStorage.setItem('quizzId', currentQuizzId );

    sessionStorage.setItem('currentStepCreation', 1 );

};

export default creationQuizz;