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

-- Quizz 4 :
insert into QUIZZLER.quizzes(difficultee, categorie) VALUES (2,'histoire');
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
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES (' La dynastie Tang',false,37);
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
insert into QUIZZLER.quizzes(difficultee, categorie) VALUES (2,'histoire');
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
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES (' Hasdrubal',false,49);
-- proposition question 10
--proposition 1 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La guerre du Pacifique',false,50);
--proposition 2 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La guerre du Golfe',false,50);
--proposition 3 question 10
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES ('La Seconde Guerre mondiale',true,50);

-- Quizz 6 :
insert into QUIZZLER.quizzes(difficultee, categorie) VALUES (2,'histoire');
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
insert into QUIZZLER.quizzes(difficultee, categorie) VALUES (3,'histoire');
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
insert into QUIZZLER.quizzes(difficultee, categorie) VALUES (3,'histoire');
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
insert into QUIZZLER.quizzes(difficultee, categorie) VALUES (3,'histoire');
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
insert into QUIZZLER.propositions(intitule, isreponse, question) VALUES (' Henri VII',false,86);
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