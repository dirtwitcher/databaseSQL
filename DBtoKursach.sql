-- drop database tamojnyaBD;

create database if not exists tamojnyaBD;

use tamojnyaBD;

create table if not exists nachalstvo
(
idNachalstva int primary key auto_increment,
fioNachalstva varchar(50) not null,
polNachalstva varchar(50) not null,
vozrastNachalstva varchar(50) not null);

create table if not exists post
(
idPosta int primary key auto_increment,
idNachalstva int not null,
gorod varchar(50) not null,
typeOfPost varchar(50) not null,
foreign key key1 (idNachalstva) references nachalstvo(idNachalstva) on delete cascade on update cascade);

create table if not exists zvaniya
(
idZvaniya int primary key auto_increment,
zvanie int not null,
staj varchar(50) not null,
doljnost varchar(50) not null);

create table if not exists inspector
(
idInspector int primary key auto_increment,
idPosta int not null,
idZvaniya int not null,
fioInsp varchar(50) not null,
pol varchar(50) not null,
vozrast varchar(50) not null,
foreign key key2 (idZvaniya) references zvaniya(idZvaniya) on delete cascade on update cascade);

create table if not exists raionAdministr
(
idRaionAdministr int primary key auto_increment,
nazvRaionAdministr varchar(50) not null,
mestopoloj varchar(50) not null);

create table if not exists grajdanski
(
idGrajdanski int primary key auto_increment,
idInspector int not null,
fioGrajd varchar(50) not null,
polGrajd varchar(50) not null,
vozrastGrajd varchar(50) not null,
foreign key key3 (idInspector) references inspector(idInspector) on delete cascade on update cascade);

create table if not exists tovar
(
idTovar int primary key auto_increment,
idGrajdanski int not null,
nazvTovara varchar(50) not null,
dopInfo varchar(50) not null,
foreign key key4 (idGrajdanski) references grajdanski(idGrajdanski) on delete cascade on update cascade);
 
create table if not exists auto
(
idAuto int primary key auto_increment,
idGrajdanski int not null,
marka varchar(50) not null,
vin varchar(50) not null,
cvet varchar(50) not null,
kuzov varchar(50) not null,
foreign key key5 (idGrajdanski) references grajdanski(idGrajdanski) on delete cascade on update cascade);

create table if not exists valuta
(
idValuta int primary key auto_increment,
idGrajdanski int not null,
ediniciValuti varchar(50) not null,
kolKupur varchar(50) not null,
foreign key key6 (idGrajdanski) references grajdanski(idGrajdanski) on delete cascade on update cascade);

create table if not exists passport
(
idPassport int primary key auto_increment,
idGrajdanski int not null,
idRaionAdministr int not null,
nomer varchar(50) not null,
seriya varchar(50) not null,
propiska varchar(50) not null,
foreign key key7 (idGrajdanski) references grajdanski(idGrajdanski) on delete cascade on update cascade,
foreign key key8 (idRaionAdministr) references raionAdministr(idRaionAdministr) on delete cascade on update cascade);

create table if not exists urLico
(
idUrLico int primary key auto_increment,
idInspector int not null,
nazvUrLico varchar(50) not null,
fioOsnovatelya varchar(50) not null,
foreign key key9 (idInspector) references inspector(idInspector) on delete cascade on update cascade);

create table if not exists tovarUrLico
(
idTovarUrLico int primary key auto_increment,
idUrLico int not null,
nazvTovara varchar(50) not null,
dopInfo varchar(50) not null,
foreign key key10 (idUrLico) references urLico(idUrLico) on delete cascade on update cascade);
 
create table if not exists autoUrLico
(
idAutoUrLico int primary key auto_increment,
idUrLico int not null,
marka varchar(50) not null,
vin varchar(50) not null,
cvet varchar(50) not null,
kuzov varchar(50) not null,
foreign key key11 (idUrLico) references urLico(idUrLico) on delete cascade on update cascade);

create table if not exists valutaUrLico
(
idValutaUrLico int primary key auto_increment,
idUrLico int not null,
ediniciValuti varchar(50) not null,
kolKupur varchar(50) not null,
foreign key key12 (idUrLico) references urLico(idUrLico) on delete cascade on update cascade);

create table if not exists dannieOrg
(
idDannieOrg int primary key auto_increment,
idUrLico int not null,
idRaionAdministr int not null,
nomer varchar(50) not null,
adress varchar(50) not null,
foreign key key13 (idRaionAdministr) references raionAdministr(idRaionAdministr) on delete cascade on update cascade);




-- -----------     

Delimiter $$
CREATE PROCEDURE insNachalstvo(b varchar(50), c varchar(50), d varchar(50))
begin
insert into nachalstvo (fioNachalstva, polNachalstva, vozrastNachalstva)
value (b, c, d);
end;

Delimiter $$
create procedure dropNachalstvo(idNach int)
begin
delete from nachalstvo where nachalstvo.idNachalstva = idNach; 
end;     

-- -----------     

Delimiter $$
CREATE PROCEDURE insPost(b int, c varchar(50), d varchar(50))
begin
insert into post (idNachalstva, gorod, typeOfPost)
value (b, c, d);
end;

Delimiter $$
create procedure dropPost(idPst int)
begin
delete from post where post.idPosta = idPst; 
end;     

-- -----------

Delimiter $$
CREATE PROCEDURE insZvaniya(b int, c varchar(50), d varchar(50))
begin
insert into zvaniya (zvanie, staj, doljnost)
value (b, c, d);
end;

use tamojnyabd;
drop procedure insZvaniya;

Delimiter $$
create procedure dropZvaniya(idZvan int)
begin
delete from zvaniya where zvaniya.idZvaniya = idZvan; 
end;     

-- -----------

Delimiter $$
CREATE PROCEDURE insInspector(b int, c int, d varchar(50),  e varchar(50), f varchar(50))
begin
insert into inspector (idInspector, idPosta, idZvaniya, fioInsp, pol, vozrast)
value (b, c, d, e, f);
end;

Delimiter $$
create procedure dropInspector(idInsp int)
begin
delete from inspector where marshruti.idInspector = idInsp; 
end;
     
-- -----------     

Delimiter $$
CREATE PROCEDURE insRaionAdministr(b int, c varchar(50))
begin
insert into raionAdministr (nazvRaionAdministr, mestopoloj)
value (b, c);
end;

Delimiter $$
create procedure dropRaionAdministr(idRaionAdministr int)
begin
delete from raionAdministr where raionAdministr.idRaionAdministr = idRaionAdm; 
end;

-- -----------     
     
Delimiter $$
CREATE PROCEDURE insGrajdanski(b int, c varchar(50),  d varchar(50), e varchar(50))
begin
insert into grajdanski (idInspector, fioGrajd, polGrajd, vozrastGrajd)
value (b, c, d, e);
end;

Delimiter $$
create procedure dropGrajdanski(idGrajd int)
begin
delete from grajdanski where grajdanski.idGrajdanski = idGrajd; 
end;     

-- -----------

Delimiter $$
CREATE PROCEDURE insTovar(b int, c varchar(50),  d varchar(50))
begin
insert into tovar (idGrajdanski, nazvTovara, dopInfo)
value (b, c, d);
end;

Delimiter $$
create procedure dropTovar(idTov int)
begin
delete from tovar where tovar.idTovar = idTov; 
end;

-- -----------

Delimiter $$
CREATE PROCEDURE insAuto(b int, c varchar(50),  d varchar(50), e varchar(50), f varchar(50))
begin
insert into auto (idGrajdanski, marka, vin, cvet, kuzov)
value (b, c, d, e, f);
end;

Delimiter $$
create procedure dropAuto(idAut int)
begin
delete from auto where auto.idAuto = idAut; 
end;

-- -----------

Delimiter $$
CREATE PROCEDURE insValuta(b int, c varchar(50),  d varchar(50))
begin
insert into valuta (idGrajdanski, ediniciValuti, kolKupur)
value (b, c, d);
end;

Delimiter $$
create procedure dropValuta(idIVal int)
begin
delete from valuta where valuta.idValuta = idVal; 
end;

-- ----------------

Delimiter $$
CREATE PROCEDURE insPassport(b int, c int,  d varchar(50), e varchar(50), f varchar(50))
begin
insert into passport (idGrajdanski, idRaionAdministr, nomer, seriya, propiska)
value (b, c, d, e, f);
end;

Delimiter $$
create procedure dropPassport(idPass int)
begin
delete from passport where passport.idPassport = idPass; 
end;

-- -----------

Delimiter $$
CREATE PROCEDURE insUrLico(b int,  c varchar(50), d varchar(50))
begin
insert into urLico (idInspector, nazvUrLico, fioOsnovatelya)
value (b, c, d);
end;

Delimiter $$
create procedure dropUrLico(idUrL int)
begin
delete from urLico where urLico.idUrLico = idUrL; 
end;

-- -----------

Delimiter $$
CREATE PROCEDURE insTovarUrLico(b int,  c varchar(50), d varchar(50))
begin
insert into tovarUrLico (idUrLico, nazvTovara, dopInfo)
value (b, c, d);
end;

Delimiter $$
create procedure dropTovarUrLico(idTovUrL int)
begin
delete from tovarUrLico where tovarUrLico.idTovarUrLico = idTovUrL; 
end;

-- -----------

Delimiter $$
CREATE PROCEDURE insAutoUrLico(b int,  c varchar(50), d varchar(50),e varchar(50),f varchar(50))
begin
insert into autoUrLico (idUrLico, marka, vin,cvet,kuzov)
value (b, c, d, e, f);
end;

Delimiter $$
create procedure dropAutoUrLico(idAutoUrL int)
begin
delete from autoUrLico where autoUrLico.idAutoUrLico = idAutoUrL; 
end;

-- -----------

Delimiter $$
CREATE PROCEDURE insValutaUrLico(b int,  c varchar(50), d varchar(50))
begin
insert into valutaUrLico (idUrLico, ediniciValuti, kolKupur)
value (b, c, d);
end;

Delimiter $$
create procedure dropValutaUrLico(idValUrL int)
begin
delete from valutaUrLico where valutaUrLico.idValutaUrLico = idValUrL; 
end;

-- -----------

Delimiter $$
CREATE PROCEDURE insDannieOrg(b int,  c int, d varchar(50), e varchar(50))
begin
insert into dannieOrg (idUrLico, idRaionAdministr, nomer, adress)
value (b, c, d, e);
end;

Delimiter $$
create procedure dropDannieOrg(idDanOrg int)
begin
delete from dannieOrg where dannieOrg.idDannieOrg = idDanOrg; 
end;



-- -----------



create table if not exists journal(
    tableName CHAR(50) NULL,
    Date DATETIME NULL,
    DELETED_ZNACH CHAR(50) NULL,
    INSERTED_ZNACH CHAR(50) NULL
);



-- -----------



Delimiter //
CREATE TRIGGER trigger_InsFioNachalstva
     AFTER INSERT ON nachalstvo
	 FOR EACH ROW
 BEGIN
   declare newPole CHAR(50);
   declare tmp int;
   
   set tmp = (select max(idNachalstva) from nachalstvo);
   SET newPole = (SELECT fioNachalstva FROM nachalstvo where idNachalstva = tmp);

    INSERT INTO journal VALUES
        ('Nachalstvo', now(), '', newPole);
END //

Delimiter //
CREATE TRIGGER trigger_DelFioNachalstva
     before DELETE ON nachalstvo
	 FOR EACH ROW
 BEGIN
    INSERT INTO journal VALUES
        ('Nachalstvo', now(), OLD.fioNachalstva, '');
END //

-- -----------

Delimiter //
CREATE TRIGGER trigger_InsZvaniya
	AFTER INSERT ON zvaniya
    FOR EACH ROW
 BEGIN
   declare newPole CHAR(50);
   declare tmp int;
   
   set tmp = (select max(idZvaniya) from zvaniya);
   SET newPole = (SELECT zvanie FROM zvaniya where idZvaniya = tmp);

    INSERT INTO journal VALUES
        ('Zvaniya', now(), '', newPole);
END //

Delimiter //
CREATE TRIGGER trigger_DelZvaniya
     before DELETE ON zvaniya
	 FOR EACH ROW
 BEGIN
    INSERT INTO journal VALUES
        ('Zvaniya', now(), OLD.zvanie, '');
END //

-- -----------

Delimiter //
CREATE TRIGGER trigger_InsInspector
  AFTER INSERT ON inspector 
  FOR EACH ROW
 BEGIN
   declare newPole CHAR(50);
   declare tmp int;
   
   set tmp = (select max(idInspector) from inspector);
   SET newPole = (SELECT fioInsp FROM inspector where idInspector = tmp);

    INSERT INTO journal VALUES
        ('Inspector', now(), '', newPole);
END //

Delimiter //
CREATE TRIGGER trigger_DelInspector
     before DELETE ON inspector
	 FOR EACH ROW
 BEGIN
    INSERT INTO journal VALUES
        ('Inspector', now(), OLD.fioInsp, '');
END //

-- -----------

Delimiter //
CREATE TRIGGER trigger_InsTovar
   AFTER INSERT ON tovar 
   FOR EACH ROW
 BEGIN
   declare newPole CHAR(50);
   declare tmp int;
   
   set tmp = (select max(idTovar) from tovar);
   SET newPole = (SELECT nazvTovara FROM tovar where idTovar = tmp);

    INSERT INTO journal VALUES
        ('Tovar', now(), '', newPole);
END //

Delimiter //
CREATE TRIGGER trigger_DelTovar
     before DELETE ON tovar
	 FOR EACH ROW
 BEGIN
    INSERT INTO journal VALUES
        ('Tovar', now(), OLD.nazvTovara, '');
END //

-- -----------

Delimiter //
CREATE TRIGGER trigger_InsAuto
	AFTER INSERT ON auto
	FOR EACH ROW
 BEGIN
   declare newPole CHAR(50);
   declare tmp int;
   
   set tmp = (select max(idAuto) from auto);
   SET newPole = (SELECT vin FROM auto where idAuto = tmp);

    INSERT INTO journal VALUES
        ('Auto', now(), '', newPole);
END //

Delimiter //													
CREATE TRIGGER trigger_DelAuto
     before DELETE ON auto
	 FOR EACH ROW
 BEGIN
    INSERT INTO journal VALUES
        ('Auto', now(), OLD.vin, '');
END //

-- -----------

Delimiter //
CREATE TRIGGER trigger_InsUrLico
    AFTER INSERT ON urLico 
   	FOR EACH ROW
 BEGIN
   declare newPole CHAR(50);
   declare tmp int;
   
   set tmp = (select max(idUrLico) from urLico);
   SET newPole = (SELECT nazvUrLico FROM urLico where idUrLico = tmp);

    INSERT INTO journal VALUES
        ('UrLico', now(), '', newPole);
END //

Delimiter //
CREATE TRIGGER trigger_DelUrLico
     before DELETE ON urLico
	 FOR EACH ROW
 BEGIN
    INSERT INTO journal VALUES
        ('UrLico', now(), OLD.nazvUrLico, '');
END //

-- -----------

Delimiter //
CREATE TRIGGER trigger_InsAutoUrLico
    AFTER INSERT ON autoUrLico 
	FOR EACH ROW
 BEGIN
   declare newPole CHAR(50);
   declare tmp int;
   
   set tmp = (select max(idAutoUrLico) from autoUrLico);
   SET newPole = (SELECT vin FROM autoUrLico where idAutoUrLico = tmp);

    INSERT INTO journal VALUES
        ('AutoUrLico', now(), '', newPole);
END //

Delimiter //
CREATE TRIGGER trigger_DelAutoUrLico
     before DELETE ON autoUrLico
	 FOR EACH ROW
 BEGIN
    INSERT INTO journal VALUES
        ('AutoUrLico', now(), OLD.vin, '');
END //



-- ----------


DELIMITER //
CREATE FUNCTION funcPlanCar(pid INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE ppid INT DEFAULT 500;
    if(pid > ppid) THEN
        RETURN 'Plan OK';
    else
        RETURN 'Bad plan';
    END IF;
END//

DELIMITER //
CREATE FUNCTION funcPlanTovar(pid INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE ppid INT DEFAULT 1200;
    if(pid > ppid) THEN
        RETURN 'Plan OK';
    else
        RETURN 'Bad plan';
    END IF;
END//

DELIMITER //
CREATE FUNCTION funcPlanValuta(pid INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE ppid INT DEFAULT 2400;
    if(pid > ppid) THEN
        RETURN 'Plan OK';
    else
        RETURN 'Bad plan';
    END IF;
END//

DELIMITER //
CREATE FUNCTION funcPlanCarUrLico(pid INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE ppid INT DEFAULT 350;
    if(pid > ppid) THEN
        RETURN 'Plan OK';
    else
        RETURN 'Bad plan';
    END IF;
END//

DELIMITER //
CREATE FUNCTION funcPlanTovarUrLico(pid INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE ppid INT DEFAULT 5700;
    if(pid > ppid) THEN
        RETURN 'Plan OK';
    else
        RETURN 'Bad plan';
    END IF;
END//

DELIMITER //
CREATE FUNCTION funcPlanValutaUrLico(pid INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE ppid INT DEFAULT 9800;
    if(pid > ppid) THEN
        RETURN 'Plan OK';
    else
        RETURN 'Bad plan';
    END IF;
END//

DELIMITER //
CREATE FUNCTION funcPlanGrajd(pid INT) RETURNS VARCHAR(20)
BEGIN
    DECLARE ppid INT DEFAULT 4400;
    if(pid > ppid) THEN
        RETURN 'Plan OK';
    else
        RETURN 'Bad plan';
    END IF;
END//






