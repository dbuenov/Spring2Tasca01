use youtube;
insert into usuari (nom_usuari, email, password)
values  ("Lagartija","lagartija@gmail.com","MiPasswordYoutube"),
        ("Rinoceronte","rinoceronte@gmail.com","ElMejorPassword"),
        ("Avestruz","avestruz@gmail.com","EntraEnYoutube"),
        ("Calamar","calamar@gmail.com","PasswordDefinitivo");

insert into video (titol,grandaria,nom_arxiu,durada,reproduccions,estat,data_publicacio,id_usuari)
values  ("Como cazan las lagartijas",607.23,"cazalagartija","00:15:31",1045,"public","2020-08-07",1),
        ("Como comen las lagartijas",321.65,"comelagartija","00:10:21",98,"privat","2021-07-15",1),
        ("Como cazan los rinocerontes",607.23,"cazalagartija","00:15:31",2,"public","2022-05-04",2),
        ("Como comen los rinocerontes",321.65,"comelagartija","00:10:21",977,"ocult","2021-12-04",2),
        ("Como cazan las avestruces",607.23,"cazaavestruz","00:15:31",54,"ocult","2021-06-09",3),
        ("Como comen las avestruces",321.65,"comeavestruz","00:10:21",24504501,"privat","2021-12-04",3),
        ("Como cazan los calamares",607.23,"cazacalamar","00:15:31",7845,"public","2022-12-03",4),
        ("Como comen los calamares",321.65,"comecalamar","00:10:21",6421,"privat","2020-11-04",4);

insert into etiqueta (nom)
values  ("Natura"),("Mon Animal"),("Sang i fetge"),("Explicit"),("Imatges ofensives"),("Educatiu");

insert into comentari (text,data,id_usuari,id_video)
values  ("M'ha agradat molt la visió realista","2020-09-08 12:45:07",2,1),
        ("Repugnant","2020-10-18 10:23:01",3,1),
        ("Pole","2020-08-07 1:12:08",4,1),
        ("No m'ho havia imaginat mai aixó","2022-09-08 12:45:07",1,7),
        ("Aixó es una copia del meu canal, et denunciaré!!!","2022-09-08 12:45:07",4,4);

insert into canal (nom,data_creació, id_usuari)
values  ("Vida de lagartijas", "2020-05-07",1),
        ("Accesorios para lagartijas", "2021-07-02",1),
        ("La vida secreta de los calamares", "2019-04-01",4);

insert into playlist (nom, id_usuari, data_creacio, estat)
values  ("animales del mundo", 2, "2021-09-30", "publica"),
        ("como comen los animales", 2, "2021-10-07", "privada"),
        ("animales", 4, "2020-05-21", "publica");

insert into etiqueta_video (id_video, id_etiqueta)
values  (1,1),
        (1,2),
        (2,3),
        (2,4),
        (2,5),
        (2,6),
        (5,4),
        (7,2),
        (7,3);

insert into video_playlist (id_playlist,id_video)
values  (1,1),
        (1,2),
        (1,5),
        (2,2),
        (2,4),
        (2,6),
        (3,1),   
        (3,2),
        (3,3),
        (3,4),
        (3,5),
        (3,6);

insert into suscripcio (id_canal, id_usuari)
values  (1,2),
        (1,3),
        (1,4),
        (3,1),
        (3,3);

insert into like_video (id_usuari,id_video,tipus,data)
values  (1,3,"like","2022-05-21 10:45:08"),
        (1,5,"like","2021-03-12 9:48:07"),
        (1,4,"dislike","2020-04-03 10:15:11"),
        (2,1,"dislike","2021-05-24 12:25:22"),
        (2,8,"dislike","2022-06-15 13:35:33"),
        (3,1,"like","2020-07-06 14:45:46"),
        (4,5,"like","2021-08-27 15:55:57"),
        (4,3,"like","2022-09-18 16:05:08");

insert into like_comentari (id_usuari,id_comentari,tipus,data)
values  (1,1,"like","2022-05-21 10:45:08"),
        (1,2,"dislike","2021-03-12 9:48:07"),
        (1,3,"like","2020-04-03 10:15:11"),
        (2,4,"like","2021-05-24 12:25:22"),
        (2,5,"dislike","2022-06-15 13:35:33"),
        (3,1,"dislike","2020-07-06 14:45:46"),
        (4,2,"like","2021-08-27 15:55:57"),
        (4,3,"dislike","2022-09-18 16:05:08");
