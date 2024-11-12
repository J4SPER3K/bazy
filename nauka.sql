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
