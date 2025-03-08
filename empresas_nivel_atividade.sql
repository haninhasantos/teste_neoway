SELECT 
  * 
FROM `vivid-science-452722-u2.landing.ld_empresas_nivel_atividade` 
WHERE nivel_atividade IS NOT NULL 
AND LENGTH(CAST(CNPJ AS STRING)) = 14

