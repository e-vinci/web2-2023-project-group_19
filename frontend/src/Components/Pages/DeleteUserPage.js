import quizzlerLogo from "../../img/logo-site.png";
import { clearAuthenticatedUser, getAuthenticatedUser, isAuthenticated } from '../../utils/auths';
import Navbar from '../Navbar/Navbar';
import Navigate from '../Router/Navigate';

const DeleteUserPage = () => {

    if(!isAuthenticated()){
        return Navigate(process.env.PATH_PREFIX);
    }

    const authenticatedUser = getAuthenticatedUser();
    const {username} = authenticatedUser;

    const main = document.querySelector('main');

    main.innerHTML = 
    `
    <div class="container-delete">
        <div class="left-container">
            <div class="center-content">
                <img src="${quizzlerLogo}" alt="" class="img-fluid">
                <h1>QUIZZLER</h1>
            </div>
        </div>
        <div class="right-container">
            <div class="center-content">
                <h1>Supprimez votre compte</h1>
                <form id="deleteForm">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <p id="username">${username}</p>
                    </div>
                    <div class="form-group">
                        <input type="submit" id="submitBtn">
                    </div>
                </form>
            </div>
        </div>
    </div>

    `
    const submitButton = document.querySelector("#deleteForm");
    return submitButton.addEventListener('submit', onDeleteUser);
  };

  async function onDeleteUser(e) {
    e.preventDefault();
  
    clearAuthenticatedUser();
  
    Navbar();
  
    return Navigate(process.env.PATH_PREFIX);
  }

export default DeleteUserPage;