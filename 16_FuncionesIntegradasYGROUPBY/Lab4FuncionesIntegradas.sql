-- Funciones Escalares

-- Observar que la función YEAR ha recuperado el año del campo SellStartDate
SELECT YEAR(SellStartDate) AS SellStartYear, ProductID, Name
FROM SalesLT.Product
ORDER BY SellStartYear;

-- Funciones escalares que funcionan con valores datetime:
SELECT YEAR(SellStartDate) AS SellStartYear,
       DATENAME(mm,SellStartDate) AS SellStartMonth,
       DAY(SellStartDate) AS SellStartDay,
       DATENAME(dw, SellStartDate) AS SellStartWeekday,  
       DATEDIFF(yy,SellStartDate, GETDATE()) AS YearsSold,
       ProductID,
       Name
FROM SalesLT.Product
ORDER BY SellStartYear;
-- La función DATENAME devuelve un valor diferente dependiendo del parámetro
-- datepart que se le pasa. En este ejemplo, mm devuelve el nombre del mes y
-- dw devuelve el nombre del día de la semana.
-- La función DATEDIFF devuelve el intervalo de tiempo especificado entre una
-- fecha de inicio y una fecha de finalización. En este caso, el intervalo se
-- mide en años (yy) y la fecha de finalización está determinada por la función
-- GETDATE; que cuando se usa sin parámetros devuelve la fecha y hora actuales.

-- Devolver el nombre y apellido concatenados para cada cliente.
SELECT CONCAT(FirstName + ' ', LastName) AS FullName
FROM SalesLT.Customer;

-- Funciones que manipulan valores basados en cadenas:
SELECT UPPER(Name) AS ProductName,
       ProductNumber,       
       ROUND(Weight, 0) AS ApproxWeight,
       LEFT(ProductNumber, 2) AS ProductType,
       SUBSTRING(ProductNumber,CHARINDEX('-', ProductNumber) + 1, 4) AS ModelCode,
       SUBSTRING(ProductNumber, LEN(ProductNumber) - CHARINDEX('-', REVERSE(RIGHT(ProductNumber, 3))) + 2, 2) AS SizeCode
FROM SalesLT.Product;
-- Las funciones ocupadas devuelven los siguientes datos:
-- El nombre del producto, convertido a mayúsculas por la función UPPER.
-- El peso del producto, redondeado al número entero más cercano mediante
-- la función ROUND.
-- El tipo de producto, que se indica con los dos primeros caracteres del
-- número de producto, comenzando por la izquierda (utilizando la función LEFT).
-- El código de modelo, que se extrae del número de producto mediante la
-- función SUBSTRING, que extrae los cuatro caracteres inmediatamente después
-- del primer carácter -, que se encuentra mediante la función CHARINDEX.
-- El código de tamaño, que se extrae utilizando la función SUBSTRING para
-- extraer los dos caracteres que siguen al último - en el código de producto.
-- El último carácter se encuentra tomando la longitud total (LEN) del ID del
-- producto y encontrando su índice (CHARINDEX) en los tres primeros caracteres
-- invertidos (REVERSE) desde la derecha (RIGHT).

--Funciones lógicas

-- Devolver solo los productos con un tamaño numérico.
SELECT Name, Size AS NumericSize
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1;

-- La siguiente consulta anida la función ISNUMERIC utilizada anteriormente
-- en una función IIF; que a su vez evalúa el resultado de la función ISNUMERIC
-- y devuelve Numeric si el resultado es 1 (true), y Non-Numeric en caso contrario.
SELECT Name, IIF(ISNUMERIC(Size) = 1, 'Numeric', 'Non-Numeric') AS SizeType
FROM SalesLT.Product;

-- La función CHOOSE devuelve el valor en la posición ordinal de una lista basada
-- en un valor de índice especificado. El índice de la lista está basado en 1,
-- por lo que en esta consulta la función devuelve Bicicletas para la categoría 1,
-- Componentes para la categoría 2, etc.
SELECT prd.Name AS ProductName,
       cat.Name AS Category,
       CHOOSE (cat.ParentProductCategoryID, 'Bikes','Components','Clothing','Accessories') AS ProductType
FROM SalesLT.Product AS prd
JOIN SalesLT.ProductCategory AS cat
    ON prd.ProductCategoryID = cat.ProductCategoryID;

-- Funciones Agregadas
-- La siguiente consulta devuelve:
-- El número de productos de la tabla. Esto se devuelve utilizando la función
-- COUNT para contar el número de filas (*).
-- El número de categorías. Esto se devuelve utilizando la función COUNT
-- para contar el número de ID de categoría distintos en la tabla.
-- El precio medio de un producto. Esto se devuelve mediante la función AVG
-- con el campo ListPrice.
SELECT COUNT(*) AS Products,
       COUNT(DISTINCT ProductCategoryID) AS Categories,
       AVG(ListPrice) AS AveragePrice
FROM SalesLT.Product;

-- Devolver el número de modelos y el precio promedio de los productos con
-- nombres de categoría que terminan en "bicicletas".
SELECT COUNT(p.ProductID) AS BikeModels, AVG(p.ListPrice) AS AveragePrice
FROM SalesLT.Product AS p
JOIN SalesLT.ProductCategory AS c
    ON p.ProductCategoryID = c.ProductCategoryID
WHERE c.Name LIKE '%Bikes';

-- GROUP BY
-- Devolver el número de clientes asignados a cada vendedor.
SELECT Salesperson, COUNT(CustomerID) AS Customers
FROM SalesLT.Customer
GROUP BY Salesperson
ORDER BY Salesperson;

-- Devolver los ingresos totales por ventas de cada vendedor que haya
-- completado cualquier venta.
SELECT c.Salesperson, SUM(oh.SubTotal) AS SalesRevenue
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader oh    
    ON c.CustomerID = oh.CustomerID
GROUP BY c.Salesperson
ORDER BY SalesRevenue DESC;

-- Devolver los totales de ventas para los vendedores que han vendido
 -- artículos y 0,00 para los que no lo han hecho.
SELECT c.Salesperson, ISNULL(SUM(oh.SubTotal), 0.00) AS SalesRevenue
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader oh
    ON c.CustomerID = oh.CustomerID
GROUP BY c.Salesperson
ORDER BY SalesRevenue DESC;

-- HAVING
-- Observe que devuelve un error. La cláusula WHERE se aplica antes de
-- las agregaciones y la cláusula GROUP BY, por lo que no puede usarla
-- para filtrar el valor agregado.
SELECT Salesperson, COUNT(CustomerID) AS Customers
FROM SalesLT.Customer
WHERE COUNT(CustomerID) > 100
GROUP BY Salesperson
ORDER BY Salesperson;

-- Modifique la consulta de la siguiente manera para agregar una
-- cláusula HAVING, que se aplica después de las agregaciones y la
-- cláusula GROUP BY.
-- Ahora devuelve solo los vendedores que tienen más de 100 clientes
-- asignados:
SELECT Salesperson, COUNT(CustomerID) AS Customers
FROM SalesLT.Customer
GROUP BY Salesperson
HAVING COUNT(CustomerID) > 100
ORDER BY Salesperson;