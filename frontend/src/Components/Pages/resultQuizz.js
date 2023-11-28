const resultQuizz = () => {
  const main = document.querySelector('main');
  main.innerHTML = `
      <div class="container">
            <div class="glass-container">
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
  `;
};

export default resultQuizz;
