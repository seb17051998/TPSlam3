# TP Zoo : triggers #

```
DROP database IF EXISTS zoo;
create database zoo;
use zoo;

DROP TABLE IF EXISTS Animal;
DROP TABLE IF EXISTS Race;
DROP TABLE IF EXISTS Espece;


CREATE TABLE Espece (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  nom_courant varchar(40) NOT NULL,
  nom_latin varchar(40) NOT NULL,
  description text,
  prix double unsigned DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY nom_latin (nom_latin)
) ENGINE=InnoDB AUTO_INCREMENT=6 ;

/* LOCK TABLES Espece WRITE; */
INSERT INTO Espece VALUES (1,'Chien','Canis canis','Bestiole à quatre pattes qui aime les caresses et tire souvent la langue',200.00),
(2,'Chat','Felis silvestris','Bestiole à quatre pattes qui saute très haut et grimpe aux arbres',150.00),
(3,'Tortue d''Hermann','Testudo hermanni','Bestiole avec une carapace très dure',140.00),
(4,'Perroquet amazone','Alipiopsitta xanthops','Joli oiseau parleur vert et jaune',700.00),
(5,'Rat brun','Rattus norvegicus','Petite bestiole avec de longues moustaches et une longue queue sans poils',10.00);
/* UNLOCK TABLES; */


CREATE TABLE Race (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  nom varchar(40) NOT NULL,
  espece_id smallint(6) unsigned NOT NULL,
  description text,
  prix double unsigned DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

LOCK TABLES Race WRITE;
INSERT INTO Race VALUES (1,'Berger allemand',1,'Chien sportif et élégant au pelage dense, noir-marron-fauve, noir ou gris.',485.00),(2,'Berger blanc suisse',1,'Petit chien au corps compact, avec des pattes courtes mais bien proportionnées et au pelage tricolore ou bicolore.',935.00),(3,'Singapura',2,'Chat de petite taille aux grands yeux en amandes.',985.00),
(4,'Bleu russe',2,'Chat aux yeux verts et à la robe épaisse et argentée.',835.00),(5,'Maine coon',2,'Chat de grande taille, à poils mi-longs.',735.00),(7,'Sphynx',2,'Chat sans poils.',1235.00),
(8,'Nebelung',2,'Chat bleu russe, mais avec des poils longs...',985.00),(9,'Rottweiller',1,'Chien d''apparence solide, bien musclé, à la robe noire avec des taches feu bien délimitées.',600.00);
UNLOCK TABLES;


CREATE TABLE Animal (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  sexe char(1) DEFAULT NULL,
  date_naissance datetime NOT NULL,
  nom varchar(30) DEFAULT NULL,
  commentaires text,
  espece_id smallint(6) unsigned NOT NULL,
  race_id smallint(6) unsigned DEFAULT NULL,
  mere_id smallint(6) unsigned DEFAULT NULL,
  pere_id smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY ind_uni_nom_espece_id (nom,espece_id)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

LOCK TABLES Animal WRITE;
INSERT INTO Animal VALUES (1,'M','2010-04-05 13:43:00','Rox','Mordille beaucoup',1,1,18,22),(2,NULL,'2010-03-24 02:23:00','Roucky',NULL,2,NULL,40,30),(3,'F','2010-09-13 15:02:00','Schtroumpfette',NULL,2,4,41,31),
(4,'F','2009-08-03 05:12:00',NULL,'Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(5,NULL,'2010-10-03 16:44:00','Choupi','Né sans oreille gauche',2,NULL,NULL,NULL),(6,'F','2009-06-13 08:17:00','Bobosse','Carapace bizarre',3,NULL,NULL,NULL),
(7,'F','2008-12-06 05:18:00','Caroline',NULL,1,2,NULL,NULL),(8,'M','2008-09-11 15:38:00','Bagherra',NULL,2,5,NULL,NULL),(9,NULL,'2010-08-23 05:18:00',NULL,'Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
(10,'M','2010-07-21 15:41:00','Bobo',NULL,1,NULL,7,21),(11,'F','2008-02-20 15:45:00','Canaille',NULL,1,NULL,NULL,NULL),(12,'F','2009-05-26 08:54:00','Cali',NULL,1,2,NULL,NULL),
(13,'F','2007-04-24 12:54:00','Rouquine',NULL,1,1,NULL,NULL),(14,'F','2009-05-26 08:56:00','Fila',NULL,1,2,NULL,NULL),(15,'F','2008-02-20 15:47:00','Anya',NULL,1,NULL,NULL,NULL),
(16,'F','2009-05-26 08:50:00','Louya',NULL,1,NULL,NULL,NULL),(17,'F','2008-03-10 13:45:00','Welva',NULL,1,NULL,NULL,NULL),(18,'F','2007-04-24 12:59:00','Zira',NULL,1,1,NULL,NULL),
(19,'F','2009-05-26 09:02:00','Java',NULL,1,2,NULL,NULL),(20,'M','2007-04-24 12:45:00','Balou',NULL,1,1,NULL,NULL),(21,'F','2008-03-10 13:43:00','Pataude',NULL,1,NULL,NULL,NULL),
(22,'M','2007-04-24 12:42:00','Bouli',NULL,1,1,NULL,NULL),(24,'M','2007-04-12 05:23:00','Cartouche',NULL,1,NULL,NULL,NULL),(25,'M','2006-05-14 15:50:00','Zambo',NULL,1,1,NULL,NULL),
(26,'M','2006-05-14 15:48:00','Samba',NULL,1,1,NULL,NULL),(27,'M','2008-03-10 13:40:00','Moka',NULL,1,NULL,NULL,NULL),(28,'M','2006-05-14 15:40:00','Pilou',NULL,1,1,NULL,NULL),
(29,'M','2009-05-14 06:30:00','Fiero',NULL,2,3,NULL,NULL),(30,'M','2007-03-12 12:05:00','Zonko',NULL,2,5,NULL,NULL),(31,'M','2008-02-20 15:45:00','Filou',NULL,2,4,NULL,NULL),
(32,'M','2009-07-26 11:52:00','Spoutnik',NULL,3,NULL,52,NULL),(33,'M','2006-05-19 16:17:00','Caribou',NULL,2,4,NULL,NULL),(34,'M','2008-04-20 03:22:00','Capou',NULL,2,5,NULL,NULL),
(35,'M','2006-05-19 16:56:00','Raccou','Pas de queue depuis la naissance',2,4,NULL,NULL),(36,'M','2009-05-14 06:42:00','Boucan',NULL,2,3,NULL,NULL),(37,'F','2006-05-19 16:06:00','Callune',NULL,2,8,NULL,NULL),
(38,'F','2009-05-14 06:45:00','Boule',NULL,2,3,NULL,NULL),(39,'F','2008-04-20 03:26:00','Zara',NULL,2,5,NULL,NULL),(40,'F','2007-03-12 12:00:00','Milla',NULL,2,5,NULL,NULL),
(41,'F','2006-05-19 15:59:00','Feta',NULL,2,4,NULL,NULL),(42,'F','2008-04-20 03:20:00','Bilba','Sourde de l''oreille droite à 80%',2,5,NULL,NULL),(43,'F','2007-03-12 11:54:00','Cracotte',NULL,2,5,NULL,NULL),
(44,'F','2006-05-19 16:16:00','Cawette',NULL,2,8,NULL,NULL),(45,'F','2007-04-01 18:17:00','Nikki','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(46,'F','2009-03-24 08:23:00','Tortilla','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
(47,'F','2009-03-26 01:24:00','Scroupy','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(48,'F','2006-03-15 14:56:00','Lulla','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(49,'F','2008-03-15 12:02:00','Dana','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
(50,'F','2009-05-25 19:57:00','Cheli','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(51,'F','2007-04-01 03:54:00','Chicaca','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(52,'F','2006-03-15 14:26:00','Redbul','Insomniaque',3,NULL,NULL,NULL),
(54,'M','2008-03-16 08:20:00','Bubulle','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),(55,'M','2008-03-15 18:45:00','Relou','Surpoids',3,NULL,NULL,NULL),(56,'M','2009-05-25 18:54:00','Bulbizard','Bestiole avec une carapace très dure',3,NULL,NULL,NULL),
(57,'M','2007-03-04 19:36:00','Safran','Coco veut un gâteau !',4,NULL,NULL,NULL),(58,'M','2008-02-20 02:50:00','Gingko','Coco veut un gâteau !',4,NULL,NULL,NULL),(59,'M','2009-03-26 08:28:00','Bavard','Coco veut un gâteau !',4,NULL,NULL,NULL),
(60,'F','2009-03-26 07:55:00','Parlotte','Coco veut un gâteau !',4,NULL,NULL,NULL),(61,'M','2010-11-09 00:00:00','Yoda',NULL,2,5,NULL,NULL),(62,'M','2010-11-05 00:00:00','Pipo',NULL,1,9,NULL,NULL);
UNLOCK TABLES;


ALTER TABLE Race ADD CONSTRAINT fk_race_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id) ON DELETE CASCADE;

ALTER TABLE Animal ADD CONSTRAINT fk_race_id FOREIGN KEY (race_id) REFERENCES Race (id) ON DELETE SET NULL;
ALTER TABLE Animal ADD CONSTRAINT fk_espece_id FOREIGN KEY (espece_id) REFERENCES Espece (id);
ALTER TABLE Animal ADD CONSTRAINT fk_mere_id FOREIGN KEY (mere_id) REFERENCES Animal (id) ON DELETE SET NULL;
ALTER TABLE Animal ADD CONSTRAINT fk_pere_id FOREIGN KEY (pere_id) REFERENCES Animal (id) ON DELETE SET NULL;

-- Table Client
drop table if exists adoption;
drop table if exists client;
CREATE TABLE Client (
id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
nom VARCHAR(100) NOT NULL,
prenom VARCHAR(60) NOT NULL,
adresse VARCHAR(200),
code_postal VARCHAR(6),
ville VARCHAR(60),
pays VARCHAR(60),
email VARBINARY(100),
PRIMARY KEY (id),
UNIQUE INDEX ind_uni_email (email)
) ENGINE = InnoDB;
-- Table Adoption

CREATE TABLE Adoption (
client_id SMALLINT UNSIGNED NOT NULL,
animal_id SMALLINT UNSIGNED NOT NULL,
date_reservation DATE NOT NULL,
date_adoption DATE,
prix DECIMAL(7,2) UNSIGNED NOT NULL,
paye TINYINT(1) NOT NULL DEFAULT 0,
PRIMARY KEY (client_id, animal_id),
CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES
Client(id),
CONSTRAINT fk_adoption_animal_id FOREIGN KEY (animal_id)
REFERENCES Animal(id),
UNIQUE INDEX ind_uni_animal_id (animal_id)
) ENGINE = InnoDB;
-- Insertion de quelques clients
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Jean', 'Dupont', 'Rue du Centre, 5',
'45810', 'Houtsiplou', 'France', 'jean.dupont@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Marie', 'Boudur', 'Place de la Gare, 2',
'35840', 'Troudumonde', 'France', 'marie.boudur@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Fleur', 'Trachon', 'Rue haute, 54b', '3250',
'Belville', 'Belgique', 'fleurtrachon@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Julien', 'Van Piperseel', NULL, NULL, NULL,
NULL, 'jeanvp@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Johan', 'Nouvel', NULL, NULL, NULL, NULL,
'johanetpirlouit@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Frank', 'Germain', NULL, NULL, NULL, NULL,
'francoisgermain@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Maximilien', 'Antoine', 'Rue Moineau, 123',
'4580', 'Trocoul', 'Belgique', 'max.antoine@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Hector', 'Di Paolo', NULL, NULL, NULL, NULL,
'hectordipao@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Anaelle', 'Corduro', NULL, NULL, NULL,
NULL, 'ana.corduro@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Eline', 'Faluche', 'Avenue circulaire, 7',
'45870', 'Garduche', 'France', 'elinefaluche@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Carine', 'Penni', 'Boulevard Haussman, 85',
'1514', 'Plasse', 'Suisse', 'cpenni@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Virginie', 'Broussaille', 'Rue du Fleuve,
18', '45810', 'Houtsiplou', 'France', 'vibrousaille@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Hannah', 'Durant', 'Rue des Pendus, 66',
'1514', 'Plasse', 'Suisse', 'hhdurant@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Elodie', 'Delfour', 'Rue de Flore, 1',
'3250', 'Belville', 'Belgique', 'e.delfour@email.com');
INSERT INTO Client (prenom, nom, adresse, code_postal, ville,
pays, email) VALUES ('Joel', 'Kestau', NULL, NULL, NULL, NULL,
'joel.kestau@email.com');
-- Insertion de quelques adoptions
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (1, 39, '2008-08-17', '2008-08-15', 735.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (1, 40, '2008-08-17', '2008-08-17', 735.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (2, 18, '2008-06-04', '2008-06-04', 485.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (3, 27, '2009-11-17', '2009-11-17', 200.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (4, 26, '2007-02-21', '2007-02-21', 485.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (4, 41, '2007-02-21', '2007-02-21', 835.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (5, 21, '2009-03-08', '2009-03-08', 200.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (6, 16, '2010-01-27', '2010-01-27', 200.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (7, 5, '2011-04-05', '2011-04-05', 150.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (8, 42, '2008-08-16', '2008-08-16', 735.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (9, 55, '2011-02-13', '2011-02-13', 140.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (9, 54, '2011-02-13', '2011-02-13', 140.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (10, 49, '2010-08-17', '2010-08-17', 140.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (11, 62, '2011-03-01', '2011-03-01', 630.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (12, 59, '2007-09-20', '2007-09-20', 10.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (13, 57, '2012-01-10', '2012-01-10', 700.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (14, 58, '2012-02-25', '2012-02-25', 700.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (15, 30, '2008-08-17', '2008-08-17', 735.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (11, 32, '2008-08-17', '2010-03-09', 140.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (9, 33, '2007-02-11', '2007-02-11', 835.00, 1);
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (2, 3, '2011-03-12', '2011-03-12', 835.00, 1);

```

## Exercice ##

```
--TP TRIGGER SOUS MYSQL--
--1 Sexe de l'animal--
delimiter |
drop trigger if exists before_insert_animal|
create trigger before_insert_animal
BEFORE INSERT ON animal FOR EACH ROW
BEGIN
	if new.sexe is not null 
		and new.sexe != 'F'
		and new.sexe != 'M'
	then
		set new.sexe = null;
	end if;
end|
delimiter ;

insert into animal (sexe,date_naissance,nom,commentaires,espece_id,race_id,mere_id,pere_id) values ("P","2000-05-19","Pauline","Je suis mignon en me promenant dans les rues",2,4,null,null);

--1 Deuxième possibilité--
DROP TABLE if exists Erreur;
CREATE TABLE Erreur (
    id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    erreur VARCHAR(255) UNIQUE);

INSERT INTO Erreur (erreur) VALUES ('Erreur : sexe doit valoir "M", "F", NULL.');

DELIMITER |
drop trigger if exists before_insert_animal|
CREATE TRIGGER before_insert_animal BEFORE INSERT
ON Animal FOR EACH ROW
BEGIN
    IF NEW.sexe IS NOT NULL   
    AND NEW.sexe != 'M'       
    AND NEW.sexe != 'F'       
      THEN
        INSERT INTO Erreur (erreur) VALUES ('Erreur : le sexe doit valoir "M", "F" ou NULL.');
    END IF;
END |
DELIMITER ;

--2 Vérification du booléen dans l'adoption--
insert into Erreur(erreur) values("Erreur : la valeur doit etre 0 ou 1");

--Insertion--
delimiter |
drop trigger if exists before_insert_adoption|
create trigger before_insert_adoption before insert
on adoption for each row
begin
		if new.paye != TRUE
		and new.paye != FALSE
	then
		insert into Erreur(erreur) values("Erreur : la valeur doit etre 0 ou 1");
	end if;
end|
delimiter ;

-- Test
INSERT INTO Adoption (client_id, animal_id, date_reservation,
date_adoption, prix, paye) VALUES (1, 40, '2008-08-17', '2008-08-17', 735.00, 3);

--Modification-- /*Le message d'erreur ne fonctionne pas*/

delimiter |
drop trigger if exists before_update_adoption|
create trigger before_update_adoption before insert
on adoption for each row
begin
	if new.paye != TRUE
	and new.paye != FALSE
	then 
		insert into Erreur(erreur) values("Erreur : la valeur doit etre 0 ou 1");
	end if;
end|
delimiter;
-- Test 
update Adoption set paye=3 where client_id=3;

--3 Vérification de la date dadoption--

INSERT INTO Erreur (erreur) VALUES ('Erreur : la date dadoption doit être supérieur ou égale à la date de réservation.');
delimiter |
drop trigger if exists before_insert_adoption|

/*Insertion*/
CREATE TRIGGER before_insert_adoption BEFORE INSERT
ON adoption FOR EACH ROW
BEGIN
    IF NEW.paye != TRUE     
    AND NEW.paye != FALSE     
      THEN
        INSERT INTO Erreur (erreur) VALUES ('Erreur : la valeur doit etre 0 ou 1');
	END IF;
    IF NEW.date_adoption < NEW.date_reservation THEN    
    
        INSERT INTO Erreur(erreur) VALUES ('Erreur : la date dadoption doit être supérieur ou égale à la date de réservation');
    END IF;
END|
delimiter ;

INSERT INTO Adoption (client_id, animal_id, date_reservation,date_adoption, prix, paye) VALUES (15, 30, '2007-08-17', '2006-08-17', 735.00, 1);

/*Update*/
delimiter |
DROP TRIGGER before_update_adoption|
CREATE TRIGGER before_update_adoption BEFORE UPDATE
ON Adoption FOR EACH ROW
BEGIN
    IF NEW.paye != TRUE     
    AND NEW.paye != FALSE     
      THEN
        INSERT INTO Erreur (erreur) VALUES ('Erreur : la valeur doit etre 0 ou 1');
	END if;
    IF NEW.date_adoption < NEW.date_reservation THEN    
    
        INSERT INTO Erreur (erreur) VALUES ('Erreur : la date dadoption doit être supérieur ou égale à la date de réservation');
    END IF;
END |
DELIMITER ;

--4 Gestion de la disponibilité des animaux pour l'adoption--

alter table animal
add disponible boolean;


DELIMITER |
drop trigger if exists after_insert_adoption|
CREATE TRIGGER after_insert_adoption AFTER INSERT
ON Adoption FOR EACH ROW
BEGIN
    UPDATE Animal
    SET disponible = FALSE
    WHERE id = NEW.animal_id;
END |

drop trigger if exists after_delete_adoption|
CREATE TRIGGER after_delete_adoption AFTER DELETE
ON Adoption FOR EACH ROW
BEGIN
    UPDATE Animal
    SET disponible = TRUE
    WHERE id = OLD.animal_id;
END |

drop trigger if exists after_update_adoption|
CREATE TRIGGER after_update_adoption AFTER UPDATE
ON Adoption FOR EACH ROW
BEGIN
    IF OLD.animal_id <> NEW.animal_id THEN
        UPDATE Animal
        SET disponible = TRUE
        WHERE id = OLD.animal_id;

        UPDATE Animal
        SET disponible = FALSE
        WHERE id = NEW.animal_id;
    END IF;
END |
DELIMITER ;

```
