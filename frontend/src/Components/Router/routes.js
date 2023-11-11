import aboutUs from '../Pages/aboutUs';
import HomePage from '../Pages/HomePage';
import NewPage from '../Pages/NewPage';
import creationQuizz from '../Pages/creationQuizz';

const routes = {
  "/": HomePage,
  '/aboutUs': aboutUs,
  '/login': NewPage,
  '/register' : NewPage,
  '/creationQuizz' : creationQuizz
};

export default routes;