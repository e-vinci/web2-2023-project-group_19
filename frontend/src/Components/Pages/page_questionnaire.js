import imageLogo from '../../img/logo-site.png';

const pageQuestionnaire = () => {
    const main = document.querySelector('main');
    main.innerHTML = `
        <div class="glass-container-pageQuestion"> 
            <div class="card-pageQuestion">
                <h5 class="card-title-pageQuestion"> Catégorie du quizz </h5>
                <img src="${imageLogo}" class="card-img-top-pageQuestion" alt="..."style="width: 31%;">
                <span class = "card-title-question" >
                    Votre question ici.
                </span>
                <span class = "card-title-question" >
                    la question est la suivante.
                </span>
                <div class="card-body">
                    <a href="#" class="btn btn-primary-question">réponse1</a>
                    <a href="#" class="btn btn-primary-question">réponse2</a>
                    <a href="#" class="btn btn-primary-question">réponse3</a>
                </div>
                <button class="Next-question-pageQuestion">Question suivante</button>
            </div>
        </div>
    `;
};

export default pageQuestionnaire;

