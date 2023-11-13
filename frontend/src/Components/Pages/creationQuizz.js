const creationQuizz = () => {
    const main = document.querySelector('main');
    main.innerHTML = `
    <div id="all">
        <div class="container2" id="container2">
            <div class="form-container2 creation-quizz">
                <form>
                    <h5 class="classe-titre"> Creation Quizz </h5>
                    <span> catégorie quizz : </span>
                    <input type="text" placeholder=". . .">
                    <span> question : </span>
                    <input type="text" placeholder=". . .">
                    <span> différentes réponse : </span>
                    <input type="text" placeholder="1.">
                    <input type="text" placeholder="2.">
                    <input type="text" placeholder="3.">
                    <span> niveau de difficulté </span>
                    <input type="text" placeholder=". . .">
                    <span> réponse correcte </span>
                    <input type="text" placeholder=". . .">
                    <button class="Next-question">Next-question</button>
                </form>
            </div>
            <div class="toggler-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <h4 class=" classe-titre4 ">
                            Bienvenue sur la page de création d’un quizz
                        </h4>
                        <button class="hidden" id="finish">Finish-the-quizz</button>
                    </div>
                </div>
            </div>
        </div>
    </div>`;
};

export default creationQuizz;
