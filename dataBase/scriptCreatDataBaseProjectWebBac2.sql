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

-- remplisage de la base de donnée

-- Quizz 1 :
insert into QUIZZLER.quizzes(difficultee, categorie) VALUES (1,'histoire');
-- question 1 quizz 1:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (1,1,'Qui était le premier président des États-Unis ?');
-- question 2 quizz 1:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (1,2,'Quel événement a marqué le début de la Révolution française en 1789 ?');
-- question 3 quizz 1:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (1,3,'Quel explorateur a découvert l Amérique en 1492 au nom de l Espagne ?');
-- question 4 quizz 1:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (1,4,'Quelle civilisation a construit les pyramides en Égypte ?');
-- question 5 quizz 1:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (1,5,'Quel empereur romain a construit le Colisée à Rome ?');
-- question 6 quizz 1:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (1,6,'Quel événement a déclenché la Première Guerre mondiale en 1914 ?');
-- question 7 quizz 1:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (1,7,'Qui était la reine d Égypte célèbre pour sa relation avec Jules César et Marc Antoine ?');
-- question 8 quizz 1:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (1,8,'Quel document a été signé en 1215 en Angleterre et a limité le pouvoir du roi ?');
-- question 9 quizz 1:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (1,9,'Qui a mené la lutte pour l indépendance de l Inde contre la domination britannique ?');
-- question 10 quizz 1:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (1,10,'Quel événement a marqué la fin de la guerre froide en 1989 ?');

-- proposition quizz 1
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Abraham Lincoln',false,1);
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('George Washington',true,1);
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Thomas Jefferson',false,1);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La prise de la Bastille',true,2);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Waterloo',false,2);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L assassinat de Louis XVI',false,2);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Christophe Colomb',true,3);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Marco Polo',false,3);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vasco de Gama',false,3);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mésopotamie',false,4);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Grèce antique',false,4);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Civilisation égyptienne',true,4);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Auguste',false,5);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Néron',false,5);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Jules César',true,5);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L attentat de Sarajevo',true,6);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité de Versailles',false,6);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Révolution russe',false,6);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Cléopâtre',true,7);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Néfertiti',false,7);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hatshepsout',false,7);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Magna Carta',true,8);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Déclaration d indépendance',false,8);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Code de Hammurabi',false,8);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mahatma Gandhi',true,9);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Jawaharlal Nehru',false,9);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Subhas Chandra Bose',false,9);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La chute du mur de Berlin',true,10);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La création de l OTAN',false,10);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La révolution cubaine',false,10);


-- Quizz 2 :
insert into QUIZZLER.quizzes(difficultee, categorie) VALUES (1,'histoire');
-- question 1 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (2,1,'Quel dirigeant politique a dirigé l Union soviétique pendant la majeure partie de la guerre froide ?');
-- question 2 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (2,2,'Qui était le leader des droits civiques aux États-Unis dans les années 1960 ?');
-- question 3 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (2,3,'Quel empire a été dirigé par Napoléon Bonaparte au début du XIXe siècle ?');
-- question 4 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (2,4,'Quelle bataille importante a eu lieu en 1066 en Angleterre, marquant la fin de l ère anglo-saxonne ?');
-- question 5 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (2,5,'Quel événement a conduit à la création de l ONU après la Seconde Guerre mondiale ?');
-- question 6 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (2,6,'Qui était le célèbre explorateur portugais qui a ouvert la voie maritime vers l Inde au XVe siècle ?');
-- question 7 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (2,7,'Quelle guerre a opposé le Nord et le Sud des États-Unis de 1861 à 1865 ?');
-- question 8 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (2,8,'Quel roi de France a été guillotiné pendant la Révolution française ?');
-- question 9 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (2,9,'Quel événement a marqué le début de la Réforme au XVIe siècle ?');
-- question 10 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (2,10,'Qui était le dirigeant de l Union pendant la guerre civile américaine ?');

-- proposition quizz 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Joseph Staline',true,11);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Nikita Khrouchtchev',false,11);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mikhaïl Gorbatchev',false,11);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Malcolm X',false,12);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Martin Luther King Jr',true,12);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Rosa Parks',false,12);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L Empire ottoman',false,13);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L Empire austro-hongrois',false,13);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L Empire français',true,13);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Hastings',true,14);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille d Azincourt',false,14);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Crécy',false,14);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La conférence de Yalta',false,15);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le plan Marshall',true,15);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La charte de San Francisco',false,15);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ferdinand Magellan',false,16);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vasco de Gama',true,16);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hernán Cortés',false,16);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La guerre de Sécession',true,17);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La guerre de Cent Ans',false,17);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La guerre hispano-américaine',false,17);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Louis XIV',false,18);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Louis XVI',true,18);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Louis XV',false,18);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La publication des 95 thèses par Martin Luther',true,19);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bulle Inter gravissimas',false,19);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Concile de Trente',false,19);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Abraham Lincoln',true,20);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ulysses S. Grant',false,20);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Robert E. Lee',false,20);

-- Quizz 3 :
insert into QUIZZLER.quizzes(difficultee, categorie) VALUES (1,'histoire');
-- question 1 quizz 3:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (3,1,'Quelle civilisation ancienne a construit la cité de Machu Picchu au Pérou ?');
-- question 2 quizz 3:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (3,2,'Quel événement a marqué le début de la Renaissance en Europe ?');
-- question 3 quizz 3:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (3,3,'Qui était la reine d Angleterre célèbre pour son règne de 63 ans au XIXe siècle ?');
-- question 4 quizz 3:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (3,4,'Quel empire a été dirigé par Constantinople (Byzance) après la division de l Empire romain ?');
-- question 5 quizz 3:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (3,5,'Quel événement a conduit à la déclaration d indépendance des États-Unis en 1776 ?');
-- question 6 quizz 3:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (3,6,'Qui était le chef militaire et politique de l Allemagne nazie pendant la Seconde Guerre mondiale ?');
-- question 7 quizz 3:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (3,7,'Quel traité a mis fin à la Première Guerre mondiale en 1919 ?');
-- question 8 quizz 3:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (3,8,'Combien de temps a durée la guerre de 100 ans ?');
-- question 9 quizz 3:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (3,9,'Qui était le fondateur de la dynastie des Ming en Chine ?');
-- question 10 quizz 3:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (3,10,'Quel philosophe grec a été le maître d Alexandre le Grand ?');

-- proposition quizz 3
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Civilisation maya',false,21);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Civilisation inca',true,21);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Civilisation azthèque',false,21);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La chute de Constantinople',false,22);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La découverte de l Amérique',true,22);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La peste noire',false,22);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Victoria',true,23);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Elizabeth',false,23);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Anne',false,23);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('romain d Occident',false,24);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES (' Empire byzantin',true,24);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Empire sassanide',false,24);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Lexington et Concord',true,25);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L émancipation proclamation',false,25);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Boston Tea Party',false,25);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Adolf Hitler',true,26);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Benito Mussolini',false,26);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hideki Tojo',false,26);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité de Brest-Litovsk',false,27);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité de Versailles',true,27);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité de Trianon',false,27);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('100 ans',false,28);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('111 ans',false,28);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('116ans',true,28);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Confucius',false,29);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Gengis Khan',false,29);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Zhu Yuanzhang',true,29);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Socrate',false,30);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Aristote',true,30);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Platon',false,30);