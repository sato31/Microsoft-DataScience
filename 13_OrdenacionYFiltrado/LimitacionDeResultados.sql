-- TOP 
-- Permitirá especificar cuántas filas se van a devolver, ya sea como 
-- un entero positivo o como un porcentaje de todas las filas calificadas.
SELECT TOP 10 Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
-- El operador TOP depende de una cláusula ORDER BY para proporcionar
-- una prioridad significativa a las filas seleccionadas. 
-- TOP se puede usar sin ORDER BY pero, en ese caso, no hay ninguna
-- manera de predecir qué filas se devolverán. 

-- WITH TIES
-- Recuperará las filas con valores que puedan encontrarse en las
-- primeras N filas seleccionadas
SELECT TOP 10 WITH TIES Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

-- PERCENT
-- Para devolver un porcentaje de las filas aptas
-- La opción PERCENT también se puede usar con la opción WITH TIES.
SELECT TOP 10 PERCENT Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;

-- OFFSET-FETCH
-- Para usar OFFSET-FETCH, debe proporcionar un valor OFFSET inicial,
-- que puede ser cero, y un número opcional de filas que se devolverán
SELECT ProductID, ProductName, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC 
OFFSET 0 ROWS --Skip zero rows
FETCH NEXT 10 ROWS ONLY; --Get the next 10
-- Para recuperar la página siguiente de datos del producto, use la 
-- cláusula OFFSET para especificar el número de filas que se van a omitir:
SELECT ProductID, ProductName, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC 
OFFSET 10 ROWS --Skip 10 rows
FETCH NEXT 10 ROWS ONLY; --Get the next 10

-- DISTINCT
-- Eliminación de Duplicados
SELECT DISTINCT City, CountryRegion
FROM Production.Supplier
ORDER BY CountryRegion, City;
-- Cuando se usa DISTINCT, el ejemplo devuelve solo una de cada
-- combinación única de valores de la lista SELECT
