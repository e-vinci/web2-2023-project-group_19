import aboutUs from '../Pages/aboutUs';
import HomePage from '../Pages/HomePage';
import NewPage from '../Pages/NewPage';

const routes = {
  "/": HomePage,
  '/aboutUs': aboutUs,
  '/login': NewPage,
  '/register' : NewPage
};

export default routes;