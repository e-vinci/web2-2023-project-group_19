import { Fireworks } from 'fireworks-js';
import classement from './ClassementPage';

const resultQuizz = () => {
  const main = document.querySelector('main');
  main.innerHTML = `
      <div class="container">
            <div id="resultQuizz-fireworks"></div>
            <div class="glass-container-resultQuizz" id="resultQuizz-glass-container">
                  <div class="main">
                      <h1> Résultat du Quizz </h1>

                      <!--  Modifier la couleur en fonction de la réussite ou pas !! -->
                      <h4 class="text-success"> Félicitation, vous avez réussi le quizz ! </h4>

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

                console.log( JSON.stringify( currentOptions ) );

                let {intensity} = currentOptions;

                if ( intensity <= 0 ) {

                    fireworks.stop();

                    console.log( "fireworks stopped !!!!!" );

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
