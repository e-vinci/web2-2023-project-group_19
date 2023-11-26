
import {getAllQuizzesCategoriesData} from "../../utils/quizzesData";
// import 'https://fonts.googleapis.com/css2?family=Blaka+Hollow&family=Quicksand:wght@300;400;500&display=swap';
const HomePage = () => {
  generateStructure();
  generateCards();
};

function generateStructure() {

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
          <div class = "box"></div>
        </div>
      </div>
    </div>
  </div>`;

}

function generateCards() {

  const box = document.querySelector('.box');

  const quizzesCategories = getAllQuizzesCategoriesData();

  quizzesCategories.forEach( category => {

    box.innerHTML += `
      <div class="card">
        <img src="${category.image}" class="card-img-top" alt="image">
        <div class="card-body ">
          <h5 class="card-title"> ${category.name} </h5>
          <a href="${category.link}" class="btn-primary"> jouer </a>
        </div>
      </div>`
  });

}

export default HomePage;
