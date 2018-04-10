# Premier TP Cinéma #

Ce tp est donc des révisions de l'année dernière du cours Si3 (Exploitation des données) dont on utilise des jointures et de l'algèbre relationnel

```

/* script de création de la base de données Cinema */
drop database if exists cinema;
create database cinema;
USE cinema
/* script de création des tables de la base de données cinema */
/* suppression des tables */
DROP TABLE if exists film;
DROP TABLE if exists acteur;
DROP TABLE if exists salle;
DROP TABLE if exists seance;
DROP TABLE if exists jouer;

/* table film */
create table film(idFilm INT auto_increment not null,
titre VARCHAR(50),
directeur varchar(30),
primary key(idFilm))engine= innodb;

/* table acteur */
create table acteur(idActeur INT auto_increment not null,
nom VARCHAR(50),
primary key(idActeur))engine=innodb;

/* table salle */
create table salle(idSalle INT auto_increment not null,
nomSalle VARCHAR(50),
adresse VARCHAR(50),
telephone VARCHAR(15),
primary key(idSalle))engine = innodb;

/* table seance */
create table seance(idFilm INT  not null, idSalle INT  not null,
horaire VARCHAR(10))engine = innodb;

/* table jouer */
create table jouer(idFilm INT not null,
idActeur INT not null)engine=innodb;

/* clés primaires */
alter table jouer  
add constraint PK_jouer primary key(idFilm, idActeur);
alter table seance 
add constraint PK_seance primary key(idFilm, idSalle);

/* clés étrangères */

alter table jouer add constraint FK_jouer_film foreign key (idFilm) references film(idFilm);
alter table jouer add constraint FK_jouer_acteur foreign key (idActeur) references acteur(idActeur);

alter table seance add constraint  FK_seance_film foreign key(idFilm) references film(idFilm);
alter table seance add constraint  FK_seance_salle foreign key(idSalle) references salle(idsalle);

/* insertion des lignes */
insert into film(titre, directeur) values('Mais qui a tué Harry ?', 'Hitchcock');
insert into film(titre, directeur) values('Cris et chuchotements', 'Bergman');
insert into film(titre, directeur) values('Annie Hall', 'Woody Allen');
insert into film(titre, directeur) values('Manhattan', 'Woody Allen');
insert into film(titre, directeur) values('chiens de paille', 'Rod Lurie');

insert into acteur(nom) value ('Gwen');
insert into acteur(nom) value ('Forsythe');
insert into acteur(nom) value ('MacLaine');
insert into acteur(nom) value ('Hitchcock');
insert into acteur(nom) value ('Anderson');
insert into acteur(nom) value ('Sylwan');
insert into acteur(nom) value ('Thulin');
insert into acteur(nom) value ('Ullman');
insert into acteur(nom) value ('Keaton');
insert into acteur(nom) value ('Roberts');
insert into acteur(nom) value ('Walken');
insert into acteur(nom) value ('Woody Allen');
insert into acteur(nom) value ('Streep');
insert into acteur(nom) value ('Hemingway');


insert into salle(nomSalle, adresse, telephone) values('Gaumont Opera','31 bd des Italiens','01 47 42 60 33');
insert into salle(nomSalle, adresse, telephone) values('St adre des Arts','30 rue St Andre des Arts','01 43 26 48 18');
insert into salle(nomSalle, adresse, telephone) values('Le Champo','51 rue des ecoles','01 47 42 60 33');
insert into salle(nomSalle, adresse, telephone) values('Georges V','144 av des Champs elysees','01 45 62 41 46');
insert into salle(nomSalle, adresse, telephone) values('Les 7 Parnassiens','98 bd du Montparnasse','01 43 20 32 20');


insert into jouer values(1,1);
insert into jouer values(1,2);
insert into jouer values(1,3);
insert into jouer values(1,4);
insert into jouer values(2,5);
insert into jouer values(2,6);
insert into jouer values(2,7);
insert into jouer values(2,8);
insert into jouer values(3,9);
insert into jouer values(3,9);
insert into jouer values(3,10);
insert into jouer values(3,11);
insert into jouer values(3,12);
insert into jouer values(4,12);
insert into jouer values(4,13);
insert into jouer values(4,14);
insert into jouer values(4,9);

insert into seance values(1,2,'20:15');
insert into seance values(2,1,'20:30');
insert into seance values(2,4,'22:15');
insert into seance values(2,5,'20:45');
insert into seance values(3,1,'18:45');
insert into seance values(3,4,'22:15');
insert into seance values(4,1,'21:30');
insert into seance values(4,3,'16:45');
insert into seance values(4,4,'19:45');

```

## Exercice ##

```
--1--
R1=Selection(film,titre="Cris et chuchotement")
R2= PROJECTION(R1,directeur)

select DISTINCT directeur 
from film 
where titre="Cris et chuchotement";

--2--

R1=SELECTION(FILM,titre="chiens de paille")
R2=JOINTURE(R1,Seance,R1.idfilm=Seance.idFilm)
R3=JOINTURE(R2,Salle,R2,idSalle=Salle.idsalle)
R4=PROJECTION(R3,nomsalle)

select nomSalle 
from Salle 
inner join Seance 
on seance.idSalle=Salle.idSalle 
inner join Film 
on film.idfilm=seance.idfilm 
where titre="Chiens de paille";

--3--

--4--

R1=SELECTION(FILM,directeur="Bergman")
R2=JOINTURE(R1.SEANCE,R1.idFilm=seance.idFilm=)
R3=JOINTURE(R2.SALLE,R2.idsalle=SALLE.idSalle)
R4=PROJECTION(R3.nomSalle,adresse)

select nomSalle,adresse 
from SALLE s
inner join SEANCE seance
On s.idsalle=se.idSalle
Inner join film f
on se.idfilm=f.idfilm
WHERE directeur="Bergman";

--5--
R1= JOINTURE(FILM,JOUER,FILM.idfilm=JOUER.idfilm)
R2= JOINTURE(R1,ACTEUR,R1.idActeur=ACTEUR.idActeur)
R3= PROJECTION(R2,directeur,nom)
R4= CLASSEMENT(R3,directeur)

--6--

R1=SELECTION(SALLE,nomSalle="Gaumont Opéra")
R2=SELECTION(FILM,directeur="Bergman")
R3=JOINTURE(R2,SEANCE,R2.idFilm=SEANCE.idFilm)
R4=JOINTURE(R3,R1,R3.idSalle=R1.idSalle)
R5=PROJECTION(R4,horaire)

select titre, horaire from Seance se
inner join SALLE s
on s.idSalle= se.idSalle
inner join FILM f
on se.idFilm=f.idFilm
where directeur="Bergman"
and nomSalle="Gaumont opera"; 

--7--

R1=SELECTION(FILM, titre = "Annie Hall" ou titre="Manhattan")
R2=JOINTURE(R1,SEANCE,R1.idFilm=SEANCE.idFilm)
R3=JOINTURE(R2,SALLE,R2.idSalle=SALLE.idSalle)
R4=PROJECTION(R3.nomSalle)

Autre solution

R1=SELECTION(FILM, titre = "Annie Hall")
R2=JOINTURE(R1,SEANCE,R1.idFilm=SEANCE.idFilm)
R3=JOINTURE(R2,SALLE,R2.idSalle=SALLE.idSalle)

R4=SELECTION(FILM,titre="Manhattan")
R5=JOINTURE(R4,SEANCE,R4.idFilm=SEANCE.idFilm)
R6=JOINTURE(R5,SALLE,R5.idSalle=SALLE.idSalle)

R7=PROJECTION(R3,nomSalle)
R8=PROJECTION(R6,nomSalle)
R9=UNION(R7,R8)

--ou
select nomSalle from seance se
inner join salle s
on s.idSalle=se.idSalle
inner join FILM f
on se.idFilm=f.idFilm
where titre="Annie Hall"
or titre="Manhattan";

select nomSalle from seance se
inner join salle s
on s.idSalle=se.idSalle
inner join FILM f
on se.idFilm=f.idFilm
where titre="Annie Hall"
union
select nomSalle from seance se
inner join salle s
on s.idSalle=se.idSalle
inner join FILM f
on se.idFilm=f.idFilm
where titre="Manhattan"

--et

R1=SELECTION(FILM, titre = "Annie Hall" et titre="Manhattan")
R2=JOINTURE(R1,SEANCE,R1.idFilm=SEANCE.idFilm)
R3=JOINTURE(R2,SALLE,R2.idSalle=SALLE.idSalle)
R4=PROJECTION(R3.nomSalle)

select nomSalle from seance se
inner join salle s
on s.idSalle=se.idSalle
inner join FILM f
on se.idFilm=f.idFilm
where titre="Annie Hall"
and titre="Manhattan";

select nomSalle from seance se
inner join salle s
on s.idSalle=se.idSalle
inner join FILM f
on se.idFilm=f.idFilm
where titre="Annie Hall" and nomsalle in
(select nomSalle from seance se
inner join salle s
on s.idSalle=se.idSalle
inner join FILM f
on se.idFilm=f.idFilm
where titre="Manhattan");

--9

R1=SELECTION(FILM,directeur="Hitchcock")
R2=SELECTION(ACTEUR,nom="Hitchcock")
R3=JOINTURE(R1,JOUER,R1.idfilm=JOUER.idfilm)
R4=JOINTURE(R3,R2,R3.idActeur=R2.idActeur)
R5=PROJECTION(R1,titre)
R6=PROJECTION(R4,titre)
R7=DIFFERENCE(R5,R6)

select titre from film f 
where directeur="Hitchcock";

select titre from film f 
where directeur="Hitchcock"
and titre not in(
Select titre from film f 
inner join jouer j
on f.idFilm=j.idfilm;
inner join Acteur adresse
on j.idActeur=a.idActeur
where directeur="Hitchcock"
and nom ="Hitchcock");

--10


select nom from ACTEUR a
inner join jouer j
on a.idActeur=j.idActeur
inner join film f
on film
group by nom 
having count(*) =(
select count(*) from film
where directeur= "Woody Allen")

```
