-- Ordenar resultados con ORDER BY
-- Ordenar productos por Nombre
SELECT Name, ListPrice 
FROM SalesLT.Product
ORDER BY Name;

-- Ordenar productos por ListPrice
SELECT Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice;

-- Ordenar productos por ListPrice en orden descendente
SELECT Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;

-- Ordenar productos por ListPrice en orden descendente y Name en orden Ascendente
SELECT Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC, Name ASC;

-- Restringir resultados con TOP

-- Devolver Nombre y ListPrice de los primeros 20 productos:
SELECT  TOP(20) Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;

-- Añadir el parametro WITH TIES
SELECT TOP (20) WITH TIES Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;

-- Añadir el parametro PERCENT
SELECT TOP (20) PERCENT WITH TIES Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;

-- Recuperar páginas de resultados con OFFSET y FETCH
-- Modifique la consulta existente para devolver los valores Name y ListPrice del producto
SELECT Name, ListPrice
FROM SalesLT.Product
ORDER BY Name OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Para recuperar la siguiente pagina de resultados
SELECT Name, ListPrice
FROM SalesLT.Product
ORDER BY Name OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

-- ALL Y DISTINCT
SELECT ALL Color
FROM SalesLT.Product;

-- Remplazar ALL con DISTINCT para eliminar duplicados de los resultados
SELECT DISTINCT Color
FROM SalesLT.Product;

-- Agregar el campo Tamaño en la consulta para obtener una combinacion unica de color y tamaño
SELECT DISTINCT Color, Size
FROM SalesLT.Product;

-- Filtrar resultados con WHERE
-- Mostrar el nombre, color y tamaño de los productos que su ProductModelID sea 6
SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID = 6
ORDER BY Name;

-- Mostrar los que su ProductModelID no sea 6
SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID != 6
ORDER BY Name;

-- Todos los productos con un ListPrice superior a 1000.00.
SELECT Name, ListPrice
FROM SalesLT.Product
WHERE ListPrice > 1000.00
ORDER BY ListPrice;

-- Mostrar productos que contengan 'HL Road Frame' al inicio de su nombre
SELECT Name, ListPrice
FROM SalesLT.Product
WHERE Name LIKE 'HL Road Frame %';

-- Mostar productos con un ProductNumber que coincide con patrones similares a
-- FR-xNNx-NN (en el que x es una letra y N es un número).
SELECT Name, ProductNumber, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'FR-_[0-9][0-9]_-[0-9][0-9]';

-- Mostrar los productos que en su fecha de venta no sean NULL
SELECT Name, ListPrice
FROM SalesLT.Product
WHERE SellEndDate IS NOT NULL;

-- Mostrar productos que se dejaron de vender en el año 2006
SELECT Name
FROM SalesLT.Product
WHERE SellEndDate BETWEEN '2006/1/1' AND '2006/12/31';

-- Recupera los productos con un valor ProductCategoryID de 5, 6 o 7
SELECT ProductCategoryID, Name, ListPrice
FROM SalesLT.Product
WHERE ProductCategoryID IN (5,6,7);

-- Recupera los productos con un valor ProductCategoryID de 5, 6 o 7 y que la fecha 
-- en la que se dejo de vender sea NULL
SELECT ProductCategoryID, Name, ListPrice, SellEndDate
FROM SalesLT.Product
WHERE ProductCategoryID IN (5,6,7) AND SellEndDate IS NULL;

-- Mostrar los productos que comiencen con 'FR' en su ProductNumber o que su ProductCategoryID
-- sea 5, 6 o 7
SELECT Name, ProductCategoryID, ProductNumber
FROM SalesLT.Product
WHERE ProductNumber LIKE 'FR%' OR ProductCategoryID IN (5,6,7);