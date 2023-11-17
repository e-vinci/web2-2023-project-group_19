import aboutUs from '../Pages/aboutUs';
import HomePage from '../Pages/HomePage';
import LoginPage from '../Pages/LoginPage';
import RegisterPage from '../Pages/RegisterPage';
import NewPage from '../Pages/NewPage';
import creationQuizz from '../Pages/creationQuizz';
import ClassementPage from '../Pages/ClassementPage';

const routes = {
  "/": HomePage,
  '/aboutUs': aboutUs,
  '/login': LoginPage,
  '/register' : RegisterPage,
  '/new': NewPage,
  '/creationQuizz' : creationQuizz,
  '/classement' : ClassementPage,

};

export default routes;