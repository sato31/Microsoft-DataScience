-- CHALLENGES

-- CHALLENGE 1: Recuperar información sobre el precio del producto
-- Cada producto de Adventure Works tiene un precio de costo estándar que
-- indica el costo de fabricación del producto y un precio de lista que indica
-- el precio de venta recomendado para el producto. Estos datos se almacenan en
-- la tabla SalesLT.Product. Cada vez que se pide un producto, el precio unitario
-- real al que se vendió también se registra en la tabla SalesLT.SalesOrderDetail.
-- Debe utilizar subconsultas para comparar el coste y los precios de lista de
-- cada producto con los precios unitarios cobrados en cada venta.

-- 1. Recuperar productos cuyo precio de lista sea superior al precio unitario medio.
--    Recupere el ID del producto, el nombre y el precio de lista de cada producto
--    en el que el precio de lista sea superior al precio unitario medio de todos
--    los productos que se han vendido.
--    Consejo: Utilice la función AVG para recuperar un valor medio.
SELECT ProductId, Name, ListPrice 
FROM SalesLT.Product
WHERE ListPrice >
    (SELECT AVG(UnitPrice)
     FROM SalesLT.SalesOrderDetail)
ORDER BY ProductID

-- 2. Recuperar productos con un precio de lista de 100 o más que se hayan vendido
--    por menos de 100.
--    Recupere el ID del producto, el nombre y el precio de lista de cada producto
--    en el que el precio de lista sea de 100 o más y el producto se haya vendido
--    por menos de 100.
SELECT ProductID, Name, ListPrice 
FROM SalesLT.Product
WHERE ProductID IN
    (SELECT ProductID
     FROM SalesLT.SalesOrderDetail
     WHERE UnitPrice < 100)
AND ListPrice > 100
ORDER BY ProductID;


-- CHALLENGE 2: Analizar la rentabilidad
-- El costo estándar de un producto y el precio unitario al que se vende
-- determinan su rentabilidad. Debe utilizar subconsultas correlacionadas 
-- para comparar el costo y el precio de venta promedio de cada producto.

-- 1. Recuperar el costo, el precio de lista y el precio de venta promedio
-- de cada producto
-- Recupere el ID del producto, el nombre, el costo y el precio de lista de
-- cada producto junto con el precio unitario promedio por el que se ha
-- vendido ese producto.
SELECT p.ProductID, p.Name, p.StandardCost, p.ListPrice,
    (SELECT AVG(sa.UnitPrice)
     FROM SalesLT.SalesOrderDetail AS sa
     WHERE p.ProductID = sa.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS p
ORDER BY p.ProductID;

-- 2. Recupere productos que tengan un precio de venta promedio que sea más
-- bajo que el costo.
-- Filtre su consulta anterior para incluir solo productos cuyo precio de 
-- coste sea superior al precio de venta medio.
SELECT p.ProductID, p.Name, p.StandardCost, p.ListPrice,
    (SELECT AVG(sa.UnitPrice)
     FROM SalesLT.SalesOrderDetail AS sa
     WHERE p.ProductID = sa.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS p
WHERE StandardCost >
    (SELECT AVG(sa.UnitPrice)
     FROM SalesLT.SalesOrderDetail AS sa
     WHERE p.ProductID = sa.ProductID)
ORDER BY p.ProductID;