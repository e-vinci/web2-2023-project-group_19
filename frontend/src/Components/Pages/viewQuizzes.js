import { clearPage } from "../../utils/render";
import getPathParameters from  "../../utils/path-href";
import { getAllQuizzes } from "../../utils/quizzesQueries";
import {getQuizzCategoryData} from "../../utils/quizzesData";

async function viewQuizzes () {

    clearPage();

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

};

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

            const buttonSrc = 'http://localhost:8080';

            const image = createButtonAndImage(quizzImage, buttonSrc, difficultyColor );

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

function createButtonAndImage (imgSrc, buttonSrc, borderColor) {

    return `
        <a class="viewQuizzes-button" href="${buttonSrc}">
            <img src="${imgSrc}" class="mx-auto viewQuizzes-button-img-${borderColor}" alt="${imgSrc}">
        </a>
    `;

};

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