
-- Puede usar la cláusula GROUP BY para subdividir el
-- contenido de esta tabla virtual en grupos de filas.

-- GROUP BY crea grupos y coloca filas en cada grupo según
-- lo determinado por los elementos especificados en la cláusula.

-- La consulta siguiente dará como resultado un conjunto de
-- filas agrupadas, una fila por CustomerID en la tabla 
-- Sales.SalesOrderHeader. Otra manera de ver el proceso GROUP BY
-- es que todas las filas con el mismo valor para CustomerID
-- se agruparán y se devolverán en una sola fila de resultado.
SELECT CustomerID
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

-- La consulta anterior es equivalente a la consulta siguiente:
SELECT DISTINCT CustomerID
FROM Sales.SalesOrderHeader

-- Para cada valor CustomerID, la consulta agrega y cuenta las
-- filas, por lo que el resultado nos muestra cuántas filas
-- de la tabla SalesOrderHeader pertenecen a cada cliente.
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

--Si necesita ordenar los resultados, debe incluir 
-- explícitamente una cláusula ORDER:
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY CustomerID;

-- Puede hacer referencia a un alias de columna en la cláusula ORDER BY,
-- pero no en la cláusula GROUP BY. La consulta siguiente producirá
-- un error de nombre de columna no válido:
SELECT CustomerID AS Customer,
       COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY Customer
ORDER BY Customer;
-- Sin embargo, la consulta siguiente se realizará correctamente,
-- agrupando y ordenando los resultados por el identificador de cliente.
SELECT CustomerID AS Customer,
       COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY Customer;

-- Solución de errores GROUP BY
-- Se permite la consulta siguiente porque cada columna de la lista
-- SELECT es una columna de la cláusula GROUP BY o una función
-- de agregado que funciona en cada grupo:
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;

-- La consulta siguiente devolverá un error porque PurchaseOrderNumber
-- no forma parte de GROUP BY y no se usa con una función de agregado.
SELECT CustomerID, PurchaseOrderNumber, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID;
-- Esta consulta devuelve un error
-- Si desea ver los pedidos por identificador de cliente y por
-- pedido de compra, puede agregar la columna PurchaseOrderNumber
-- a la cláusula GROUP BY, como se muestra a continuación:
SELECT CustomerID, PurchaseOrderNumber, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader
GROUP BY CustomerID, PurchaseOrderNumber;
-- Esta consulta devolverá una fila por cada cliente y cada combinación
-- de pedido de compra, junto con el recuento de pedidos de esa combinación.



