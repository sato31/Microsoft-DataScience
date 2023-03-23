--INNER JOIN

-- Muestra los productos que pertenezcan a una categoria
SELECT SalesLT.Product.Name As ProductName, 
    SalesLT.ProductCategory.Name AS Category
FROM SalesLT.Product
INNER JOIN SalesLT.ProductCategory
    ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID;

-- Misma consulta omitiendo INNER
SELECT SalesLT.Product.Name As ProductName, 
    SalesLT.ProductCategory.Name AS Category
FROM SalesLT.Product
JOIN SalesLT.ProductCategory    
    ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID;

-- Añadiendo alias a las tablas
SELECT p.Name As ProductName, c.Name AS Category
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory As c    
    ON p.ProductCategoryID = c.ProductCategoryID;
    
-- Recuperar los datos de pedidos de las tablas SalesLT.SalesOrderHeader, 
-- SalesLT.SalesOrderDetail y SalesLT.Product:
SELECT oh.OrderDate, oh.SalesOrderNumber, p.Name As ProductName,
    od.OrderQty, od.UnitPrice, od.LineTotal
FROM SalesLT.SalesOrderHeader AS oh
JOIN SalesLT.SalesOrderDetail AS od
    ON od.SalesOrderID = oh.SalesOrderID
JOIN SalesLT.Product AS p    
    ON od.ProductID = p.ProductID
ORDER BY oh.OrderDate, oh.SalesOrderID, od.SalesOrderDetailID;


-- OUTER JOIN

-- Recuperar una lista de todos los clientes y cualquier pedido que hayan realizado,
-- incluidos los clientes que se han registrado pero nunca han realizado un pedido.
SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer AS c
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
    ON c.CustomerID = oh.CustomerID
ORDER BY c.CustomerID;

-- Quitando la palabra OUTER de la consulta:
SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS oh
    ON c.CustomerID = oh.CustomerID
ORDER BY c.CustomerID;

-- Devuelve solo los clientes que no han realizado ningún pedido
SELECT c.FirstName, c.LastName, oh.SalesOrderNumber
FROM SalesLT.Customer AS c
LEFT JOIN SalesLT.SalesOrderHeader AS oh
    ON c.CustomerID = oh.CustomerID
WHERE oh.SalesOrderNumber IS NULL 
ORDER BY c.CustomerID;

-- Recuperar datos de tres tablas distintas
SELECT p.Name As ProductName, oh.SalesOrderNumber
FROM SalesLT.Product AS p
LEFT JOIN SalesLT.SalesOrderDetail AS od
    ON p.ProductID = od.ProductID
LEFT JOIN SalesLT.SalesOrderHeader AS oh
    ON od.SalesOrderID = oh.SalesOrderID
ORDER BY p.ProductID;

-- Agregar una combinación interna para devolver información de categoría.
-- Al mezclar combinaciones internas y externas, puede ser útil ser explícito
-- acerca de los tipos de unión utilizando las palabras clave INNER y OUTER.
SELECT p.Name As ProductName, c.Name AS Category, oh.SalesOrderNumber
FROM SalesLT.Product AS p
LEFT OUTER JOIN SalesLT.SalesOrderDetail AS od
    ON p.ProductID = od.ProductID
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS oh
    ON od.SalesOrderID = oh.SalesOrderID
INNER JOIN SalesLT.ProductCategory AS c
    ON p.ProductCategoryID = c.ProductCategoryID
ORDER BY p.ProductID;

-- CROSS JOIN
-- Una combinación cruzada coincide con todas las combinaciones
-- posibles de filas de las tablas que se une.

-- Muestre los resultados que contienen una fila para cada combinación de productos y clientes
SELECT p.Name, c.FirstName, c.LastName, c.EmailAddress
FROM SalesLT.Product as p
CROSS JOIN SalesLT.Customer as c;

-- AUTOUNION
-- Es una técnica utilizada para unir una tabla a sí misma definiendo dos instancias 
-- de la tabla, cada una con su propio alias.

-- Por ejemplo, en una tabla de empleados donde el gerente de un empleado
-- también es un empleado, o una tabla de categorías de productos donde cada categoría
-- podría ser una subcategoría de otra categoría.

-- Combinación automática entre dos instancias de la tabla 
-- SalesLT.ProductCategory (con los alias cat y pcat)

SELECT pcat.Name AS ParentCategory, cat.Name AS SubCategory
FROM SalesLT.ProductCategory as cat
JOIN SalesLT.ProductCategory pcat
    ON cat.ParentProductCategoryID = pcat.ProductCategoryID
ORDER BY ParentCategory, SubCategory;
-- Los resultados reflejan la jerarquía de categorías principales y secundarias.