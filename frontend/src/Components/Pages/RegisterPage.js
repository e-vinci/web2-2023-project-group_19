import quizzlerLogo from "../../img/logo-site.png";
import { setAuthenticatedUser } from '../../utils/auths';
import { clearPage, renderPageTitle } from '../../utils/render';
import Navbar from '../Navbar/Navbar';
import Navigate from '../Router/Navigate';


const RegisterPage = () => {
    clearPage();
    renderPageTitle('Register');

    const main = document.querySelector('main');
    main.innerHTML = 
    `
    <div class="container-register">
        <div class="left-container">
            <div class="center-content">
                <img src="${quizzlerLogo}" alt="" class="img-fluid">
                <h1>QUIZZLER</h1>
            </div>
        </div>
        <div class="right-container">
            <div class="center-content">
                <h1>REGISTER</h1>
                <form id="registerForm">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email"  name="email" id="registerEmail">
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text"  name="username" id="registerUsername">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="registerPassword">
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm passwor</label>
                        <input type="password" name="confpassword" id="registerConfPassword">
                    </div>
                    <div class="form-group">
                        <p>
                            En vous inscrivant, vous acceptez<br>
                            nos <a href="/confidentiality">conditions générales d'utilisation</a>
                        </p>
                    </div>
                    <div class="form-group">
                        <input type="submit" id="submitBtn">
                    </div>
                </form>
                <a href="/login">Vous possédez un compte ?</a>
            </div>
        </div>
    </div>

    `

    const submitButton = document.querySelector("#registerForm");
    submitButton.addEventListener('submit', onRegister);
  };

  async function onRegister(e) {
    e.preventDefault();
  
    const email = document.querySelector('#registerEmail').value;
    const password = document.querySelector('#registerPassword').value;
    const confPassword = document.querySelector('#registerConfPassword').value;
    const username = document.querySelector('#registerUsername').value;

    if (password !== confPassword) {
        throw new Error ("Passwords do not match");
    }
    const options = {
        method: 'POST',
        body: JSON.stringify({
            email,
            username,
            password
        }),
        headers: {
            'Content-Type': 'application/json',
        },
    }



   
  
    console.log(options.body);
    const response = await fetch('/api/auths/register', options);
    console.log(response.status);
    const authenticatedUser = await response.json();
  
    try{

        if (!response.ok) throw new Error(`fetch error : ${response.status} : ${response.statusText}`);
        
        console.log('Newly registered & authenticated user : ', authenticatedUser);
      
        setAuthenticatedUser(authenticatedUser);
      
        Navbar();
      
        Navigate('/');
    }catch(error){
        alert(authenticatedUser);
    } 
}

  export default RegisterPage;