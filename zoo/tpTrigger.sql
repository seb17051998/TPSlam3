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

update animal set disponible=1;

/*Test de l'insertion*/

INSERT INTO Adoption (client_id, animal_id, date_reservation,date_adoption, prix, paye) VALUES (15, 30, '2007-08-17', '2008-08-17', 735.00, 1);

/*Test de la suppression*/

delete from adoption where client_id=15;

/*Test de la modification*/

update adoption set animal_id=57 where client_id=15;
--5 Historisation--

create table historique(

	)









		
	
	
