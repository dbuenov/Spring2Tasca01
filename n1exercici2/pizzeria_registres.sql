insert into provincia (nom)
values ("Barcelona"), ("Girona"), ("Tarragona"), ("Lleida");

insert into localitat (nom, id_provincia)
values 	("Barcelona", 1), ("Badalona", 1), ("Mataró", 1), 
		("Girona", 2), ("Figueres", 2), ("Palamós", 2),
        ("Tarragona", 3), ("Amposta",3),("Reus",3),
        ("Lleida",4),("Tremp", 4),("Sort",4);
		

insert into botiga (adreça, cp, id_localitat, id_provincia)
values 	("Entença", "08111", 1,1),
		("Diagonal", "08111", 1,1),
		("March", "08222", 2,1),
		("Prim", "08222", 2,1),
		("Sant Joan", "08333", 3,1),
		("Sant Pere", "08333", 3,1),
		("1 de Maig", "09111", 4,2),
		("Valencia", "09111", 4,2),
        ("Diputació", "09222", 5,2),
		("Aragó", "09222", 5,2),
		("Mallorca", "09333", 6,2),
		("Casanova", "09333", 6,2),
		("Villaroel", "07111", 7,3),
		("Sepulveda", "07111", 7,3),
		("Floridablanca", "07222", 8,3),
		("Aribau", "07222", 8,3),
		("Muntaner", "07333", 9,3),
        ("Balmes", "07333", 9,3),
        ("Villaroel", "06111", 10,4),
        ("Avenir", "06111", 10,4),
        ("Gràcia", "06222", 11,4),
        ("Rosselló", "06222", 11,4),
        ("Paris", "06333", 12,4),
        ("Londres", "06333", 12,4);
		
insert into client (nom, cognom, adreça, cp, telèfon, id_localitat, id_provincia)
values 	("Pere", "Aragones","Pere IV", "08911", "933994567", 1, 1),
		("Peret", "Felop","Ricart", "08922", "933994545", 1, 1),
		("Luis", "Piar","Lluria", "08933", "933923232", 2, 1),
		("Maria", "Juan","Roger", "08944", "933991111", 2, 1),
		("Joan", "Haitd","Ramis", "08955", "933992222", 3, 1),
		("Ramon", "James","Ravella", "08966", "933993333", 3, 1),
		("Julia", "Stuard","Diagonal", "08977", "933994333", 4, 2),
		("Daniel", "Eduard","BArcelona", "08988", "933194333", 4, 2),
		("Pere", "Perez","Valencia", "08999", "933941111", 5, 2),
		("Felix", "Lopez","Girona", "08111", "933999999", 5, 2),
		("Josep", "Agag","Balaguer", "08222", "933991213", 6, 2),
		("Raul", "Aznar","Ciutat", "08222", "933996711", 6, 2),
		("Albert", "Biel","Carders", "08333", "933997474", 7, 3),
		("Jorge", "Bonilla","Bolivia", "08444", "933997843", 7, 3),
		("Jordi", "Torrente","Peru", "08555", "933992212", 8, 3),
		("Rocio", "Dieguez","Melilla", "08666", "933997321", 8, 3),
		("Jose Maria", "Ceuta","Pere IV", "08777", "933991212", 9, 3),
		("Julian", "Aroca","Carolines", "08888", "933994343", 9, 3),
		("Anna", "Aroa","Almirall Cervera", "08999", "933996542", 10, 4),
		("Olga", "Niam","Aragó", "08232", "933992221", 10, 4),
		("Montse", "Estres","La Forja", "08222", "933993312", 11, 4),
		("Mercè", "Montserrat","Aribau", "08333", "933995434", 11, 4),
		("Agata", "Achilipu","Angli", "08444", "933994567", 12, 4),
		("Mia", "Del Rio","Mallorca", "08111", "933994567", 12, 4);
		
insert into empleat (nom, cognom, nif, telèfon, carrec, id_botiga)
values 	("Pere","Feliu","123456781B","931234567","Cuiner",1),
		("Joan","Garci","123456781C","931234567","Repartidor",1),
		("Joan","Feliu","123456781D","931234567","Cuiner",2),
		("Mari","Garci","123456789E","931234567","Repartidor",2),
		("Luis","Ruina","123456789F","931234567","Cuiner",3),
		("Fele","Perez","123456789G","931234567","Repartidor",3),
		("Raul","Gomez","123456789H","931234567","Cuiner",4),
		("Kali","Bueno","123456789J","931234567","Repartidor",4),
		("Coli","Lurba","123456789I","931234567","Cuiner",5),
		("Saul","Carme","123456789K","931234567","Repartidor",5),
		("Wais","Sanch","123456789L","931234567","Cuiner",6),
		("Jaul","Feliu","123456789M","931234567","Repartidor",6),
		("Real","Farci","123456789N","931234567","Cuiner",7),
		("Tere","Garci","123456789O","931234567","Repartidor",7),
		("Toni","Ruina","123456789P","931234567","Cuiner",8),
		("Juli","Perez","123456789Q","931234567","Repartidor",8),
		("Rafa","Gomez","123456789R","931234567","Cuiner",9),
		("Marc","Bueno","123456789T","931234567","Repartidor",9),
		("Alba","Lurba","123456789Y","931234567","Cuiner",10),
		("Sara","Carme","123456789I","931234567","Repartidor",10),
		("Dani","Sanch","123456789O","931234567","Cuiner",11),
		("Luis","Feliu","123456789A","931234567","Repartidor",11),
		("Fele","Feliu","123456789S","931234567","Cuiner",12),
		("Coli","Bueno","123456789D","931234567","Repartidor",12),
		("Wais","Bueno","123456789F","931234567","Cuiner",13),
		("Rafa","Garci","123456789G","931234567","Repartidor",13),
		("Raul","Feliu","123456789H","931234567","Cuiner",14),
		("Joan","Ajure","123456789J","931234567","Repartidor",14),
		("Toni","Ajure","123456789K","931234567","Cuiner",15),
		("Tere","Ajure","123456789L","931234567","Repartidor",15),
		("Juli","Gomez","123456789Z","931234567","Cuiner",16),
		("Real","Gomez","123456789X","931234567","Repartidor",16),
		("Marc","Gomez","123456789V","931234567","Cuiner",17),
		("Alba","Feliu","123456789B","931234567","Repartidor",17),
		("Sara","Feliu","123456789N","931234567","Cuiner",18),
		("Dani","Garci","123456789M","931234567","Repartidor",18),
		("Luis","Juane","123456781A","931234567","Cuiner",19),
		("Joan","Juane","123456781Q","931234567","Repartidor",19),
		("Pere","Lopez","123456781W","931234567","Cuiner",20),
		("Said","Lopez","123456781E","931234567","Repartidor",20),
		("Miki","Ajure","123456781R","931234567","Cuiner",21),
		("Marc","Waist","123456781T","931234567","Repartidor",21),
		("Susi","Raule","123456781Y","931234567","Cuiner",22),
		("Juli","Juane","123456781U","931234567","Repartidor",22),
		("Mimi","Gomez","123456781I","931234567","Cuiner",23),
		("Elia","Sanch","123456781O","931234567","Repartidor",23),
		("Oric","Feliu","123456781P","931234567","Cuiner",24),
		("Xena","Garci","123456781A","931234567","Repartidor",24);
		
insert into categoria_pizza (nom)
values 	("tot l'any"), 
		("dia d'Italia");

insert into producte (nom, descripció, preu, id_categoria_pizza)
values 	("coca-cola","Beguda", 1.90, null),
		("fanta","Beguda", 1.80, null),
		("completa","Hamburguesa", 5.90, null),
		("solo queso","Hamburguesa", 4.50, null),
		("Margarita","Pizza", 20.90, 1), 
		("Barbacoa","Pizza", 23.90,1),
        ("Pepperoni","Pizza", 24.90,2),
		("4 formatges","Pizza", 25.90,2);
		
insert into comanda (data_comanda, tipus_entrega, id_client, id_empleat, hora_entrega)
values 	("2020-12-24","domicili",1,2,"2020-12-24 10:45:12"),
		("2021-12-24","botiga",1,null,"2021-12-24 10:45:12"),
		("2022-12-24","domicili",1,6,"2022-12-24 10:45:12"),
		("2021-12-24","domicili",2,6,"2021-12-24 10:45:12"),
		("2022-12-24","domicili",2,4,"2022-12-24 10:45:12"),
		("2021-12-24","domicili",3,4,"2021-12-24 10:45:12"),
		("2021-12-24","botiga",4,null,"2021-12-24 10:45:12"),
		("2020-12-24","botiga",4,null,"2020-12-24 10:45:12"),
		("2022-12-24","domicili",5,8,"2022-12-24 10:45:12"),
		("2021-12-24","domicili",5,10,"2021-12-24 10:45:12"),
		("2020-12-24","domicili",6,10,"2020-12-24 10:45:12"),
		("2020-12-24","botiga",7,null,"2020-12-24 10:45:12"),
		("2021-12-24","botiga",8,null,"2021-12-24 10:45:12"),
		("2021-12-24","botiga",9,null,"2021-12-24 10:45:12"),
		("2022-12-24","domicili",9,10,"2022-12-24 10:45:12"),
		("2022-12-24","domicili",10,12,"2022-12-24 10:45:12"),
		("2020-12-24","domicili",11,12,"2020-12-24 10:45:12"),
		("2020-12-24","domicili",12,14,"2020-12-24 10:45:12"),
		("2021-12-24","botiga",13,null,"2021-12-24 10:45:12"),
		("2022-12-24","botiga",14,null,"2022-12-24 10:45:12"),
		("2020-12-24","domicili",15,16,"2020-12-24 10:45:12"),
		("2021-12-24","domicili",16,18,"2021-12-24 10:45:12"),
		("2020-12-24","botiga",17,null,"2020-12-24 10:45:12");
		
insert into producte_comanda (id_comanda, cuantitat, id_producte)
values 	(1,2,1),
		(1,1,2),
        (1,3,3),
        
        (2,2,1),
		(2,1,2),
        (2,3,4),
        
        (3,2,1),
		(3,1,2),
        (3,3,5),
        
        (4,2,1),
		(4,1,2),
        (4,3,6),
        
        (5,2,1),
		(5,1,2),
        (5,3,3),
        
        (6,2,1),
		(6,1,2),
        (6,3,4),
        
        (7,2,1),
		(7,1,2),
        (7,3,5),
        
        (8,2,1),
		(8,1,2),
        (8,3,6),
        
        (9,2,1),
		(9,1,2),
        (9,3,3),
        
        (10,2,1),
		(10,1,2),
        (10,3,4),
        
        (11,2,1),
		(11,1,2),
        (11,3,5),
        
        (12,2,1),
		(12,1,2),
        (12,3,6),
        
        (13,2,1),
		(13,1,2),
        (13,3,3),
        
        (14,2,1),
		(14,1,2),
        (14,3,4),
        
        (15,2,1),
		(15,1,2),
        (15,3,5),
        
        (16,2,1),
		(16,1,2),
        (16,3,6),
        
        (17,2,1),
		(17,1,2),
        (17,3,3),
        
        (18,2,1),
		(18,1,2),
        (18,3,4),
        
        (19,2,1),
		(19,1,2),
        (19,3,5),
        
        (20,2,1),
		(20,1,2),
        (20,3,6),
        
        (21,2,1),
		(21,1,2),
        (21,3,3),
        
        (22,2,1),
		(22,1,2),
        (22,3,4),
        
        (23,2,1),
		(23,1,2),
        (23,3,5);