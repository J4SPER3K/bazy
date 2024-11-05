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