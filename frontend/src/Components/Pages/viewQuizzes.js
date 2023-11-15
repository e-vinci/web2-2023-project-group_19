import toDo from "../../img/To-do.jpg"

const viewQuizzes = () => {

    const main = document.querySelector('main');

    const categoryTitle = createTitle( 'Histoire', 'h1', '75px', '7em' );

    main.innerHTML += categoryTitle;

    const QUIZZES = [ 
        {
            difficulty : 'easy',
            quizzes : ["1", "2", "3", "4" ]
        },
        {
            difficulty : 'medium',
            quizzes : ["1", "2" ]
        },
        {
            difficulty : 'hard',
            quizzes : ["1", "2", "3", "4", "5", "6", "7" ]
        }
    ];
    
    QUIZZES.map( (quizzesDifficulty) => {

        const difficultyTitle = createTitle( quizzesDifficulty.difficulty, 'h2', '125px', '4em' );
        main.innerHTML += difficultyTitle;

        const box = createBox();

        for ( let i=0; i<quizzesDifficulty.quizzes.length; i+=1 ) {

            const buttonSrc = 'http://localhost:8080';

            const image = createButtonAndImage(toDo, buttonSrc );

            box.innerHTML += image;

        };

        main.appendChild( box );

        return true;

    });

};

function createBox() {

    const box = document.createElement('div');
    box.className = 'box';

    box.style = { 
        display : "grid", 
        gridTemplateColumns: "1fr 1fr 1fr", 
        gap: "10px 1em", 
        margin : "5em", 
        marginBottom : "5em",
        textAlign : "center",
        alignItems : "center"
    };

    return box;

};

function createButtonAndImage (imgSrc, buttonSrc) {

    return `<a href="${buttonSrc}"><img src="${imgSrc}" class="rounded d-block" alt="${imgSrc}" style="width: 18rem; margin: auto;"></a>`;

};

function createTitle (titleText, titleSize, paddingLeft, fontSize ) {
    
    return `<${titleSize} style="display:flex;justify-content:left;color:rgb(0, 0, 0);padding:30px;padding-left:${paddingLeft};font-family:'Tilt Warp', sans-serif;font-size:${fontSize}">${titleText}</h1>`;

};

export default viewQuizzes;