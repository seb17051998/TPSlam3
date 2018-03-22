--BUNEL Sébastien BTS SIO2

--Question 1--
--SQL--
select directeur
from film
where titre="Cris et chuchotements";

--ALGEBRE RELATIONNEL--

R1=Selection(film,titre="Cris et chuchotement")
R2= PROJECTION(R1,directeur)

--Question 2--
--SQL--
select nomSalle 
from Salle 
inner join Seance 
on seance.idSalle=Salle.idSalle 
inner join Film 
on film.idfilm=seance.idfilm 
where titre="Chiens de paille";

--ALGEBRE RELATIONNEL--
R1=SELECTION(FILM,titre="chiens de paille")
R2=JOINTURE(R1,Seance,R1.idfilm=Seance.idFilm)
R3=JOINTURE(R2,Salle,R2,idSalle=Salle.idsalle)
R4=PROJECTION(R3,nomsalle)

--Question 3--
--SQL--
select adresse, telephone
from salle
where nomSalle="Le Studio";

--ALGEBRE RELATIONNEL--
R1=SELECTION(SALLE,adresse,telephone)
R2=RESTRICTION(R1,nomSalle="Le Studio")

--Question 4--
--SQL--
0
