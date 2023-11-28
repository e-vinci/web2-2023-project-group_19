import aboutUs from '../Pages/aboutUs';
import HomePage from '../Pages/HomePage';
import LoginPage from '../Pages/LoginPage';
import RegisterPage from '../Pages/RegisterPage';
import creationQuizz from '../Pages/creationQuizz';
import ClassementPage from '../Pages/ClassementPage';
import viewQuizzes from '../Pages/viewQuizzes';
import resultQuizz from '../Pages/resultQuizz';
import pageQuestion from '../Pages/page_questionnaire'
import pageConfidentialité from '../Pages/Confidentialite'

const routes = {
  "/": HomePage,
  '/aboutUs': aboutUs,
  '/login': LoginPage,
  '/register' : RegisterPage,
  '/creationQuizz' : creationQuizz,
  '/classement' : ClassementPage,
  '/Confidentialite' : pageConfidentialité,
  
  '/viewQuizzes' : viewQuizzes,
  '/resultQuizz' : resultQuizz,
  '/page_questionnaire': pageQuestion
};

export default routes;