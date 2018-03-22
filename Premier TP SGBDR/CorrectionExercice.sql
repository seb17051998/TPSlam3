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
