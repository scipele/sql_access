/*| Item	       | Main Program Documentation Notes                            |
  |--------------|-------------------------------------------------------------|
  | Filename     | comparison.sql                                              |
  | Purpose      | shows side by side comparison of joined and each table      |
  | By Name,Date | T.Sciple, 04/20/2025                                       */

-- Step 1 Create query of the joined tables, and save as a_un
SELECT .fld FROM ta
UNION
SELECT tb.fld FROM tb;


-- Step 2 Next create two separate left joins of the union above and each of 
-- the original tables
SELECT tu.fld, ta.[fld], tb.[fld]
FROM    (
        a_un
        LEFT JOIN ta
        ON tu.fld=ta.[fld]
        )
    LEFT JOIN tb
    ON tu.fld=tb.[fld];


-- Step 3. Try this where union is embedded

SELECT tu.fld, ta.[fld], tb.[fld]
FROM (
    SELECT ta.fld FROM ta
    UNION
    SELECT tb.fld FROM tb
) AS tu
LEFT JOIN ta ON tu.fld = ta.[fld]
LEFT JOIN tb ON tu.fld = tb.[fld];
