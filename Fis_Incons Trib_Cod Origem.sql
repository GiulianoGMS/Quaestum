SELECT DISTINCT G.SEQPRODUTO CODIGO_PRODUTO, A.DESCCOMPLETA DESCRICAO,
                'Trib.: IMP - Codigo Origem: '||CODORIGEMTRIB TRIBUTACAO_INCONSISTENTE

FROM CONSINCO.MAD_PEDVENDAITEM G INNER JOIN CONSINCO.MAD_PEDVENDA   H ON H.NROPEDVENDA   = G.NROPEDVENDA
                                 INNER JOIN CONSINCO.MAP_PRODUTO    A ON A.SEQPRODUTO    = G.SEQPRODUTO
                                 INNER JOIN CONSINCO.MAP_FAMDIVISAO B ON B.SEQFAMILIA    = A.SEQFAMILIA
                                 INNER JOIN CONSINCO.MAP_TRIBUTACAO C ON B.NROTRIBUTACAO = C.NROTRIBUTACAO
                                                          
WHERE H.SITUACAOPED NOT IN ('F', 'C') 
/*AND G.NROEMPRESA  = VARIAVEL_LOJA    << Campo utilizado para filtro 
  AND G.NROPEDVENDA = VARIAVEL_PEDIDO  << Campo utilizado para filtro */
  AND (UPPER(TRIBUTACAO) LIKE '%IMP%'      AND CODORIGEMTRIB IN (0,4,5,6,7) AND UPPER(TRIBUTACAO) NOT LIKE '%LIMP%'
   OR  UPPER(TRIBUTACAO) LIKE '%IMP.LIMP%' AND CODORIGEMTRIB IN (0,4,5,6,7)) ;
