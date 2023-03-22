-- WHERE
-- Solo se devolverán las filas cuando la cláusula WHERE se evalúe como TRUE
-- la consulta siguiente devuelve todos los productos
-- con un valor ProductCategoryID de 2:
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE ProductCategoryID = 2;

-- Devuelve todos los productos con un valor ListPrice menor que 10,00:
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE ListPrice < 10.00;

-- IS NULL / IS NOT NULL
-- Permitir o excluir los valores “unknown” o NULL:
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE ProductName IS NOT NULL;

-- Varias condiciones AND y OR
-- Devuelve un producto de la categoría 2 que cuesta menos de 10,00
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE ProductCategoryID = 2
    AND ListPrice < 10.00;

-- Devuelve productos de la categoría 2 OR (O) 3 AND (Y) cuesta menos
-- de 10,00:
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE (ProductCategoryID = 2 OR ProductCategoryID = 3)
    AND (ListPrice < 10.00);

-- IN
-- Es un acceso directo para varias condiciones de igualdad para
-- la misma columna conectada con OR
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE ProductCategoryID IN (2, 3, 4);

-- BETWEEN
-- Es otro acceso directo que se puede usar al filtrar para un 
-- límite superior e inferior del valor, en lugar de usar dos
-- condiciones con el operador AND. 
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
WHERE ListPrice BETWEEN 1.00 AND 10.00;

SELECT ProductName, ModifiedDate
FROM Production.Product
WHERE ModifiedDate BETWEEN '2012-01-01' AND '2012-12-31';

-- LIKE
-- Solo se puede usar para los datos de caracteres y nos permite
-- usar caracteres comodín y patrones de expresiones regulares.
-- Los caracteres comodín nos permiten especificar cadenas parciales.

-- Devolver todos los productos con nombres que contengan la palabra "mountain":
SELECT Name, ListPrice
FROM SalesLT.Product
WHERE Name LIKE '%mountain%';

-- Puede usar el carácter comodín _ (guión bajo) para representar un carácter único:
SELECT ProductName, ListPrice
FROM SalesLT.Product
WHERE ProductName LIKE 'Mountain Bike Socks, _';

-- También puede definir patrones complejos para las cadenas que desea buscar.
-- Por ejemplo, la siguiente consulta busca productos 
-- con un nombre que comience por “Mountain-”, seguido de:
--  tres caracteres entre 0 y 9
--  un espacio
--  cualquier cadena
--  una coma
--  un espacio
--  dos caracteres entre 0 y 9

SELECT ProductName, ListPrice
FROM SalesLT.Product
WHERE ProductName LIKE 'Mountain-[0-9][0-9][0-9] %, [0-9][0-9]';


