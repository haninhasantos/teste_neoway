WITH cotacoes AS (
  SELECT 
  cd_acao_rdz
  ,COUNT(DISTINCT cd_acao) acoes
  ,MIN(dt_pregao) primeiro_pregao
  ,MAX(dt_pregao) ult_pregao
  ,MIN(vl_abertura) menor_abertura
  ,MAX(vl_abertura) maior_abertura
  ,MIN(vl_fechamento) menor_fechamento
  ,MAX(vl_fechamento) maior_fechamento
  ,SUM(qt_tit_neg) total_tit_neg
FROM `vivid-science-452722-u2.bronze.bz_cotacoes_bolsa` 
WHERE dt_pregao >= 20210901
AND dt_pregao < 20220701
GROUP BY  cd_acao_rdz
)

SELECT 
   emp_bolsa.vl_cnpj
  ,emp_bolsa.segmento_b3
  ,emp_bolsa.segmento
  ,emp_bolsa.cd_acao
  ,emp_bolsa.subsetor
  ,emp_bolsa.setor_economico 
  ,emp_bolsa.nm_empresa
  ,emp_bolsa.cd_acao_rdz
  ,df.de_cnae_principal
  ,df.endereco_regiao
  ,df.endereco_uf
  ,acoes
  ,primeiro_pregao
  ,ult_pregao
  ,menor_abertura
  ,maior_abertura
  ,menor_fechamento
  ,maior_fechamento
  ,total_tit_neg
  ,dim_simples.id_sequencial dim_simples_id
  ,dim_saude.id_sequencial dim_saude_id
  ,dim_atividade.id_sequencial dim_atividade_id
  ,dim_porte.id_sequencial dim_porte_id
FROM  `vivid-science-452722-u2.bronze.bz_df_empresas` df 
INNER JOIN `vivid-science-452722-u2.bronze.bz_empresas_simples_final` simples 
  ON df.cnpj = simples.cnpj 
INNER JOIN `vivid-science-452722-u2.fato.dim_simples_simei` dim_simples 
  ON IF(simples.optante_simei IS TRUE, 'Sim', 'Não') = dim_simples.simei
     AND IF(simples.optante_simples IS TRUE, 'Sim', 'Não') = dim_simples.simples
INNER JOIN `vivid-science-452722-u2.bronze.bnz_empresas_nivel_atividade` atividade 
  ON df.cnpj = atividade.cnpj 
INNER JOIN `vivid-science-452722-u2.fato.dim_nivel_atividade` dim_atividade 
  ON atividade.nivel_atividade = dim_atividade.nivel_atividade 
INNER JOIN `vivid-science-452722-u2.bronze.bnz_empresas_bolsa` emp_bolsa
  ON df.cnpj = emp_bolsa.vl_cnpj 
INNER JOIN `vivid-science-452722-u2.bronze.bz_empresas_saude_tributaria` saude
  ON df.cnpj = saude.cnpj 
INNER JOIN `vivid-science-452722-u2.fato.dim_saude_tributaria` dim_saude
  ON saude.saude_tributaria = dim_saude.saude_tributaria 
INNER JOIN `vivid-science-452722-u2.bronze.bz_empresa_porte` porte 
  ON df.cnpj = porte.cnpj 
INNER JOIN `vivid-science-452722-u2.fato.dim_empresa_porte`dim_porte
  ON dim_porte.empresa_porte = porte.empresa_porte
LEFT JOIN cotacoes 
  ON cotacoes.cd_acao_rdz = emp_bolsa.cd_acao_rdz