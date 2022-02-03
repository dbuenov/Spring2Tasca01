SELECT 	count(id_comanda), 
		e.nom, 
		e.cognom 
FROM comanda c
		join empleat e on c.id_empleat = e.id_empleat
where c.id_empleat is not null
group by c.id_empleat