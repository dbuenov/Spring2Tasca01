select 	l.nom, 
		sum(cuantitat)
from producte_comanda pc
		join producte p on pc.id_producte = p.id_producte
		join comanda c on pc.id_comanda = c.id_comanda
		join client cl on c.id_client = cl.id_client
		join localitat l on cl.id_localitat = l.id_localitat
where descripció = "Beguda"
group by l.nom