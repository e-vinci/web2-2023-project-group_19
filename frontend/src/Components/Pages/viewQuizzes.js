import anime from 'animejs';
import { clearPage } from "../../utils/render";
import getPathParameters from  "../../utils/path-href";
import { getAllQuizzes } from "../../utils/quizzesQueries";
import {getQuizzCategoryData} from "../../utils/quizzesData";

async function viewQuizzes () {

    clearPage();

    // Prend les paramètre dans l'URL de la page (après le ?)
    /**
     * lien : http://localhost:8080/viewQuizzes?categorie=geographie
     * parametersObject = {
     *  categorie : "geographie"
     * }
     */
    const parametersObject = getPathParameters();

    const category = parametersObject.categorie;

    
    const quizzData = getQuizzCategoryData(category);
    const quizzDataImage = quizzData.image;
    const quizzDataCategoryName = quizzData.name;

    const quizzes = await getAllQuizzes(category);

    const QUIZZES = [
        {
            difficulty : 1,
            quizzes : []
        },
        {
            difficulty : 2,
            quizzes : []
        },
        {
            difficulty : 3,
            quizzes : []
        }
    ];

    for ( let i=0; i<quizzes.length; i+=1 ) {

        const {difficultee} = quizzes[i];
        const arrayToPush = QUIZZES.find( x => x.difficulty === difficultee ).quizzes;

        arrayToPush.push( quizzes[i] );

    };

    generateQuizzesButtons( QUIZZES, quizzDataImage, quizzDataCategoryName );

    setInterval(animateGridElements, 2000 );

};

function animateGridElements() {

    anime({
        targets: '.viewQuizzes-cards',
        scale: [
          {value: .9, easing: 'easeOutSine', duration: 500},
          {value: 1, easing: 'easeInOutQuad', duration: 1200}
        ],
        delay: anime.stagger(500, {grid: [3, 3], from: 'center'})
      });
}

function generateQuizzesButtons ( quizzesArray, quizzImage, quizzCategoryName ) {

    const main = document.querySelector('main');

    const categoryTitle = createTitle( quizzCategoryName, 'h1' );

    main.innerHTML += categoryTitle;

    quizzesArray.map( (quizzesDifficulty) => {

        const difficultyLevel = quizzesDifficulty.difficulty;

        const difficultyColor = chooseDifficultyColor( difficultyLevel );
        const difficultyName = chooseDifficultyName( difficultyLevel );

        const difficultyTitle = createTitle( difficultyName, 'h2' );
        main.innerHTML += difficultyTitle;

        const box = createBox();

        for ( let i=0; i<quizzesDifficulty.quizzes.length; i+=1 ) {

            console.log(JSON.stringify(quizzesDifficulty.quizzes))

            const quizzId = quizzesDifficulty.quizzes[i].id_quizz;

            const buttonSrc = `http://localhost:8080/page_questionnaire?quizzId=${quizzId}`;

            const image = createCard(quizzImage, buttonSrc, difficultyColor, difficultyName );

            box.innerHTML += image;

        };

        main.appendChild( box );

        return true;

    });

};

function createBox () {

    const box = document.createElement('div');

    box.className = 'viewQuizzes-box';

    return box;

};

function createCard (quizzImage, buttonSrc, difficultyColor, title) {

    return `
        <div class="card viewQuizzes-cards" style="width: 18rem;">
            <a class="viewQuizzes-button" href="${buttonSrc}">
                <img class="card-img-top" src="${quizzImage}" alt="Card image cap">
            </a>
            <div class="card-body-viewQuizz">
                <h5 class="card-title">${title}</h5>
                <p class="card-text-viewQuizz">Quizz non effectué</p>
            </div>
    </div>`;
}

/* function createButtonAndImage (imgSrc, buttonSrc, borderColor) {

    return `
        <a class="viewQuizzes-button" href="${buttonSrc}">
            <img src="${imgSrc}" class="mx-auto viewQuizzes-button-img-${borderColor}" alt="${imgSrc}">
        </a>
    `;

}; */

function createTitle (titleText, titleSize ) {
    
    return `
        <${titleSize} class="viewQuizzes-title-${titleSize}">
            ${titleText}
        </${titleSize}>
    `;

};

function chooseDifficultyColor( difficultyLevel ) {

    const DIFFICULTIES_COLORS = [ "green", "orange", "red"];

    return DIFFICULTIES_COLORS[difficultyLevel-1];

};

function chooseDifficultyName( difficultyLevel ) {

    const DIFFICULTIES_NAMES = [ "Easy", "Medium", "Hard"];
    
    return DIFFICULTIES_NAMES[difficultyLevel-1];

};

export default viewQuizzes;