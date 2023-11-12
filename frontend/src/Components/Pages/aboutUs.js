import image1 from "../../img/IMG-20230810-WA0000.jpg";
import image2 from "../../img/IMG_7902.jpg";
import image3 from "../../img/IMG_8258.jpg";
import image4 from "../../img/Screenshot_20210401-100311_Instagram.jpg";
import imageNico from "../../img/photoNico.jpg";



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
  <img src="${image1}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Alexis Arnaud</h5>
    <p class="card-text">Alexis est responsable de l’algorithme</p>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="${image4}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Keyvan Nikazm</h5>
    <p class="card-text">Keyvan est responsable du design du site</p>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="${image2}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Simon Bosseler</h5>
    <p class="card-text">Simon est responsable de remplir la base de donnée</p>
  </div>
</div>
<div class="card" style="width: 18rem;">
  <img src="${image3}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Ismet Ismet</h5>
    <p class="card-text">Ismet est responsable de créé les pages du site</p>
  </div>
</div>
</div>

  `
};
export default aboutUs;
