DROP TABLE IF EXISTS Producent;
CREATE TABLE Producent (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nazwa VARCHAR(255) NOT NULL
);

INSERT INTO Producent (nazwa)
VALUES
('HardPapier'),
('BlackToner'),
('Invisible Ink'),
('Paper-Jams'),
('Sister ink.'),
('Drukarz'),
('Black Lion');

DROP TABLE IF EXISTS 'Kategoria';
CREATE TABLE Kategoria (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nazwa VARCHAR(255) NOT NULL
);

INSERT INTO Kategoria (id,nazwa)
VALUES
(1,'do użytku domowego'),
(2,'heavy-duty'),
(3,'oryginał'),
(4,'zamiennik'),
(5,'Sister ink.');

DROP TABLE IF EXISTS 'Drukarka';
CREATE TABLE Drukarka (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    model VARCHAR(255) NOT NULL,
    producent_id INT,
    kategoria_id INT,
    FOREIGN KEY (producent_id) REFERENCES Producent(id)
    FOREIGN KEY (kategoria_id) REFERENCES Kategoria(id)
);

INSERT INTO Drukarka (model,producent_id,kategoria_id)
VALUES
('HaPap-1234',1,1),
('HaPap-XL-34',1,2),
('SI-9876',5,2),
('Super-150',6,2);

DROP TABLE IF EXISTS 'Material';
CREATE TABLE Material (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    model VARCHAR(255) NOT NULL,
    typ_materialu INT,
    czy_zamiennik INT,
    producent_id INT,
    FOREIGN KEY (typ_materialu) REFERENCES TypMaterialu(typ_materialu)
    FOREIGN KEY (czy_zamiennik) REFERENCES CzyZamiennik(czy_zamiennik)
    FOREIGN KEY (producent_id) REFERENCES Producent(id)
);

DROP TABLE IF EXISTS 'CzyZamiennik';
CREATE TABLE CzyZamiennik (
    czy_zamiennik INTEGER PRIMARY KEY AUTOINCREMENT,
    zamiennik_typ VARCHAR(50) NOT NULL
);

INSERT INTO CzyZamiennik (czy_zamiennik, zamiennik_typ) VALUES
(1, 'Oryginał'),
(2, 'Zamiennik');

DROP TABLE IF EXISTS 'TypMaterialu';
CREATE TABLE TypMaterialu (
    typ_materialu INTEGER PRIMARY KEY AUTOINCREMENT,
    material_nazwa VARCHAR(50) NOT NULL
);

INSERT INTO TypMaterialu (typ_materialu, material_nazwa) VALUES
(1, 'TONER'),
(2, 'BĘBEN');

INSERT INTO Material (model,typ_materialu,czy_zamiennik,producent_id)
VALUES

('HaPap-1234-B',1,1,1),
('HaPap-1234-B-S',1,2,2),
('HaPap-1234-B-M',1,2,1),
('HaPap-1234-XXL',1,1,1),
('HaPap-1234-XXL-X',1,2,2),
('Symp-1234-X',1,2,3),

('HaPap-1232-BMB',2,1,1),

('HaPap-XL-12',2,1,1),

('Hpa-XL-12a',2,2,4),

('Si-9876t',1,1,5),
('Si-mba-76t',1,2,7),
('Si-9876b',2,1,5),
('DK-150_Extra',1,1,6),
('DK-150_ExtraPlus',1,2,6),
('Super-150_Ultra',1,2,7),
('BB-150',2,1,6);

DROP TABLE IF EXISTS 'PasujeDo';
CREATE TABLE PasujeDo (
    ID_pasuje INTEGER PRIMARY KEY AUTOINCREMENT,
    material_id INT,
    drukarka_id INT,
    FOREIGN KEY (material_id) REFERENCES Material(id),
    FOREIGN KEY (drukarka_id) REFERENCES Drukarka(id)
);

INSERT INTO PasujeDo (material_id, drukarka_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(4, 2),
(5, 2),
(6, 1),
(7, 1),
(8, 2),
(9, 2),
(10, 3),
(11, 3),
(12, 3),
(13, 4),
(14, 4),
(15, 4),
(16, 4);

DROP TABLE IF EXISTS 'Magazyn';
CREATE TABLE Magazyn (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    produkt_id INT,
    cena DECIMAL(10, 2) NOT NULL,
    ilosc INT NOT NULL,
    id_typu INT NOT NULL,
    FOREIGN KEY (produkt_id) REFERENCES Material(id),
    FOREIGN KEY (produkt_id) REFERENCES Drukarka(id),
    FOREIGN KEY (id_typu) REFERENCES Typ_Produktu(id_typu)
);

DROP TABLE IF EXISTS 'Typ_Produktu';
CREATE TABLE Typ_Produktu (
    id_typu INTEGER PRIMARY KEY AUTOINCREMENT,
    typ_produktu VARCHAR(50) NOT NULL
);

INSERT INTO Typ_Produktu (id_typu, typ_produktu) VALUES
(1, 'Drukarki'),
(2, 'Materialy');

DROP TABLE IF EXISTS 'Zamówienie';
CREATE TABLE Zamówienie (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_stanu INT,
    id_magazynowe INT,
    klient_id INT,
    FOREIGN KEY (id_magazynowe) REFERENCES Magazyn(id),
    FOREIGN KEY (klient_id) REFERENCES Klient(id)
);

INSERT INTO Magazyn (id_typu,produkt_id,ilosc,cena) VALUES
(1,1,3,199.99),
(1,2,2,249.99),
(1,3,2,549.99),

(2,1,2,19.99),
(2,2,4,9.99),
(2,3,3,15.99),
(2,4,0,15.99),
(2,5,2,25.99),
(2,6,0,5.99),
(2,7,1,105.29),
(2,8,1,235.49),
(2,9,1,135.49),
(2,10,3,65.49),
(2,11,2,88.70),
(2,12,3,109.98),
(2,13,13,5.49),
(2,14,7,8.49),
(2,15,9,2.79),
(2,16,3,49.98),
(1,4,3,149.98);



DROP TABLE IF EXISTS 'Stan_Zamowienia';
CREATE TABLE Stan_Zamowienia (
    id_stanu INTEGER PRIMARY KEY AUTOINCREMENT,
    stan_zamowienia VARCHAR(50) NOT NULL
);

INSERT INTO Stan_Zamowienia (id_stanu, stan_zamowienia) VALUES
(1, 'Zakupy zrealizowane'),
(2, 'Rezerwacja');

DROP TABLE IF EXISTS 'Klient';
CREATE TABLE Klient (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    imie VARCHAR(255) NOT NULL,
    nazwisko VARCHAR(255) NOT NULL
);

INSERT INTO Klient(id,imie,nazwisko)
VALUES
  (87082932728,'Wiaczesław','Świątek'),
  (79311816204,'Arleta','Wróblewska'),
  (66093044251,'Bogdan','Wawrzyniak'),
  (93043016458,'Tadeusz','Karpiński'),
  (70060782684,'Agnieszka','Wrona'),
  (80050144864,'Sandra','Pietrzak'),
  (81072056166,'Magda','Kot'),
  (77092158733,'Filip','Laskowski'),
  (920082894551,'Oliver','Domański');



INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,87082932728,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,79311816204,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,66093044251,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,93043016458,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,70060782684,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234'));





INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,87082932728,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234-B'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,79311816204,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234-B'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,87082932728,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234-B'));


INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,93043016458,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234-B-S'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,66093044251,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234-B-S'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,87082932728,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234-XXL'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,87082932728,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1232-BMB'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,80050144864,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1232-BMB'));





INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,81072056166,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-XL-34'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,87082932728,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-XL-34'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,87082932728,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-1234-XXL'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,77092158733,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'HaPap-XL-12'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,920082894551,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'Hpa-XL-12a'));





INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,87082932728,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'SI-9876'));
INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,80050144864,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'SI-9876'));
INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,77092158733,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'SI-9876'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,81072056166,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'SI-9876'));


INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,80050144864,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'Si-9876t'));
INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,77092158733,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'Si-9876t'));



INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,87082932728,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'Si-9876t'));


INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,80050144864,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'Si-mba-76t'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,77092158733,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'Si-mba-76t'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (1,80050144864,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'Si-9876b'));

INSERT INTO Zamówienie (id_stanu, klient_id, id_magazynowe)
VALUES (2,920082894551,(
    SELECT Magazyn.id
    FROM Magazyn
    LEFT JOIN Material ON Magazyn.produkt_id = Material.id AND Magazyn.id_typu = 2
    LEFT JOIN Drukarka ON Magazyn.produkt_id = Drukarka.id AND Magazyn.id_typu = 1
    WHERE COALESCE(Material.model, Drukarka.model) = 'Si-9876b'));
