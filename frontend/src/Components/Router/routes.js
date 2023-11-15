import aboutUs from '../Pages/aboutUs';
import HomePage from '../Pages/HomePage';
import LoginPage from '../Pages/LoginPage';
import RegisterPage from '../Pages/RegisterPage';
import NewPage from '../Pages/NewPage';
import creationQuizz from '../Pages/creationQuizz';
import viewQuizzes from '../Pages/viewQuizzes';

const routes = {
  "/": HomePage,
  '/aboutUs': aboutUs,
  '/login': LoginPage,
  '/register' : RegisterPage,
  '/new': NewPage,
  '/creationQuizz' : creationQuizz,
  '/viewQuizzes' : viewQuizzes
};

export default routes;