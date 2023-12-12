import imageAlexis from "../../img/Alexis.jpg";
import imageSimon from "../../img/Simon.jpg";
import imageIsmet from "../../img/Ismet.jpg";
import imageKeyvan from "../../img/Keyvan.jpg";
import imageNico from "../../img/Nicolas.jpg";

const aboutUs = () => {
  const main = document.querySelector('main');
  main.innerHTML = `
  <div class = "box2">
  <div class="card" style="width: 18rem;">
  <img src="${imageNico}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Nicolas Venturini</h5>
<<<<<<< HEAD
    <button id="showStory"> description </button>
=======
    <button id="showStory">about Nicolas</button>
>>>>>>> e35f4f551edcea61d528ca42f98c98ef02d151e3
        <dialog id="Story">
          <form method="dialog">
            <p>Nicolas est le responsable de la base de donnée. Il a conceptualisé la base de donnée, la remplit et la déployer avec Simon Nicolas a également fait le backend de la page du classement et à participer au backend pour la création des quizzes.
            </p>
              <button id="confirmBtn">Close</button>
          </form>
        </dialog>
  </div>
  </div>
  <div class="card" style="width: 18rem;">
  <img src="${imageAlexis}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Alexis Arnaud</h5>
<<<<<<< HEAD
    <button id="showStory"> description </button>
=======
    <button id="showStory">About Alexis</button>
>>>>>>> e35f4f551edcea61d528ca42f98c98ef02d151e3
    <dialog id="Story">
      <form method="dialog">
        <p>Pudor in debeo sum nostro illum orationi fortius quidem fortius postulabat aetas fortius datam Neque robustioribus tuli patiebatur meum versari aliquis Atratino hunc accusationis accusationis erga dicendi et Vellem debeo enim Atratino dicendi tueri et accusationis patiebatur tuli parentemque istam tuus quidem et vobis accusationis accusationis moderatur beneficium in magis.
        </p>
          <button id="confirmBtn">Close</button>
      </form>
    </dialog>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="${imageKeyvan}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Keyvan Nikazm</h5>
<<<<<<< HEAD
    <button id="showStory"> description </button>
=======
    <button id="showStory">About Keyvan</button>
>>>>>>> e35f4f551edcea61d528ca42f98c98ef02d151e3
        <dialog id="Story">
          <form method="dialog">
            <p>Pudor in debeo sum nostro illum orationi fortius quidem fortius postulabat aetas fortius datam Neque robustioribus tuli patiebatur meum versari aliquis Atratino hunc accusationis accusationis erga dicendi et Vellem debeo enim Atratino dicendi tueri et accusationis patiebatur tuli parentemque istam tuus quidem et vobis accusationis accusationis moderatur beneficium in magis.</p>
              <button id="confirmBtn">Close</button>
          </form>
        </dialog>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="${imageSimon}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Simon Bosseler</h5>
<<<<<<< HEAD
      <button id="showStory"> description </button>
=======
      <button id="showStory">About Simon</button>
>>>>>>> e35f4f551edcea61d528ca42f98c98ef02d151e3
        <dialog id="Story">
          <form method="dialog">
            <p> Simon est l'un des deux conceptualisateurs de la base de données avec son acolyte Nicolas. Ils ont fourni une base de données structurées afin de déployer une application fonctionnelle et dans le cadre d'une expérience utilisateur à la hauteur des attentes.
            <br> Il a participé à l'insertion de toutes les données dans la base de données ainsi qu'au déploiement de celle-ci.</p>
            <br> Il a également participer au backend de la création des quizzs.
              <button id="confirmBtn">Close</button>
          </form>
        </dialog>

  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="${imageIsmet}" class="card-img-top" alt="...">
  <div class="card-body-AboutUs">
    <h5 class="card-title">Ismet Ismet</h5>
<<<<<<< HEAD
    <button id="showStory"> dexcription </button>
=======
    <button id="showStory">About Ismet</button>
>>>>>>> e35f4f551edcea61d528ca42f98c98ef02d151e3
    <dialog id="Story">
      <form method="dialog">
        <p>Pudor in debeo sum nostro illum orationi fortius quidem fortius postulabat aetas fortius datam Neque robustioribus tuli patiebatur meum versari aliquis Atratino hunc accusationis accusationis erga dicendi et Vellem debeo enim Atratino dicendi tueri et accusationis patiebatur tuli parentemque istam tuus quidem et vobis accusationis accusationis moderatur beneficium in magis.
        </p>
          <button id="confirmBtn">Close</button>
      </form>
    </dialog>
  </div>
</div>
</div>

  `
  const showStory = document.querySelectorAll('#showStory');
  const Story = document.querySelectorAll('#Story');

  for (let i = 0; i < showStory.length; i+=1) {
    showStory[i].addEventListener('click', () => Story[i].showModal());
    
  }

};



export default aboutUs;
