import AboutUsPage from '../Pages/aboutUs';
import HomePage from '../Pages/HomePage';
import LoginPage from '../Pages/LoginPage';
import RegisterPage from '../Pages/RegisterPage';
import CreationQuizzPage from '../Pages/creationQuizz';
import LeaderboardPage from '../Pages/ClassementPage';
import ViewQuizzesPage from '../Pages/viewQuizzes';
import ResultQuizzPage from '../Pages/resultQuizz';
import QuestionnairePage from '../Pages/page_questionnaire'
import ConfidentialityPage from '../Pages/Confidentialite'

const routes = {
  "/": HomePage,
  '/aboutUs': AboutUsPage,
  '/login': LoginPage,
  '/register' : RegisterPage,
  '/creationQuizz' : CreationQuizzPage,
  '/leaderboard' : LeaderboardPage,
  '/confidentiality' : ConfidentialityPage,
  '/viewQuizzes' : ViewQuizzesPage,
  '/resultQuizz' : ResultQuizzPage,
  '/questionnaire': QuestionnairePage
};

export default routes;