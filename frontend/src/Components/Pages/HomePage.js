 import { PerspectiveCamera, Scene, WebGLRenderer, Points, PointsMaterial, BufferGeometry, Float32BufferAttribute, MathUtils, TextureLoader, Group, Clock} from "three";
 // import {OrbitControls} from 'three/examples/jsm/controls/OrbitControls' // import de l'objet

import circle from '../../img/PYlN8.png'

import {getAllQuizzesCategoriesData} from "../../utils/quizzesData";

const HomePage = () => {
  generateStructure();
  generateCards();
  renderThreeDimension();
};

function generateRandomPointsDistanceColor( pointsCount, pointsDistance ) {

  const points = new Float32Array(pointsCount * 3); // chaque point a des coordonnées en x, y, z
  const colors = new Float32Array(pointsCount * 3); // tableau qui contient toute les couleurs r, g, b

  for (let i = 0; i < points.length; i += 3) { // possibilite de probleme avec l'incrementation
    points[i] = MathUtils.randFloatSpread(pointsDistance * 2); // genere un entier compris entre 1 et -1 car la distance / 2
    points[i + 1] = MathUtils.randFloatSpread(pointsDistance * 2); // genere un entier compris entre 1 et -1 car la distance / 2
    points[i + 2] = MathUtils.randFloatSpread(pointsDistance * 2); // genere un entier compris entre 1 et -1 car la distance / 2
    colors[i] = Math.random();
    colors[i + 1] = Math.random();
    colors[i + 2] = Math.random();
  }

  return { colors, points };

}

function renderThreeDimension (){

 const texture = new TextureLoader(); // creer l'objet qui va changer la forme de l'element
 const circleTexture = texture.load(circle); // j'ajoute la texture a mon element
 const scene = new Scene(); // creation d'un objet
 
 const count = 750 // nombre de point presents
 const distance = 2; // qui va permettre de specifier la distance entre le point le plus proche et le point le plus loin

 // scene.add(new AxesHelper()); // permet de voir les axes

 const camera = new PerspectiveCamera(
  75,
  window.innerWidth / window.innerHeight,
  0.01, 
  1000); // camera qui permet de regarder la scene
 camera.position.y = 0.5;
 camera.position.z = 2; // pousser la camera pour regarder le centre
 camera.position.x = 0.5;
 scene.add(camera); // ajout de la camera a la scene

  const { points, colors } = generateRandomPointsDistanceColor( count, distance );

 const Geometrie = new BufferGeometry() // cette ligne permet de créer des geometrie plus complexe par exemple des faces

 
 Geometrie.setAttribute('position', new Float32BufferAttribute(points, 3));// l'attribut va s'appeler position et va contenir des triplet d'element et prendre 3 elements qui correspond a une coordonner
 Geometrie.setAttribute('color', new Float32BufferAttribute(colors, 3));
 const pointMaterial = new PointsMaterial({
  size : 0.1,
  vertexColors: true,
  map : circleTexture,
  alphaTest : 0.01,
  transparent: true,
 })
 const pointsObject = new Points(Geometrie, pointMaterial); // creer des point

 const groupe = new Group();
 groupe.add(pointsObject);

//  const LineMaterial = new LineBasicMaterial({
//   color : 0xfff5f5f5,
//   opacity : 0.001,
//  })

//  const LineObject = new Line(Geometrie, LineMaterial);

//  LineObject.computeLineDistances();
//  LineObject.scale.x = 0.5 // probleme
//  LineObject.scale.y = 0.5 // probleme
//  LineObject.scale.z = 0.09 //  probleme
//  groupe.add(LineObject);

 scene.add(groupe);
 const renderer = new WebGLRenderer({
  antialias: true,
  alpha : true, // permet de rendre les bord plus lisse sans le pixelisage
 }); // permet de rendre la scene a l'ecran
 renderer.setSize(window.innerWidth, window.innerHeight); // definir la taille du rendu 
 renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))// definir le ratio et mettre 2 pour economiser des ressources sur des ecrans qui on une densite de pixel important
 const particlesContainer = document.querySelector('#homepage-particles-container');
 particlesContainer.appendChild(renderer.domElement) // rendre l'element sur le body
 // const controls = new OrbitControls(camera, renderer.domElement) // Les commandes d'orbite permettent à la caméra d'orbiter autour d'une cible.

 const clock = new Clock();

//   let mouseXY = 0; 
//   window.addEventListener('mousemove', e => { // cette fonction va recuperer la position de la souris
//   mouseXY = e.clientX
//   mouseXY = e.clientY
//  })

function tick (){ // une function pour avoir un nouveau rendu
  const time = clock.getElapsedTime() // compter le temps qui c'est ecouler
  groupe.rotation.y = time * 0.1; // controle automatique 
  groupe.rotation.x = time * 0.1; // controle automatique 
  groupe.rotation.z = time * 0.1; // controle automatique 
  // const ratio = (mouseXY / window.innerWidth -0.5) * 2 // controle de l'utilisateur
  // groupe.rotation.y = ratio * Math.PI * 0.1 // vitesse de rotation de l'utilisateur
  renderer.render(scene, camera); // faire le rendu par rapport a la camera
  // controls.update(); // permet a notre cube de pouvoir bouger
  requestAnimationFrame(tick); // permet de rappeler la fonction pour avoir des rendu en permanence

}

tick();

window.addEventListener('resize', () => {
  camera.aspect = window.innerWidth / window.innerHeight; // changer l'aspect de la camera
  camera.updateProjectionMatrix(); // mettre a jour la camera
  renderer.setSize(window.innerWidth, window.innerHeight); // changer la taille du renderer
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2)) // changement du pixel ratio exemple changement d'ecran
})

};
function generateStructure() {

  const main = document.querySelector('main');
  main.innerHTML = 
  `<div id="homepage-particles-container"></div>
  <div class="container homepage-container">
    <div class="homepage-glass-container"> 
    <div class="content">
    <div class= "main">
      <h1> QUIZZLER </h1> <br>
      <h4>
        Plongez dans le savoir !
      </h4>
      <div class = "box">
      </div>
  </div>
</div>
</div>
</div>`

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
