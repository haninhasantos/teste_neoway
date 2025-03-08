SELECT 
  * 
FROM `vivid-science-452722-u2.landing.ld_empresas_saude_tributaria` 
WHERE saude_tributaria IS NOT NULL 
AND LENGTH(CAST(cnpj AS STRING)) = 14

