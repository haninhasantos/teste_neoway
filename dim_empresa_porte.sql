
WITH cte AS (
    SELECT DISTINCT empresa_porte 
    FROM `vivid-science-452722-u2.bronze.bz_empresa_porte`
)
SELECT 
    ROW_NUMBER() OVER () AS id_sequencial, 
    empresa_porte
FROM cte;
