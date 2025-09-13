/*| Item	       | Main Program Documentation Notes                            |
  |--------------|-------------------------------------------------------------|
  | Filename     | comparison.sql                                              |
  | Purpose      | shows side by side comparison of joined and each table      |
  | By Name,Date | T.Sciple, 04/20/2025                                       */

-- Step 1 Create query of the joined tables, and save as a_un
SELECT tb1.fld FROM tb1
UNION
SELECT tb2.fld FROM tb2;


-- Step 2 Next create two separate left joins of the union above and each of 
-- the original tables
SELECT a_un.fld, tb1.[fld], tb2.[fld]
FROM    (
        a_un
        LEFT JOIN tb1
        ON a_un.fld=tb1.[fld]
        )
    LEFT JOIN tb2
    ON a_un.fld=tb2.[fld];


-- Step 3. Try this where union is embedded

SELECT a_un.fld, tb1.[fld], tb2.[fld]
FROM (
    SELECT tb1.fld FROM tb1
    UNION
    SELECT tb2.fld FROM tb2
) AS a_un
LEFT JOIN tb1 ON a_un.fld = tb1.[fld]
LEFT JOIN tb2 ON a_un.fld = tb2.[fld];
