WITH cte AS (
    SELECT DISTINCT nivel_atividade 
    FROM `vivid-science-452722-u2.bronze.bnz_empresas_nivel_atividade`
)
SELECT 
    ROW_NUMBER() OVER () AS id_sequencial, 
    nivel_atividade
FROM cte;
