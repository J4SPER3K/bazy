!!! Baza została edytowana, ponieważ nie zauważyłem 5 zadania i robię na szybko!!!

# Ctrl + Enter -> wykonanie polecenia z aktywnym kursorempostac

CREATE TABLE  izba ( 
    adres_budynku varchar(50),
    nazwa_izby varchar(30),
    metraz smallint unsigned,
    wlasciciel int,
    primary key(adres_budynku, nazwa_izby),
    foreign key (wlasciciel) references postac(id_postaci) on delete set null
    );
    
    ALTER TABLE izba ADD kolor varchar(30) AFTER metraz;

ALTER TABLE walizka MODIFY COLUMN kolor enum('rozowy','czerwony','teczowy','zolty');
    
ALTER TABLE walizka MODIFY COLUMN kolor enum('rozowy','czerwony','teczowy','zolty') DEFAULT 'rozowy';
select * from postac;

INSERT INTO walizka (id_walizki, pojemnosc, kolor, id_wlasciciela) VALUES (1, 25, 'czerwony', 1), (2, 15, 'zolty', 3);

SELECT * FROM izba;

INSERT INTO izba (adres_budynku, nazwa_izby, metraz, kolor, wlasciciel) VALUES ('13/21 Lesna Dolina','spizarnia','40','biszkoptowy',2);

CREATE TABLE przetwory (
    id_przetworu INT PRIMARY KEY AUTO_INCREMENT,
    rok_produkcji YEAR DEFAULT 1654,
    id_wykonawcy INT,
    zawartosc VARCHAR(100),
    dodatek VARCHAR(50) DEFAULT 'papryczka chilli',
    id_konsumenta INT,
    FOREIGN KEY (id_wykonawcy) REFERENCES postac(id_postaci),
    FOREIGN KEY (id_konsumenta) REFERENCES postac(id_postaci)
);

INSERT INTO przetwory (rok_produkcji, id_wykonawcy, zawartosc, dodatek, id_konsumenta)
VALUES (2023, 1, 'bigos', DEFAULT, 3);

INSERT INTO postac (nazwa, rodzaj, data_ur, wiek) VALUES ('Kacper', 'wiking', "2004-07-23" , 20);
INSERT INTO postac (nazwa, rodzaj, data_ur, wiek) VALUES ('Kacperus', 'wiking',"1995-07-24", 29);
INSERT INTO postac (nazwa, rodzaj, data_ur, wiek) VALUES ('Kacperson', 'wiking',"1994-07-25", 30);
INSERT INTO postac (nazwa, rodzaj, data_ur, wiek) VALUES ('Kapi', 'wiking', "1993-07-26", 31);
INSERT INTO postac (nazwa, rodzaj, data_ur, wiek) VALUES ('Super', 'wiking', "1992-07-27", 32);
	
CREATE TABLE statek (
	nazwa_statku varchar(15) PRIMARY KEY,
    rodzaj_statku ENUM('szybki','wolny'),
    data_wodowania DATE,
    max_ladownosc INT UNSIGNED);

INSERT INTO statek (nazwa_statku, rodzaj_statku, data_wodowania, max_ladownosc) VALUES ("Titanic", "wolny", "2024-05-07", 650);
INSERT INTO statek (nazwa_statku, rodzaj_statku, data_wodowania, max_ladownosc) VALUES ("Speedy", "szybki", "2024-05-08", 250);

ALTER TABLE postac ADD COLUMN funkcja VARCHAR (40);

UPDATE postac set funkcja = 'kapitan' where nazwa = 'Bjorn';

select * from postac;

ALTER TABLE postac ADD COLUMN nazwa_statku VARCHAR (15);
ALTER TABLE postac ADD FOREIGN KEY postac(nazwa_statku) REFERENCES statek(nazwa_statku);

UPDATE postac SET nazwa_statku = 'Titanic' WHERE nazwa IN ('Bjorn', 'Drozd');
UPDATE postac SET nazwa_statku = 'Speedy' WHERE nazwa IN ('Kacper', 'Kacperus', 'Kacperson', 'Kapi', 'Super');

DELETE FROM izba WHERE nazwa_izby= 'spizarnia';

DROP TABLE izba;
