SELECT 
  * 
FROM `vivid-science-452722-u2.landing.ld_empresas_simples` 
WHERE optante_simei IS NOT NULL 
AND optante_simples IS NOT NULL 
AND LENGTH(CAST(cnpj AS STRING)) = 14