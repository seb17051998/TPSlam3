--1--
delimiter |
drop procedure if exists ajoutSouscrit|
create procedure ajoutSouscrit
(num integer, nom char(20),ville char(20), total decimal(10,0))
begin
insert into souscrit values(num,nom,ville,total);
end |
delimiter ;
call ajoutSouscrit(8,"BROGNART","PARIS",100000);
select * from souscrit;
show create procedure ajoutSouscrit;

--2--
delimiter |
drop procedure if exists listSouscrit|
create procedure listSouscrit(bornesup integer,borneinf integer)
begin
	select num from verse
	where montant<bornesup
	and num in(select num from verse 
	where montant>borneinf);
end|
delimiter ;
call listSouscrit(100,1000);

--3--
delimiter |
drop procedure if exists listAbo|
create procedure listAbo(echeance date)
begin
	select distinct s.num, nom from souscrit s
	inner join abonne a
	on s.num=a.num
	where date_add(dateDebut, interval duree month)> echeance;
end|
delimiter ;
call listAbo("2017/11/01");

--4--
create view versementsTotaux as select num, sum(montant) as total from verse 
group by num;

delimiter |
drop procedure if exists updateVersement|
create procedure updateVersement(nomSouscripteur,pourcentage)
begin
	
	
	