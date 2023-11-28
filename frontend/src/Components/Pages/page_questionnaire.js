/* eslint-disable no-param-reassign */
import imageLogo from '../../img/logo-site.png';
import { getOneQuizzContent } from '../../utils/quizzesQueries';
import getPathParameters from '../../utils/path-href';
import Navigate from '../Router/Navigate';
import {getQuizzCategoryData} from "../../utils/quizzesData";

async function pageQuestionnaire () {

    const parametersObject = getPathParameters();
    let {quizzId} = parametersObject;

    if ( quizzId === undefined || Number.isNaN(Number(quizzId))) {

        return Navigate('/');

    }

    quizzId = Number(quizzId);

    const quizz = await getOneQuizzContent(quizzId);

    const sessionQuizzId = Number( sessionStorage.getItem('quizzId') );

    if ( sessionQuizzId !== quizzId ) {

        const randomQuestionsOrderArray = randomQuestionsOrder(quizz);
        initializeSessionData( quizzId, randomQuestionsOrderArray, 0 );

        console.log( "session initialized" );

    };

    const questions = JSON.parse( sessionStorage.getItem('questions') );
    const sessionCurrentIndex = Number( sessionStorage.getItem('currentIndexQuestion') );

    const categoryData = getQuizzCategoryData(quizz.categorie);
    const categoryName = categoryData.name;
    const categoryImage = categoryData.image;

    renderQuestionnaire(questions, sessionCurrentIndex, categoryName);
    applyBackgroundImageOnContainer(categoryImage);

    if ( sessionCurrentIndex === questions.length - 1 ) {

        addEndQuizzButton();

    } else {

        addNextQuestionButton();

    };

    const maxCountQuestions = questions.length;
    addCounterQuestions( sessionCurrentIndex, maxCountQuestions );

    addEventListenersToProps();

    return true;
    
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

function renderQuestionnaire (questions, indexQuestion, categoryName) {

    const question = questions[indexQuestion];
    const intituleQuestion = question.intitule;

    const propositionsQuestion = question.propositions;

    const main = document.querySelector('main');
    main.innerHTML = `
        <div class="glass-container-pageQuestion">
            <div class="card-pageQuestion">
                <h5 class="card-title-pageQuestion"> ${categoryName} </h5>
                <img src="${imageLogo}" class="card-img-top-pageQuestion" alt="...">
                <span class = "card-title-question">
                    ${intituleQuestion}
                </span>
                <div class="card-body propositions">
                    ${propositionsQuestion.map( proposition => `<a class="btn btn-primary-question" data-is-selected="false">${proposition.intitule}</a>` ).join("")}
                </div>
                <div id="endQuizzButtonWrapper"></div>
                <div id="nextQuestionButtonWrapper"></div>
                <div id="counterWrapper"></div>
            </div>
        </div>
    `;

}

function applyBackgroundImageOnContainer (categoryImage) {

    const container = document.querySelector('.glass-container-pageQuestion');

    container.style.backgroundImage = `url(${categoryImage})`;

}

function addCounterQuestions ( currentIndexQuestion, maxCountQuestions ) {
    
    const counterWrapper = document.querySelector('#counterWrapper');

    counterWrapper.innerHTML += `
        <div class="div-counter-questions-pageQuestion">
            <p>Question n°${currentIndexQuestion+1} / ${maxCountQuestions}</p>
        </div>
    `;

}

function addNextQuestionButton() {

    const nextQuestionButtonWrapper = document.querySelector('#nextQuestionButtonWrapper');

    nextQuestionButtonWrapper.innerHTML += `
        <button class="Next-question-pageQuestion" id="nextQuestionButton">
            Question suivante
        </button>
    `;

    const button = document.querySelector('#nextQuestionButton');

    button.addEventListener('click', (e) => {

        e.preventDefault();

        const propositionSelected = checkSelectedProposition();

        if ( propositionSelected === null ) return false;

        const questions = JSON.parse( sessionStorage.getItem('questions') );
        const sessionCurrentIndex = Number( sessionStorage.getItem('currentIndexQuestion') );

        const {propositions} = questions[sessionCurrentIndex];

        const isReponse = propositions.find( p => p.intitule === propositionSelected ).isreponse;
        
        console.log( `isReponse ${isReponse}`);

        if ( isReponse ) {

            console.log( "bonne réponse !" );

        }

        button.style.border = "10px solid red";

        sessionStorage.setItem('currentIndexQuestion', sessionCurrentIndex+1 );

        setTimeout(() => {

            pageQuestionnaire();

        }, 3000);

        

        return true;

    });

}

function checkSelectedProposition () {

    const propositions = document.querySelectorAll('.btn-primary-question');

    let propositionSelected = null;

    propositions.forEach( proposition => {

        if ( proposition.dataset.isSelected === "true" ) {
            
            proposition.style.backgroundColor = "green";
            propositionSelected = proposition.innerText;

        } else {

            proposition.style.backgroundColor = "red";

        }

    })

    return propositionSelected;

}

function addEndQuizzButton() {

    const endQuizzButtonWrapper = document.querySelector('#endQuizzButtonWrapper');

    endQuizzButtonWrapper.innerHTML += `
        <button class="Next-question-pageQuestion" id="endQuizzButton">
            Terminer le quizz
        </button>
    `;

    const button = document.querySelector('#endQuizzButton');

    console.log( button.id );

    button.addEventListener('click', (e) => {

        e.preventDefault();

        button.style.border = "10px solid red";

        return true;

    });

}

function addEventListenersToProps () {

    const propositions = document.querySelectorAll('.btn-primary-question');

    propositions.forEach( proposition => {

        console.log( `proposition : ${proposition.innerHTML}\n\n` );

        proposition.addEventListener('click', () => {

            for ( let i=0; i<propositions.length; i+=1 ) {

                propositions[i].dataset.isSelected = "false";
                propositions[i].style.border = "none";

            }

            proposition.dataset.isSelected = "true";
            proposition.style.border = "5px solid blue";

        });

    });

}

function initializeSessionData ( currentQuizzId, quizzQuestions, quizzCurrentIndexQuestion ) {

    sessionStorage.setItem('quizzId', currentQuizzId );

    sessionStorage.setItem('questions', JSON.stringify(quizzQuestions) );

    sessionStorage.setItem('currentIndexQuestion', quizzCurrentIndexQuestion );

}

export default pageQuestionnaire;