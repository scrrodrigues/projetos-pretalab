-- Pergunta 1: Qual é a área total desmatada por bioma em um município específico?

SELECT id_municipio, bioma, SUM(desmatado) AS area_total_desmatada
FROM `basedosdados.br_inpe_prodes.municipio_bioma`
WHERE id_municipio = "1707207"
GROUP BY bioma, id_municipio;

-- Pergunta 2: Qual é o bioma com a maior área desmatada em um Município específico?

SELECT id_municipio, bioma, SUM(desmatado) AS area_total_desmatada
FROM `basedosdados.br_inpe_prodes.municipio_bioma`
WHERE id_municipio = "1707207"
GROUP BY bioma, id_municipio
ORDER BY area_total_desmatada DESC;

-- Pergunta 3: Qual foi a tendência de desmatamento ao longo dos anos em um bioma específico?

SELECT ano, bioma, SUM(desmatado) AS area_total_desmatada
FROM `basedosdados.br_inpe_prodes.municipio_bioma`
WHERE bioma = "Amazônia"
GROUP BY bioma, ano
ORDER BY area_total_desmatada DESC;

-- Pergunta 4: Qual é a média de desmatamento anual por bioma?

SELECT ano, bioma, AVG(desmatado) AS media_da_area_desmatada
FROM `basedosdados.br_inpe_prodes.municipio_bioma`
GROUP BY bioma, ano
ORDER BY ano DESC;

-- Pergunta 5: Quais municípios apresentaram aumento no desmatamento em um ano específico?

-- Opção 1:
SELECT ano, id_municipio, bioma, SUM(desmatado) AS area_desmatada_em_2020
FROM `basedosdados.br_inpe_prodes.municipio_bioma`
WHERE ano = 2020
GROUP BY id_municipio, bioma, ano
ORDER BY area_desmatada_em_2020 DESC;

-- Opção 2:
SELECT id_municipio,bioma, ano,
   SUM(CASE WHEN ano = 2020 THEN desmatado ELSE 0 END) AS desmatamento_2020,
   SUM(CASE WHEN ano = 2019 THEN desmatado ELSE 0 END) AS desmatamento_2019,
   SUM(CASE WHEN ano = 2020 THEN desmatado ELSE 0 END) - SUM(CASE WHEN ano = 2019 THEN desmatado ELSE 0 END) AS aumento_desmatamento
FROM `basedosdados.br_inpe_prodes.municipio_bioma`
WHERE ano IN (2019, 2020)
GROUP BY id_municipio, bioma, ano
ORDER BY aumento_desmatamento DESC;

-- Pergunta 6: Qual bioma teve o menor desmatamento em um determinado ano?

SELECT ano, id_municipio, bioma, SUM(desmatado) AS area_desmatada_em_2021
FROM `basedosdados.br_inpe_prodes.municipio_bioma`
WHERE ano = 2021
GROUP BY id_municipio, bioma, ano
ORDER BY area_desmatada_em_2021 ASC
Limit 1;

-- Pergunta 7: Qual a distribuição do desmatamento por bioma em um gráfico?

SELECT  bioma, SUM(desmatado) AS area_desmatada
FROM `basedosdados.br_inpe_prodes.municipio_bioma`
GROUP BY bioma
ORDER BY bioma ASC; --ORDER BY area_desmatada DESC;


-- Pergunta 8: Quais municípios tiveram a maior área desmatada no último ano disponível?

SELECT  id_municipio, SUM(desmatado) AS area_desmatada
FROM `basedosdados.br_inpe_prodes.municipio_bioma`
WHERE ano = 2022
GROUP BY id_municipio
ORDER BY area_desmatada DESC;
