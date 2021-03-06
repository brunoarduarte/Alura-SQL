SELECT YEAR(DATA_VENDA) AS ano,
FLOOR(SUM(IMPOSTO * F.TOTAL)) AS valor_imposto
FROM notas_fiscais AS NF
INNER JOIN `vw_faturamento` AS F ON NF.NUMERO = F.NUMERO
GROUP BY ano HAVING ano = 2016;
