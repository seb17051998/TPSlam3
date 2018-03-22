drop database if exists cinema;
create database cinema;
use cinema;

create table film(
	idFilm int not null AUTO_INCREMENT,
	titre varchar(30),
	directeur varchar(30),

	PRIMARY KEY(idFilm));

create table salle(
	idSalle int not null AUTO_INCREMENT,
	nomSalle varchar(30),
	Adresse varchar(30),
	Telephone int not null,
	PRIMARY KEY(idSalle));

create table seance(	
	idSalle int not null,
	idFilm int not null,
	horaire time
	);

create table acteur(
	idActeur int not null AUTO_INCREMENT,
	nom varchar(30),
	PRIMARY KEY(idActeur));

create table jouer(
	idActeur int not null,
	idFilm int not null);   

alter table jouer
add constraint pk_jouer
primary key(idActeur);

alter table jouer
add constraint pk_jouer
primary key(idFilm);

alter table seance
add constraint pk_seance
primary key(idSalle);

alter table seance
add constraint pk_seance
primary key(idFilm);
	
alter table seance
add constraint fk_seance_idSalle_salle
foreign key(idSalle)
references salle(idSalle);

alter table seance
add constraint fk_seance_idFilm_film
foreign key(idfilm)
references film(idfilm);

alter table jouer
add constraint fk_jouer_idActeur_acteur
foreign key(idActeur)
references acteur(idActeur);

alter table seance
add column prix decimal(5,2)
default 0;

alter table jouer
add constraint fk_jouer_idFilm_acteur
foreign key(idFilm)
references film(idFilm);

insert into film(Titre, Directeur) VALUES ("Mais qui a tué Harry ?","Hitchcock");
insert into film(Titre, Directeur) VALUES ("Cris et chuchotements","Bergman");


insert into salle(nomSalle, Adresse, Telephone) VALUES ("Gaumont Opéra","31, bd des Italiens",0147426033);
insert into salle(nomSalle, Adresse, Telephone) VALUES ("Saint André des Arts","30, rue Saint André des Arts",0143264818);
insert into salle(nomSalle, Adresse, Telephone) VALUES ("Le Champo","51, rue des Ecoles",0143545160);
insert into salle(nomSalle, Adresse, Telephone) VALUES ("Georges V","144, av. des Champs Elysées",0145624146);
insert into salle(nomSalle, Adresse, Telephone) VALUES ("Les 7 Parnassiens","98, bd du Montparnasse",0143203220);

insert into acteur(nom) VALUES ("Gwenn");
insert into acteur(nom) VALUES ("Forsythe");
insert into acteur(nom) VALUES ("MacLaine");
insert into acteur(nom) VALUES ("Hitchcock");
insert into acteur(nom) VALUES ("Anderson");
insert into acteur(nom) VALUES ("Sylwan");
insert into acteur(nom) VALUES ("Thulin");
insert into acteur(nom) VALUES ("Ullman");

insert into seance(idSalle,idFilm,Horaire) VALUES (1,2,"20:15",8.75);
insert into seance(idSalle,idFilm,Horaire) VALUES (2,1,"20:30",7.50);
insert into seance(idSalle,idFilm,Horaire) VALUES (2,4,"22:15",10.00);
insert into seance(idSalle,idFilm,Horaire) VALUES (2,5,"20:45",7.50);
insert into seance(idSalle,idFilm,Horaire) VALUES (3,1,"20:45",7.50);
insert into seance(idSalle,idFilm,Horaire) VALUES (3,4,"20:45",7.50);
insert into seance(idSalle,idFilm,Horaire) VALUES (4,1,"20:45",7.50); --A MODIFIER
insert into seance(idSalle,idFilm,Horaire) VALUES (4,3,"20:45",7.50); --
insert into seance(idSalle,idFilm,Horaire) VALUES (4,4,"20:45",7.50); --
insert into seance(idSalle,idFilm,Horaire) VALUES (5,5,"20:45",7.50); --

insert into jouer(idActeur,idFilm) VALUES (1,1);
insert into jouer(idActeur,idFilm) VALUES (1,2);
insert into jouer(idActeur,idFilm) VALUES (2,1);
insert into jouer(idActeur,idFilm) VALUES (2,2);
insert into jouer(idActeur,idFilm) VALUES (3,1);
insert into jouer(idActeur,idFilm) VALUES (3,2);
insert into jouer(idActeur,idFilm) VALUES (4,1);
insert into jouer(idActeur,idFilm) VALUES (4,2);
insert into jouer(idActeur,idFilm) VALUES (5,1);
insert into jouer(idActeur,idFilm) VALUES (5,2);
insert into jouer(idActeur,idFilm) VALUES (6,1);
insert into jouer(idActeur,idFilm) VALUES (6,2);
insert into jouer(idActeur,idFilm) VALUES (7,1);
insert into jouer(idActeur,idFilm) VALUES (7,2);
insert into jouer(idActeur,idFilm) VALUES (8,1);
insert into jouer(idActeur,idFilm) VALUES (8,2);