-- select concat(T1.nazvanieOstanovki," - " ,T2.nazvanieOstanovki) as NazvanieMarshruta, T1.nazvanieOstanovki as nach, raspisanie.vremya as vremyaOtb, T2.nazvanieOstanovki as kon, raspisanie.den, marshruti.typeOfTrain from ostanovki as T1 inner join ostanovki as T2 inner join marshruti inner join raspisanie on (T1.idOstanovki = marshruti.idOstanovkiNachalo) and (T2.idOstanovki = marshruti.idOstanovkiKonec) and (raspisanie.idOstanovki = marshruti.idOstanovkiNachalo) order by marshruti.idMarshruta, raspisanie.vremya;



select
concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki) as nazvanieMarshruta, 
T4.nazvanieOstanovki, typeOfTrain
from
ostanovki as T1 
inner join 
ostanovki as T2 
inner join
ostanovki as T3
inner join 
ostanovki as T4
inner join
marshruti
 inner join 
 raspisanie 
 on (T1.idOstanovki = marshruti.idOstanovkiNachalo) and 
	(T2.idOstanovki = marshruti.idOstanovkiKonec)  and
     (raspisanie.idOstanovki = T3.idOstanovki) and
     (raspisanie.idMarshruta = marshruti.idMarshruta) and
     (T3.nazvanieOstanovki = 'Осиповичи')

where T3.idOstanovki between T1.idOstanovki and T2.idOstanovki and
		T4.idOstanovki between T1.idOstanovki and T2.idOstanovki
group by nazvanieMarshruta, T4.nazvanieOstanovki
 
UNION

select
concat(T1.nazvanieOstanovki,' - ',T2.nazvanieOstanovki) as nazvanieMarshruta, 
T4.nazvanieOstanovki, typeOfTrain
from
ostanovki as T1 
inner join 
ostanovki as T2 
inner join
ostanovki as T3
inner join 
ostanovki as T4
inner join
marshruti
 inner join 
 raspisanie 
 on (T1.idOstanovki = marshruti.idOstanovkiNachalo) and 
	(T2.idOstanovki = marshruti.idOstanovkiKonec)  and
     (raspisanie.idOstanovki = T3.idOstanovki) and
     (raspisanie.idMarshruta = marshruti.idMarshruta) and
     (T3.nazvanieOstanovki = 'Михановичи')

where T3.idOstanovki <= T1.idOstanovki and T3.idOstanovki >= T2.idOstanovki and
 	  T4.idOstanovki <= T1.idOstanovki and T4.idOstanovki >= T2.idOstanovki
      
      group by nazvanieMarshruta, T4.nazvanieOstanovki;