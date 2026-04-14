DROP TABLE IF EXISTS dochazka CASCADE;
DROP TABLE IF EXISTS instruktor CASCADE;
DROP TABLE IF EXISTS kurz CASCADE;
DROP TABLE IF EXISTS platba CASCADE;
DROP TABLE IF EXISTS prakticka CASCADE;
DROP TABLE IF EXISTS prakticka_vyuka CASCADE;
DROP TABLE IF EXISTS student CASCADE;
DROP TABLE IF EXISTS teoreticka_vyuka CASCADE;
DROP TABLE IF EXISTS teorie CASCADE;
DROP TABLE IF EXISTS vozidlo CASCADE;
DROP TABLE IF EXISTS zkouska CASCADE;
DROP TABLE IF EXISTS student_kurz CASCADE;

CREATE TABLE dochazka (
    student_id INTEGER NOT NULL,
    teoreticka_vyuka_id INTEGER NOT NULL,
    pritomen VARCHAR(256) NOT NULL,
    datum DATE NOT NULL
);
ALTER TABLE dochazka ADD CONSTRAINT pk_dochazka PRIMARY KEY (student_id, teoreticka_vyuka_id);

CREATE TABLE instruktor (
    instruktor_id SERIAL NOT NULL,
    vozidlo_id INTEGER,
    jmeno VARCHAR(256) NOT NULL,
    telefon VARCHAR(256) NOT NULL,
    opravneni VARCHAR(256) NOT NULL
);
ALTER TABLE instruktor ADD CONSTRAINT pk_instruktor PRIMARY KEY (instruktor_id);

CREATE TABLE kurz (
    kurz_id SERIAL NOT NULL,
    datum_zapisu DATE NOT NULL,
    kategorie VARCHAR(256) NOT NULL
);
ALTER TABLE kurz ADD CONSTRAINT pk_kurz PRIMARY KEY (kurz_id);

CREATE TABLE platba (
    platba_id SERIAL NOT NULL,
    student_id INTEGER NOT NULL,
    castka VARCHAR(256) NOT NULL,
    datum DATE NOT NULL,
    zpusob_platby VARCHAR(256) NOT NULL
);
ALTER TABLE platba ADD CONSTRAINT pk_platba PRIMARY KEY (platba_id);

CREATE TABLE prakticka (
    zkouska_id INTEGER NOT NULL,
    trasa VARCHAR(256) NOT NULL
);
ALTER TABLE prakticka ADD CONSTRAINT pk_prakticka PRIMARY KEY (zkouska_id);

CREATE TABLE prakticka_vyuka (
    prakticka_vyuka_id SERIAL NOT NULL,
    student_id INTEGER NOT NULL,
    datum DATE NOT NULL
);
ALTER TABLE prakticka_vyuka ADD CONSTRAINT pk_prakticka_vyuka PRIMARY KEY (prakticka_vyuka_id);

CREATE TABLE student (
    student_id SERIAL NOT NULL,
    instruktor_id INTEGER NOT NULL,
    jmeno VARCHAR(256) NOT NULL,
    telefon VARCHAR(256) NOT NULL,
    bydliste VARCHAR(256) NOT NULL
);
ALTER TABLE student ADD CONSTRAINT pk_student PRIMARY KEY (student_id);

CREATE TABLE teoreticka_vyuka (
    teoreticka_vyuka_id SERIAL NOT NULL,
    instruktor_id INTEGER NOT NULL,
    tema VARCHAR(256) NOT NULL,
    datum DATE NOT NULL
);
ALTER TABLE teoreticka_vyuka ADD CONSTRAINT pk_teoreticka_vyuka PRIMARY KEY (teoreticka_vyuka_id);

CREATE TABLE teorie (
    zkouska_id INTEGER NOT NULL,
    pokus VARCHAR(256) NOT NULL
);
ALTER TABLE teorie ADD CONSTRAINT pk_teorie PRIMARY KEY (zkouska_id);

CREATE TABLE vozidlo (
    vozidlo_id SERIAL NOT NULL,
    registracni_znacka VARCHAR(256) NOT NULL,
    znacka VARCHAR(256) NOT NULL,
    model VARCHAR(256) NOT NULL
);
ALTER TABLE vozidlo ADD CONSTRAINT pk_vozidlo PRIMARY KEY (vozidlo_id);
ALTER TABLE vozidlo ADD CONSTRAINT uc_vozidlo_registracni_znacka UNIQUE (registracni_znacka);

CREATE TABLE zkouska (
    zkouska_id SERIAL NOT NULL,
    student_id INTEGER NOT NULL,
    datum DATE NOT NULL,
    vysledek VARCHAR(256) NOT NULL
);
ALTER TABLE zkouska ADD CONSTRAINT pk_zkouska PRIMARY KEY (zkouska_id);

CREATE TABLE student_kurz (
    student_id INTEGER NOT NULL,
    kurz_id INTEGER NOT NULL
);
ALTER TABLE student_kurz ADD CONSTRAINT pk_student_kurz PRIMARY KEY (student_id, kurz_id);

CREATE OR REPLACE FUNCTION kontrola_limitu_zkousek() RETURNS trigger AS $$
DECLARE
    pocet INTEGER;
BEGIN
    SELECT COUNT(*) INTO pocet
    FROM zkouska
    WHERE student_id = NEW.student_id;

    IF pocet >= 3 THEN
        RAISE EXCEPTION 'Student již absolvoval 3 zkoušky – další pokus není povolen.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER limit_zkousek_trigger
BEFORE INSERT ON zkouska
FOR EACH ROW
EXECUTE FUNCTION kontrola_limitu_zkousek();

ALTER TABLE dochazka ADD CONSTRAINT fk_dochazka_student FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE dochazka ADD CONSTRAINT fk_dochazka_teoreticka_vyuka FOREIGN KEY (teoreticka_vyuka_id) REFERENCES teoreticka_vyuka (teoreticka_vyuka_id) ON DELETE CASCADE;

ALTER TABLE instruktor ADD CONSTRAINT fk_instruktor_vozidlo FOREIGN KEY (vozidlo_id) REFERENCES vozidlo (vozidlo_id) ON DELETE CASCADE;

ALTER TABLE platba ADD CONSTRAINT fk_platba_student FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;

ALTER TABLE prakticka ADD CONSTRAINT fk_prakticka_zkouska FOREIGN KEY (zkouska_id) REFERENCES zkouska (zkouska_id) ON DELETE CASCADE;

ALTER TABLE prakticka_vyuka ADD CONSTRAINT fk_prakticka_vyuka_student FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;

ALTER TABLE student ADD CONSTRAINT fk_student_instruktor FOREIGN KEY (instruktor_id) REFERENCES instruktor (instruktor_id) ON DELETE CASCADE;

ALTER TABLE teoreticka_vyuka ADD CONSTRAINT fk_teoreticka_vyuka_instruktor FOREIGN KEY (instruktor_id) REFERENCES instruktor (instruktor_id) ON DELETE CASCADE;

ALTER TABLE teorie ADD CONSTRAINT fk_teorie_zkouska FOREIGN KEY (zkouska_id) REFERENCES zkouska (zkouska_id) ON DELETE CASCADE;

ALTER TABLE zkouska ADD CONSTRAINT fk_zkouska_student FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;

ALTER TABLE student_kurz ADD CONSTRAINT fk_student_kurz_student FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE student_kurz ADD CONSTRAINT fk_student_kurz_kurz FOREIGN KEY (kurz_id) REFERENCES kurz (kurz_id) ON DELETE CASCADE;