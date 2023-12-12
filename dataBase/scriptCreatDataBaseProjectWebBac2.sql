-- Supprimer le schéma QUIZZLER s'il existe avec toutes ses dépendances
DROP SCHEMA IF EXISTS QUIZZLER CASCADE;

-- Créer le schéma QUIZZLER
CREATE SCHEMA QUIZZLER;

-- Créer la table quizzes
CREATE TABLE QUIZZLER.quizzes (
    id_quizz SERIAL PRIMARY KEY,
    difficultee INTEGER NOT NULL CHECK (difficultee > 0 AND difficultee < 4),
    categorie VARCHAR NOT NULL,
    points_rapportes INTEGER NULL CHECK (points_rapportes >= 0)
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
    nbr_tentatives INTEGER NOT NULL CHECK (nbr_tentatives >= 0),
    nbr_questions_reussies INTEGER NULL CHECK (nbr_questions_reussies <= 10)
);

-- Créer la table questions
CREATE TABLE QUIZZLER.questions (
    id_question SERIAL PRIMARY KEY,
    quizz INTEGER NOT NULL REFERENCES QUIZZLER.quizzes (id_quizz),
    numero INTEGER NOT NULL CHECK (numero >= 0 AND numero <= 10),
    intitule VARCHAR NOT NULL UNIQUE
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
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (1,'histoire', 1);
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
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (1,'histoire', 1);
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
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (1,'histoire', 1);
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
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Empire byzantin',true,24);
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
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('116 ans',true,28);
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

-- Quizz 4 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (2,'histoire',2);
-- question 1 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (4,1,'Quel événement a marqué le début de la Guerre de Cent Ans en 1337 ?');
-- question 2 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (4,2,'Qui était le fondateur de l Empire mongol au XIIIe siècle ?');
-- question 3 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (4,3,'Quelle ancienne civilisation a développé l écriture cunéiforme en Mésopotamie ?');
-- question 4 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (4,4,'Quelle était la principale cause de la Révolution industrielle au XVIIIe siècle ?');
-- question 5 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (4,5,'Qui était la première femme pilote à traverser l Atlantique en solo en 1932 ?');
-- question 6 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (4,6,'Quel événement a marqué le début de la Guerre de Sécession en 1861 ?');
-- question 7 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (4,7,'Quelle dynastie chinoise a construit la Grande Muraille ?');
-- question 8 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (4,8,'Qui était le dirigeant de l URSS pendant la Seconde Guerre mondiale ?');
-- question 9 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (4,9,'Quel traité a mis fin à la guerre de Trente Ans en 1648 ?');
-- question 10 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (4,10,'Quelle bataille a été décisive pour l indépendance des États-Unis pendant la Révolution américaine ?');

-- proposition quizz 4
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille d Azincourt',false,31);
--proposition 2 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La guerre des Roses',true,31);
--proposition 3 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La décapitation de Charles VI',false,31);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Gengis Khan',true,32);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Kubilai Khan',false,32);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Tamerlan',false,32);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Akkadiens',false,33);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Perses',false,33);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Sumériens',true,33);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Invention de la machine à vapeur',true,34);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Agriculture intensive',false,34);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les guerres napoléoniennes',false,34);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Amelia Earhart',true,35);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Bessie Coleman',false,35);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Jacqueline Cochran',false,35);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Proclamation d émancipation',false,36);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Gettysburg',false,36);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Attaque de Fort Sumter',true,36);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La dynastie Han',false,37);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La dynastie Tang',false,37);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La dynastie Qin',true,37);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Nikita Khrouchtchev',false,38);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Joseph Staline',true,38);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Léon Trotsky',false,38);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité de Westphalie',true,39);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité d Utrecht',false,39);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité de Versailles',false,39);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Yorktown',true,40);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Saratoga',false,40);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Bunker Hill',false,40);

-- Quizz 5 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (2,'histoire',2);
-- question 1 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (5,1,'Qui était le pharaon égyptien connu pour ses réformes religieuses et son culte d Aton ?');
-- question 2 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (5,1,'Quel événement a conduit à la création de la Ligue des Nations en 1920 ?');
-- question 3 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (5,3,'Qui était le roi d Angleterre pendant la signature de la Magna Carta en 1215 ?');
-- question 4 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (5,4,'Quelle était la principale cause de la Révolution russe en 1917 ?');
-- question 5 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (5,5,'Quel explorateur italien a atteint l Amérique en 1499, avant Christophe Colomb ?');
-- question 6 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (5,6,'Quelle bataille a marqué la fin de l Empire napoléonien en 1815 ?');
-- question 7 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (5,7,'Qui était la première femme à remporter le prix Nobel de la paix en 1903 ?');
-- question 8 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (5,8,'Quel était le nom du premier satellite artificiel lancé dans l espace en 1957 par l URSS ?');
-- question 9 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (5,9,'Qui était le chef militaire carthaginois lors des guerres puniques contre Rome ?');
-- question 10 quizz 4:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (5,10,'Quelle guerre a été déclenchée par l attaque surprise de Pearl Harbor en 1941 ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ramsès II',false,41);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Akhenaton',true,41);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Toutânkhamon',false,41);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité de Versailles',false,42);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Révolution russe',false,42);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La fin de la Première Guerre mondiale',true,42);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Richard Cœur de Lion',false,43);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Jean sans Terre',true,43);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Henri II',false,43);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La famine',false,44);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La participation à la Première Guerre mondiale',true,44);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La répression du régime tsariste',false,44);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Marco Polo',false,45);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('John Cabot',false,45);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Amerigo Vespucci',true,45);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Waterloo',true,46);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Leipzig',false,46);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille d Austerlitz',false,46);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Marie Curie',true,47);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Jane Addams',false,47);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Florence Nightingale',false,47);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Explorer 1',false,48);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Apollo 11',false,48);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sputnik 1',true,48);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hannibal',true,49);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hamilcar Barca',false,49);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hasdrubal',false,49);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La guerre du Pacifique',false,50);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La guerre du Golfe',false,50);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Seconde Guerre mondiale',true,50);

-- Quizz 6 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (2,'histoire',2);
-- question 1 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (6,1,'Quelle était la principale cause de la Révolution industrielle en Angleterre au XVIIIe siècle ?');
-- question 2 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (6,2,'Qui était le chef militaire romain célèbre pour sa victoire à la bataille de Zama contre Hannibal ?');
-- question 3 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (6,3,'Quelle était la principale cause de la guerre des Boers en Afrique du Sud au XIXe siècle ?');
-- question 4 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (6,4,'Qui était le premier président de la République populaire de Chine en 1949 ?');
-- question 5 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (6,5,'quel événement a marqué le début de la Révolution industrielle au Royaume-Uni au XVIIIe siècle ?');
-- question 6 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (6,6,'Qui était le célèbre chef militaire carthaginois lors de la deuxième guerre punique ?');
-- question 7 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (6,7,'Quelle était la principale cause de la guerre de Corée en 1950 ?');
-- question 8 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (6,8,'Quel explorateur portugais a atteint l Inde par voie maritime en contournant l Afrique au XVe siècle ?');
-- question 9 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (6,9,'Quel événement a marqué le début de la guerre civile russe en 1918 ?');
-- question 10 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (6,10,'Qui était le célèbre souverain moghol qui a construit le Taj Mahal au XVIIe siècle ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Invention de la machine à vapeur',false,51);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Agriculture intensive',false,51);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La révolution agricole',true,51);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Scipion l Africain',true,52);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Jules César',false,52);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Pompée',false,52);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La rivalité entre les Boers et les Britanniques',true,53);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La ruée vers l or',false,53);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les tensions raciales',false,53);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sun Yat-sen',false,54);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mao Zedong',true,54);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Chiang Kai-shek',false,54);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La découverte de l électricité',false,55);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Révolution française',false,55);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Invention de la machine à vapeur',true,55);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hannibal',true,56);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hamilcar Barca',false,56);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hasdrubal',false,56);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Invasion du Nord par le Sud',true,57);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les rivalités entre les États-Unis et l URSS',false,57);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les revendications territoriales',false,57);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vasco de Gama',false,58);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Fernand de Magellan',false,58);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Bartolomeu Dias',true,58);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Assassinat de Raspoutine',false,59);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Révolution d Octobre',true,59);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La mutinerie du cuirassé Potemkine',false,59);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Aurangzeb',false,60);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Akbar',false,60);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Shah Jahan',true,60);

-- Quizz 7 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (3,'histoire',3);
-- question 1 quizz 7:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (7,1,'Quel empereur romain a tenté de réformer le système politique et économique, mais a été assassiné en 180 après J.-C. ?');
-- question 2 quizz 7:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (7,2,'Quelle bataille décisive a eu lieu en 732, mettant fin à l invasion musulmane en Europe ?');
-- question 3 quizz 7:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (7,3,'Qui était le dirigeant soviétique responsable de la politique de la Perestroïka dans les années 1980 ?');
-- question 4 quizz 7:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (7,4,'Quel philosophe grec a enseigné à Alexandre le Grand et a fondé l école de pensée appelée le Lycée ?');
-- question 5 quizz 7:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (7,5,'Quel était le nom du premier empereur de Chine, fondateur de la dynastie Qin, au IIIe siècle avant J.-C. ?');
-- question 6 quizz 7:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (7,6,'Quel événement a marqué le début de la guerre du Péloponnèse en 431 avant J.-C. ?');
-- question 7 quizz 7:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (7,7,'Qui était le conquérant mongol qui a fondé la dynastie Yuan en Chine au XIIIe siècle ?');
-- question 8 quizz 7:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (7,8,'Quelle bataille a été le tournant de la guerre du Pacifique pendant la Seconde Guerre mondiale, en 1942 ?');
-- question 9 quizz 7:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (7,9,'Quel était le nom de l ancienne cité mésopotamienne, souvent considérée comme la plus ancienne ville du monde ?');
-- question 10 quizz 7:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (7,10,'Qui était le grand général carthaginois lors de la Deuxième Guerre punique, qui a traversé les Alpes avec des éléphants ?');

-- proposition quizz 7
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Auguste',false,61);
--proposition 2 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Nerva',false,61);
--proposition 3 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Commode',true,61);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Poitiers',true,62);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille d Hastings',false,62);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Cannae',false,62);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mikhaïl Gorbatchev',true,63);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Leonid Brejnev',false,63);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Youri Andropov',false,63);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Socrate',false,64);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Aristote',true,64);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Platon',false,64);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Qin Shi Huang',true,65);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Liu Bang',false,65);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Han Wudi',false,65);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Marathon',false,66);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L invasion de la Grèce par les Perses',false,66);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La prise de Corinthe par Sparte',true,66);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Gengis Khan',true,67);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Kubilai Khan',false,67);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Tamerlan',false,67);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Midway',true,68);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille d Iwo Jima',false,68);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Guadalcanal',false,68);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ur',true,69);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sumer',false,69);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Babylone',false,69);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hamilcar Barca',false,70);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hannibal',true,70);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hasdrubal',false,70);

-- Quizz 8 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (3,'histoire',3);
-- question 1 quizz 8:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (8,1,'Quel était le nom du traité qui a mis fin à la Première Guerre mondiale en 1919 ?');
-- question 2 quizz 8:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (8,2,'Qui était le chef militaire et politique de l Empire aztèque lors de la conquête espagnole ?');
-- question 3 quizz 8:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (8,3,'Quelle guerre a été déclenchée par l invasion de la Pologne par l Allemagne en 1939 ?');
-- question 4 quizz 8:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (8,4,'Quelle était la capitale de l Empire byzantin ?');
-- question 5 quizz 8:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (8,5,'Qui était le dirigeant de l URSS pendant la crise des missiles cubains en 1962 ?');
-- question 6 quizz 8:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (8,6,'Quel était le nom du programme spatial soviétique qui a envoyé le premier homme dans l espace en 1961 ?');
-- question 7 quizz 8:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (8,7,'Qui était le célèbre général spartiate qui a dirigé les troupes grecques à la bataille des Thermopyles ?');
-- question 8 quizz 8:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (8,8,'Quelle ancienne civilisation a construit la cité de Persépolis en Perse ?');
-- question 9 quizz 8:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (8,9,'Qui était le dirigeant de l Empire mongol au moment de son apogée, au XIIIe siècle ?');
-- question 10 quizz 8:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (8,10,'Quel était le nom du mouvement artistique et culturel qui a émergé à la Renaissance en Italie au XIVe siècle ?');

-- proposition quizz 8
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité de Versailles',true,71);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité de Brest-Litovsk',false,71);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le traité de Trianon',false,71);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Cuauhtémoc',false,72);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Montezuma II',true,72);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Itzcoatl',false,72);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La guerre sino-japonaise',false,73);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La guerre d Hiver',false,73);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Seconde Guerre mondiale',true,73);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Rome',false,74);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Byzance',false,74);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Constantinople',true,74);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Nikita Khrouchtchev',true,75);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Léonid Brejnev',false,75);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mikhaïl Gorbatchev',false,75);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Apollo',false,76);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vostok',true,76);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Soyuz',false,76);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Périclès',false,77);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Léonidas',true,77);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Alcibiade',false,77);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Perses',true,78);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Babyloniens',false,78);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Mèdes',false,78);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Gengis Khan',false,79);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Kubilai Khan',true,79);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Tamerlan',false,79);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le classicisme',false,80);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le maniérisme',false,80);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Renaissance',true,80);


-- Quizz 9 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (3,'histoire',3);
-- question 1 quizz 9:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (9,1,'Quelle bataille a été le tournant de la guerre civile américaine en faveur de l Union ?');
-- question 2 quizz 9:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (9,2,'Qui était le leader politique sud-africain emprisonné pendant 27 ans, puis devenu président après la fin de l apartheid ?');
-- question 3 quizz 9:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (9,3,'Quel était le nom de l ancienne civilisation précolombienne qui a construit la cité de Teotihuacan au Mexique ?');
-- question 4 quizz 9:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (9,4,'Quelle bataille a été le tournant de la guerre du Vietnam, marquée par une offensive surprise en 1968 ?');
-- question 5 quizz 9:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (9,5,'Quelle était la principale cause de la Révolution hongroise de 1956 ?');
-- question 6 quizz 9:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (9,6,'Qui était le roi d Angleterre pendant la guerre des Deux-Roses ?');
-- question 7 quizz 9:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (9,7,'Quel empereur romain a construit le Colosse de Néron, une statue gigantesque à son effigie ?');
-- question 8 quizz 9:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (9,8,'Quelle était la principale cause de la guerre entre l Iran et l Irak dans les années 1980 ?');
-- question 9 quizz 9:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (9,9,'Qui était le célèbre explorateur chinois qui a entrepris sept voyages diplomatiques au XIVe siècle ?');
-- question 10 quizz 9:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (9,10,'Quel était le nom de l empereur romain qui a adopté le christianisme comme religion officielle de l Empire ?');

-- proposition quizz 9
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Gettysburg',true,81);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Bull Run',false,81);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Shiloh',false,81);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Thabo Mbeki',false,82);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('F.W. de Klerk',false,82);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Nelson Mandela',true,82);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Aztèques',false,83);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Mayas',false,83);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Toltèques',true,83);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Dien Bien Phu',false,84);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille de Hue',true,84);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La bataille d Ia Drang',false,84);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La domination soviétique',true,85);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La crise économique',false,85);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les tensions ethniques',false,85);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Henri VII',false,86);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Richard III',true,86);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Édouard IV',false,86);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Auguste',false,87);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Néron',true,87);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Caligula',false,87);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les frontières contestées',false,88);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les rivalités religieuses',true,88);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les ressources pétrolières',false,88);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Zheng He',true,89);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Marco Polo',false,89);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ibn Battuta',false,89);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Auguste',false,90);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Constantin',true,90);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Trajan',false,90);

-- Quizz 10 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (1,'geographie',3);
-- question 1 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (10,1,'Quel est le plus grand océan de la planète ?');
-- question 2 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (10,2,'Quel est le fleuve le plus long du monde ?');
-- question 3 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (10,3,'Quelle est la plus haute montagne du monde ?');
-- question 4 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (10,4,'Quel pays est situé au nord des États-Unis ?');
-- question 5 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (10,5,'Quelle est la capitale de la France ?');
-- question 6 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (10,6,'Quel désert est le plus grand du monde ?');
-- question 7 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (10,7,'Quel est le plus grand lac d Afrique ?');
-- question 8 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (10,8,'Quel est le plus grand pays d Amérique du Sud ?');
-- question 9 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (10,9,'Dans quel océan se trouve l île de Madagascar ?');
-- question 10 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (10,10,'Quel est le pays le plus peuplé du monde ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Atlantique',false,91);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Indien',false,91);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Pacifique',true,91);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Nil',false,92);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Mississippi',false,92);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L Amazone',true,92);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le mont Kilimandjaro',false,93);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le mont Everest',true,93);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Alpes',false,93);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mexique',false,94);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Canada',true,94);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Russie',false,94);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Londres',false,95);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Rome',false,95);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Paris',true,95);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le désert du Sahara',true,96);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le désert d Atacama',false,96);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le désert de Gobi',false,96);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le lac Victoria',true,97);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le lac Tanganyika',false,97);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le lac Malawi',false,97);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Argentine',false,98);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Brésil',true,98);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Pérou',false,98);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Indien',true,99);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Atlantique',false,99);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Pacifique',false,99);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Inde',false,100);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Chine',true,100);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('États-Unis',false,100);

-- Quizz 11 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (1,'geographie',1);
-- question 1 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (11,1,'Quelle est la capitale de l Australie ?');
-- question 2 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (11,2,'Dans quel continent se trouve l Égypte ?');
-- question 3 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (11,3,'Quelle est la chaîne de montagnes la plus longue au monde ?');
-- question 4 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (11,4,'Quel est le plus grand archipel du monde ?');
-- question 5 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (11,5,'Quel est le plus grand lac d Amérique du Nord ?');
-- question 6 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (11,6,'Quel est le pays le plus vaste d Europe ?');
-- question 7 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (11,7,'Quelle est la capitale du Japon ?');
-- question 8 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (11,8,'Quel est le désert le plus aride du monde ?');
-- question 9 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (11,9,'Quelle est la plus grande île du monde ?');
-- question 10 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (11,10,'Quel est le plus grand pays d Amérique du Sud en termes de superficie ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sydney',false,101);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Melbourne',false,101);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Canberra',true,101);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Asie',false,102);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Afrique',true,102);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Europe',false,102);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Andes',true,103);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Alpes',false,103);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Rocheuses',false,103);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Philippines',false,104);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Indonésie',true,104);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Maldives',false,104);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le lac Supérieur',true,105);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le lac Michigan',false,105);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le lac Huron',false,105);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Allemagne',false,106);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La France',false,106);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Russie',true,106);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Pékin',false,107);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Tokyo',true,107);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Séoul',false,107);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le désert de Mojave',false,108);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le désert du Kalahari',false,108);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le désert d Atacama',true,108);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Madagascar',false,109);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Groenland',true,109);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Bornéo',false,109);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Brésil',true,110);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Argentine',false,110);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Pérou',false,110);

-- Quizz 12 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (1,'geographie',1);
-- question 1 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (12,1,'Dans quel océan se trouve l île de Bornéo ?');
-- question 2 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (12,2,'Quel est le plus grand lac du monde en termes de superficie ?');
-- question 3 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (12,3,'Quel est le détroit qui sépare l Asie de l Amérique du Nord ?');
-- question 4 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (12,4,'Quelle est la capitale de l Inde ?');
-- question 5 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (12,5,'Quel est le plus long fleuve d Amérique du Sud ?');
-- question 6 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (12,6,'Dans quel pays se trouve le mont Kilimandjaro ?');
-- question 7 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (12,7,'Quelle est la chaîne de montagnes qui traverse l Espagne, la France, la Suisse, et l Italie ?');
-- question 8 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (12,8,'Quel est le désert le plus grand d Afrique ?');
-- question 9 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (12,9,'Dans quel pays se trouve la ville de Pétra, connue pour ses bâtiments sculptés dans la roche ?');
-- question 10 quizz 2:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (12,10,'Quelle est la mer intérieure entourée par les terres de l Europe, de l Asie et de l Afrique ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Indien',false,111);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Pacifique',true,111);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Atlantique',false,111);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le lac Baïkal',true,112);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le lac Supérieur',false,112);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le lac Victoria',false,112);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le détroit de Gibraltar',false,113);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le détroit de Béring',true,113);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le détroit de Malacca',false,113);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Kolkata',false,114);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mumbai',false,114);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('New Delhi',true,114);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Orénoque',false,115);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Paraná',false,115);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Amazone',true,115);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Kenya',false,116);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Tanzanie',true,116);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L Ouganda',false,116);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Alpes',false,117);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Pyrénées',true,117);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les Carpates',false,117);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le désert du Sahara',true,118);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le désert de Kalahari',false,118);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le désert de Namib',false,118);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Irak',false,119);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Syrie',false,119);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Jordanie',true,119);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La mer Méditerranée',true,120);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La mer Noire',false,120);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La mer Rouge',false,120);

-- Quizz 13 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (2,'geographie',2);
-- question 1 quizz 13:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (13,1,'Quel pays est situé à la pointe sud de l Afrique ?');
-- question 2 quizz 13:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (13,2,'Quel est le plus grand pays d Asie en termes de superficie ?');
-- question 3 quizz 13:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (13,3,'Dans quel océan se trouve l archipel des Maldives ?');
-- question 4 quizz 13:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (13,4,'Quelle est la capitale de l Argentine ?');
-- question 5 quizz 13:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (13,5,'Quel est le plus grand lac d Asie ?');
-- question 6 quizz 13:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (13,6,'Dans quel pays se trouve la cordillère des Andes ?');
-- question 7 quizz 13:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (13,7,'Quel est le plus grand désert de sable du monde ?');
-- question 8 quizz 13:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (13,8,'Quelle est la ville la plus peuplée d Afrique ?');
-- question 9 quizz 13:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (13,9,'Dans quel pays se trouve la forêt amazonienne ?');
-- question 10 quizz 13:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (13,10,'Quelle est la capitale de la Turquie ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Madagascar',false,121);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Afrique du Sud',true,121);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Nigeria',false,121);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Chine',false,122);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Inde',false,122);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Russie',true,122);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Atlantique',false,123);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Indien',true,123);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Pacifique',false,123);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Buenos Aires',true,124);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Rio de Janeiro',false,124);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Bogota',false,124);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac Baïkal',true,125);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac de Côme',false,125);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac Aral',false,125);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Chili',true,126);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Pérou',false,126);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Colombie',false,126);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sahara',false,127);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Gobi',false,127);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Rub al-Khali',true,127);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le Caire',false,128);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lagos',true,128);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Johannesburg',false,128);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Brésil',true,129);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mexique',false,129);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Colombie',false,129);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Istanbul',false,130);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ankara',true,130);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Izmir',false,130);

-- Quizz 14 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (2,'geographie',2);
-- question 1 quizz 14:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (14,1,'Quel est le plus grand pays insulaire du monde ?');
-- question 2 quizz 14:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (14,2,'Dans quel océan se trouve l île de Tahiti ?');
-- question 3 quizz 14:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (14,3,'Quel est le point le plus bas de la Terre ?');
-- question 4 quizz 14:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (14,4,'Quelle est la capitale du Canada ?');
-- question 5 quizz 14:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (14,5,'Quel pays est traversé par l équateur ?');
-- question 6 quizz 14:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (14,6,'Quelle est la plus grande île de la mer Méditerranée ?');
-- question 7 quizz 14:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (14,7,'Dans quel pays se trouve la ville de Marrakech ?');
-- question 8 quizz 14:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (14,8,'Quel est le plus grand lac d Europe ?');
-- question 9 quizz 14:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (14,9,'Dans quel pays se trouve le delta du Mékong ?');
-- question 10 quizz 14:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (14,10,'Quelle est la capitale de la Nouvelle-Zélande ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Japon',false,131);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Indonésie',true,131);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Philippines',false,131);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Indien',false,132);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Pacifique',true,132);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Atlantique',false,132);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mer Morte',true,133);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Grand Canyon',false,133);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac Baïkal',false,133);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Toronto',false,134);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vancouver',false,134);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ottawa',true,134);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Colombie',false,135);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Kenya',false,135);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Équateur',true,135);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Crète',false,136);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sicile',true,136);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sardaigne',false,136);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Algérie',false,137);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Maroc',true,137);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Tunisie',false,137);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac Balaton',false,138);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac de Genève',false,138);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac Ladoga',true,138);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vietnam',true,139);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Thaïlande',false,139);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Cambodge',false,139);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Christchurch',false,140);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Auckland',false,140);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Wellington',true,140);

-- Quizz 15 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (2,'geographie',2);
-- question 1 quizz 15:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (15,1,'Quel est le plus grand glacier du monde ?');
-- question 2 quizz 15:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (15,2,'Dans quel pays se trouve le mont Fuji ?');
-- question 3 quizz 15:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (15,3,'Quelle est la plus haute chute d eau du monde ?');
-- question 4 quizz 15:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (15,4,'Quel est le plus grand pays d Afrique en termes de population ?');
-- question 5 quizz 15:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (15,5,'Dans quel océan se trouve l île de Hawaï ?');
-- question 6 quizz 15:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (15,6,'Quelle est la capitale de la Suède ?');
-- question 7 quizz 15:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (15,7,'Quel est le plus grand désert froid du monde ?');
-- question 8 quizz 15:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (15,8,'Dans quel pays se trouve la vallée de Kathmandu ?');
-- question 9 quizz 15:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (15,9,'Quel est le point le plus élevé de l Amérique du Nord ?');
-- question 10 quizz 15:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (15,10,'Quelle est la mer située entre l Arabie Saoudite et l Afrique de l Est ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Glacier Perito Moreno',false,141);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Glacier Franz Josef',false,141);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Glacier Lambert',true,141);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Chine',false,142);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Japon',true,142);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Corée du Sud',false,142);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Chutes du Niagara',false,143);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Angel Falls',true,143);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Iguazu Falls',false,143);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Nigeria',true,144);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Éthiopie',false,144);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Égypte',false,144);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Atlantique',false,145);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Pacifique',true,145);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Indien',false,145);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oslo',false,146);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Helsinki',false,146);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Stockholm',true,146);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Désert de l Arctique',true,147);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Désert du Taklamakan',false,147);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Désert de l Antarctique',false,147);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Inde',false,148);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Népal',true,148);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Bhoutan',false,148);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mont Denali',true,149);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mont McKinley',false,149);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mont Rainier',false,149);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mer Rouge',true,150);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mer d Arabie',false,150);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mer Caspienne',false,150);

-- Quizz 16 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (3,'geographie',3);
-- question 1 quizz 16:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (16,1,'Quel est le point le plus élevé de l Himalaya ?');
-- question 2 quizz 16:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (16,2,'Dans quel pays se trouve le lac Titicaca, le plus grand lac d Amérique du Sud ?');
-- question 3 quizz 16:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (16,3,'Quelle est la capitale de la Mongolie ?');
-- question 4 quizz 16:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (16,4,'Quel est le plus grand désert chaud du monde ?');
-- question 5 quizz 16:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (16,5,'Dans quel pays se trouve le massif du Kilimandjaro ?');
-- question 6 quizz 16:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (16,6,'Quel est le plus grand delta du monde ?');
-- question 7 quizz 16:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (16,7,'Quelle est la ville la plus haute du monde ?');
-- question 8 quizz 16:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (16,8,'Dans quel océan se trouve l archipel des Seychelles ?');
-- question 9 quizz 16:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (16,9,'Quelle est la plus grande île de la Méditerranée ?');
-- question 10 quizz 16
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (16,10,'Quel pays est situé à l extrémité sud de la péninsule arabique ?');

-- proposition quizz 16
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mont Everest',true,151);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('K2',false,151);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mont Kanchenjunga',false,151);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Pérou',false,152);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Bolivie',true,152);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Chili',false,152);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oulan-Bator',true,153);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Astana',false,153);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oufa',false,153);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sahara',true,154);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Kalahari',false,154);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sonora',false,154);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Kenya',false,155);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ouganda',false,155);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Tanzanie',true,155);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Delta du Nil',false,156);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Delta du Mékong',true,156);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Delta du Gange',false,156);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Paz',false,157);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Quito',false,157);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lhassa',true,157);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Atlantique',false,158);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Indien',true,158);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Pacifique',false,158);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sicile',true,159);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sardaigne',false,159);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Crète',false,159);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Arabie Saoudite',false,160);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oman',false,160);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Yémen',true,160);

-- Quizz 17 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (3,'geographie',3);
-- question 1 quizz 17:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (17,1,'Dans quel pays se trouve le mont Elbrouz, la plus haute montagne d Europe ?');
-- question 2 quizz 17:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (17,2,'Quelle est la capitale du Kazakhstan ?');
-- question 3 quizz 17:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (17,3,'Quel est le plus grand lac salé du monde ?');
-- question 4 quizz 17:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (17,4,'Dans quel pays se trouve la ville de Casablanca ?');
-- question 5 quizz 17:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (17,5,'Quelle est la rivière la plus longue d Asie ?');
-- question 6 quizz 17:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (17,6,'Quel est le plus haut sommet d Afrique en dehors de l Himalaya ?');
-- question 7 quizz 17:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (17,7,'Dans quel pays se trouve le lac Baïkal, le plus profond du monde ?');
-- question 8 quizz 17:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (17,8,'Quelle est la capitale du Ghana ?');
-- question 9 quizz 17:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (17,9,'Quel est le plus grand désert de sel du monde ?');
-- question 10 quizz 17:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (17,10,'Dans quel pays se trouve la vallée de la Mort ?');

-- proposition quizz 17
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Russie',true,161);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('France',false,161);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Géorgie',false,161);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Almaty',false,162);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Nur-Sultan (anciennement Astana)',true,162);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Bichkek',false,162);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mer Morte',false,163);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac Assal',false,163);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Grand Lac Salé',true,163);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Algérie',false,164);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Maroc',true,164);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Tunisie',false,164);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Yangtsé',true,165);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mékong',false,165);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Gange',false,165);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mont Kenya',false,166);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mont Kilimandjaro',false,166);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Rwenzori',true,166);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Russie',true,167);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mongolie',false,167);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Chine',false,167);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lagos',false,168);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Accra',true,168);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Abuja',false,168);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Salar d Uyuni',true,169);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Bonneville Salt Flats',false,169);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Chott el Jerid',false,169);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('États-Unis',true,170);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mexique',false,170);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Australie',false,170);

-- Quizz 18 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (3,'geographie',3);
-- question 1 quizz 18:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (18,1,'Quel est le plus grand lac d eau douce d Amérique du Sud ?');
-- question 2 quizz 18:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (18,2,'Dans quel océan se trouve l île de Sumatra ?');
-- question 3 quizz 18:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (18,3,'Quelle est la capitale de la Lettonie ?');
-- question 4 quizz 18:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (18,4,'Quel est le plus grand canyon d Europe ?');
-- question 5 quizz 18:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (18,5,'Dans quel pays se trouve le mont Ararat ?');
-- question 6 quizz 18:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (18,6,'Quelle est la capitale du Sri Lanka ?');
-- question 7 quizz 18:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (18,7,'Quel est le plus grand delta en Amérique du Nord ?');
-- question 8 quizz 18:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (18,8,'Dans quel pays se trouve la ville de Timbuktu ?');
-- question 9 quizz 18:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (18,9,'Quelle est la plus grande île du continent africain ?');
-- question 10 quizz 18:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (18,10,'Quel est le plus grand fjord du monde ?');

-- proposition quizz 18
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac Titicaca',false,171);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac Maracaibo',true,171);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lac Poopó',false,171);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Atlantique',false,172);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Indien',true,172);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Océan Pacifique',false,172);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Tallinn',false,173);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vilnius',false,173);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Riga',true,173);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Grand Canyon du Verdon',false,174);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Gorges du Tarn',false,174);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vikos Gorge',true,174);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Turquie',true,175);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Iran',false,175);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Arménie',false,175);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Colombo',true,176);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Kandy',false,176);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Galle',false,176);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Delta du Yukon',false,177);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Delta du Mississippi',true,177);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Delta de Mackenzie',false,177);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Niger',false,178);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mali',true,178);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Burkina Faso',false,178);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Madagascar',true,179);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Zanzibar',false,179);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Socotra',false,179);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Geirangerfjord',false,180);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Milford Sound',false,180);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Scoresby Sund',true,180);

--Quizz 19 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (1,'sciences',1);
-- question 1 quizz 19:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (19,1,'Quel est le symbole chimique de l eau ?');
-- question 2 quizz 19:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (19,2,'Quelle est la planète la plus proche du soleil ?');
-- question 3 quizz 19:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (19,3,'Quel est l organe principal du système respiratoire humain ?');
-- question 4 quizz 19:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (19,4,'Quel gaz les plantes absorbent-elles lors de la photosynthèse ?');
-- question 5 quizz 19:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (19,5,'Quelle est la force qui attire tous les objets vers la Terre ?');
-- question 6 quizz 19:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (19,6,'Quelle est la formule chimique de la table de sucre ?');
-- question 7 quizz 19:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (19,7,'Quel est l os le plus long du corps humain ?');
-- question 8 quizz 19:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (19,8,'Quel est l élément le plus abondant dans l atmosphère terrestre ?');
-- question 9 quizz 19:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (19,9,'Quelle est la fonction principale des reins dans le corps humain ?');
-- question 10 quizz 19:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (19,10,'Quel est le processus par lequel les plantes fabriquent leur propre nourriture ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('H',false,181);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('O',false,181);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('H2O',true,181);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Venus',false,182);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mars',false,182);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mercure',true,182);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le cœur',false,183);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les poumons',true,183);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le foie',false,183);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oxygène',false,184);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Azote',false,184);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Dioxyde de carbone',true,184);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La gravité',true,185);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le magnétisme',false,185);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La force centrifuge',false,185);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('C6H12O6',true,186);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('CO2',false,186);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('NaCl',false,186);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le fémur',true,187);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L humérus',false,187);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le radius',false,187);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oxygène',false,188);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Azote',true,188);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Argon',false,188);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Digestion des aliments',false,189);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Production d enzymes',false,189);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Filtration du sang',true,189);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Respiration',false,190);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Photosynthèse',true,190);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Transpiration',false,190);

--Quizz 20 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (1,'sciences',1);
-- question 1 quizz 20:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (20,1,'Quel est l organe responsable de la production d insuline dans le corps humain ?');
-- question 2 quizz 20:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (20,2,'Quel est le plus petit os du corps humain ?');
-- question 3 quizz 20:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (20,3,'Quelle est la planète connue comme la "planète rouge" ?' );
-- question 4 quizz 20:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (20,4,'Quel est le processus par lequel l eau passe de l état liquide à l état gazeux ?');
-- question 5 quizz 20:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (20,5,'Quelle est la couche extérieure de la Terre ?');
-- question 6 quizz 20:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (20,6,'Quel est l organe sensoriel responsable de la vision ?');
-- question 7 quizz 20:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (20,7,'Quelle est la formule chimique de l oxygène ?');
-- question 8 quizz 20:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (20,8,'Quel est l organe du corps humain qui pompe le sang ?');
-- question 9 quizz 20:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (20,9,'Quel est l élément chimique symbolisé par "C" ?');
-- question 10 quizz 20:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (20,10,'Quelle est la force qui maintient les planètes en orbite autour du soleil ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le pancréas',true,191);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le foie',false,191);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les reins',false,191);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L étrier',true,192);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le marteau',false,192);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L enclume',false,192);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Jupiter',false,193);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vénus',false,193);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mars',true,193);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Évaporation',true,194);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Condensation',false,194);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Fusion',false,194);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Manteau',false,195);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Croûte',true,195);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Noyau',false,195);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oreille',false,196);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Nez',false,196);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Œil',true,196);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('O',false,197);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('O2',true,197);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('CO2',false,197);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le cœur',true,198);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les poumons',false,198);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le foie',false,198);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Calcium',false,199);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Carbone',true,199);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Cuivre',false,199);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le magnétisme',false,200);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La force centrifuge',false,200);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La gravité',true,200);

-- Quizz 21 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (1,'sciences',1);
-- question 1 quizz 21:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (21,1,'Quel est le plus grand organe du corps humain ?');
-- question 2 quizz 21:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (21,2,'Quelle est la planète la plus grande de notre système solaire ?');
-- question 3 quizz 21:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (21,3,'Quel est le processus par lequel les plantes perdent de l eau par leurs feuilles ?');
-- question 4 quizz 21:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (21,4,'Quel est l organe responsable de la digestion des aliments dans le corps humain ?');
-- question 5 quizz 21:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (21,5,'Quelle est la formule chimique de l eau de chaux ?');
-- question 6 quizz 21:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (21,6,'Quelle est la vitamine associée à la peau ?');
-- question 7 quizz 21:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (21,7,'Quel est l élément le plus lourd de la table périodique ?');
-- question 8 quizz 21:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (21,8,'Quelle est la couche d ozone dans l atmosphère terrestre ?');
-- question 9 quizz 21:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (21,9,'Quel est le gaz responsable de la couleur bleue du ciel ?');
-- question 10 quizz 21:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (21,10,'Quel est le processus par lequel les organismes produisent de l énergie à partir des aliments ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le cerveau',false,201);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La peau',true,201);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le foie',false,201);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Jupiter',true,202);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Saturne',false,202);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Neptune',false,202);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Transpiration',true,203);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Respiration',false,203);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Photosynthèse',false,203);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le foie',false,204);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le pancréas',false,204);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L estomac',true,204);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('CaCO3',false,205);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('H2O2',false,205);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ca(OH)2',true,205);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vitamine A',false,206);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vitamine C',false,206);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Vitamine D',true,206);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Uranium',true,207);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Plomb',false,207);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mercure',false,207);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Troposphère',false,208);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Stratosphère',true,208);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mésosphère',false,208);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Dioxyde de carbone',false,209);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oxygène',false,209);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Azote',true,209);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Respiration cellulaire',true,210);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Photosynthèse',false,210);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Fermentation',false,210);

-- Quizz 22 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (2,'sciences',2);
-- question 1 quizz 22:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (22,1,'Quel est le processus par lequel une substance passe directement de l état solide à l état gazeux sans passer par l état liquide ?');
-- question 2 quizz 22:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (22,2,'Quelle est la principale fonction du foie dans le corps humain ?');
-- question 3 quizz 22:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (22,3,'Quelle est l unité de mesure de la force dans le système international ?');
-- question 4 quizz 22:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (22,4,'Quelle est la loi de Newton qui décrit l action et la réaction ?');
-- question 5 quizz 22:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (22,5,'Quel est l élément chimique qui compose la majeure partie de l atmosphère terrestre');
-- question 6 quizz 22:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (22,6,'Quelle est la formule chimique de l acide sulfurique ?');
-- question 7 quizz 22:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (22,7,'Quelle est la couche la plus externe de la Terre ?');
-- question 8 quizz 22:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (22,8,'Quelle interaction fondamentale de la physique est responsable du maintien des planètes en orbite autour du soleil ?');
-- question 9 quizz 22:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (22,9,'Quel est le processus par lequel une cellule divise pour former deux cellules filles identiques ?');
-- question 10 quizz 22:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (22,10,'Quelle est la formule chimique de la chlorophylle, le pigment responsable de la photosynthèse chez les plantes ?');

-- proposition question 2
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Sublimation',true,211);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Fusion',false,211);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Évaporation',false,211);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Production d insuline',false,212);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Détoxification',true,212);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Digestion des protéines',false,212);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Watt',false,213);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Joule',false,213);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Newton',true,213);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Première loi',false,214);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Deuxième loi',false,214);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Troisième loi',true,214);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oxygène',false,215);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Azote',true,215);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Dioxyde de carbone',false,215);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('H2SO4',true,216);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('NaOH',false,216);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('CO2',false,216);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Noyau',false,217);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Manteau',false,217);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Croûte',true,217);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Interaction électromagnétique',false,218);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Interaction nucléaire forte',false,218);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Interaction gravitationnelle',true,218);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Méiose',false,219);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Apoptose',false,219);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mitose',true,219);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('CO2',false,220);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('C6H12O6',false,220);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('C55H72MgN4O5',true,220);

-- Quizz 23 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (2,'sciences',2);
-- question 1 quizz 23:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (23,1,'Quel est le gaz responsable de l effet de serre sur la Terre ?');
-- question 2 quizz 23:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (23,2,'Quelle est la propriété d un matériau qui s oppose au passage du courant électrique ?');
-- question 3 quizz 23:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (23,3,'Quel est l organe du corps humain responsable de la production de bile ?');
-- question 4 quizz 23:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (23,4,'Quel est le processus par lequel les roches sont brisées en morceaux plus petits sans changement de composition chimique ?');
-- question 5 quizz 23:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (23,5,'Quelle est la formule chimique de l ammoniac ?');
-- question 6 quizz 23:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (23,6,'Quel est le nombre total de chromosomes dans une cellule humaine normale ?');
-- question 7 quizz 23:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (23,7,'Quelle est la loi de la physique qui décrit la conservation de l énergie ?');
-- question 8 quizz 23:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (23,8,'Quel est l organe du corps humain responsable de la production d insuline ?');
-- question 9 quizz 23:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (23,9,'Quelle est la loi de la physique qui décrit la relation entre la pression, le volume et la température d un gaz ?');
-- question 10 quizz 23:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (23,10,'Quel est le processus par lequel l ADN est copié pour former un ARN ?');

-- proposition quizz 23
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oxygène',false,221);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Dioxyde de carbone',true,221);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Méthane',false,221);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Résistance',true,222);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Capacité',false,222);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Inductance',false,222);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le pancréas',false,223);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le foie',true,223);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L estomac',false,223);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Érosion',false,224);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Métamorphisme',false,224);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Fragmentation',true,224);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('NH3',true,225);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('N2H4',false,225);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('HNO3',false,225);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('23',false,226);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('46',false,226);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('64',true,226);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de Newton',false,227);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi d Ohm',false,227);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de la conservation de l énergie',true,227);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le pancréas',true,228);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le foie',false,228);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les reins',false,228);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de Boyle',false,229);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de Charles',false,229);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de Dalton',true,229);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Transcription',true,230);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Traduction',false,230);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Réplication',false,230);

-- Quizz 24 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (2,'sciences',2);
-- question 1 quizz 24:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (24,1,'Quel est l organe sensoriel responsable de l audition ?');
-- question 2 quizz 24:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (24,2,'Quelle est la force qui maintient les planètes en orbite autour du soleil');
-- question 3 quizz 24:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (24,3,'Quelle est la formule chimique du sel de table ?');
-- question 4 quizz 24:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (24,4,'Quel est l organe du corps humain responsable de la filtration du sang et de l élimination des déchets sous forme d urine ?');
-- question 5 quizz 24:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (24,5,'Quelle est la formule chimique du nitrate d ammonium ?');
-- question 6 quizz 24:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (24,6,'Quelle est la loi de la physique qui décrit la conservation de la masse ?');
-- question 7 quizz 24:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (24,7,'Quelle est la réaction chimique représentant la photosynthèse chez les plantes ?');
-- question 8 quizz 24:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (24,8,'Quelle est la formule chimique de l hydroxyde de calcium ?');
-- question 9 quizz 24:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (24,9,'Quel est l organe sensoriel responsable du goût ?');
-- question 10 quizz 24:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (24,10,'Quel est le processus par lequel les cellules eucaryotes produisent de l énergie en l absence d oxygène ?');

-- proposition QUIZZ 24
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L œil',false,231);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L oreille',true,231);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le nez',false,231);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Interaction électromagnétique',false,232);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Interaction nucléaire forte',false,232);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Interaction gravitationnelle',true,232);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('NaCl',true,233);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('KCl',false,233);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('CaCl2',false,233);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le foie',false,234);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Les reins',false,234);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le pancréas',true,234);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('NH4NO3',true,235);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('N2H4',false,235);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('HNO3',false,235);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi d Archimède',false,236);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de la gravité',false,236);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de la conservation de la masse',true,236);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('CO2 + O2 → C6H12O6 + H2O',false,237);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('6CO2 + 6H2O → C6H12O6 + 6O2',true,237);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('N2 + 3H2 → 2NH3',false,237);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('CaCO3',false,238);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('H2O2',false,238);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ca(OH)2',true,238);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L œil',false,239);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('L oreille',false,239);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La langue',true,239);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Respiration cellulaire',false,240);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Photosynthèse',false,240);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Fermentation',true,240);

-- Quizz 25 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (3,'sciences',3);
-- question 1 quizz 25:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (25,1,'Quelle est la particule subatomique qui a une charge positive égale en magnitude à celle de l électron ?');
-- question 2 quizz 25:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (25,2,'Quelle est la loi de la thermodynamique qui énonce que l énergie totale d un système isolé reste constante ?');
-- question 3 quizz 25:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (25,3,'Quel est l effet qui cause le décalage vers le rouge des galaxies lointaines en astronomie ?');
-- question 4 quizz 25:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (25,4,'Quelle est la molécule responsable du transport de l information génétique dans les cellules ?');
-- question 5 quizz 25:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (25,5,'Quelle est l unité de mesure de l intensité du courant électrique ?');
-- question 6 quizz 25:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (25,6,'Quel est le processus par lequel une cellule décompose les molécules organiques pour produire de l énergie ?');
-- question 7 quizz 25:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (25,7,'Quelle est la structure anatomique du cerveau responsable de la régulation de diverses fonctions corporelles, y compris la température et la faim ?');
-- question 8 quizz 25:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (25,8,'Quelle est la molécule qui stocke l énergie dans les cellules et libère cette énergie lors de la respiration cellulaire ?');
-- question 9 quizz 25:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (25,9,'Quelle est la théorie qui explique l origine de l univers à partir d un état extrêmement dense et chaud ?');
-- question 10 quizz 25:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (25,10,'Quelle est la propriété des particules subatomiques qui peut être décrite comme une combinaison de spin et de charge électrique ?');

-- proposition question 25
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Proton',true,241);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Neutron',false,241);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Positron',false,241);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Première loi de la thermodynamique',true,242);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Deuxième loi de la thermodynamique',false,242);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Troisième loi de la thermodynamique',false,242);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Effet Doppler',true,243);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Effet Zeeman',false,243);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Effet Stark',false,243);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('ARN messager (ARNm)',false,244);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Acide désoxyribonucléique (ADN)',true,244);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('ARN ribosomique (ARNr)',false,244);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Volt',false,245);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Ampère',true,245);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Watt',false,245);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Respiration cellulaire',true,246);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Photosynthèse',false,246);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Fermentation',false,246);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hippocampe',false,247);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Amygdale',false,247);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hypothalamus',true,247);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('DNA',false,248);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('ATP',true,248);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('RNA',false,248);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le modèle de l oscillation cyclique',false,249);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le modèle du Steady State',false,249);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Le modèle de Big Bang',true,249);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Moment magnétique',true,250);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Moment cinétique',false,250);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Moment dipolaire',false,250);

-- Quizz 26 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (3,'sciences',3);
-- question 1 quizz 26:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (26,1,'Quelle est la loi de la physique qui décrit comment la lumière est déviée lorsqu elle passe à travers un prisme ou un milieu transparent ?');
-- question 2 quizz 26:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (26,2,'Quelle est la molécule qui transporte l oxygène dans le sang des vertébrés ?');
-- question 3 quizz 26:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (26,3,'Quel est le processus par lequel les cellules d un organisme multicellulaire deviennent spécialisées pour des fonctions spécifiques ?');
-- question 4 quizz 26:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (26,4,'Quel est l effet qui explique pourquoi les objets chauds émettent de la lumière ?');
-- question 5 quizz 26:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (26,5,'Quelle est la théorie biologique qui soutient que les caractéristiques acquises au cours de la vie d un individu peuvent être transmises à sa descendance ?');
-- question 6 quizz 26:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (26,6,'Quelle est la molécule qui stocke l information génétique dans les cellules ?');
-- question 7 quizz 26:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (26,7,'Quelle est la réaction chimique qui décrit la conversion du dioxyde de carbone et de l eau en glucose lors de la photosynthèse ?');
-- question 8 quizz 26:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (26,8,'Quelle est la force qui maintient les protons et les neutrons ensemble dans le noyau d un atome ?');
-- question 9 quizz 26:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (26,9,'Quel est l effet qui explique la déviation des objets massifs dans l espace-temps en présence d une masse importante ?');
-- question 10 quizz 26:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (26,10,'Quelle est la molécule qui compose la majorité de l atmosphère terrestre ?');

-- proposition quizz 26
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de Snell',true,251);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de Kepler',false,251);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de Coulomb',false,251);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Myoglobine',false,252);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Chlorophylle',false,252);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hémoglobine',true,252);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Mitose',false,253);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Différenciation cellulaire',true,253);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Méiose',false,253);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Effet photoélectrique',false,254);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Effet Compton',false,254);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Rayonnement du corps noir',true,254);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Théorie de l évolution',false,255);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Lamarckisme',true,255);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Créationnisme',false,255);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Acide désoxyribonucléique (ADN)',true,256);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('ARN messager (ARNm)',false,256);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('ARN ribosomique (ARNr)',false,256);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Réaction de combustion',false,257);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Réaction d oxydation',true,257);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Réaction de réduction',false,257);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Force nucléaire faible',false,258);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Force nucléaire forte',true,258);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Force électromagnétique',false,258);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Effet Doppler',false,259);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Effet Zeeman',false,259);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Courbure de l espace-temps',true,259);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Dioxyde de carbone (CO2)',false,260);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Azote (N2)',true,260);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Oxygène (O2)',false,260);

-- Quizz 27 :
insert into QUIZZLER.quizzes(difficultee, categorie, points_rapportes) VALUES (3,'sciences',3);
-- question 1 quizz 27:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (27,1,'Quelle est la particule élémentaire responsable de la médiation de la force électromagnétique ?');
-- question 2 quizz 27:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (27,2,'Quelle est la loi de la physique qui décrit la variation de la pression d un gaz avec le volume, à température constante ?');
-- question 3 quizz 27:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (27,3,'Quel est l élément le plus abondant dans l univers ?');
-- question 4 quizz 27:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (27,4,'Quelle est la théorie qui unifie la mécanique quantique et la relativité générale ?');
-- question 5 quizz 27:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (27,5,'Quel est le processus de production d énergie dans le cœur des étoiles, y compris le Soleil ?');
-- question 6 quizz 27:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (27,6,'Quelle est la principale fonction des ribosomes dans une cellule ?');
-- question 7 quizz 27:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (27,7,'Quel physicien a développé la théorie de la relativité restreinte ?');
-- question 8 quizz 27:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (27,8,'Quelle est la vitesse de la lumière dans le vide, en mètres par seconde (approximativement) ?');
-- question 9 quizz 27:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (27,9,'Quel est le processus par lequel les cellules convertissent le glucose en énergie en l absence d oxygène ?');
-- question 10 quizz 27:
insert into QUIZZLER.questions(quizz, numero, intitule) VALUES (27,10,'Quelle est la constante qui représente la charge élémentaire d un électron ?');

-- proposition quizz 27
--proposition 1 question 1
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Boson de Higgs',false,261);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Gluon',false,261);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Photon',true,261);
-- proposition question 2
--proposition 1 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de Boyle',true,262);
--proposition 2 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de Charles',false,262);
--proposition 3 question 2
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Loi de Gay-Lussac',false,262);
-- proposition question 3
--proposition 1 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hydrogène',true,263);
--proposition 2 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Hélium',false,263);
--proposition 3 question 3
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Carbone',false,263);
-- proposition question 4
--proposition 1 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Théorie des champs',false,264);
--proposition 2 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Théorie des cordes',true,264);
--proposition 3 question 4
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Théorie du tout',false,264);
-- proposition question 5
--proposition 1 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Fusion nucléaire',true,265);
--proposition 2 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Fission nucléaire',false,265);
--proposition 3 question 5
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Réaction chimique',false,265);
-- proposition question 6
--proposition 1 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Réplication de l ADN',false,266);
--proposition 2 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Stockage d énergie',false,266);
--proposition 3 question 6
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Synthèse des protéines',true,266);
-- proposition question 7
--proposition 1 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Isaac Newton',false,267);
--proposition 2 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Albert Einstein',true,267);
--proposition 3 question 7
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Niels Bohr',false,267);
-- proposition question 8
--proposition 1 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('300,000 km/s',true,268);
--proposition 2 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('150,000 km/s',false,268);
--proposition 3 question 8
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('500,000 km/s',false,268);
-- proposition question 9
--proposition 1 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Phosphorylation oxydative',false,269);
--proposition 2 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Krebs cycle',false,269);
--proposition 3 question 9
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('Glycolyse',true,269);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('1.6 x 10^-19 coulombs',true,270);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('6.63 x 10^-34 Js',false,270);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('9.8 m/s^2',false,270);

-- insert users
insert into QUIZZLER.users(email, mdp, username, nbr_points, isadmin) VALUES('nicolas.venturini@student.vinci.be','$2y$10$AowrDKtvBw/4QfiL7O/qC.LhF0ITfPUQRGC5cDOPL5TLVOis65Hjm','nicoco',222,true);
insert into QUIZZLER.users(email, mdp, username, nbr_points, isadmin) VALUES('simon.bosseler@student.vinci.be','$2y$10$AowrDKtvBw/4QfiL7O/qC.LhF0ITfPUQRGC5cDOPL5TLVOis65Hjm','simon',200,true);
insert into QUIZZLER.users(email, mdp, username, nbr_points, isadmin) VALUES('alexis.arnaud@student.vinci.be','$2y$10$AowrDKtvBw/4QfiL7O/qC.LhF0ITfPUQRGC5cDOPL5TLVOis65Hjm','alexis',190,true);
insert into QUIZZLER.users(email, mdp, username, nbr_points, isadmin) VALUES('ismet.ismet@student.vinci.be','$2y$10$AowrDKtvBw/4QfiL7O/qC.LhF0ITfPUQRGC5cDOPL5TLVOis65Hjm','ismet',180,true);
insert into QUIZZLER.users(email, mdp, username, nbr_points, isadmin) VALUES('keyvan.Nikazm@student.vinci.be','$2y$10$AowrDKtvBw/4QfiL7O/qC.LhF0ITfPUQRGC5cDOPL5TLVOis65Hjm','keyvan',170,true);