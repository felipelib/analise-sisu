#Análise Geral
SELECT 
 ROUND(AVG(nota_candidato), 2) nota_media, 
 ROUND(AVG(nota_corte), 2) nota_corte_media,
 ROUND(AVG(nota_corte), 2) - ROUND(AVG(nota_candidato), 2) as diferenca_notas, 
 ROUND(AVG(nota_l), 2) media_linguagens,
 ROUND(AVG(nota_ch), 2) media_humanas,
 ROUND(AVG(nota_cn), 2) media_naturezas,
 ROUND(AVG(nota_m), 2) media_matematica,
 ROUND(AVG(nota_r), 2) media_redacao, 
 ROUND(COUNT(CASE WHEN status_aprovado is true THEN 1 END)/COUNT(status_aprovado) * 100, 2) taxa_aprovacao
FROM `basedosdados.br_mec_sisu.microdados`;

#Evolução do Desempenho ao longo dos anos
SELECT 
 ano, 
 ROUND(AVG(nota_candidato), 2) nota_media,
 ROUND(AVG(nota_corte), 2) nota_corte_media,
 ROUND( ROUND(AVG(nota_corte), 2) - ROUND(AVG(nota_candidato), 2), 2) as diferenca_notas,
 ROUND(AVG(nota_l), 2) media_linguagens,
 ROUND(AVG(nota_ch), 2) media_humanas,
 ROUND(AVG(nota_cn), 2) media_naturezas,
 ROUND(AVG(nota_m), 2) media_matematica,
 ROUND(AVG(nota_r), 2) media_redacao,
 ROUND(COUNT(CASE WHEN status_aprovado is true THEN 1 END)/COUNT(status_aprovado) * 100, 2) taxa_aprovacao
FROM `basedosdados.br_mec_sisu.microdados`
GROUP BY ano
ORDER BY ano ASC;

#Desempenho por Estado
SELECT 
 COALESCE(sigla_uf_candidato, 'Estado não Informado') as estado,
 ROUND(AVG(nota_candidato), 2) nota_media,
 COUNT(CASE WHEN status_aprovado is true THEN 1 END) aprovacoes,
 ROUND(COUNT(CASE WHEN status_aprovado is true THEN 1 END)/COUNT(status_aprovado) * 100, 2) as taxa_aprovacao
FROM `basedosdados.br_mec_sisu.microdados`
GROUP BY estado;

#Análise por Sexo
SELECT 
 sexo, 
 COUNT(sexo) contagem, 
 ROUND(AVG(nota_l), 2) media_linguagens,
 ROUND(AVG(nota_ch), 2) media_humanas,
 ROUND(AVG(nota_cn), 2) media_naturezas,
 ROUND(AVG(nota_m), 2) media_matematica,
 ROUND(AVG(nota_r), 2) media_redacao,
 ROUND(AVG(nota_candidato), 2) nota_media,
 COUNT(CASE WHEN status_aprovado is true THEN 1 END) aprovacoes
FROM `basedosdados.br_mec_sisu.microdados`
GROUP BY sexo
ORDER BY aprovacoes DESC;











