SELECT 
  * 
FROM `vivid-science-452722-u2.landing.ld_empresas_porte` 
WHERE LENGTH(CAST(cnpj AS STRING)) = 14
AND empresa_porte IS NOT NULL 

