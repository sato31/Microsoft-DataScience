-- Funciones de agregado
-- T-SQL proporciona funciones de agregado como SUM, MAX y AVG para
-- realizar cálculos que toman varios valores y devuelven un único resultado.

-- Estas funciones se pueden usar en las cláusulas SELECT, HAVING
-- y ORDER BY. Sin embargo, no se pueden usar en la cláusula WHERE.

-- Ejemplos:
SELECT AVG(ListPrice) AS AveragePrice,
       MIN(ListPrice) AS MinimumPrice,
       MAX(ListPrice) AS MaximumPrice
FROM Production.Product;

-- Devolver los precios medios, mínimos y máximos de los productos
-- de una categoría específica mediante la adición de una cláusula WHERE
SELECT AVG(ListPrice) AS AveragePrice,
       MIN(ListPrice) AS MinimumPrice,
       MAX(ListPrice) AS MaximumPrice
FROM Production.Product
WHERE ProductCategoryID = 15;

-- Esta consulta devuelve la primera y la última empresa por 
-- nombre, mediante MIN y MAX
SELECT MIN(CompanyName) AS MinCustomer, 
       MAX(CompanyName) AS MaxCustomer
FROM SalesLT.Customer;
-- Esta consulta devolverá el primer y el último valor de CompanyName
-- en la secuencia de intercalación de la base de datos, 
-- que en este caso es alfabético

-- La función escalar YEAR se usa en el ejemplo para devolver solo la
-- parte del año de la fecha de pedido, antes de que se evalúen MIN y MAX:
SELECT MIN(YEAR(OrderDate)) AS Earliest,
       MAX(YEAR(OrderDate)) AS Latest
FROM Sales.SalesOrderHeader;

-- DISTINCT con funciones de agregado
-- Cuando se usa con una función de agregado, DISTINCT quita los
-- valores duplicados de la columna de entrada antes de calcular
-- el valor de resumen. DISTINCT es útil al resumir las apariciones
-- únicas de valores, como los clientes en la tabla de pedidos.

-- En el ejemplo siguiente se devuelve el número de clientes que
-- han realizado pedidos, independientemente del número de pedidos
-- que han realizado:
SELECT COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM Sales.SalesOrderHeader;
-- COUNT(<una_columna>) simplemente cuenta cuántas filas tienen algún
-- valor en la columna. Si no hay valores NULL, COUNT(<una_columna>)
-- será igual que COUNT(*). COUNT (DISTINCT <una_columna>) cuenta
-- cuántos valores diferentes hay en la columna.

-- Funciones de agregado con NULL
-- Las funciones de agregado de T-SQL omiten los valores NULL

-- Esta consulta muestra la diferencia entre cómo AVG controla 
-- NULL y cómo se podría calcular un promedio con una columna
-- calculada SUM/COUNT(*):
SELECT SUM(c2) AS sum_nonnulls, 
    COUNT(*) AS count_all_rows, 
    COUNT(c2) AS count_nonnulls, 
    AVG(c2) AS average, 
    (SUM(c2)/COUNT(*)) AS arith_average
FROM t1;

-- En este conjunto de resultados, la columna denominada average es
-- el agregado que obtiene internamente la suma de 150 y divide por
-- el recuento de valores no NULL de la columna c2. El cálculo sería
-- 150/5 o 30. La columna denominada arith_average divide 
-- explícitamente la suma por el recuento de todas las filas, por lo
-- que el cálculo es 150/6 o 25.

-- Si necesita resumir todas las filas, sean NULL o no, plantéese
-- reemplazar los valores NULL por otro valor que la función de 
-- agregado no omitirá. Puede usar la función COALESCE para este fin.


