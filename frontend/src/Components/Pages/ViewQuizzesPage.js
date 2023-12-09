import anime from 'animejs';
import { clearPage } from '../../utils/render';
import getPathParameters from  '../../utils/path-href';
import { getAllQuizzes } from '../../utils/quizzesQueries';
import {getQuizzCategoryData} from '../../utils/quizzesData';
import { chooseDifficultyColor, chooseDifficultyName } from '../../utils/difficultyData';

async function viewQuizzes ( categorieName ) {

    console.log( categorieName );
    
    clearPage();

    const parametersObject = getPathParameters();

    const category = parametersObject.categorie;

    const quizzData = getQuizzCategoryData(category);
    const quizzDataImages = quizzData.images;
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

    generateQuizzesButtons( QUIZZES, quizzDataImages, quizzDataCategoryName );

    for ( let i=0; i<3; i+=1 ) {

        setTimeout(() => {
            animateGridElements();
        }, i * 3000);

    };
    

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

function generateQuizzesButtons ( quizzesArray, quizzDataImages, quizzCategoryName ) {

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

            const buttonSrc = `http://localhost:8080/questionnaire?quizzId=${quizzId}`;

            const indexDifficultyImg = difficultyLevel - 1;

            const image = createCard(quizzDataImages[indexDifficultyImg], buttonSrc, difficultyColor, difficultyName );

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
        <div class="card viewQuizzes-cards" style="width: 80%; margin : auto;">
            <a class="viewQuizzes-button" href="${buttonSrc}">
                <img class="card-img-top" src="${quizzImage}" alt="Card image cap">
            </a>
            <div class="card-body-viewQuizz">
                <h5 class="card-title viewQuizzes-title-${difficultyColor}">${title}</h5>
                <p class="card-text-viewQuizz">Quizz non effectué</p>
            </div>
    </div>`;
}

function createTitle (titleText, titleSize ) {
    
    return `
        <${titleSize} class="viewQuizzes-title-${titleSize}">
            ${titleText}
        </${titleSize}>
    `;

};

export default viewQuizzes;