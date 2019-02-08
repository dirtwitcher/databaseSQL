
use vokzal;





Delimiter $$

CREATE PROCEDURE insMarshruti(a int, b int, c int, d varchar(25))

begin
insert into marshruti (idMarshruta, idOstanovkiNachalo, idOstanovkiKonec, typeOfTrain)

value (a, b, c, d);
end;



Delimiter $$

create procedure dropMarshruti(idMarsh int)
begin

delete from marshruti where marshruti.idMarshruta = idMarsh; 

end;
     





Delimiter $$

CREATE PROCEDURE insMarshrutiOstanovki (a int, b int, c int)
    
begin        
       
insert into marshrutiOstanovki  (idMarshrutiOstanovki, idOstanovki, idMarshruta)
       
value (a, b, c);     
end;



Delimiter $$

create procedure dropMarshrutiOstanovki(idMarshOst int)
	
begin
        
delete from marshrutiOstanovki where marshrutiOstanovki.idMarshrutiOstanovki = idMarshOst; 
	
end;
     
     



Delimiter $$

CREATE PROCEDURE insOstanovki(a int, b varchar(25))
    
begin        
       
insert into ostanovki (idOstanovki, nazvanieOstanovki)
       
value (a, b);     
    
end;
    


Delimiter $$

create procedure dropOstanovki(ost int)
	begin
        
delete from ostanovki where ostanovki.idOstanovki = ost; 
	
end;
     
     

     

Delimiter $$

CREATE PROCEDURE insRaspisanie(a int, b int, c int, d time, e varchar(15))
    
begin        
insert into raspisanie (idRaspisaniya, idMarshruta, idOstanovki, vremya, den)
       
value (a, b, c, d, e);     
    
end;



Delimiter $$

create procedure dropRaspisanie(idRasp int)
	
begin
        
delete from raspisanie where raspisanie.idRaspisaniya = idRasp; 
	
end;
 
    



Delimiter $$

CREATE PROCEDURE insRastoyanie(a int, b int, c int, d int, e int)
    
begin        
       
insert into rastoyanie (idRastoyaniya, idOstanovkiNachalo, idOstanovkiKonec, rastoyanie, idMarshruta)
       
value (a, b, c, d, e);     
    
end;



Delimiter $$

create procedure dropRastoyanie(idRast int)
	
begin
        
delete from rastoyanie where rastoyanie.idRastoyaniya = idRast; 
	
end;
