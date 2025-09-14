-- Creating the ta_est_data table with additional fields
CREATE TABLE ta_est_data (
    id INT PRIMARY KEY,
    estim_no VARCHAR(10),
    project_title VARCHAR(100),
    status VARCHAR(20),
    cost_ar DECIMAL(10, 2),
    cost_mech DECIMAL(10, 2),
    cost_ei DECIMAL(10, 2)
);

-- Inserting sample data with some null values
INSERT INTO ta_est_data (id, estim_no, project_title, status, cost_ar, cost_mech, cost_ei) VALUES
(1, '25-1001', 'Alpha Project', 'Active', 1000.50, NULL, 750.25),
(2, '25-1002', 'Beta Project', 'Pending', NULL, 2000.75, 500.00),
(3, '25-1003', 'Gamma Project', 'Completed', 1500.00, 1200.00, NULL),
(4, '25-1004', 'Delta Project', 'Active', 800.00, 900.00, 1100.00),
(5, '25-1005', 'Epsilon Project', 'Draft', NULL, NULL, 300.50);

SELECT u.id, u.estim_no, u.cost_type, u.cost_amount, t.project_title, t.status
FROM (
    SELECT id, estim_no, 'AR' AS cost_type, cost_ar AS cost_amount
    FROM ta_est_data
    WHERE cost_ar IS NOT NULL
    UNION ALL
    SELECT id, estim_no, 'MECH' AS cost_type, cost_mech AS cost_amount
    FROM ta_est_data
    WHERE cost_mech IS NOT NULL
    UNION ALL
    SELECT id, estim_no, 'EI' AS cost_type, cost_ei AS cost_amount
    FROM ta_est_data
    WHERE cost_ei IS NOT NULL
) u
JOIN ta_est_data t ON u.id = t.id
ORDER BY u.estim_no;
