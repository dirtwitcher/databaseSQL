create database if not exists vokzal;


use vokzal;



create table if not exists ostanovki
(
idOstanovki int primary key,

nazvanieOstanovki varchar(25) not null);



create table if not exists marshruti
(
idMarshruta int primary key,

idOstanovkiNachalo int not null,

idOstanovkiKonec int not null,

typeOfTrain varchar(25) not null);



create table if not exists marshrutiOstanovki(
idMarshrutiOstanovki int primary key,

idOstanovki int not null,

idMarshruta int not null,

foreign key key1 (idOstanovki) references ostanovki(idOstanovki) on delete cascade on update cascade,

foreign key key2 (idMarshruta) references marshruti(idMarshruta) on delete cascade 
on update cascade);
 


create table if not exists rastoyanie
(
idRastoyaniya int primary key,

idOstanovkiNachalo int not null,

idOstanovkiKonec int not null,

rastoyanie int not null,

idMarshruta int not null,

foreign key key3 (idMarshruta) references marshruti(idMarshruta) on delete cascade on update cascade);



create table if not exists raspisanie
(
idRaspisaniya int primary key,

idMarshruta int not null,

idOstanovki int not null,

dataVremya datetime not null,

den varchar(15) check('Будний' or 'Выходной'),

foreign key key4 (idOstanovki) references ostanovki(idOstanovki) on delete cascade on update cascade);

