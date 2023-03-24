-- Subconsultas simples
-- Una subconsulta es una consulta anidada dentro de otra consulta.
-- La subconsulta a menudo se denomina consulta interna y la consulta
-- dentro de la cual se anida se denomina consulta externa.

-- El precio más alto por el que se ha vendido un producto individual
SELECT MAX(UnitPrice)
FROM SalesLT.SalesOrderDetail;

-- Usar la consulta anterior como una subconsulta en una consulta externa
-- que recupera productos con un ListPrice superior al precio de venta máximo
SELECT Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice >
    (SELECT MAX(UnitPrice)     
    FROM SalesLT.SalesOrderDetail);
    
-- Devuelve el ProductID para cada producto que se ha pedido en cantidades de 20 o más
SELECT DISTINCT ProductID
FROM SalesLT.SalesOrderDetail
WHERE OrderQty >= 20;

-- Usar la consulta anterior en una subconsulta que busque los nombres de los productos
-- que se han pedido en cantidades de 20 o más.
SELECT Name FROM SalesLT.Product
WHERE ProductID IN
    (SELECT DISTINCT ProductID
     FROM SalesLT.SalesOrderDetail 
     WHERE OrderQty >= 20);

-- La siguiente consulta devuelve los mismos resultados pero se usa una combinacion
SELECT DISTINCT Name
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS o
    ON p.ProductID = o.ProductID
WHERE OrderQty >= 20;

-- Subconsultas correlacionadas
-- Es posible que deba usar una subconsulta interna que haga referencia a un valor
-- de la consulta externa. Conceptualmente, la consulta interna se ejecuta una vez
-- por cada fila devuelta por la consulta externa (razón por la cual las subconsultas
-- correlacionadas a veces se denominan subconsultas repetidas).

-- Obtener el ID de pedido, el ID de producto y la cantidad para cada venta de un producto.
SELECT od.SalesOrderID, od.ProductID, od.OrderQty
FROM SalesLT.SalesOrderDetail AS od
ORDER BY od.ProductID;

-- Modifique la consulta de la siguiente manera para filtrarla mediante una subconsulta
-- en la cláusula WHERE que recupera la cantidad máxima comprada para cada producto
-- recuperado por la consulta externa. Tenga en cuenta que la consulta interna hace 
-- referencia a un alias de tabla que se declara en la consulta externa.
SELECT od.SalesOrderID, od.ProductID, od.OrderQty
FROM SalesLT.SalesOrderDetail AS od
WHERE od.OrderQty =
    (SELECT MAX(OrderQty)
     FROM SalesLT.SalesOrderDetail AS d
     WHERE od.ProductID = d.ProductID)
ORDER BY od.ProductID;
-- Los resultados solo deben contener registros de pedidos de productos
-- para los que la cantidad pedida es la máxima pedida para ese producto.

-- Devuelve el ID de pedido, la fecha del pedido y el ID de cliente para
-- cada pedido que se ha realizado.
SELECT o.SalesOrderID, o.OrderDate, o.CustomerID
FROM SalesLT.SalesOrderHeader AS o
ORDER BY o.SalesOrderID;

-- Recuperar el nombre de la compañía para cada cliente mediante una 
-- subconsulta correlacionada en la cláusula SELECT.
SELECT o.SalesOrderID, o.OrderDate,  
    (SELECT CompanyName    
     FROM SalesLT.Customer AS c
     WHERE c.CustomerID = o.CustomerID) AS CompanyName
FROM SalesLT.SalesOrderHeader AS o
ORDER BY o.SalesOrderID;
-- Compruebe que se devuelve el nombre de la compañía para cada
-- cliente encontrado por la consulta externa.