
WITH cte AS (
    SELECT 
      COUNT(cnpj)  empresas  
    ,IF(optante_simei IS TRUE, 'Sim', 'Não') simei
    ,IF(optante_simples IS TRUE, 'Sim', 'Não') simples
    FROM `vivid-science-452722-u2.bronze.bz_empresas_simples_final`
    GROUP BY simei, simples
)
SELECT 
    ROW_NUMBER() OVER () AS id_sequencial
    ,cte.simei
    ,cte.simples
FROM cte;
