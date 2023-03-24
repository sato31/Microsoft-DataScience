-- CHALLENGES

-- CHALLENGE 1: Recuperar la información de envío del pedido
-- El director de operaciones desea informes sobre el envío de pedidos
-- basados en los datos de la tabla SalesLT.SalesOrderHeader.

-- 1. Recupere el ID del pedido y el costo de flete de cada pedido.
-- Escriba una consulta para devolver el ID de pedido para cada pedido,
-- junto con el valor de Freight redondeado a dos decimales en una
-- columna denominada FreightCost.
SELECT SalesOrderID, 
       ROUND(Freight, 2) AS FreightCost
FROM SalesLT.SalesOrderHeader;

-- 2. Añade el método de envío.
-- Amplíe la consulta para incluir una columna denominada ShippingMethod
-- que contenga el campo ShipMethod, con formato en minúsculas.
SELECT SalesOrderID,
       ROUND(Freight, 2) AS FreightCost,
       LOWER(ShipMethod) AS ShippingMethod
FROM SalesLT.SalesOrderHeader;

-- 3. Añade los detalles de la fecha de envío.
-- Amplíe la consulta para incluir columnas denominadas ShipYear,
-- ShipMonth y ShipDay que contengan el año, el mes y el día de 
-- ShipDate. El valor ShipMonth debe mostrarse como el nombre del mes
-- (por ejemplo, June)
SELECT SalesOrderID,
       ROUND(Freight, 2) AS FreightCost,
       LOWER(ShipMethod) AS ShippingMethod,
       YEAR(ShipDate) AS ShipYear,
       DATENAME(mm,ShipDate) AS ShipMonth,
       DAY(ShipDate) AS ShipDay
FROM SalesLT.SalesOrderHeader;


-- CHALLENGE 2: Ventas agregadas de productos
-- El gerente de ventas desea informes que incluyan información agregada
-- sobre las ventas de productos.

-- 1. Recuperar ventas totales por producto
-- Escriba una consulta para recuperar una lista de los nombres de producto
-- de la tabla SalesLT.Product y los ingresos totales de cada producto 
-- calculados como la suma de LineTotal de la tabla SalesLT.SalesOrderDetail,
-- con los resultados ordenados en orden descendente de ingresos totales.
SELECT p.Name, SUM(sa.LineTotal) AS IngresosTotales
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sa
    ON p.ProductID = sa.ProductID
GROUP BY p.Name
ORDER BY IngresosTotales DESC;

-- 2. Filtrar la lista de ventas de productos para incluir solo productos
-- que cuesten más de 1.000
-- Modifique la consulta anterior para incluir los totales de ventas de
-- productos que tienen un precio de lista de más de 1000.
SELECT p.Name, SUM(sa.LineTotal) AS IngresosTotales
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sa
    ON p.ProductID = sa.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
ORDER BY IngresosTotales DESC;

-- 3. Filtrar los grupos de ventas de productos para incluir solo las ventas
-- totales superiores a 20.000
-- Modifique la consulta anterior para incluir solo grupos de productos con
-- un valor total de ventas superior a 20.000.
SELECT p.Name, SUM(sa.LineTotal) AS IngresosTotales
FROM SalesLT.Product AS p
JOIN SalesLT.SalesOrderDetail AS sa
    ON p.ProductID = sa.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
HAVING SUM(sa.LineTotal) > 20000
ORDER BY IngresosTotales DESC;





