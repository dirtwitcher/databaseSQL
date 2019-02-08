use vokzal;

/*
select concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki), T1.nazvanieOstanovki as nach, T1.idMarshruta,
T2.nazvanieOstanovki as kon, T2.idMarshruta
from
(select ostanovki.nazvanieOstanovki, idMarshruta from ostanovki inner join  marshruti on marshruti.idOstanovkiNachalo=ostanovki.idOstanovki) T1,
(select ostanovki.nazvanieOstanovki, idMarshruta from ostanovki inner join  marshruti on marshruti.idOstanovkiKonec=ostanovki.idOstanovki) T2;
having  T1.idMarshruta=T2.idMarshruta;
*/

/*
select concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki), T1.nazvanieOstanovki as nach,
T2.nazvanieOstanovki as kon, marshruti.idMarshruta
from
ostanovki as T1 inner join ostanovki as T2 inner join marshruti on (T1.idOstanovki = marshruti.idOstanovkiNachalo)
and
(T2.idOstanovki = marshruti.idOstanovkiKonec);
*/

/*
select 
concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki), T1.nazvanieOstanovki as nach, T1.idMarshruta, T1.idOstanovkiNachalo,
T3.vremya as DVotb, T3.idOstanovki, 
T2.nazvanieOstanovki as kon, T2.idMarshruta
from
(select ostanovki.nazvanieOstanovki, idMarshruta, idOstanovkiNachalo, idOstanovkiKonec from ostanovki inner join  marshruti on marshruti.idOstanovkiNachalo=ostanovki.idOstanovki) T1,
(select ostanovki.nazvanieOstanovki, idMarshruta from ostanovki inner join  marshruti on marshruti.idOstanovkiKonec=ostanovki.idOstanovki) T2,
(select raspisanie.vremya,idOstanovki from raspisanie inner join marshruti on raspisanie.idOstanovki=marshruti.idOstanovkiNachalo) T3
having  T1.idMarshruta=T2.idMarshruta and T3.idOstanovki=T1.idOstanovkiNachalo order by T3.vremya; 
*/

select 

concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki), 
T1.nazvanieOstanovki as nach,
raspisanie.vremya as vremyaOtb,
T2.nazvanieOstanovki as kon,
 sum(rastoyanie.rastoyanie) as polnRast,
marshruti.idMarshruta,
raspisanie.den,
marshruti.typeOfTrain

from
ostanovki as T1 
inner join 
ostanovki as T2 
inner join 
marshruti 
inner join 
raspisanie  
 inner join
 rastoyanie 
 on (T1.idOstanovki = marshruti.idOstanovkiNachalo) and 
	(T2.idOstanovki = marshruti.idOstanovkiKonec) and 
	(raspisanie.idOstanovki = marshruti.idOstanovkiNachalo) 
   and
   (marshruti.idMarshruta=rastoyanie.idMarshruta)
  --  where rastoyanie.rastoyanie=(select sum(rastoyanie) from rastoyanie group by rastoyanie.idMarshruta )
 	  group by rastoyanie.idRastoyaniya
      
      order by marshruti.idMarshruta;

#select concat(idOstanovki,' ',nazvanieOstanovki) from ostanovki;

#select typeOfTrain from marshruti;

/*
select ostanovki.nazvanieOstanovki as nachalo, marshruti.typeOfTrain, raspisanie.dataVremya, raspisanie.den from marshruti inner join raspisanie inner join ostanovki on marshruti.idMarshruta = raspisanie.idMarshruta and marshruti.idOstanovkiNachalo=ostanovki.idOstanovki;
*/



/*
select ostanovki.nazvanieOstanovki as nacalo, ostanovki.nazvanieOstanovki as konec,
idMarshruta from ostanovki inner join  marshruti on marshruti.idOstanovkiNachalo=ostanovki.idOstanovki where
konec=
(select ostanovki.nazvanieOstanovki from ostanovki inner join  marshruti on marshruti.idOstanovkiKonec=ostanovki.idOstanovki);
*/

/*
SELECT T1.manager_vydacha, T1.cnt1, T2.cnt1
FROM
  (SELECT manager_vydacha, COUNT(*) AS cnt1
   FROM raw
   WHERE office IN ('1', '2', '3', '4') AND date_podgotovka BETWEEN '2012-01-01' AND '2012-12-31'
   GROUP BY manager_vydacha
   ) T1,
  (SELECT manager_vydacha, COUNT(*) AS cnt1
   FROM raw
   WHERE office IN ('1', '2', '3', '4') AND date_vydacha BETWEEN '2012-01-01' AND '2012-12-31'
   GROUP BY manager_vydacha
  ) T2
WHERE T2.manager_vydacha = T1.manager_vydacha
*/
