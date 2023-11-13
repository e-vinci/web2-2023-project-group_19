// eslint-disable-next-line no-unused-vars
import image1 from '../../img/Capture_decran_2023-10-25_134836.png'
/**
 * Render the Navbar which is styled by using Bootstrap
 * Each item in the Navbar is tightly coupled with the Router configuration :
 * - the URI associated to a page shall be given in the attribute "data-uri" of the Navbar
 * - the router will show the Page associated to this URI when the user click on a nav-link
 */

const Navbar = () => {
  const navbarWrapper = document.querySelector('#navbarWrapper');
  const navbar = `
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="#" data-uri="/">
          <img src="${image1}" alt="Logo" width="100" height="100" class="d-inline-block align-top" href="/" data-uri="/">
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="#" data-uri="/creationQuizz">(création)</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" data-uri="/aboutUs">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" data-uri="/login">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" data-uri="/register">Register</a>
            </li>                        
          </ul>
        </div>
      </div>
    </nav>
  `;
  navbarWrapper.innerHTML = navbar;
};

export default Navbar;

