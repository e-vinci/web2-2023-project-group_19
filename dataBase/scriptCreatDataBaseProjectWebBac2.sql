CREATE SCHEMA QUIZZLER;

CREATE TABLE QUIZZLER.quizzes(
    id_quizz SERIAL NOT NULL PRIMARY KEY,
    difficultee INTEGER NOT NULL check(difficultee > 0 && difficultee < 4),
    categorie VARCHAR NOT NULL,
    points_rapportes INTEGER NOT NULL check(points_rapportes >= 0),
    nbr_points_reussies INTEGER NOT NULL check(nbr_points_reussies <= 10),
);

CREATE TABLE QUIZZLER.users(
    id_user SERIAL NOT NULL PRIMARY KEY,
    email varchar NOT NULL UNIQUE,
    mdp varchar NOT NULL,
    username varchar NOT NULL UNIQUE,
    nbr_points INTEGER DEFAULT 0 check(nbr_points >= 0),
    isAdmin BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE QUIZZLER.participations(
    id_participation SERIAL NOT NULL PRIMARY KEY,
    quizz INTEGER NOT NULL REFERENCES quizzs(id_quizz),
    user INTEGER NOT NULL REFERENCES users(id_user),
    nbr_tentatives INTEGER NOT NULL check(nbr_tentatives >= 0)
);

CREATE TABLE QUIZZLER.questions(
    id_question SERIAL NOT NULL PRIMARY KEY,
    quizz INTEGER NOT NULL REFERENCES quizzs(id_quizz),
    numero INTEGER NOT NULL check(numero <= 10 && numero >= 0),
    intitule varchar NOT NULL
);

CREATE TABLE QUIZZLER.propositions(
    id_proposition SERIAL NOT NULL PRIMARY KEY,
    intitule VARCHAR NOT NULL,
    isReponse BOOLEAN NOT NULL DEFAULT FALSE,
    question INTEGER REFERENCES questions(id_question)
);