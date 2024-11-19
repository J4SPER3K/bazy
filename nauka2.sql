pozdrawiam

SELECT * FROM postac WHERE rodzaj='wiking'
ORDER BY data_ur ASC;

DELETE from postac WHERE id_postaci = 5;

INSERT INTO postac VALUES(default, 'Odin', '1', '1567-09-29', '158');

#change zmienai nazwe i atrybut
ALTER TABLE postac CHANGE id_postaci id_postaci int;

#modify zmienia tylko atrybuty
ALTER TABLE postac MODIFY id_postaci int;

#usuniecie klucza obcego
ALTER TABLE walizka DROP foreign key walizka_ibfk_1;

informacje o tabeli
SHOW CREATE TABLE walizka;

#pesel (11 znaków)
ALTER TABLE postac ADD pesel varchar(11) first;

UPDATE postac SET pesel='12345678912' WHERE nazwa='Bjorn';

ALTER TABLE postac MODIFY rodzaj enum('wiking', 'ptak', 'kobieta', 'syrena');

insert into postac values(12345678911, 5, 'Gertruda Nieszczera', 4, '2000-12-08', 24);

ALTER TABLE postac MODIFY rodzaj enum('wiking', 'ptak', 'kobieta', 'syrena', 'waz');
INSERT INTO postac(id_postaci, nazwa, rodzaj, data_ur, wiek) VALUES(11, 'Loko', 5, '2023-01-28', 1);

#kopia struktury
CREATE TABLE marynarz LIKE postac;

#kopia danych
INSERT INTO marynarz SELECT * FROM postac WHERE statek IS not null;

#usunąć dane z kolumny statek
UPDATE postac SET statek = null WHERE statek IS not null;

DELETE FROM postac WHERE nazwa='Super';

#zatopić statki
DELETE FROM statek WHERE nazwa_statku is not null;

#usunąć tabelę statek
ALTER TABLE postac DROP foreign key FK_statek;
DROP TABLE statek;


CREATE TABLE zwierz(id int auto_increment, nazwa varchar(40), wiek int, primary key (id));

INSERT INTO zwierz VALUES(default, 'Drozd', 5),(default, 'Loko', 1);