import geographyImg from "../img/géographie.jpg"
import historyImg from "../img/histoire.jpg";
import sciencesImg from "../img/science.jpg";

const viewQuizzesPath = "http://localhost:8080/viewQuizzes";

const quizzesCategories = [
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

  export default quizzesCategories;