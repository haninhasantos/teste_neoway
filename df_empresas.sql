SELECT 
  * 
FROM `vivid-science-452722-u2.landing.ld_df_empresas` 
WHERE LENGTH(CAST(cnpj AS STRING)) = 14
