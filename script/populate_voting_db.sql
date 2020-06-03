USE voting;

SET autocommit=0; /* par defaut mysql est en autocommit, mettre a false le temps du script */

SET NAMES utf8mb4; /* jeu de caracteres pour les donnees inserees */

-- -----------------------------------------------------
-- Empty all tables
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE voting.addresses;
TRUNCATE TABLE voting.candidates;
TRUNCATE TABLE voting.towns;
TRUNCATE TABLE voting.electors;
TRUNCATE TABLE voting.persons;
TRUNCATE TABLE voting.polls;
TRUNCATE TABLE voting.votes;
TRUNCATE TABLE voting.polling_stations;
SET FOREIGN_KEY_CHECKS=1;

-- -----------------------------------------------------
-- Insert poll (1st round)
-- -----------------------------------------------------
INSERT INTO polls (description, polling_date, round_number) VALUES ("1er tour de l'élection présidentielle 2017", "2017-05-14", 1);

-- -----------------------------------------------------
-- Insert towns
-- -----------------------------------------------------
INSERT INTO towns (town_name, zip_code)
VALUES
('Paris', '75001'),
('Evry', '91000'),
('Créteil', '94000');

-- -----------------------------------------------------
-- Insert addresses
-- -----------------------------------------------------
INSERT INTO addresses (road, town_id)
VALUES
('1 ROUTE DE LA VILLES HEULIN', 1),
('1 IMPASSE DE LA VILLES MOLLE', 1),
('1 ROUTE DE LA VILLES MOLLE', 1),
('1 CHEMIN DE LA VILLES OURS', 1),
('1 PASSAGE DE LA VILLES OURS', 1),
('1 ROUTE DE LA VILLEZ PIERRE', 1),
('1 CHEMIN DE LA VILLES ROBERT', 1),
('1 IMPASSE DE VINCENNES', 1),
('1 RUE DE VINCENNES', 1),
('1 RUE VINCENT AURIOL', 1),
('1 ALLEE VINCENT VAN GOGH', 1),
('1 RUE DU 28 FEVRIER 1943', 1),
('1 ALLEE DES VIOLETTES', 1),
('1 RUE DE LA VIREE DE LA CROIX', 1),
('1 CHEMIN DES VIREES DES LANDES', 1),
('1 ROUTE DE LA VIREE DE DEVANT', 1),
('1 ROUTE DES VIREES GILLES', 1),
('1 CHEMIN DE LA VIREE GUIOCHET', 1);

-- -----------------------------------------------------
-- Insert 1 polling_station
-- -----------------------------------------------------
INSERT INTO polling_stations (station_identifier, address_id) VALUES (1, 18);

-- -----------------------------------------------------
-- Insert 20 persons
-- -----------------------------------------------------
INSERT INTO persons (firstnames, lastname)
VALUES
("Lewis", "Hamilton"),
("Valteri", "Bottas"),
("Sebastian", "Vettel"),
("Charles", "Leclerc"),
("Max", "Verstappen"),
("Alexander", "Albon"),
("Carlos", "Sainz"),
("Lando", "Norris"),
("Daniel", "Ricciardo"),
("Nico", "Hulkenberg"),
("Sergio", "Perez"),
("Lance", "Stroll"),
("Kimi", "Raikkonen"),
("Antonio", "Giovinazzi"),
("Kevin", "Magnussen"),
("Romain", "Grosjean"),
("Pierre", "Gasly"),
("Daniil", "Kvyat"),
("George", "Russell"),
("Robert", "Kubica");

-- -----------------------------------------------------
-- Insert 3 candidates
-- -----------------------------------------------------
INSERT INTO candidates (person_id) VALUES (1), (3), (5);

-- -----------------------------------------------------
-- Insert 20 electors
-- -----------------------------------------------------
INSERT INTO electors (person_id, polling_station_id, home_address_id, birth_town_id, birthdate, national_identifier, signing_order)
VALUES
(1, 1, 1, 1, "1995-07-28", 1, 1),
(2, 1, 1, 1, "1981-02-24", 2, 2),
(3, 1, 2, 1, "1994-09-21", 3, 3),
(4, 1, 2, 1, "1993-02-11", 4, 4),
(5, 1, 2, 1, "1997-04-28", 5, 5),
(6, 1, 3, 1, "1964-03-18", 6, 6),
(7, 1, 4, 1, "1987-10-07", 7, 7),
(8, 1, 5, 1, "1998-11-04", 8, 8),
(9, 1, 6, 2, "1978-01-30", 9, 9),
(10, 1, 7, 2, "1980-07-29", 10, 10),
(11, 1, 8, 2, "1983-02-14", 11, 11),
(12, 1, 9, 2, "1995-09-25", 12, 12),
(13, 1, 10, 2, "1992-12-31", 13, 13),
(14, 1, 11, 2, "1995-06-15", 14, 14),
(15, 1, 12, 3, "1988-09-16", 15, 15),
(16, 1, 13, 3, "1991-08-11", 16, 16),
(17, 1, 14, 3, "1999-07-07", 17, 17),
(18, 1, 15, 3, "2000-05-01", 18, 18),
(19, 1, 16, 3, "1970-10-18", 19, 19),
(20, 1, 17, 3, "1977-03-17", 20, 20);

-- -----------------------------------------------------
-- Insert votes
-- -----------------------------------------------------
INSERT INTO votes (elector_id, candidate_id, poll_id, polling_station_id, voting_time)
VALUES
(1, 1, 1, 1, "2017-05-14 09:23:21"),
(2, 1, 1, 1, "2017-05-14 09:26:10"),
(3, 1, 1, 1, "2017-05-14 09:41:48"),
(4, 1, 1, 1, "2017-05-14 10:22:44"),
(5, 1, 1, 1, "2017-05-14 10:25:32"),
(6, 2, 1, 1, "2017-05-14 10:33:35"),
(7, 2, 1, 1, "2017-05-14 10:51:27"),
(8, 2, 1, 1, "2017-05-14 11:06:18"),
(9, 2, 1, 1, "2017-05-14 11:14:19"),
(10, 2, 1, 1, "2017-05-14 11:37:07"),
(11, 2, 1, 1, "2017-05-14 11:45:06"),
(12, 2, 1, 1, "2017-05-14 11:58:13"),

(16, 3, 1, 1, "2017-05-14 13:07:38"),
(17, 3, 1, 1, "2017-05-14 13:35:53"),
(18, 3, 1, 1, "2017-05-14 14:14:18"),
(19, 3, 1, 1, "2017-05-14 15:24:26"),
(20, 3, 1, 1, "2017-05-14 15:51:34");

COMMIT; /* Valider les inserts */

SET autocommit=1; /* remettre a true */