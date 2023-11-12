import quizzlerLogo from "../../img/logo-site.png";

const LoginPage = () => {
    const main = document.querySelector('main');
    main.innerHTML = 
    `
    <div class="container-login">
        <div class="left-container">
            <div class="center-content">
                <img src="${quizzlerLogo}" alt="" class="img-fluid">
                <h1>QUIZZLER</h1>
            </div>
        </div>
        <div class="right-container">
            <div class="center-content">
                <h1>LOGIN</h1>
                <form action="">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text"  name="username" id="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password">
                    </div>
                    <div class="form-group">
                        <button type="submit">Sign Up</button>
                    </div>
                </form>
                <a href="/register">Don’t have an account?</a>
            </div>
        </div>
    </div>

    `
  };
  
  export default LoginPage;