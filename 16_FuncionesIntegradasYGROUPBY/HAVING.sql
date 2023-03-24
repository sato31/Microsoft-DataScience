
-- Filtro de grupos con HAVING
-- La cláusula HAVING actúa como filtro en los grupos.
-- Esto es similar a la forma en que la cláusula WHERE actúa
-- como filtro en las filas devueltas por la cláusula FROM.

-- Se cuentan los pedidos de cada cliente y se filtran los
-- resultados para incluir solo los clientes que han realizado
-- más de 10 pedidos:
SELECT CustomerID,
      COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*) > 10;

-- Comparación de HAVING con WHERE
-- Una cláusula HAVING se procesa después de GROUP BY y solo
-- funciona en grupos, no en filas de detalles. En resumen:
--  - Una cláusula WHERE filtra las filas antes de formar grupos
--  - Una cláusula HAVING filtra grupos completos y normalmente 
--    examina los resultados de una agregación.
