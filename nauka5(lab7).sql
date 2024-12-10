pozdrawiam5

CREATE TABLE moja_baza.kreatura AS SELECT * FROM wikingowie.kreatura;
CREATE TABLE moja_baza.uczestnicy AS SELECT * FROM wikingowie.uczestnicy;
CREATE TABLE moja_baza.etapy_wyprawy AS SELECT * FROM wikingowie.etapy_wyprawy;
CREATE TABLE moja_baza.sektor AS SELECT * FROM wikingowie.sektor;
CREATE TABLE moja_baza.wyprawa AS SELECT * FROM wikingowie.wyprawa;

SELECT k.nazwa FROM moja_baza.kreatura k LEFT JOIN moja_baza.uczestnicy u ON k.idKreatury = u.idKreatury WHERE u.idUczestnicy IS NULL;

SELECT w.nazwa AS nazwa_wyprawy, SUM(e.ilosc) AS suma_ekwipunku FROM moja_baza.wyprawa w JOIN moja_baza.etapy_wyprawy e ON w.idWyprawy = e.idWyprawy GROUP BY w.nazwa;

SELECT w.nazwa AS nazwa_wyprawy, COUNT(u.idUczestnicy) AS liczba_uczestnikow, GROUP_CONCAT(k.nazwa) AS nazwy_uczestnikow FROM moja_baza.wyprawa w JOIN moja_baza.uczestnicy u ON w.idWyprawy = u.idWyprawy JOIN moja_baza.kreatura k ON u.idKreatury = k.idKreatury GROUP BY w.nazwa;

SELECT w.nazwa AS nazwa_wyprawy, e.nazwa AS nazwa_etapu, s.nazwa AS nazwa_sektora, e.data_poczatku, e.data_konca, k.nazwa AS kierownik FROM moja_baza.etapy_wyprawy e JOIN moja_baza.wyprawa w ON e.idWyprawy = w.idWyprawy JOIN moja_baza.sektor s ON e.idSektora = s.idSektora JOIN moja_baza.kreatura k ON e.idKierownika = k.idKreatury ORDER BY w.data_rozpoczecia, e.kolejnosc;

SELECT s.nazwa AS nazwa_sektora, COUNT(e.idEtapu) AS ilosc_odwiedzin FROM moja_baza.sektor s LEFT JOIN moja_baza.etapy_wyprawy e ON s.idSektora = e.idSektora GROUP BY s.nazwa;

SELECT k.nazwa AS nazwa_kreatury, 
       IFNULL(COUNT(u.idWyprawy), 0) AS ilosc_wypraw,
       IFNULL(IF(COUNT(u.idWyprawy) > 0, 'brał udział w wyprawie', 'nie brał udziału w wyprawie'), 'nie brał udziału w wyprawie') AS status_udzialu FROM moja_baza.kreatura k LEFT JOIN moja_baza.uczestnicy u ON k.idKreatury = u.idKreatury GROUP BY k.nazwa;

SELECT w.nazwa AS nazwa_wyprawy, SUM(LENGTH(e.dziennik)) AS suma_znakow FROM moja_baza.wyprawa w JOIN moja_baza.etapy_wyprawy e ON w.idWyprawy = e.idWyprawy GROUP BY w.nazwa HAVING suma_znakow < 400;

SELECT w.nazwa AS nazwa_wyprawy, AVG(u.ilosc * z.waga) AS srednia_waga_zasobow FROM moja_baza.wyprawa w JOIN moja_baza.uczestnicy u ON w.idWyprawy = u.idWyprawy JOIN moja_baza.zasob z ON u.idZasobu = z.idZasobu GROUP BY w.nazwa;

ostatnie nie umiem

