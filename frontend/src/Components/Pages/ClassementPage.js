import throphyImg from '../../img/throphyImg.png';
import medailleBronz from '../../img/medaille_bronze.png';
import medailleOr from '../../img/medaille_or.png';
import medailleArgent from '../../img/medaille_argent.png';
import getClassement from '../../utils/classementQueries';

const main = document.querySelector('main');
const ClassementPage = async() => {
 
  const quizzClassement = await getClassement();


  main.innerHTML = `
    <div class="container-classement">
    <div class ="sous-classement-body">

        <div class="classement-header">
            <img src="${throphyImg}" alt="Trophy Image">
            <h1>CLASSEMENT ACTUEL</h1>
        </div>

        <div class="classement-body">
            <div class="table text-dark">
            
                <div class="medal-container">
                    <div class="medal">
                        <img src="${medailleArgent}" alt="Médaille d'argent">
                        <div class="usernameClassement">${quizzClassement[1].username}</div>
                        <div class="scoreClassement">${quizzClassement[1].nbr_points}</div>
                    </div>
                    <div class="medal">
                        <img src="${medailleOr}" alt="Médaille d'or">
                        <div class="usernameClassement">${quizzClassement[0].username}</div>
                        <div class="scoreClassement">${quizzClassement[0].nbr_points}</div>

                    </div>
                    <div class="medal">
                        <img src="${medailleBronz}" alt="Médaille de bronze">
                        <div class="usernameClassement">${quizzClassement[2].username}</div>
                        <div class="scoreClassement">${quizzClassement[2].nbr_points}</div>
                    </div>
                </div>
            </div>
        </div>
        </div>
</div>


    `;
    creatCase(quizzClassement);
};

function creatCase(quizzClassement){
    
    if(quizzClassement.length > 3){
        const textDark = document.querySelector('.text-dark');
        // eslint-disable-next-line no-plusplus
        for(let i=3; i<quizzClassement.length;i++){
            textDark.innerHTML += `<div class="data-row">
        <div class="rankClassement">${i+1}</div>
        <div class="usernameClassement">${quizzClassement[i].username}</div>
        <div class="scoreClassement">${quizzClassement[i].nbr_points}</div>
    </div>`;
        }
       
        
    }
}


export default ClassementPage;
