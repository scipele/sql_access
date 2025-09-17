/*| Item	       | Main Program Documentation Notes                            |
  |--------------|-------------------------------------------------------------|
  | Filename     | comparison.sql                                              |
  | Purpose      | shows side by side comparison of joined and each table      |
  | By Name,Date | T.Sciple, 09/16/2025                                       */

/* 1. Create Two Tables to use for the example */
CREATE TABLE ta(fa TEXT);
INSERT INTO ta VALUES('Iso_1001'), ('Iso_1002'), ('Iso_1003'), ('Iso_1005'), ('Iso_1006');

CREATE TABLE tb(fb TEXT);
INSERT INTO tb VALUES('Iso_1001'),('Iso_1002'),('Iso_1004'),('Iso_1005'),('Iso_1007');


/* 2. Union query embedded inside of two joins */
SELECT DISTINCT
    qu.fu,
    ta.fa,
    tb.fb
FROM
    (
        (
            SELECT DISTINCT ta.fa AS fu FROM ta
            UNION
            SELECT DISTINCT tb.fb AS fu FROM tb
        ) AS qu
        LEFT JOIN ta ON ta.fa = qu.fu
    )
    LEFT JOIN tb ON tb.fb = qu.fu;


/* 3. Alternate query that shows the ID numbers of the related fa/fb fields for reference indicating the original order in the tables */
SELECT DISTINCT
    qu.fu,
    ta.id_a,  /* <--- added id field */
    ta.fa,
    tb.id_b,  /* <--- added id field */
    tb.fb
FROM
    (
        (
            SELECT DISTINCT ta.fa AS fu FROM ta
            UNION
            SELECT DISTINCT tb.fb AS fu FROM tb
        ) AS qu
        LEFT JOIN ta ON ta.fa = qu.fu
    )
    LEFT JOIN tb ON tb.fb = qu.fu;