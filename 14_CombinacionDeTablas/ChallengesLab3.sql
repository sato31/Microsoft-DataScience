-- CHALLENGES

-- CHALLENGE 1: Generar informes de facturas
-- 1. Recuperar pedidos de clientes
-- Escriba una consulta que devuelva el nombre de la empresa de la tabla 
-- SalesLT.Customer y el identificador de pedido de ventas y 
-- el total adeudado de la tabla SalesLT.SalesOrderHeader.
SELECT cu.CompanyName, sa.SalesOrderID, sa.TotalDueFROM SalesLT.Customer AS cu
JOIN SalesLT.SalesOrderHeader AS sa
    ON cu.CustomerID = sa.CustomerID;
    
-- 2. Recuperar pedidos de clientes con direcciones
-- Amplíe su consulta de pedidos de clientes para incluir la dirección de la oficina principal
-- de cada cliente, incluida la dirección completa, la ciudad, el estado o la provincia,
-- el código postal y el país o región.
-- Consejo: Tenga en cuenta que cada cliente puede tener varios destinatarios en la tabla
-- SalesLT.Address, por lo que el desarrollador de la base de datos ha creado la tabla 
-- SalesLT.CustomerAddress para habilitar una relación de varios a varios entre clientes y
-- direcciones. La consulta deberá incluir ambas tablas y debe filtrar los resultados para
-- que solo se incluyan las direcciones de la oficina principal.
SELECT cu.CompanyName,    
    ad.AddressLine1,
    ISNULL(AddressLine2, '') AS AddressLine2,     
    ad.City,     
    ad.StateProvince,     
    ad.PostalCode,     
    ad.CountryRegion,    
    sa.SalesOrderID, 
    sa.TotalDue
FROM SalesLT.Customer AS cu
JOIN SalesLT.SalesOrderHeader AS sa
    ON cu.CustomerID = sa.CustomerID
JOIN SalesLT.CustomerAddress AS ca
    ON sa.CustomerID = ca.CustomerID
JOIN SalesLT.Address AS ad
    ON ca.AddressID = AD.AddressID
WHERE ca.AddressType = 'Main Office';

-- CHALLENGE 2: Recuperar datos de clientes
-- 1. Recuperar una lista de todos los clientes y sus pedidos
-- El gerente de ventas quiere una lista de todas las empresas clientes y sus contactos
-- (nombre y apellido), mostrando el ID del pedido de ventas y el total adeudado por 
-- cada pedido que han realizado. Los clientes que no hayan realizado ningún pedido 
-- deben incluirse en la parte inferior de la lista con valores NULL para el ID del
-- pedido y el total adeudado.
SELECT cu.CompanyName, cu.FirstName, cu.LastName, 
    sa.SalesOrderID, sa.TotalDue
FROM SalesLT.Customer AS cu
LEFT JOIN SalesLT.SalesOrderHeader AS sa 
    ON cu.CustomerID = sa.CustomerID
ORDER BY sa.SalesOrderID DESC;

-- 2. Recuperar una lista de clientes sin dirección
-- Devuelva una lista de ID de cliente, nombres de compañías, nombres de contacto 
-- (nombre y apellido) y números de teléfono para clientes sin dirección almacenada 
-- en la base de datos.
SELECT cu.CustomerID, cu.CompanyName, cu.FirstName, cu.LastName, cu.Phone
FROM SalesLT.Customer AS cu
LEFT JOIN SalesLT.CustomerAddress AS ca
    ON cu.CustomerID = ca.CustomerID
WHERE ca.AddressID IS NULL;

-- CHALLENGE 3: Crear un catálogo de productos
-- 1. Recuperar información del producto por categoría
-- El catálogo de productos enumerará los productos por categoría principal y subcategoría,
-- por lo que debe escribir una consulta que recupere los campos nombre de la categoría
-- principal, el nombre de la subcategoría y el nombre del producto para el catálogo.
SELECT pc.Name AS CategoríaPrincipal,
    cat.Name AS SubCategoria,
    p.Name AS Producto
FROM SalesLT.ProductCategory AS pc
JOIN SalesLT.ProductCategory AS cat
    ON pc.ProductCategoryID = cat.ParentProductCategoryID
JOIN SalesLT.Product AS p 
    ON p.ProductCategoryID = cat.ProductCategoryID
ORDER BY CategoríaPrincipal, SubCategoria, Producto;