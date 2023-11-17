import throphyImg from '../../img/throphyImg.png';
import medailleBronz from '../../img/medaille_bronze.png'
import medailleOr from '../../img/medaille_or.png'
import medailleArgent from '../../img/medaille_argent.png'

const ClassementPage = () => {
    const main = document.querySelector('main');
    main.innerHTML = 
    `
    <div class="container-classement">
    <div class ="sous-classement-body">

        <div class="classement-header">
            <img src="${throphyImg}" alt="Trophy Image">
            <h1>CLASSEMENT ACTUEL</h1>
        </div>

        <div class="classement-body">
            <div class="table">
            
                <div class="medal-container">
                    <div class="medal">
                        <img src="${medailleArgent}" alt="Médaille d'argent">
                        <div class="usernameClassement">vLuken</div>
                        <div class="scoreClassement">150</div>
                    </div>
                    <div class="medal">
                        <img src="${medailleOr}" alt="Médaille d'or">
                        <div class="usernameClassement">iySmo</div>
                        <div class="scoreClassement">300</div>

                    </div>
                    <div class="medal">
                        <img src="${medailleBronz}" alt="Médaille de bronze">
                        <div class="usernameClassement">ayaro_07</div>
                        <div class="scoreClassement">100</div>
                    </div>
                </div>

                <div class="data-row">
                    <div class="rankClassement">4</div>
                    <div class="usernameClassement">Nicolas</div>
                    <div class="scoreClassement">85</div>
                </div>
                <div class="data-row">
                    <div class="rankClassement">5</div>
                    <div class="usernameClassement">Simon</div>
                    <div class="scoreClassement">67</div>
                </div>
                <div class="data-row">
                    <div class="rankClassement">6</div>
                    <div class="usernameClassement">T4</div>
                    <div class="scoreClassement">45</div>
                </div>
            </div>
        </div>
        </div>
</div>


    `
  };
  
  export default ClassementPage;