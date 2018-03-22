/*
**  Ce script créé les tables de la base TOUSCEAU
SOUSCRIT     (NUM, NOM, VILLE, TOTAL)
VERSE           (#NUM, DATE, MONTANT)
ABONNE       (#NUM, #CODE-R, DATE-D, DUREE)
REVUE          (CODE-R, NOM-R, PRIX)



(TOTAL : total des sommes versées l'année précédente)


 */

/* création de la database */
 
 
drop database if exists Tousceau;
create database Tousceau;
USE Tousceau

/* création des tables */

/* table SOUSCRIT */

drop table if exists SOUSCRIT;
CREATE TABLE SOUSCRIT
(num int not null ,
 nom char(20),
 ville char(20),
 total decimal(10.2)
 )engine = innodb;

describe SOUSCRIT;

/* table REVUE */

drop table if exists REVUE;
CREATE TABLE REVUE
(coder char(3)  NOT NULL ,
 nomr char(30)  NOT NULL ,
 prix decimal(8.2) 
 )engine = innodb;

describe revue; 
 
 /* table VERSE */

drop table if exists VERSE;
CREATE TABLE VERSE
(
 num int  NOT NULL ,
 datev  date  NOT NULL , 
  montant decimal(10.2) 
  )engine = innodb;
 
 describe verse;

 /* table ABONNE */

drop table if exists ABONNE;
CREATE TABLE abonne
(
 num int  NOT NULL ,
 coder char(3)  NOT NULL  ,
 dateDebut date  noT NULL ,
 duree int 
 )engine = innodb;
 
describe abonne;

/* création des clés primaires */

alter table souscrit
add constraint pk_souscrit PRIMARY KEY (num);

alter table revue
add constraint pk_revue PRIMARY KEY (coder);

alter table verse
add constraint pk_verse PRIMARY KEY (num, datev);

alter table abonne
add constraint pk_abonne PRIMARY KEY (num, coder);

/* creation des clés étrangères */

alter table verse
add constraint fk_verse_num FOREIGN KEY (num) REFERENCES souscrit(num);
alter table abonne
add constraint fk_abonne_num FOREIGN KEY (num) REFERENCES souscrit(num);
alter table abonne
add constraint fk_abonne_coder FOREIGN KEY (coder) REFERENCES revue(coder);

/* insertion des lignes */

delete from souscrit;




INSERT souscrit VALUES (1,  'Dupond'  , 'Paris',7000   );
INSERT souscrit VALUES (2,'Durand'  , 'Lyon',12000   );
INSERT souscrit VALUES (3,'Martin'  , 'Marseille',5000   );
INSERT souscrit VALUES (4,'Petit'  , 'Rouen',20000   );
INSERT souscrit VALUES (5,'Thomas'  , 'Lille',15000   );
INSERT souscrit VALUES (6,'Legendre'  , 'Metz',25000   );
INSERT souscrit VALUES (7,'Loisel'  , 'Lille',6000   );


SELECT * FROM souscrit;

delete from verse;

INSERT verse VALUES (  1,'2017/01/31',50   );
INSERT verse VALUES (  2,'2017/02/28',200   );
INSERT verse VALUES (  3,'2017/02/15',8750  );
INSERT verse VALUES (  4,'2016/08/28',800  );
INSERT verse VALUES (  5,'2016/05/03',1000  );
INSERT verse VALUES (  6,'2016/07/14',30  );
INSERT verse VALUES (  1,'2016/10/18',600);
INSERT verse VALUES (  1,'2016/12/24',400);
INSERT verse VALUES (  3,'2016/11/30',80);
INSERT verse VALUES (  7,'2016/09/20',9000);



SELECT * FROM verse;

delete from revue;

INSERT revue VALUES (  'r10','talypso',250 );
INSERT revue VALUES (  'r20','match',180 );
INSERT revue VALUES (  'r30','svm',200 );
INSERT revue VALUES (  'r40','01info',350 );
INSERT revue VALUES (  'r50','closer',40 );

SELECT * FROM revue;

delete from abonne;

INSERT abonne VALUES (  1,'r10','2017/01/01',12 );
INSERT abonne VALUES (  1,'r30','2016/03/01',6 );
INSERT abonne VALUES (  2,'r10','2016/06/01',6 );
INSERT abonne VALUES (  2,'r20','2016/08/01',18 );
INSERT abonne VALUES (  2,'r30','2016/10/01',12 );
INSERT abonne VALUES (  2,'r40','2017/02/01',12 );
INSERT abonne VALUES (  3,'r40','2016/03/01',6 );
INSERT abonne VALUES (  4,'r30','2016/09/15',6 );


SELECT * FROM abonne;
