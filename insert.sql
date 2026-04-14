-- VOZIDLA
INSERT INTO vozidlo (registracni_znacka, znacka, model) VALUES
('1A1 1111', 'Škoda', 'Fabia'),
('2B2 2222', 'Škoda', 'Octavia'),
('5A1 2456', 'Škoda', 'Octavia'),
('3C3 3333', 'Ford', 'Focus'),
('4D4 4444', 'Renault', 'Clio'),
('5E5 5555', 'Toyota', 'Yaris'),
('6F6 6666', 'Kia', 'Rio'),
('7G7 7777', 'Hyundai', 'i30'),
('8H8 8888', 'Peugeot', '208'),
('9I9 9999', 'Volkswagen', 'Golf'),
('0J0 0000', 'Opel', 'Astra'),
('1K1 1112', 'Mazda', '3'),
('2L2 2223', 'Citroën', 'C3');

-- INSTRUKTORI
INSERT INTO instruktor (vozidlo_id, jmeno, telefon, opravneni) VALUES
(1, 'Jan Novák', '123456789', 'B'),
(2, 'Petr Svoboda', '987654321', 'B'),
(3, 'Lucie Černá', '456789123', 'B, C'),
(4, 'Eva Malá', '321654987', 'B'),
(5, 'Roman Dvořák', '789123456', 'A, B'),
(6, 'Alena Veselá', '654321987', 'C'),
(6, 'Tomáš Král', '111222333', 'B'),
(8, 'Martina Zelená', '222333444', 'B, C'),
(9, 'Karel Černý', '333444555', 'A'),
(4, 'Jana Bílá', '444555666', 'B'),
(11, 'Pavel Modrý', '555666777', 'C'),
(NULL, 'Lucie Fialová', '666777888', 'B');

-- STUDENTI
INSERT INTO student (instruktor_id, jmeno, telefon, bydliste) VALUES
(1, 'Adam Kučera', '123123123', 'Praha'),
(2, 'Barbora Hrušková', '234234234', 'Brno'),
(1, 'Cyril Malý', '345345345', 'Plzeň'),
(3, 'Denisa Novotná', '456456456', 'Ostrava'),
(4, 'Eliška Pokorná', '567567567', 'Liberec'),
(5, 'Filip Růžička', '678678678', 'Zlín'),
(6, 'Gabriela Tichá', '789789789', 'Hradec Králové'),
(2, 'Hynek Urban', '890890890', 'Pardubice'),
(3, 'Iveta Valentová', '901901901', 'Olomouc'),
(4, 'Petr Novák', '112112112', 'České Budějovice'),
(7, 'Radek Šimek', '223344556', 'Jihlava'),
(8, 'Simona Holá', '334455667', 'Karlovy Vary'),
(9, 'Tomáš Doležal', '445566778', 'Ústí nad Labem'),
(10, 'Veronika Černá', '556677889', 'Teplice'),
(11, 'Zdeněk Modrý', '667788990', 'Písek'),
(12, 'Andrea Fialová', '778899001', 'Tábor');

-- KURZY
INSERT INTO kurz (kurz_id, datum_zapisu, kategorie) VALUES
(1, '2024-01-10', 'B'),
(2, '2024-02-15', 'B'),
(3, '2024-03-01', 'B'),
(4, '2024-03-20', 'C'),
(5, '2024-04-05', 'B'),
(6, '2024-04-25', 'C'),
(7, '2024-05-10', 'A'),
(8, '2024-05-20', 'B'),
(9, '2024-06-01', 'C'),
(10, '2024-06-15', 'A'),
(11, '2024-07-01', 'B'),
(12, '2024-07-20', 'C');

-- STUDENT_KURZ
INSERT INTO student_kurz (student_id, kurz_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4),
(2, 1), (2, 5),
(3, 1), (3, 2), (3, 3), (3, 5),
(4, 1), (4, 3),
(5, 1), (5, 2), (5, 3), (5, 5),
(6, 1), (6, 2), (6, 4), (6, 5),
(7, 1), (7, 2), (7, 4), (7, 6),
(8, 2), (8, 3), (8, 5),
(9, 2), (9, 3), (9, 4), (9, 5),
(10, 1), (10, 3), (10, 5), (10, 6),
(11, 7), (12, 8), (13, 9), (14, 10), (15, 11), (16, 12);

-- TEORETICKA VYUKA
INSERT INTO teoreticka_vyuka (teoreticka_vyuka_id, instruktor_id, tema, datum) VALUES
(1, 1, 'Pravidla silničního provozu', '2024-01-11'),
(2, 2, 'Základy první pomoci', '2024-01-12'),
(3, 3, 'Technika jízdy', '2024-01-13'),
(4, 4, 'Značky a situace', '2024-01-14'),
(5, 5, 'Bezpečnost provozu', '2024-01-15'),
(6, 6, 'Povinnosti řidiče', '2024-01-16'),
(7, 7, 'Ekonomická jízda', '2024-01-17'),
(8, 8, 'Zákony a předpisy', '2024-01-18'),
(9, 9, 'Údržba vozidla', '2024-01-19'),
(10, 10, 'Psychologie řidiče', '2024-01-20'),
(11, 11, 'Navigace a plánování trasy', '2024-01-21'),
(12, 12, 'Řízení v krizových situacích', '2024-01-22');

-- DOCHAZKA
INSERT INTO dochazka (student_id, teoreticka_vyuka_id, pritomen, datum) VALUES
(1, 1, 'ano', '2024-01-11'),
(2, 1, 'ano', '2024-01-11'),
(3, 1, 'ne', '2024-01-11'),
(4, 2, 'ano', '2024-01-12'),
(5, 2, 'ne', '2024-01-12'),
(6, 3, 'ano', '2024-01-13'),
(7, 4, 'ano', '2024-01-14'),
(8, 5, 'ne', '2024-01-15'),
(9, 6, 'ano', '2024-01-16'),
(11, 7, 'ano', '2024-01-17'),
(12, 8, 'ne', '2024-01-18'),
(13, 9, 'ano', '2024-01-19'),
(14, 10, 'ano', '2024-01-20'),
(1, 2, 'ano', '2024-01-12'),
(1, 3, 'ano', '2024-01-13'),
(1, 4, 'ano', '2024-01-14'),
(1, 6, 'ano', '2024-01-16'),
(1, 7, 'ano', '2024-01-17'),
(1, 9, 'ano', '2024-01-19'),
(1, 10, 'ano', '2024-01-20'),
(1, 12, 'ano', '2024-01-22'),
(16, 12, 'ano', '2024-01-22');

-- ZKOUSKY
INSERT INTO zkouska (zkouska_id, student_id, datum, vysledek) VALUES
(1, 1, '2024-03-10', 'uspěl'),
(2, 2, '2024-03-11', 'neuspěl'),
(3, 3, '2024-03-12', 'uspěl'),
(4, 4, '2024-03-13', 'uspěl'),
(5, 5, '2024-03-14', 'neuspěl'),
(6, 6, '2024-03-15', 'uspěl'),
(7, 11, '2024-03-16', 'uspěl'),
(8, 12, '2024-03-17', 'neuspěl'),
(9, 13, '2024-03-18', 'uspěl'),
(10, 14, '2024-03-19', 'uspěl'),
(11, 15, '2024-03-20', 'neuspěl'),
(12, 16, '2024-03-21', 'uspěl'),
(13, 1, '2024-04-21', 'uspěl');

-- TEORIE
INSERT INTO teorie (zkouska_id, pokus) VALUES
(1, '1'), (2, '2'), (3, '1'), (4, '1'), (5, '3'), (6, '1'),
(7, '1'), (8, '2'), (9, '1'), (10, '1'), (11, '3'), (12, '1');

-- PRAKTICKA
INSERT INTO prakticka (zkouska_id, trasa) VALUES
(1, 'Trasa A'), (2, 'Trasa B'), (3, 'Trasa C'), (4, 'Trasa D'), (5, 'Trasa A'), (6, 'Trasa B'),
(7, 'Trasa C'), (8, 'Trasa D'), (9, 'Trasa A'), (10, 'Trasa B'), (11, 'Trasa C'), (12, 'Trasa D');

-- PRAKTICKA VYUKA
INSERT INTO prakticka_vyuka (prakticka_vyuka_id, student_id, datum) VALUES
(1, 1, '2024-02-01'),
(2, 2, '2024-02-02'),
(3, 3, '2024-02-03'),
(4, 4, '2024-02-04'),
(5, 5, '2024-02-05'),
(6, 6, '2024-02-06'),
(7, 7, '2024-02-07'),
(8, 8, '2024-02-08'),
(9, 9, '2024-02-09'),
(10, 10, '2024-02-10'),
(11, 11, '2024-02-11'),
(12, 12, '2024-02-12'),
(13, 13, '2024-02-13'),
(14, 14, '2024-02-14'),
(15, 15, '2024-02-15'),
(16, 16, '2024-02-16');

-- PLATBY
INSERT INTO platba (platba_id, student_id, castka, datum, zpusob_platby) VALUES
(1, 1, '5000', '2024-01-20', 'hotově'),
(2, 2, '5000', '2024-01-21', 'kartou'),
(3, 3, '5500', '2024-01-22', 'převodem'),
(4, 4, '5200', '2024-01-23', 'kartou'),
(5, 5, '5300', '2024-01-24', 'hotově'),
(6, 6, '5400', '2024-01-25', 'hotově'),
(7, 7, '5600', '2024-01-26', 'převodem'),
(8, 8, '5700', '2024-01-27', 'hotově'),
(9, 9, '5800', '2024-01-28', 'kartou'),
(10, 10, '5900', '2024-01-29', 'převodem'),
(11, 11, '6000', '2024-01-30', 'kartou'),
(12, 12, '6100', '2024-01-31', 'hotově'),
(13, 13, '6200', '2024-02-01', 'převodem'),
(14, 14, '6300', '2024-02-02', 'kartou'),
(15, 15, '6400', '2024-02-03', 'hotově'),
(16, 16, '6500', '2024-02-04', 'převodem');