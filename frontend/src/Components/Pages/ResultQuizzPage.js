import { Fireworks } from 'fireworks-js';
<<<<<<< HEAD
import classement from './ClassementPage';

const resultQuizz = () => {
  const main = document.querySelector('main');
  main.innerHTML = `
      <div class="container">
            <div id="resultQuizz-fireworks"></div>
            <div class="glass-container-resultQuizz" id="resultQuizz-glass-container">
                  <div class="main">
                      <h1> Résultat du Quizz </h1>
=======
import Navigate from '../Router/Navigate';

const resultQuizz = ( category = "Histoire", difficulty = "Moyenne", pointsTotauxRapportes = 0, percentageQuestionsSucceeded = 0 ) => {
>>>>>>> e35f4f551edcea61d528ca42f98c98ef02d151e3

  if ( category === undefined ) {

<<<<<<< HEAD
                      <div class="box-result">
                          <div class="card-result">
                              <h4 class="fs-5"> Nombre de question(s) réussite(s) : <p class="text-success"> 7 </p> </h4>
                          </div>
                          <div class="card-result">
                              <h4 class="fs-5"> Point(s) gagné lors de la partie : <p class="text-success"> 14 pts </p> </h4>
                          </div>
                          <div class="card-result">
                              <h4 class="fs-5"> Difficulté : <p class="text-success"> Moyenne </p> </h4>
                          </div>
                          <div class="card-result">
                              <h4 class="fs-5"> Catégorie : <p class="text-success"> Histoire </p> </h4>
                          </div>
                          <div class="card-result">
                              <h4 class="fs-5"> Pourcentage de réussite : <p class="text-success"> 70% </p> </h4>
                          </div>
                          </div>
                    <button class="btn btn-outline-primary testButton" id="buttonResult"> Consulter le classement </button>
                  </div>
            </div>
            </div>
      </div>
  `
  ;
  const button = document.querySelector('button');

  console.log( button.className);
  const buttonResultClik = document.querySelector(".testButton");
  buttonResultClik.addEventListener('click', boutonClassement );
  const fireworks = createFireworks();
  endFireworks(fireworks);
=======
    return Navigate('/');

  };

  let textClassName;
  let textContent;

  const isSucceeded = percentageQuestionsSucceeded >= 50;

  if ( isSucceeded ) {

    textContent = 'Félicitation, vous avez réussi le quizz !';
    textClassName = 'text-success';

  } else {

    textContent = 'Dommage, vous n\'avez pas réussi le quizz..';
    textClassName = 'text-danger';

  }

  renderResults( category, difficulty, pointsTotauxRapportes, percentageQuestionsSucceeded, textContent, textClassName );

  if ( isSucceeded ) {

    const fireworks = createFireworks();
    endFireworks(fireworks);

  }
  

  return true;
};

function renderResults( category, difficulty, pointsTotauxRapportes, percentageQuestionsSucceeded, textContent, textClassName ) {

    sessionStorage.clear();
    
    const main = document.querySelector('main');
    main.innerHTML = `
        <div class="container">
                <div id="resultQuizz-fireworks"></div>
                <div id="resultQuizz-glass-container">
                    <div class="main">
                        <h1> Résultat du Quizz </h1>

                        <h4 class="${textClassName}"> ${textContent} </h4>

                        <div class="box-result">
                            <div class="card-result">
                                <h4 class="fs-5"> Difficulté : <p class="${textClassName}"> ${difficulty} </p> </h4>
                            </div>
                            <div class="card-result">
                                <h4 class="fs-5"> Catégorie : <p class="${textClassName}"> ${category} </p> </h4>
                            </div>
                            <div class="card-result">
                                <h4 class="fs-5"> Points gagnés : <p class="${textClassName}"> ${pointsTotauxRapportes} pts </p> </h4>
                            </div>
                            <div class="card-result">
                                <h4 class="fs-5"> Pourcentage de réussite : <p class="${textClassName}"> ${percentageQuestionsSucceeded}% </p> </h4>
                            </div>
        
                            <button type="button" class="btn btn-outline-primary" id="button-result">Consulter le classement </button>
                            </div>
                    </div>
                </div>
                </div>
        </div>
    `;
    
>>>>>>> e35f4f551edcea61d528ca42f98c98ef02d151e3
};

function boutonClassement() {

    const buttonResultClik = document.querySelector(".testButton");

    buttonResultClik.style.border = "5px solid red"

    classement();
}


function createFireworks() {

    const container = document.querySelector('#resultQuizz-fireworks')
    // eslint-disable-next-line new-cap
    const fireworks = new Fireworks(container, {
        autoresize : false,
        traceSpeed : 5,
    });

    fireworks.start();

    return fireworks;

}

function endFireworks(fireworks) {

    setTimeout(() => {

        for ( let i=0; i<60; i+=1 ) {

            const {currentOptions} = fireworks;

            setTimeout(() => {

                let {intensity} = currentOptions;

                if ( intensity <= 0 ) {

                    fireworks.stop();

                } else {

                    intensity -= 0.5;

                    fireworks.updateOptions({
                        intensity,
                    });

                }
                
                
            }, i * 300);

        }

    }, 3000 );

}

export default resultQuizz;
