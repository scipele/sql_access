/*| Item	       | Main Program Documentation Notes                            |
  |--------------|-------------------------------------------------------------|
  | Filename     | comparison.sql                                              |
  | Purpose      | shows side by side comparison of joined and each table      |
  | By Name,Date | T.Sciple, 04/20/2025                                       */

-- Option 1 - Comparison with reference sequential number and ID's from tables 'ta' and 'tb'
SELECT 
    (
        SELECT COUNT(*) + 1 
        FROM (
            SELECT DISTINCT ta.fa AS fu FROM ta
            UNION
            SELECT DISTINCT tb.fb AS fu FROM tb
        ) AS qu2 
        WHERE qu2.fu < qu.fu
    ) AS q_id,
    qu.fu,
    ta.id_a,
    ta.fa,
    tb.id_b,
    tb.fb
FROM (
    (SELECT DISTINCT ta.fa AS fu FROM ta
     UNION
     SELECT DISTINCT tb.fb AS fu FROM tb) AS qu
    LEFT JOIN ta ON ta.fa = qu.fu
) 
LEFT JOIN tb ON tb.fb = qu.fu
ORDER BY qu.fu;


-- Option 2 - Comparison with any ID's from tables 'ta' and 'tb'
SELECT DISTINCT qu.fu, ta.fa, tb.fb FROM
    (
        (   
            SELECT DISTINCT ta.fa AS fu FROM ta
            UNION
            SELECT DISTINCT tb.fb AS fu FROM tb
        )  AS qu
        LEFT JOIN ta ON ta.fa = qu.fu
    )
    LEFT JOIN tb ON tb.fb = qu.fu
	ORDER BY qu.fu;