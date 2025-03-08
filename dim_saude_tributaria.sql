WITH cte AS (
    SELECT DISTINCT saude_tributaria 
    FROM `vivid-science-452722-u2.bronze.bz_empresas_saude_tributaria`
)
SELECT 
    ROW_NUMBER() OVER () AS id_sequencial, 
    saude_tributaria
FROM cte;