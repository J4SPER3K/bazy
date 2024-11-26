pozdrawiam3

#kopiowanie tabel
CREATE TABLE kreatura AS SELECT * FROM wikingowie.kreatura;

CREATE TABLE zasob AS SELECT * FROM wikingowie.zasob;

CREATE TABLE ekwipunek AS SELECT * FROM wikingowie.ekwipunek;

SELECT * FROM zasob;

SELECT * FROM zasob WHERE rodzaj = 'jedzenie';

SELECT * FROM ekwipunek;

#in wypisuje dane wartosci
SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN (1, 3, 5);

#wykrzyknik to zaprzeczenie
SELECT * FROM kreatura WHERE rodzaj !='wiedzma' AND udzwig >= 50;

SELECT * FROM zasob WHERE waga BETWEEN 2 AND 5;

SELECT * FROM kreatura WHERE nazwa LIKE "%or%" AND udzwig BETWEEN 30 AND 70;


SELECT * FROM zasob;

SELECT year(dataPozyskania), month(dataPozyskania), day(dataPozyskania) FROM zasob;

SELECT * FROM zasob WHERE month(dataPozyskania) in (7,8);

SELECT rodzaj FROM zasob;

SELECT * FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC;

SELECT * FROM kreatura order by dataUr limit 5 DESC;

#distinct wyswietla unikalne tresci
select DISTINCT nazwa, dataPozyskania FROM zasob;
SELECT DISTINCT(rodzaj) FROM zasob;


#funkcja concat() wyswietla 2 lub wiecej kolumn jako jedną
#w czwartym i piatym zadaniu dochodzimy do destrukcji mózgownicy poniewaz pojawiaja sie kwerendy które 1 raz widze 0o0
SELECT CONCAT(nazwa," - ",rodzaj) AS 'nazwa - rodzaj' FROM kreatura WHERE rodzaj LIKE "wi%";

SELECT nazwa, ilosc * waga, dataPozyskania FROM zasob WHERE year(dataPozyskania) BETWEEN 2000 AND 2007;

SELECT nazwa, (ilosc*waga)*0.7 AS 'netto' , (ilosc*waga)*0.3 AS 'odpadki' FROM zasob WHERE rodzaj = 'jedzenie';

SELECT * FROM zasob WHERE rodzaj IS NULL;

SELECT DISTINCT(nazwa), rodzaj FROM zasob WHERE nazwa LIKE "Ba%" OR nazwa LIKE "%os" ORDER BY nazwa ASC;
