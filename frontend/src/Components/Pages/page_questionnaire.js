import imageLogo from '../../img/logo-site.png';
import { getOneQuizzContent } from '../../utils/quizzes';

let currentIndexQuestion = 0;

async function pageQuestionnaire () {

    const quizz = await getOneQuizzContent(1);

    const randomQuestionsOrderArray = randomQuestionsOrder(quizz);

    quizz.questions = randomQuestionsOrderArray;

    renderQuestionnaire(quizz, currentIndexQuestion);

    currentIndexQuestion+=1;
    
};

function randomQuestionsOrder(quizz) {

    const {questions} = quizz;

    const randomQuestionsOrderArray = [];

    while ( questions.length > 0 ) {

        const randomIndex = Math.floor( Math.random() * questions.length );

        const randomQuestion = questions[randomIndex];

        questions.splice(randomIndex, 1);

        randomQuestionsOrderArray.push( randomQuestion );

    }

    return randomQuestionsOrderArray;
}

function renderQuestionnaire (quizz, indexQuestion) {

    const question = quizz.questions[indexQuestion];
    const intituleQuestion = question.intitule;

    const propositionsQuestion = question.propositions;

    const main = document.querySelector('main');
    main.innerHTML = `
        <div class="glass-container-pageQuestion"> 
            <div class="card-pageQuestion">
                <h5 class="card-title-pageQuestion"> ${quizz.categorie} </h5>
                <img src="${imageLogo}" class="card-img-top-pageQuestion" alt="..."style="width: 31%;">
                <span class = "card-title-question" >
                    ${intituleQuestion}
                </span>
                <div class="card-body">
                    ${propositionsQuestion.map( proposition => `<a href="#" class="btn btn-primary-question">${proposition.intitule}</a>` ).join("")}
                </div>
                <button class="Next-question-pageQuestion">Question suivante</button>
            </div>
        </div>
    `;

}

export default pageQuestionnaire;