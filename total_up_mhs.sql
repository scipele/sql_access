SELECT
    e.estim_id,
    e.supt_mh,
    q.er_spl_mhs,
    q.bw_mhs,
    (e.supt_mh+q.er_spl_mhs+q.bw_mhs) as tot_mh
FROM
    est_data AS e
JOIN
    (SELECT estim_id, 
     SUM(er_spl_mhs) AS er_spl_mhs,
     SUM(bw_mhs) AS bw_mhs
     FROM qtys GROUP BY estim_id) AS q
ON
    e.estim_id = q.estim_id;
