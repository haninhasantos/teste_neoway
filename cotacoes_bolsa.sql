SELECT 
  *
FROM `vivid-science-452722-u2.landing.ld_cotacoes_bolsa` 
WHERE cd_acao_rdz IS NOT NULL 
  AND tp_merc IS NOT NULL  
  AND nm_empresa_rdz IS NOT NULL
  AND tp_reg IS NOT NULL 
