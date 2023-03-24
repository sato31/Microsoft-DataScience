-- Subconsultas escalares
-- Una subconsulta escalar es una instrucción SELECT interna dentro
-- de una consulta externa, escrita para devolver un solo valor.

-- Desea recuperar los detalles del último pedido que se ha realizado, 
-- suponiendo que es el que tiene el valor SalesOrderID más alto. Para buscar
-- el valor SalesOrderID más alto, puede usar la consulta siguiente:
SELECT MAX(SalesOrderID)
FROM Sales.SalesOrderHeader
-- Esta consulta devuelve un valor único que indica el valor más alto de
-- OrderID en la tabla SalesOrderHeader.

-- Para obtener los detalles de este pedido, es posible que tenga que filtrar la tabla
-- SalesOrderDetails en función del valor devuelto por la consulta anterior. Puede
-- realizar esta tarea anidando la consulta para recuperar el valor máximo de SalesOrderID
-- dentro de la cláusula WHERE de una consulta que recupera los detalles del pedido.
SELECT SalesOrderID, ProductID, OrderQty
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = 
   (SELECT MAX(SalesOrderID)
    FROM Sales.SalesOrderHeader);

-- Una subconsulta escalar se puede usar en cualquier lugar de una consulta
-- donde se espera un valor, incluida la lista SELECT.
-- Se puede ampliar la consulta anterior para incluir la cantidad media de 
-- elementos que se pide, de modo que podamos comparar la cantidad pedida
-- en el pedido más reciente con la media de todos los pedidos.
SELECT SalesOrderID, ProductID, OrderQty,
    (SELECT AVG(OrderQty)
     FROM SalesLT.SalesOrderDetail) AS AvgQty
FROM SalesLT.SalesOrderDetail
WHERE SalesOrderID = 
    (SELECT MAX(SalesOrderID)
     FROM SalesLT.SalesOrderHeader);

-- Subconsultas multivalor
-- Una subconsulta multivalor es adecuada para devolver resultados mediante
-- el operador IN. En el ejemplo siguiente se devuelven los valores CustomerID y
-- SalesOrderID de todos los pedidos realizados por los clientes de Canadá.
SELECT CustomerID, SalesOrderID
FROM Sales.SalesOrderHeader
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Sales.Customer
    WHERE CountryRegion = 'Canada');
--  Si ejecutara solo la consulta interna, se devolvería una columna de valores
-- CustomerID, con una fila para cada cliente de Canadá.

-- Las subconsultas multivalor se pueden escribir fácilmente mediante combinaciones.
-- Por ejemplo, esta consulta usa una combinación para devolver los mismos resultados
-- del ejemplo anterior:
SELECT c.CustomerID, o.SalesOrderID
FROM Sales.Customer AS c
JOIN Sales.SalesOrderHeader AS o
    ON c.CustomerID = o.CustomerID
WHERE c. CountryRegion = 'Canada';

