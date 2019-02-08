
select
concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki) as nazvanieMarshruta, 
T3.nazvanieOstanovki,
 raspisanie.vremya as vremyaOtbitiya
from
ostanovki as T1 
inner join 
ostanovki as T2 
inner join
ostanovki as T3
inner join 
marshruti
 inner join 
 raspisanie 
 on (T1.idOstanovki = marshruti.idOstanovkiNachalo) and 
	(T2.idOstanovki = marshruti.idOstanovkiKonec)  and
     (raspisanie.idOstanovki = T3.idOstanovki) and
     (raspisanie.idMarshruta = marshruti.idMarshruta)

where T3.idOstanovki between T1.idOstanovki and T2.idOstanovki  -- and T3.nazvanieOstanovki Like 'Мин%'
    
UNION

select
concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki) as nazvanieMarshruta, 
T3.nazvanieOstanovki,
 raspisanie.vremya as vremyaOtbitiya
from
ostanovki as T1 
inner join 
ostanovki as T2 
inner join
ostanovki as T3
inner join 
marshruti
 inner join 
 raspisanie 
 on (T1.idOstanovki = marshruti.idOstanovkiNachalo) and 
	(T2.idOstanovki = marshruti.idOstanovkiKonec) and
	 (raspisanie.idOstanovki = T3.idOstanovki) and
     (raspisanie.idMarshruta = marshruti.idMarshruta)
    
where T3.idOstanovki <= T1.idOstanovki and T3.idOstanovki >= T2.idOstanovki  -- and T3.nazvanieOstanovki Like 'Мин%'

order by nazvanieOstanovki, vremyaOtbitiya;




/*
select 

concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki) as nazvanieMarshruta, 
T1.nazvanieOstanovki as nachaloMarshruta,
raspisanie.vremya as vremyaOtbitiya,
T2.nazvanieOstanovki as konecMarshruta,
raspisanie.den as den,
marshruti.typeOfTrain as typeOfTrain

from
ostanovki as T1 
inner join 
ostanovki as T2 
inner join 
marshruti 
inner join 
raspisanie  

 on (T1.idOstanovki = marshruti.idOstanovkiNachalo) and 
	(T2.idOstanovki = marshruti.idOstanovkiKonec) and 
	(raspisanie.idOstanovki = marshruti.idOstanovkiNachalo) 
      
order by marshruti.idMarshruta, raspisanie.vremya;
*/




/*
select
concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki) as nazvanieMarshruta, 
T3.nazvanieOstanovki,
 raspisanie.vremya as vremyaOtbitiya,
T3.idOstanovki,
marshruti.idOstanovkiNachalo,
marshruti.idOstanovkiKonec
from
ostanovki as T1 
inner join 
ostanovki as T2 
inner join
ostanovki as T3
inner join 
marshruti
 inner join 
 raspisanie 
 on (T1.idOstanovki = marshruti.idOstanovkiNachalo) and 
	(T2.idOstanovki = marshruti.idOstanovkiKonec)  and
     (raspisanie.idOstanovki = T3.idOstanovki) and
     (raspisanie.idMarshruta = marshruti.idMarshruta)

     -- надо еще в расписании ИДмаршрута связать с чем-нибудь чтоб время не повторялось

where T3.idOstanovki between T1.idOstanovki and T2.idOstanovki
-- group by raspisanie.idMarshruta -- and T3.nazvanieOstanovki Like 'Мин%'
    
UNION

select
concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki) as nazvanieMarshruta, 
T3.nazvanieOstanovki,
 raspisanie.vremya as vremyaOtbitiya,
T3.idOstanovki,
marshruti.idOstanovkiNachalo,
marshruti.idOstanovkiKonec
from
ostanovki as T1 
inner join 
ostanovki as T2 
inner join
ostanovki as T3
inner join 
marshruti
 inner join 
 raspisanie 
 on (T1.idOstanovki = marshruti.idOstanovkiNachalo) and 
	(T2.idOstanovki = marshruti.idOstanovkiKonec) and
	 (raspisanie.idOstanovki = T3.idOstanovki) and
     (raspisanie.idMarshruta = marshruti.idMarshruta)
     
     -- надо еще в расписании ИДмаршрута связать с чем-нибудь чтоб время не повторялось
    
where T3.idOstanovki <= T1.idOstanovki and T3.idOstanovki >= T2.idOstanovki

order by nazvanieMarshruta,vremyaOtbitiya;
 -- and T3.nazvanieOstanovki Like 'Мин%';
*/

/*
create procedure show_tab(a varchar(50))
begin

end;
*/


/*
select 

concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki) as nazvanieMarshruta, 
T1.nazvanieOstanovki as nachaloMarshruta,
raspisanie.vremya as vremyaOtbitiya,
T2.nazvanieOstanovki as konecMarshruta,
raspisanie.den as den,
marshruti.typeOfTrain as typeOfTrain

from
ostanovki as T1 
inner join 
ostanovki as T2 
inner join 
marshruti 
inner join 
raspisanie  

 on (T1.idOstanovki = marshruti.idOstanovkiNachalo) and 
	(T2.idOstanovki = marshruti.idOstanovkiKonec) and 
	(raspisanie.idOstanovki = marshruti.idOstanovkiNachalo) 
      
order by marshruti.idMarshruta, raspisanie.vremya;


-- название маршрута, аремя отбытия с первой остановки, полное расстояние, время прибытия на конечную остановку, виды поездов на этом маршруте
-- группировка и по маршруту и по времени

*/



