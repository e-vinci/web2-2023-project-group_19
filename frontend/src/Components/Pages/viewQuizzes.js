import history from "../../img/history.jpg";
import { clearPage } from "../../utils/render";

const viewQuizzes = () => {

    const QUIZZES = [ 
        {
            difficulty : 1,
            quizzes : ["1", "2", "3" ]
        },
        {
            difficulty : 2,
            quizzes : ["1", "2", "3" ]
        },
        {
            difficulty : 3,
            quizzes : ["1", "2", "3" ]
        }
    ];

    clearPage();
    generateQuizzesButtons( QUIZZES );

};

function generateQuizzesButtons ( quizzesArray ) {

    const main = document.querySelector('main');

    const categoryTitle = createTitle( 'Histoire', 'h1' );

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

            const image = createButtonAndImage(history, buttonSrc, difficultyColor );

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