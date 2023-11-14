
const resultQuizz = () => {
    const main = document.querySelector('main');
    main.innerHTML = `
    <div class = "container"
    <div class = "glass-container">
    <div class= "main">
      <h1> Résultat du Quizz</h1>

      /**  A modifier en fonction de la réussite ou pas !! **/
      <h4 class = "text-success"> Félicitation, vous avez réussi le quizz ! </h4>

      
    </div>
    </div>
    </div>
    
`

};

export default resultQuizz;