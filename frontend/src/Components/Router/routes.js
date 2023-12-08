import AboutUsPage from '../Pages/AboutUsPage';
import HomePage from '../Pages/HomePage';
import LoginPage from '../Pages/LoginPage';
import RegisterPage from '../Pages/RegisterPage';
import CreationQuizzPage from '../Pages/CreationQuizzPage';
import LeaderboardPage from '../Pages/ClassementPage';
import ViewQuizzesPage from '../Pages/ViewQuizzesPage';
import ResultQuizzPage from '../Pages/ResultQuizzPage';
import QuestionnairePage from '../Pages/QuestionnairePage'
import ConfidentialityPage from '../Pages/ConfidentialitePage'

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