import anime from 'animejs';
import { clearPage } from '../../utils/render';
import getPathParameters from  '../../utils/path-href';
import { getAllQuizzes } from '../../utils/quizzesQueries';
import {getQuizzCategoryData} from '../../utils/quizzesData';
import { chooseDifficultyColor, chooseDifficultyName } from '../../utils/difficultyData';
import { getParticipation } from '../../utils/participationsQueries';
import { getAuthenticatedUser } from '../../utils/auths';
import { getUserFromUsername } from '../../utils/usersQueries';

const quizzUri = 'http://localhost:8080/quizz';

async function viewQuizzes ( categorieName ) {

    console.log( categorieName );
    
    clearPage();

    const authenticatedUser = getAuthenticatedUser();
    const defaultUserId = -1;
    let userId;

    if ( authenticatedUser !== undefined ) {

        console.log( "authentifié!" );

        const {username} = authenticatedUser;
        const userFound = await getUserFromUsername(username);
        userId = userFound.id_user;

    } else {

        console.log( "pas authentifié!" );

        userId = defaultUserId;

    };

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

    generateQuizzesButtons( QUIZZES, quizzDataImages, quizzDataCategoryName, userId );

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

async function generateQuizzesButtons ( quizzesArray, quizzDataImages, quizzCategoryName, userId ) {

    const main = document.querySelector('main');

    const categoryTitle = createTitle( quizzCategoryName, 'h1' );

    main.innerHTML += categoryTitle;

    let quizzNumber = 1;

    quizzesArray.map( (quizzesDifficulty) => {

        const difficultyLevel = quizzesDifficulty.difficulty;

        const difficultyColor = chooseDifficultyColor( difficultyLevel );
        const difficultyName = chooseDifficultyName( difficultyLevel );

        const difficultyTitle = createTitle( difficultyName, 'h2' );
        main.innerHTML += difficultyTitle;

        const box = createBox();

        for ( let i=0; i<quizzesDifficulty.quizzes.length; i+=1 ) {

            const quizzId = quizzesDifficulty.quizzes[i].id_quizz;

            let participationFound;

            if ( userId === -1 ) {

                participationFound = null;

            } else {

                participationFound = getParticipation( userId, quizzId );

            }

            console.log(`participationFound : ${participationFound}`);

            const buttonSrc = `${quizzUri}?quizzId=${quizzId}`;

            const indexDifficultyImg = difficultyLevel - 1;

            const image = createCard(quizzDataImages[indexDifficultyImg], buttonSrc, difficultyColor, quizzNumber, participationFound );

            quizzNumber += 1;

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

function createCard (quizzImage, buttonSrc, difficultyColor, quizzNumber, participationFound ) {

    let text;

    console.log(`participationFound : ${participationFound}`);

    if ( participationFound === null ) {

        text = `Quizz non effectué`;

    } else {

        const countMaxAttemps = 3;
        const countAttemps = 1;
        const countPoints = 20;

        text = `Effectué ${countAttemps}/${countMaxAttemps} fois<br>${countPoints} points gagnés`;

    }

    return `
    <div class="card viewQuizzes-cards" style="width:80%;margin:auto;">
        <a class="viewQuizzes-button" href="${buttonSrc}">
            <img class="card-img-top" src="${quizzImage}" alt="Card image cap">
        </a>
        <div class="card-body-viewQuizz">
            <h3 class="card-title viewQuizzes-title-${difficultyColor}">Quizz n°${quizzNumber}</h5>
            <p class="card-text-viewQuizz">${text}</p>
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