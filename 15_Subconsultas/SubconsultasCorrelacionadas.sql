-- Las subconsultas independientes se pueden escribir como consultas 
-- independientes, sin dependencias de la consulta externa. Una subconsulta 
-- independiente se procesa una vez, cuando la consulta externa se ejecuta y
--  pasa sus resultados a esa consulta externa.

-- Las subconsultas correlacionadas hacen referencia a una o varias columnas
-- de la consulta externa y, por tanto, dependen de ella. Las subconsultas 
-- correlacionadas no se pueden ejecutar por separado desde la consulta externa.

-- En el ejemplo siguiente se usa una subconsulta correlacionada para devolver el
-- pedido más reciente de cada cliente. La subconsulta hace referencia a la consulta
-- externa y hace referencia a su valor CustomerID en su cláusula WHERE. Para cada
-- fila de la consulta externa, la subconsulta busca el identificador de pedido máximo
-- del cliente al que se hace referencia en esa fila y la consulta externa comprueba
-- si la fila que se está analizando es la fila con ese identificador de pedido.
SELECT SalesOrderID, CustomerID, OrderDate
FROM SalesLT.SalesOrderHeader AS o1
WHERE SalesOrderID =
    (SELECT MAX(SalesOrderID)
     FROM SalesLT.SalesOrderHeader AS o2
     WHERE o2.CustomerID = o1.CustomerID)
ORDER BY CustomerID, OrderDate;

