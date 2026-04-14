--LIST STUDENTS ENROLLED IN CATEGORY 'B' COURSES

SELECT DISTINCT student_id, jmeno, telefon, bydliste
FROM (
    SELECT DISTINCT student_id, instruktor_id, jmeno, telefon, bydliste
    FROM STUDENT
    NATURAL JOIN (
        SELECT DISTINCT kurz_id, datum_zapisu, kategorie
        FROM (
            SELECT DISTINCT * FROM KURZ WHERE kategorie = 'B'
        ) R1
        NATURAL JOIN STUDENT_KURZ
    ) R2
) R3;

-- STUDENTS WHO PASSED THE THEORY EXAM ON THEIR FIRST ATTEMPT
SELECT DISTINCT student_id, jmeno
FROM (
    SELECT DISTINCT student_id, instruktor_id, jmeno, telefon, bydliste
    FROM STUDENT
    NATURAL JOIN (
        SELECT DISTINCT zkouska_id, pokus
        FROM (
            SELECT DISTINCT * FROM TEORIE WHERE pokus = '1'
        ) R1
        NATURAL JOIN (
            SELECT DISTINCT * FROM ZKOUSKA WHERE vysledek = 'uspěl'
        ) R2
    ) R3
) R4;

-- ACTIVE INSTRUCTORS

SELECT DISTINCT i.instruktor_id, i.jmeno
FROM instruktor i
WHERE EXISTS (
    SELECT 1
    FROM teoreticka_vyuka t
    WHERE t.instruktor_id = i.instruktor_id
)
AND EXISTS (
    SELECT 1
    FROM student s
    JOIN prakticka_vyuka pv ON s.student_id = pv.student_id
    WHERE s.instruktor_id = i.instruktor_id
);

-- OVERVIEW OF VEHICLE ASSIGNMENTS
SELECT 
    v.registracni_znacka,
    v.znacka,
    v.model,
    STRING_AGG(i.jmeno, ', ') AS assigned_instructors
FROM vozidlo v
LEFT JOIN instruktor i ON v.vozidlo_id = i.vozidlo_id
GROUP BY v.vozidlo_id, v.registracni_znacka, v.znacka, v.model;
