/*| Item	       | Main Program Documentation Notes                            |
  |--------------|-------------------------------------------------------------|
  | Filename     | comparison.sql                                              |
  | Purpose      | shows side by side comparison of joined and each table      |
  | By Name,Date | T.Sciple, 09/13/2025                                       */

/* 1. Create Two Tables to use for the example */
CREATE TABLE ta(fa TEXT);
INSERT INTO ta VALUES('Iso_1001'), ('Iso_1002'), ('Iso_1003'), ('Iso_1005'), ('Iso_1006');

CREATE TABLE tb(fb TEXT);
INSERT INTO tb VALUES('Iso_1001'),('Iso_1002'),('Iso_1004'),('Iso_1005'),('Iso_1007');

/* 2. Union query embedded inside of two joins */
SELECT tu.fu, ta.fa, tb.fb
FROM (
    SELECT ta.fa AS fu FROM ta
    UNION
    SELECT tb.fb AS fu FROM tb
) AS tu
LEFT JOIN ta ON tu.fu = ta.fa
LEFT JOIN tb ON tu.fu = tb.fb;
