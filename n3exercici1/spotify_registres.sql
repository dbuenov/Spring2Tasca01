use spotify;

insert into paypal (nom_usuari)
values  ("pepe@hotmail.com");

insert into targeta (numero_targeta, mes, any, codi_seguretat)
values  (1234567890123456, "juny", "2023", "521"),
        (6543210987654321, "maig", "2024", "745");

insert into suscripció (data_inici, data_renovació, id_paypal, id_targeta)
values  ("2021-12-04", "2022-12-04", 1, null),
        ("2021-06-07", "2022-06-07", null, 1),
        ("2021-10-09", "2022-10-09", null, 2);

insert into usuari (email, password, nom_usuari, id_suscripció)
values  ("pepe@hotmail.com", "PasswordChulo", "pepeWay", 1),
        ("luis@hotmail.com", "PasswordInfinito", "luisiluisa", 2),
        ("maria@gmail.com", "ElMejorPassword", "maria_1992", 3),
        ("joan@hotmail.com", "NoPongasPassword", "ErJoan", null),
        ("javier@gmail.com", "MiPasswordParaSpotify", "javierte", null);

insert into pagament (data, total, id_suscripció)
values  ("2018-12-08", 9.99, 1),
        ("2019-12-08", 19.99, 1),
        ("2020-12-08", 9.99, 1),
        ("2021-12-08", 9.99, 1),
        ("2021-06-07", 19.99, 2),
        ("2020-10-09", 9.99, 3),
        ("2021-10-09", 19.99, 3);

insert into playlist (titol, data_creació, id_usuari, esborrada, compartida)
values  ("lista para correr", "2021-04-07", 1, false, false),
        ("lista para cocinar", "2021-02-09", 1, false, true),
        ("lista para estudiar", "2021-04-07", 2, false, true),
        ("lista para trabajar", "2020-10-13", 5, true, false);

insert into artista (nom)
values  ("Raphael"),("Lola Flores"),("C Tangana");

insert into album (titol, anyo, id_artista)
values  ("El Madrileño", "2021", 3),
        ("Ídolo", "2017", 3),
        ("Vuelve por Navidad", "2004", 1),
        ("Juerga Flamenca", "1961", 2);

insert into canço (titol, durada, reproduccions, id_album)
values  ("Maria Belen","00:02:31", 1251, 4),
        ("Torcuata","00:03:52", 7215, 4),
        ("No, No, No Y No","00:04:34", 1457, 4),
        ("Noche De Paz, Noche De Fe (Silent Night)","00:01:15", 45489, 3),
        ("Llegó Navidad (Happy Xmas [War Is Over])","00:02:26", 2442, 3),
        ("Blanca Navidad (White Christmas)","00:03:07", 45451, 3),
        ("La Canción Del Tamborilero","00:04:38", 654872, 3),
        ("Tiempo","00:05:19", 456541, 2),
        ("Inditex","00:03:21", 545412, 2),
        ("De pie","00:02:34", 45121, 2),
        ("No te pegas","00:01:35", 878754, 2),
        ("Los Tontos","00:05:27", 1231457, 1),
        ("Nominao","00:02:28", 45541215, 1);

insert into esborrada (data, id_playlist)
values  ("2021-11-04",4);

insert into llista_cançons (id_playlist, id_canço, id_usuari)
values  (1,1,1),
        (1,2,1),
        (1,3,1),
        (1,4,1),
        (2,10,1),
        (2,11,2),
        (2,12,4),
        (2,13,1),
        (3,7,2),
        (3,8,1),
        (3,9,3),
        (3,10,2),
        (4,5,5),
        (4,6,5),
        (4,7,5),
        (4,8,5);
    
insert into agrada_canço (id_usuari, id_canço)
values  (1,6),
        (1,7),
        (1,8),
        (2,10),
        (2,11),
        (2,12),
        (3,1),
        (3,2),
        (3,3),
        (4,8),
        (4,9),
        (4,10),
        (5,1),
        (5,2),
        (5,4);

insert into agrada_album (id_usuari, id_album)
values  (1,1),
        (1,2),
        (2,3),
        (2,4),
        (3,1),
        (3,2),
        (4,3),
        (4,4),
        (5,1),
        (5,2);

insert into segueix (id_usuari, id_artista)
values  (1,1),
        (1,2),
        (2,3),
        (2,1),
        (3,2),
        (3,3),
        (4,1),
        (4,2),
        (5,3),
        (5,1);

insert into relacionat (id_artista, id_artista1)
values  (1,2),
        (1,3),
        (2,1),
        (3,1);

