/* eslint-disable no-param-reassign */
import imageLogo from '../../img/logo-site.png';
import { getOneQuizzContent } from '../../utils/quizzesQueries';
import getPathParameters from '../../utils/path-href';
import Navigate from '../Router/Navigate';
import {getQuizzCategoryData} from '../../utils/quizzesData';
import ResultQuizzPage from './ResultQuizzPage';
import { chooseDifficultyName } from '../../utils/difficultyData';  

async function QuestionnairePage () {

    const parametersObject = getPathParameters();
    let {quizzId} = parametersObject;

    if ( quizzId === undefined || Number.isNaN(Number(quizzId))) {

        return Navigate('/');

    };

    quizzId = Number(quizzId);

    const quizz = await getOneQuizzContent(quizzId);

    if ( !quizz ) {
        const main = document.querySelector('main');
        main.innerHTML = `<h1>Oops! Something went wrong...</h1>`;
        return false;
    };

    const sessionQuizzId = Number( sessionStorage.getItem('quizzId') );

    const {

        name : categoryName,
        image : categoryImage,

    } = getQuizzCategoryData(quizz.categorie);

    if ( sessionQuizzId !== quizzId ) {

        console.log( `initialized !` );

        const randomQuestionsOrderArray = randomQuestionsOrder(quizz);
        const difficultyName = chooseDifficultyName( quizz.difficultee );
        const pointsRapportes = quizz.points_rapportes;
        const numberOfQuestions = randomQuestionsOrderArray.length;
        initializeSessionData( quizzId, randomQuestionsOrderArray, categoryName, difficultyName, pointsRapportes, numberOfQuestions );

    };

    const questions = JSON.parse( sessionStorage.getItem('questions') );
    const sessionCurrentIndex = Number( sessionStorage.getItem('currentIndexQuestion') );
    const countRightAnswers = Number( sessionStorage.getItem('countRightAnswers') );

    renderQuestionnaire(questions, sessionCurrentIndex, categoryName);
    applyBackgroundImageOnContainer(categoryImage);

    if ( sessionCurrentIndex === questions.length - 1 ) {

        addEndQuizzButton();

    } else {

        addNextQuestionButton();

    };

    const maxCountQuestions = questions.length;
    addCounterQuestions( sessionCurrentIndex, maxCountQuestions );
    addCounterRightAnswers( countRightAnswers );

    addPropositionsListeners();

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

    };

    return randomQuestionsOrderArray;

};

function renderQuestionnaire (questions, indexQuestion, categoryName) {

    const question = questions[indexQuestion];
    const intituleQuestion = question.intitule;

    const propositionsQuestion = question.propositions;

    const main = document.querySelector('main');
    main.innerHTML = `
        <div class="glass-container-pageQuestion">
            <div class="card-pageQuestion">
            <div class="card-header">
                <div id="counterQuestionsWrapper"></div>
                <h5 class="card-title-pageQuestion"> ${categoryName} </h5>
                <div id="countRightAnswersWrapper"></div>
            </div>
                <img src="${imageLogo}" class="card-img-top-pageQuestion" alt="...">
                <span class = "card-title-question">
                    ${intituleQuestion}
                </span>
                <div class="card-body propositions">
                    ${propositionsQuestion.map( proposition => `<a class="btn proposition-element" data-is-selected="false">${proposition.intitule}</a>` ).join("")}
                </div>
                <div id="endQuizzButtonWrapper"></div>
                <div id="nextQuestionButtonWrapper"></div>
            </div>
        </div>
    `;

};

function applyBackgroundImageOnContainer (categoryImage) {

    const container = document.querySelector('.glass-container-pageQuestion');

    container.style.backgroundImage = `url(${categoryImage})`;

};

function addCounterQuestions ( currentIndexQuestion, maxCountQuestions ) {
    
    const counterQuestionsWrapper = document.querySelector('#counterQuestionsWrapper');

    counterQuestionsWrapper.innerHTML += `
        <div class="div-counter-questions-pageQuestion">
            <p>Question n°${currentIndexQuestion+1} / ${maxCountQuestions}</p>
        </div>
    `;

};

function addCounterRightAnswers ( countRightAnswers ) {

    console.log( `countRightAnswers : ${countRightAnswers}` );
    
    const countRightAnswersWrapper = document.querySelector('#countRightAnswersWrapper');

    countRightAnswersWrapper.innerHTML += `
        <div class="div-count-right-answers-pageQuestion">
            <p>${countRightAnswers} bonne(s) réponse(s)</p>
        </div>
    `;

};

function addNextQuestionButton() {

    const nextQuestionButtonWrapper = document.querySelector('#nextQuestionButtonWrapper');

    nextQuestionButtonWrapper.innerHTML += `
        <button class="Next-question-pageQuestion" id="nextQuestionButton">
            Question suivante
        </button>
    `;

    const button = document.querySelector('#nextQuestionButton');

    button.addEventListener('click', onNextQuestionButton );

};

function onNextQuestionButton() {

    const sessionCurrentIndex = Number( sessionStorage.getItem('currentIndexQuestion') );

    console.log( `sessionCurrentIndex ${sessionCurrentIndex}` );
    checkAnswer( sessionCurrentIndex);

    const buttonNextQuestion = document.querySelector('#nextQuestionButton');

    buttonNextQuestion.style.border = '5px solid red';

    sessionStorage.setItem('currentIndexQuestion', sessionCurrentIndex + 1 );

    buttonNextQuestion.removeEventListener('click', onNextQuestionButton );

    setTimeout(() => {

        QuestionnairePage();

    }, 900);

};

function checkAnswer( sessionCurrentIndex ) {

    const questions = JSON.parse( sessionStorage.getItem('questions') );

    const {propositions} = questions[sessionCurrentIndex];

    removePropositionsListeners();

    checkIsReponsePropositions( propositions );

    let propositionSelected = getPropositionSelected();

    propositionSelected = checkSelectedProposition( propositionSelected );

    console.log( JSON.stringify( propositionSelected ) );

    if ( propositionSelected.isreponse ) {

        const countRightAnswers = Number( sessionStorage.getItem('countRightAnswers') );

        sessionStorage.setItem('countRightAnswers', countRightAnswers+1);

    };

}

function getPropositionSelected() {

    const propositionsElements = document.querySelectorAll('.proposition-element');

    let propositionSelected = null;

    propositionsElements.forEach( propositionElement => {

        if ( propositionElement.dataset.isSelected === 'true' ) {

            propositionSelected = {
                intitule : propositionElement.innerText,
            };

        };

    });

    return propositionSelected;

};

function checkSelectedProposition ( propositionSelected ) {

    const propositionsElements = document.querySelectorAll('.proposition-element');

    propositionsElements.forEach( propositionElement => {

        if ( propositionSelected.intitule === propositionElement.innerText ) {

            const booleanString = propositionElement.dataset.isReponse;
            propositionSelected.isreponse = JSON.parse(booleanString);

        };

    });

    return propositionSelected;

};

function checkIsReponsePropositions ( propositions ) {

    const propositionsElements = document.querySelectorAll('.proposition-element');

    propositionsElements.forEach( propositionElement => {

        const isReponse = propositions.find( p => p.intitule === propositionElement.innerText ).isreponse;

        if ( isReponse ) {

            propositionElement.dataset.isReponse = 'true';
            propositionElement.style.backgroundColor = 'green';

        } else {

            propositionElement.dataset.isReponse = 'false';
            propositionElement.style.backgroundColor = 'red';

        };

    });

};

function addEndQuizzButton() {

    const endQuizzButtonWrapper = document.querySelector('#endQuizzButtonWrapper');

    endQuizzButtonWrapper.innerHTML += `
        <button class="Next-question-pageQuestion" id="endQuizzButton">
            Terminer le quizz
        </button>
    `;

};

function addEndQuizzButtonListener() {

    const button = document.querySelector('#endQuizzButton');

    button.addEventListener('click', () => {

        // Enregistrer participation

        const sessionCurrentIndex = Number( sessionStorage.getItem('currentIndexQuestion') );

        checkAnswer( sessionCurrentIndex );

        const category = sessionStorage.getItem('category');
        const difficulty = sessionStorage.getItem('difficulty');
        const pointsRapportes = Number( sessionStorage.getItem('pointsRapportes') );
        const countRightAnswers = Number( sessionStorage.getItem('countRightAnswers') );
        const numberOfQuestions = Number( sessionStorage.getItem('numberOfQuestions') );

        const pointsTotauxRapportes = pointsRapportes * countRightAnswers;

        const percentageQuestionsSucceeded = (countRightAnswers / numberOfQuestions) * 100;

        ResultQuizzPage( category, difficulty, pointsTotauxRapportes, percentageQuestionsSucceeded );

        button.style.border = '10px solid red';

        return true;

    });

}

function removePropositionsListeners() {

    const propositions = document.querySelectorAll('.proposition-element');

    propositions.forEach( proposition => {

        proposition.removeEventListener('click', onPropositionClick );

    });

};

function addPropositionsListeners () {

    const propositions = document.querySelectorAll('.proposition-element');

    propositions.forEach( proposition => {

        proposition.addEventListener('click', onPropositionClick );

    });

};

function onPropositionClick(event) {

    const propositions = document.querySelectorAll('.proposition-element');

    for ( let i=0; i<propositions.length; i+=1 ) {

        propositions[i].dataset.isSelected = 'false';
        propositions[i].style.border = 'none';

    };

    const proposition = event.target;

    proposition.dataset.isSelected = 'true';
    proposition.style.border = '5px solid blue';

    const questions = JSON.parse( sessionStorage.getItem('questions') );
    const sessionCurrentIndex = Number( sessionStorage.getItem('currentIndexQuestion') );

    if ( sessionCurrentIndex === questions.length - 1 ) {

        addEndQuizzButtonListener();

    };

};

function initializeSessionData ( currentQuizzId, quizzQuestions, quizzCategory, quizzDifficulty, pointsRapportes, numberOfQuestions ) {

    sessionStorage.setItem('quizzId', currentQuizzId );

    sessionStorage.setItem('category', quizzCategory );

    sessionStorage.setItem('difficulty', quizzDifficulty );

    sessionStorage.setItem('questions', JSON.stringify(quizzQuestions) );

    sessionStorage.setItem('currentIndexQuestion', 0 );

    sessionStorage.setItem('countRightAnswers', 0 );

    sessionStorage.setItem('pointsRapportes', pointsRapportes );

    sessionStorage.setItem('numberOfQuestions', numberOfQuestions );

};

export default QuestionnairePage;