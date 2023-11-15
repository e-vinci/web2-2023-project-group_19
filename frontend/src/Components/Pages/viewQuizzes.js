import toDo from "../../img/To-do.jpg";
import { clearPage } from "../../utils/render";

const viewQuizzes = () => {

    const QUIZZES = [ 
        {
            difficulty : 1,
            quizzes : ["1", "2", "3", "4" ]
        },
        {
            difficulty : 2,
            quizzes : ["1", "2" ]
        },
        {
            difficulty : 3,
            quizzes : ["1", "2", "3", "4", "5", "6", "7" ]
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

        const DIFFICULTIES_COLORS = [ "green", "orange", "red"];
        const DIFFICULTIES_NAMES = [ "Easy", "Medium", "Hard"];

        const difficultyNumber = quizzesDifficulty.difficulty;

        const difficultyColor = DIFFICULTIES_COLORS[difficultyNumber-1];
        const difficultyName = DIFFICULTIES_NAMES[difficultyNumber-1];

        const difficultyTitle = createTitle( difficultyName, 'h2' );
        main.innerHTML += difficultyTitle;

        const box = createBox();

        for ( let i=0; i<quizzesDifficulty.quizzes.length; i+=1 ) {

            const buttonSrc = 'http://localhost:8080';

            const image = createButtonAndImage(toDo, buttonSrc, difficultyColor );

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

    return `<a href="${buttonSrc}" class="viewQuizzes-button-${borderColor}"><img src="${imgSrc}" class="rounded d-block" alt="${imgSrc}" style="width:18rem;margin:auto;"></a>`;

};

function createTitle (titleText, titleSize ) {
    
    return `<${titleSize} class="viewQuizzes-title-${titleSize}">${titleText}</h1>`;

};

export default viewQuizzes;