import image1 from "../../img/To-do.jpg"
// import 'https://fonts.googleapis.com/css2?family=Blaka+Hollow&family=Quicksand:wght@300;400;500&display=swap';
const HomePage = () => {
  const main = document.querySelector('main');
  main.innerHTML = 
  `<div class="container">
    <div class="glass-container"> 
    <div class="content">
    <div class= "main">
      <h1> QUIZZLER </h1> <br>
      <h4>
        Plonger dans le savoir !
      </h4>
      <div class = "box">
      <div class="card">
        <img src="${image1}" class="card-img-top" alt="image">
          <div class="card-body ">
            <h5 class="card-title"> Catégorie du quizz </h5>
              <a href="#" class="btn-primary"> jouer </a>
         </div>
      </div>
      <div class="card">
        <img src="${image1}" class="card-img-top" alt="image">
          <div class="card-body">
            <h5 class="card-title"> Catégorie du quizz </h5>
              <a href="#" class="btn-primary"> jouer </a>
         </div>
      </div>
      <div class="card">
        <img src="${image1}" class="card-img-top" alt="image">
          <div class="card-body">
            <h5 class="card-title"> Catégorie du quizz </h5>
              <a href="#" class="btn-primary"> jouer </a>
         </div>
      </div>
      </div>
  </div>
</div>
</div>
</div>`
};

export default HomePage;
