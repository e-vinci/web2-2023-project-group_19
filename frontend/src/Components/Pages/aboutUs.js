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
    <p class="card-text">Nicolas est responsable de la base de donnée</p>
  </div>
  </div>
  <div class="card" style="width: 18rem;">
  <img src="${imageAlexis}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Alexis Arnaud</h5>
    <p class="card-text">Alexis est responsable de l’algorithme</p>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="${imageKeyvan}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Keyvan Nikazm</h5>
    <p class="card-text">Keyvan est responsable du design du site</p>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="${imageSimon}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Simon Bosseler</h5>
    <p class="card-text">Simon est responsable de remplir la base de donnée</p>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="${imageIsmet}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Ismet Ismet</h5>
    <p class="card-text">Ismet est responsable de créé les pages du site</p>
  </div>
</div>
</div>

  `
};
export default aboutUs;
