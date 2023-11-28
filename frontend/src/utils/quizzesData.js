import geographyImg from "../img/géographie.jpg"
import historyImg from "../img/histoire.jpg";
import sciencesImg from "../img/science.jpg";
// import historyImg1 from "../img/img_histoire/img_histoire_1.jpg";
// import historyImg2 from "../img/img_histoire/img_histoire_2.jpg";
// import historyImg3 from "../img/img_histoire/img_histoire_3.jpg";
// import historyImg4 from "../img/img_histoire/img_histoire_4.jpg";
// import historyImg5 from "../img/img_histoire/img_histoire_5.png";
// import historyImg6 from "../img/img_histoire/img_histoire_6.jpg";
// import historyImg7 from "../img/img_histoire/img_histoire_7.jpg";
// import historyImg8 from "../img/img_histoire/img_histoire_8.jpg";
// import historyImg9 from "../img/img_histoire/img_histoire_9.jpg";

const viewQuizzesPath = "http://localhost:8080/viewQuizzes";

const quizzesCategoriesData = [
    {
      id : "geographie",
      image : geographyImg,
      name : "Géographie",
      link : `${viewQuizzesPath}?categorie=geographie`
    },
    {
      id : "histoire",
      image : historyImg,
      name : "Histoire",
      link : `${viewQuizzesPath}?categorie=histoire`
    },
    {
      id : "sciences",
      image : sciencesImg,
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