-- ISNULL
--
-- Toma dos argumentos. El primero es una expresión que estamos probando.
-- Si el valor de ese primer argumento es NULL, la función devuelve el segundo
-- argumento. Si la primera expresión no es NULL, se devuelve sin cambios.
SELECT FirstName,
      ISNULL(MiddleName, 'None') AS MiddleIfAny,
      LastName
FROM Sales.Customer;

-- COALESCE
--
-- Puede tomar un número variable de argumentos, cada uno de los cuales es
-- una expresión. Devolverá la primera expresión de la lista que no sea NULL.
SELECT COALESCE ( expression1, expression2, [ ,...n ] )

SELECT EmployeeID,
      COALESCE(HourlyRate * 40,
                WeeklySalary,
                Commission * SalesQty) AS WeeklyEarnings
FROM HR.Wages;

-- NULLIF
--
-- NULLIF toma dos argumentos y devuelve NULL si son equivalentes.
-- Si no son iguales, NULLIF devuelve el primer argumento.
SELECT SalesOrderID,
      ProductID,
      UnitPrice,
      NULLIF(UnitPriceDiscount, 0) AS Discount
FROM Sales.SalesOrderDetail;
-- NULLIF reemplaza un descuento de 0 por un valor NULL.
-- Devuelve el valor de descuento si no es 0:




