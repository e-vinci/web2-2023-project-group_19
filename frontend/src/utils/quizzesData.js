import geographyImg from "../img/géographie.jpg"
import historyImg from "../img/histoire.jpg";
import sciencesImg from "../img/science.jpg";
import historyImg1 from "../img/img_histoire/img_histoire_1.jpg";
import historyImg2 from "../img/img_histoire/img_histoire_2.jpg";
import historyImg3 from "../img/img_histoire/img_histoire_3.jpg";
import historyImg4 from "../img/img_histoire/img_histoire_4.jpg";
import historyImg5 from "../img/img_histoire/img_histoire_5.png";
import historyImg6 from "../img/img_histoire/img_histoire_6.jpg";
import historyImg7 from "../img/img_histoire/img_histoire_7.jpg";
import historyImg8 from "../img/img_histoire/img_histoire_8.jpg";
import historyImg9 from "../img/img_histoire/img_histoire_9.jpg";
import geoImg1 from "../img/img_geography/img_geo1.jpg";
import geoImg2 from "../img/img_geography/img_geo2.jpg";
import geoImg3 from "../img/img_geography/img_geo3.jpg";
import geoImg4 from "../img/img_geography/img_geo4.jpg";
import geoImg5 from "../img/img_geography/img_geo5.jpg";
import geoImg6 from "../img/img_geography/img_geo6.jpg";
import geoImg7 from "../img/img_geography/img_geo7.jpg";
import geoImg8 from "../img/img_geography/img_geo8.jpg";
import geoImg9 from "../img/img_geography/img_geo9.jpg";
import scienceImg1 from "../img/img_science/img_sci1.jpg";
import scienceImg2 from "../img/img_science/img_sci2.jpg";
import scienceImg3 from "../img/img_science/img_sci3.jpg";
import scienceImg4 from "../img/img_science/img_sci4.jpg";
import scienceImg5 from "../img/img_science/img_sci5.jpg";
import scienceImg6 from "../img/img_science/img_sci6.jpg";
import scienceImg7 from "../img/img_science/img_sci7.jpg";
import scienceImg8 from "../img/img_science/img_sci8.jpg";
import scienceImg9 from "../img/img_science/img_sci9.jpg";


const viewQuizzesPath = "http://localhost:8080/viewQuizzes";

const quizzesCategoriesData = [
    {
      id : "geographie",
      image : geographyImg,
      images : [geoImg1,geoImg2,geoImg3,geoImg4,geoImg5,geoImg6,geoImg7,geoImg8,geoImg9],
      name : "Géographie",
      link : `${viewQuizzesPath}?categorie=geographie`
    },
    {
      id : "histoire",
      image: historyImg,
      images : [historyImg1,historyImg2,historyImg3,historyImg4,historyImg5,historyImg6,historyImg7,historyImg8,historyImg9],
      name : "Histoire",
      link : `${viewQuizzesPath}?categorie=histoire`
    },
    {
      id : "sciences",
      image : sciencesImg,
      images : [scienceImg1,scienceImg2,scienceImg3,scienceImg4,scienceImg5,scienceImg6,scienceImg7,scienceImg8,scienceImg9],
      name : "Sciences",
      link : `${viewQuizzesPath}?categorie=sciences`
    },
  ];

function getQuizzCategoryData (category) {

  return quizzesCategoriesData.find( quizz => quizz.id === category );

}

function getAllQuizzesCategoriesData () {

  return quizzesCategoriesData;

};

export {
  getQuizzCategoryData, 
  getAllQuizzesCategoriesData
};