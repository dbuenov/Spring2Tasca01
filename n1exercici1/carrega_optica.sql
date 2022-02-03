use optica;
insert into adreça (Carrer, nº, pis, porta, ciutat, cp, pais)
values 
("c/ Montserrat", "54", "7", "3", "Badalona", "08916", "Spain"),
("c/ Alella", "34", "2", "3", "Badalona", "08080", "Spain"),
("c/ Sevilla", "22", "1", "5", "Badalona", "08450", "Spain"),
("c/ Viladomat", "454", "1", "4", "Barcelona", "08934", "Spain"),
("c/ Dos de Maig", "4", "2", "3", "Barcelona", "08342", "Spain"),
("c/ Baluart", "5", "1", "2", "Barcelona", "08242", "Spain"),
("c/ Bonavista", "534", "9", "1", "Mataró", "08673", "Spain"),
("c/ Hospital", "767", "7", "3", "Mataró", "08944", "Spain"),
("c/ Eduard Toda", "43", "3", "7", "Mataró", "08563", "Spain"),
("c/ Entença", "123", "7", "5", "Blanes", "08351", "Spain"),
("c/ Estació", "84", "1", "4", "Blanes", "08546", "Spain"),
("c/ Encarnació", "3", "1", "3", "Blanes", "08954", "Spain"),
("c/ Pacífic", "43", "5", "2", "Tarragona", "08456", "Spain"),
("c/ Palomar", "76", "6", "3", "Tarragona", "08873", "Spain");


insert into proveidor (nom, teléfon, fax, nif, idAdreça)
values

("Rompetechos SL", "934094656", "934242435", "45136918Y", 1),
("Veoveo SA", "934554545", "975489615", "98545697T", 3),
("No me Mires SL", "933461234", "934513397", "98789718T", 5),
("Gafas y Gafas", "935561234", "934895642", "45996538A", 7);

insert into client (nom, cognom, idAdreça, Teléfon, email, dataregistre, recomanatper)
values
("Joan", "Perez", 2, "932587944", "joan.perez@hotmail.com", "2020-05-13", null),
("Pere", "Orozco", 4, "937845694", "pereorozco@gmail.com", "2021-04-12", 1),
("Dani", "Oltra", 6, "932456789", "oltradani@gmail.com", "2022-07-06", 1),
("Carme", "Fel", 8, "934513238", "carme.fel@gmail.com", "2021-09-30", null),
("Maria", "Salomon", 9, "932455122", "mariasalo@hotmail.com", "2020-11-26", 4),
("Luis", "Escriva", 10, "932457894", "escriva.luis@hotmail.com", "2020-07-19", 3),
("Sofia", "Jimenez", 11, "934541212", "sofia.jimenez@gmail.com", "2021-12-27", null),
("Anna", "Gonzalez", 12, "937879854", "anna.gonzalez@gmail.com", "2021-08-06", null),
("Miquel", "Ramon", 13, "934545498", "miguel.rar@hotmail.com", "2022-06-30", 4),
("Margarita", "Gonzalez", 14, "935445786", "marga.gon@gmail.com", "2022-05-24", 8);

insert into marca (nom, idproveidor)
values
("Oakley", 1),
("Ray-Ban", 2),
("Police", 3),
("Oakley", 2),
("Arnette", 4),
("Carrera", 3);

insert into venedor (nom)
values
("Ramon"),("Daniel"),("Carolina"),("Josep");

insert into ulleres (Montura, ColorMontura, GraduacióD, GraduacióE, ColorVidreD, ColorVidreE, Preu, DataVenta, idClient, idMarca, idVenedor)
values
("Flotant","Verd",2.3,2.2,"Blanc","Blanc",120.99,"2021-12-23",1,1,1),
("Pasta","Verd",2.5,2.4,"Blanc","Blanc",100.76,"2021-05-21",1,2,1),
("Metalica","Marró",2.1,2.4,"Blanc","Blanc",125.50,"2022-09-12",2,3,1),
("Flotant","Blau",1.3,1.2,"Fosc", "Fosc",145.60,"2021-01-16",2,4,2),
("Pasta","Vermell",1.1,1.1,"Fosc", "Fosc",147.58,"2020-10-19",3,5,2),
("Metalica","Negre",3.2,3.4,"Blanc","Blanc",99.56,"2020-10-17",4,6,2),
("Pasta","Blau",4.5,5.4,"Fosc", "Fosc",124.54,"2021-11-29",5,2,3),
("Pasta","Vermell",3.2,3.2,"Blanc","Blanc",123.37,"2021-09-28",6,3,3),
("Metalica","Blau",2.3,2.1,"Fosc", "Fosc",254.78,"2022-04-22",7,4,4),
("Flotant","Negre",3.2,3.2,"Blanc","Blanc",214.45,"2022-02-17",8,5,4),
("Pasta","Vermell",1.3,1.2,"Blanc","Blanc",126.12,"2022-07-30",9,6,3),
("Pasta","Vermell",1.3,1.3,"Fosc", "Fosc",189.01,"2020-09-07",10,2,3),
("Flotant","Vermell",4.4,4.5,"Blanc","Blanc",169.45,"2021-08-09",7,3,2),
("Pasta","Negre",8.8,8.9,"Blanc","Blanc",200.45,"2020-06-09",6,4,2),
("Metalica","Marró",3.2,3.4,"Blanc","Blanc",85.60,"2021-02-03",5,5,1),
("Metalica","Verd",4.5,4.5,"Fosc", "Fosc",97.45,"2020-11-07",4,1,2),
("Pasta","Vermell",1.3,1.3,"Fosc", "Fosc",189.01,null,3,2,null),
("Flotant","Vermell",4.4,4.5,"Blanc","Blanc",169.45,null,4,6, null),
("Pasta","Negre",8.8,8.9,"Blanc","Blanc",200.45,null,3,6,null),
("Metalica","Marró",3.2,3.4,"Blanc","Blanc",85.60,null,10,5,null),
("Metalica","Verd",4.5,4.5,"Fosc", "Fosc",97.45,null,9,4,null);