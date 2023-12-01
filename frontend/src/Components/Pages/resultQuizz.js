import { Fireworks } from 'fireworks-js';

const resultQuizz = () => {
  const main = document.querySelector('main');
  main.innerHTML = `
      <div class="container">
            <div id="resultQuizz-fireworks"></div>
            <div class="glass-container" id="resultQuizz-glass-container">
                  <div class="main">
                      <h1> Résultat du Quizz </h1>

                      /**  Modifier la couleur en fonction de la réussite ou pas !! **/
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
    
                          <button type="button" class="btn btn-outline-primary" id="button-result">Consulter le classement </button>
                          </div>
                  </div>
            </div>
            </div>
      </div>
  `;
  const fireworks = createFireworks();
  endFireworks(fireworks);
};

function createFireworks() {

    const container = document.querySelector('#resultQuizz-fireworks')
    // eslint-disable-next-line new-cap
    const fireworks = new Fireworks(container, {
        autoresize : false,
    });

    fireworks.start();

    return fireworks;

}

function endFireworks(fireworks) {

    setTimeout(() => {

        for ( let i=0; i<30; i+=1 ) {

            const {currentOptions} = fireworks;

            setTimeout(() => {

                console.log( JSON.stringify( currentOptions ) );

                let {acceleration} = currentOptions;

                if ( acceleration === 0.9850000000000011 ) {

                    fireworks.stop();

                    console.log( "fireworks stopped !!!!!" );

                } else {

                    acceleration -= 0.005;

                    fireworks.updateOptions({
                        acceleration,
                    });

                }
                
                
            }, i * 300);

        }

    }, 3000 );

}

export default resultQuizz;
