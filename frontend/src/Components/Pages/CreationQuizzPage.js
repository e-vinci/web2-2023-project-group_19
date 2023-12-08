/* eslint-disable no-param-reassign */
import { createQuizz, getLastQuizzId, getOneQuizzContent, /* createQuestion,createProposition,getLastQuestionId */ } from '../../utils/quizzesQueries';

let i;
const creationQuizz = () => {
    creatQuestionaire();
    onAddQuizz();
};
 // i =+1;
 function creatQuestionaire() {
  // eslint-disable-next-line no-cond-assign
  const main = document.querySelector('main');
  
  main.innerHTML = `
        <div id="all">
            <div class="container2" id="container2">
                <div class="form-container2 creation-quizz">
                    <form id="questionForm">
                        <h5 class="classe-titre"> Creation Quizz </h5>
                        <span> catégorie quizz : </span>
                        <input type="text" id="categorieQuizzId" placeholder=". . .">
                        <span> question : </span>
                        <input type="text" id="questionQuizzId" placeholder=". . .">
                        <span> différentes propositions : </span>
                        <input type="text" id="proposition1Id" placeholder="1.">
                        <input type="text"id="proposition2Id" placeholder="2.">
                        <input type="text" id="proposition3Id" placeholder="3.">
                        <span> niveau de difficulté </span>
                        <input type="text" id="niveauDifQuizzId"placeholder=". . .">
                        <span> réponse correcte </span>
                        <input type="text" id="reponseQuizzId" placeholder=". . .">
                        <input type="submit" id="boutonQuizzId" class="Next-question" Next-question>
                    </form>
                </div>
                <div class="toggler-container">
                    <div class="toggle">
                        <div class="toggle-panel toggle-left">
                            <h4 class=" classe-titre4 ">
                                Bienvenue sur la page de création d’un quizz
                            </h4>
                            <h3 classe=" classe-titre3 ">${i}/10 </h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>`;

  const formulaire = document.querySelector('#questionForm');
  const boutonFinish = document.querySelector('#boutonQuizzId');
  if(i === 9){
    boutonFinish.innerHTML = "terminer le quizz";
  }
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
    i+=1;
    return i; */
  
}

async function onAddQuizz(){
    const categorieQuizz = document.querySelector("#categorieQuizzId").value;
    // const question = document.querySelector("#questionQuizzId").value;
    const proposition1 = document.querySelector("#proposition1Id").value;
    const proposition2 = document.querySelector("#proposition2Id").value;
    const proposition3 = document.querySelector("#proposition3Id").value;
    const difficultee = document.querySelector("#niveauDifQuizzId").value;
    let reponse = document.querySelector("#reponseQuizzId").value;
    
    if (reponse === proposition1) {
        reponse = proposition1;
    }
    if (reponse === proposition2) {
        reponse = proposition2;
    } 
    if(reponse === proposition3){
        reponse = proposition3;
    }

    const idQuizz = await getLastQuizzId();

    const quizzFound =  await getOneQuizzContent( idQuizz );

    // Le quizz n'a pas été trouvé

    if ( quizzFound === undefined ) {

        await createQuizz(difficultee, categorieQuizz);

    };

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

export default creationQuizz;