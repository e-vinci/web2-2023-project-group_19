CREATE SCHEMA QUIZZLER;

CREATE TABLE QUIZZLER.quizzs(
    id_quizz SERIAL NOT NULL PRIMARY KEY,
    difficultee INTEGER NOT NULL,
    categorie VARCHAR NOT NULL,
    point_rapporte INTEGER NOT NULL,
    nbr_point_reussit INTEGER NOT NULL check ( nbr_point_reussit <= 10)
);

CREATE TABLE QUIZZLER.users(
    id_user SERIAL NOT NULL PRIMARY KEY,
    email varchar NOT NULL UNIQUE,
    mdp varchar NOT NULL,
    username varchar NOT NULL UNIQUE,
    nbr_point INTEGER DEFAULT 0 check ( nbr_point >= 0),
   -- rang varchar NULL,
    isAdmin BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE QUIZZLER.participation(
    id_participation SERIAL NOT NULL PRIMARY KEY,
    quizz INTEGER NOT NULL REFERENCES quizzs(id_quizz),
    user INTEGER NOT NULL REFERENCES users(id_user)
);

CREATE TABLE QUIZZLER.questions(
    id_question SERIAL NOT NULL PRIMARY KEY,
    quizz INTEGER NOT NULL REFERENCES quizzs(id_quizz),
    numero INTEGER NOT NULL check (numero <= 10),
    intitule varchar NOT NULL
);

CREATE TABLE QUIZZLER.propositions(
    id_proposition SERIAL NOT NULL PRIMARY KEY,
    intitule VARCHAR NOT NULL,
    is_reponse BOOLEAN NOT NULL DEFAULT FALSE,
    question INTEGER REFERENCES questions(id_question)
);