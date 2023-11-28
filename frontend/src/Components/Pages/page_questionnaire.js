import imageLogo from '../../img/logo-site.png';
import { getOneQuizzContent } from '../../utils/quizzesQueries';
import getPathParameters from '../../utils/path-href';
import Navigate from '../Router/Navigate';
import {getQuizzCategoryData} from "../../utils/quizzesData";

let currentIndexQuestion = 0;

async function pageQuestionnaire () {

    const parametersObject = getPathParameters();
    let {quizzId} = parametersObject;

    if ( quizzId !== undefined && !Number.isNaN(Number(quizzId))) {

        quizzId = Number(quizzId);

        const quizz = await getOneQuizzContent(quizzId);
        const categoryData = getQuizzCategoryData(quizz.categorie);
        const categoryName = categoryData.name;
        const categoryImage = categoryData.image;

        console.log( JSON.stringify( parametersObject ) );

        const randomQuestionsOrderArray = randomQuestionsOrder(quizz);

        quizz.questions = randomQuestionsOrderArray;

        renderQuestionnaire(quizz, currentIndexQuestion, categoryName);
        applyBackgroundImageOnContainer(categoryImage);

        currentIndexQuestion+=1;

    } else {

        Navigate('/');
    
    };
    
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

function renderQuestionnaire (quizz, indexQuestion, categoryName) {

    const question = quizz.questions[indexQuestion];
    const intituleQuestion = question.intitule;

    const propositionsQuestion = question.propositions;

    const main = document.querySelector('main');
    main.innerHTML = `
        <div class="glass-container-pageQuestion"> 
            <div class="card-pageQuestion">
                <h5 class="card-title-pageQuestion"> ${categoryName} </h5>
                <img src="${imageLogo}" class="card-img-top-pageQuestion" alt="...">
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

function applyBackgroundImageOnContainer (categoryImage) {

    const container = document.querySelector('.glass-container-pageQuestion');

    container.style.backgroundImage = `url(${categoryImage})`;

    console.log( container.style );

}

export default pageQuestionnaire;