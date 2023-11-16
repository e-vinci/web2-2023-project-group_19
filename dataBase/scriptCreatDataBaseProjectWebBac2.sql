-- Supprimer le schéma QUIZZLER s'il existe avec toutes ses dépendances
DROP SCHEMA IF EXISTS QUIZZLER CASCADE;

-- Créer le schéma QUIZZLER
CREATE SCHEMA QUIZZLER;

-- Créer la table quizzes
CREATE TABLE QUIZZLER.quizzes (
    id_quizz SERIAL PRIMARY KEY,
    difficultee INTEGER NOT NULL CHECK (difficultee > 0 AND difficultee < 4),
    categorie VARCHAR NOT NULL,
    points_rapportes INTEGER NULL CHECK (points_rapportes >= 0),
    nbr_points_reussies INTEGER NULL CHECK (nbr_points_reussies <= 10)
);

-- Créer la table users
CREATE TABLE QUIZZLER.users (
    id_user SERIAL PRIMARY KEY,
    email VARCHAR NOT NULL UNIQUE,
    mdp VARCHAR NOT NULL,
    username VARCHAR NOT NULL UNIQUE,
    nbr_points INTEGER DEFAULT 0 CHECK (nbr_points >= 0),
    isAdmin BOOLEAN NOT NULL DEFAULT FALSE
);

-- Créer la table participations
CREATE TABLE QUIZZLER.participations (
    id_participation SERIAL PRIMARY KEY,
    quizz INTEGER NOT NULL REFERENCES QUIZZLER.quizzes (id_quizz),
    utilisateur INTEGER NOT NULL REFERENCES QUIZZLER.users (id_user),
    nbr_tentatives INTEGER NOT NULL CHECK (nbr_tentatives >= 0)
);

-- Créer la table questions
CREATE TABLE QUIZZLER.questions (
    id_question SERIAL PRIMARY KEY,
    quizz INTEGER NOT NULL REFERENCES QUIZZLER.quizzes (id_quizz),
    numero INTEGER NOT NULL CHECK (numero >= 0 AND numero <= 10),
    intitule VARCHAR NOT NULL
);

-- Créer la table propositions
CREATE TABLE QUIZZLER.propositions (
    id_proposition SERIAL PRIMARY KEY,
    intitule VARCHAR NOT NULL,
    isReponse BOOLEAN NOT NULL DEFAULT FALSE,
    question INTEGER REFERENCES QUIZZLER.questions (id_question)
);

INSERT INTO QUIZZLER.quizzes(difficultee, categorie) VALUES
    (1,'histoire'),
    (1,'geographie'),
    (1,'science');
-- Insertion de questions d'histoire
INSERT INTO QUIZZLER.questions (quizz, numero, intitule) VALUES
    (1, 1, 'Quelle était la capitale de l''Empire romain?'),
    (1, 2, 'Quel événement a marqué le début de la Première Guerre mondiale?'),
    (1, 3, 'Qui était le dirigeant de l''Union soviétique pendant la crise des missiles cubains?');

-- Insertion de propositions pour les questions d'histoire
INSERT INTO QUIZZLER.propositions (intitule, isReponse, question) VALUES
    ('Athènes', FALSE, 1),
    ('Rome', TRUE, 1),
    ('Alexandrie', FALSE, 1),
    ('Constantinople', FALSE, 1),
    ('L assassinat de l archiduc François-Ferdinand', TRUE, 2),
    ('La bataille de la Somme', FALSE, 2),
    ('Le traité de Versailles', FALSE, 2),
    ('La révolution russe', FALSE, 2),
    ('Joseph Staline', FALSE, 3),
    ('Léon Trotsky', FALSE, 3),
    ('Nikita Khrouchtchev', TRUE, 3),
    ('Mikhaïl Gorbatchev', FALSE, 3);

-- Insertion de questions de géographie
INSERT INTO QUIZZLER.questions (quizz, numero, intitule) VALUES
    (2, 4, 'Quel est le plus grand océan du monde?'),
    (2, 5, 'Quelle est la capitale du Canada?'),
    (2, 6, 'Quelle est la plus haute montagne du monde?');

-- Insertion de propositions pour les questions de géographie
INSERT INTO QUIZZLER.propositions (intitule, isReponse, question) VALUES
    ('L océan Atlantique', FALSE, 4),
    ('L océan Indien', FALSE, 4),
    ('L océan Arctique', FALSE, 4),
    ('L océan Pacifique', TRUE, 4),
    ('Toronto', FALSE, 5),
    ('Ottawa', TRUE, 5),
    ('Vancouver', FALSE, 5),
    ('Montréal', FALSE, 5),
    ('Mont Everest', TRUE, 6),
    ('K2', FALSE, 6),
    ('Mont McKinley', FALSE, 6),
    ('Mont Kilimandjaro', FALSE, 6);

-- Insertion de questions de science
INSERT INTO QUIZZLER.questions (quizz, numero, intitule) VALUES
    (3, 7, 'Quel est le symbole chimique de l eau?'),
    (3, 8, 'Quelle est la plus petite particule d un élément chimique?'),
    (3, 9, 'Quel scientifique a développé la théorie de la relativité restreinte?');

-- Insertion de propositions pour les questions de science
INSERT INTO QUIZZLER.propositions (intitule, isReponse, question) VALUES
    ('H2O', TRUE, 7),
    ('CO2', FALSE, 7),
    ('O2', FALSE, 7),
    ('NaCl', FALSE, 7),
    ('Atome', TRUE, 8),
    ('Molécule', FALSE, 8),
    ('Proton', FALSE, 8),
    ('Neutron', FALSE, 8),
    ('Isaac Newton', FALSE, 9),
    ('Albert Einstein', TRUE, 9),
    ('Niels Bohr', FALSE, 9),
    ('Marie Curie', FALSE, 9);
