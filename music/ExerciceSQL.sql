--Quels sont les élèves qui suivent le plus de cours ?
create view statCours (id,nom,nbCours)
as select e.id,e.nom,count(*)
from eleves e 
inner join inscriptions i 
on e.id=i.idEleve
group by e.id,e.nom;

select id,nom from statCours
where nbCours= (select max(nbCours) from statCours);


--Quels sont les élèves qui suivent tous les cours du conservatoire ?

select idEleve, count(distinct idCours)
from inscriptions
group by idEleve
having count(distinct idCours)
=(select count(*) from cours);