
SELECT 
  * 
FROM `vivid-science-452722-u2.landing.ld_empresas_bolsa` 
WHERE vl_cnpj IS NOT NULL 
AND LENGTH(CAST(vl_cnpj AS STRING)) = 14
AND segmento_b3 IS NOT NULL  