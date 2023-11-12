import quizzlerLogo from "../../img/logo-site.png";

const RegisterPage = () => {
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
                <form action="">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email"  name="email" id="email">
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text"  name="username" id="username">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" id="password">
                    </div>
                    <div class="form-group">
                        <label for="password">Confirm password</label>
                        <input type="password" name="password" id="password">
                    </div>
                    <div class="form-group">
                        <button type="submit">Sign Up</button>
                    </div>
                </form>
                <a href="/login">You have an account?</a>
            </div>
        </div>
    </div>

    `
  };
  
  export default RegisterPage;