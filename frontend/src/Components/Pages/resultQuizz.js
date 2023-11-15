
const resultQuizz = () => {
    const main = document.querySelector('main');
    main.innerHTML = `
    <div class = "container"
    <div class = "glass-container">
    <div class= "main">
      <h1> Résultat du Quizz</h1>

      /**  Modifier la couleur en fonction de la réussite ou pas !! **/
      <h4 class = "text-success"> Félicitation, vous avez réussi le quizz ! </h4>

      <div class = "box">
      <div class = "card">
      <h4> Nombre de question(s) réussite(s) : {{this.reussit}} </h4>
      </div>
      <div class = "card">
      <h4> Point(s) gagné lors de la partie : {{this.point}}</h4>
      </div>
      <div class = "card">
      <h4> Difficulté : </h4>
      </div>
      <div class = "card">
      <h4> Catégorie : {{this.categorie}} </h4>
      </div>
      <div class = "card">
      <h4> Pourcentage de réussite : {{this.pourcentage}}</h4>
      </div>
      
      <button type="button" class="btn btn-outline-primary">Consulter le classement </button>
      
      </div>
    </div>
    </div>
    </div>
    
`

};

export default resultQuizz;