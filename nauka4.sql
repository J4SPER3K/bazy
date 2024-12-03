pozdrawiam4

1.1
SELECT AVG(waga) FROM kreatura WHERE rodzaj="wiking";
1.2
SELECT AVG(waga), COUNT(rodzaj), rodzaj FROM kreatura GROUP BY rodzaj;
1.3
SELECT AVG(year(dataUr)), rodzaj FROM kreatura GROUP BY rodzaj;
2.1
SELECT rodzaj, SUM(waga) FROM zasob GROUP BY rodzaj;
2.2
SELECT nazwa, AVG(waga) AS srednia_waga FROM zasob GROUP BY nazwa HAVING SUM(ilosc)>=4 AND SUM(waga)>10;
2.3
SELECT rodzaj, COUNT(nazwa) from zasob WHERE ilosc>1 GROUP BY rodzaj;
3.1
SELECT kreatura.nazwa, COUNT(ekwipunek.idZasobu) AS ilosc_zasobow FROM kreatura LEFT JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury GROUP BY kreatura.nazwa;
3.2
SELECT kreatura.nazwa, zasob.nazwa AS nazwa_zasobu FROM kreatura LEFT JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury LEFT JOIN zasob ON ekwipunek.idZasobu = zasob.idZasobu;
3.3
SELECT kreatura.nazwa FROM kreatura LEFT JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury WHERE ekwipunek.idKreatury IS NULL;
4.1
SELECT kreatura.nazwa AS nazwa_wikinga, zasob.nazwa AS nazwa_zasobu FROM kreatura NATURAL JOIN ekwipunek JOIN zasob ON ekwipunek.idZasobu = zasob.idZasobu WHERE EXTRACT(YEAR FROM k.data_urodzenia) BETWEEN 1670 AND 1679 AND kreatura.rodzaj = 'wiking';
4.2
SELECT kreatura.nazwa FROM kreatura NATURAL JOIN ekwipunek JOIN zasob ON ekwipunek.idZasobu = zasob.idZasobu WHERE zasob.typ = 'jedzenie' ORDER BY kreatura.data_urodzenia DESC LIMIT 5;
4.3
#tutaj posłużyłem się troszeczke pomocą (głównie w joinach troche poszperałem z pomocą)
SELECT k1.nazwa AS nazwa_kreatury_1, k2.nazwa AS nazwa_kreatury_2 FROM kreatura k1 JOIN kreatura k2 ON k1.idKreatury = k2.idKreatury - 5;
5.1
SELECT kreatura.rodzaj, AVG(zasob.waga) AS srednia_waga_zasobow FROM kreatura JOIN ekwipunek ON kreatura.idKreatury = ekwipunek.idKreatury JOIN zasob ON ekwipunek.idZasobu = zasob.idZasobu WHERE kreatura.rodzaj NOT IN ('małpa', 'wąż') AND COUNT(e.idEkwipunku) < 30 GROUP BY kreatura;
5.2 podpowiedz 2 jest trudne
SELECT 
