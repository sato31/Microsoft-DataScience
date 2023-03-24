-- Ejemplos de funciones de fecha y hora:
SELECT  SalesOrderID,
    OrderDate,
        YEAR(OrderDate) AS OrderYear,
        DATENAME(mm, OrderDate) AS OrderMonth,
        DAY(OrderDate) AS OrderDay,
        DATENAME(dw, OrderDate) AS OrderWeekDay,
        DATEDIFF(yy,OrderDate, GETDATE()) AS YearsSinceOrder
FROM Sales.SalesOrderHeader;

-- Funciones matemáticas
SELECT TaxAmt,
       ROUND(TaxAmt, 0) AS Rounded,
       FLOOR(TaxAmt) AS Floor,
       CEILING(TaxAmt) AS Ceiling,
       SQUARE(TaxAmt) AS Squared,
       SQRT(TaxAmt) AS Root,
       LOG(TaxAmt) AS Log,
       TaxAmt * RAND() AS Randomized
FROM Sales.SalesOrderHeader;

-- Funciones de cadena
SELECT  CompanyName,
        UPPER(CompanyName) AS UpperCase,
        LOWER(CompanyName) AS LowerCase,
        LEN(CompanyName) AS Length,
        REVERSE(CompanyName) AS Reversed,
        CHARINDEX(' ', CompanyName) AS FirstSpace,
        LEFT(CompanyName, CHARINDEX(' ', CompanyName)) AS FirstWord,
        SUBSTRING(CompanyName, CHARINDEX(' ', CompanyName) + 1, LEN(CompanyName)) AS RestOfName
FROM Sales.Customer;

-- Funciones Lógicas
-- Permite determinar cuál de varios valores se va a devolver.
-- Las funciones lógicas evalúan una expresión de entrada y 
-- devuelven un valor adecuado en función del resultado.

-- IIF
-- La función IIF evalúa una expresión de entrada booleana y 
-- devuelve un valor especificado si la expresión se evalúa como
-- True, y un valor alternativo si la expresión se evalúa como False.

-- Por ejemplo, la siguiente consulta, evalúa el tipo de dirección de
-- un cliente. Si el valor es "Oficina principal", la expresión devuelve
-- "Billing". Para todos los demás valores de tipo de dirección,
-- la expresión devuelve "Mailing":
SELECT AddressType,
      IIF(AddressType = 'Main Office', 'Billing', 'Mailing') AS UseAddressFor
FROM Sales.CustomerAddress;

-- CHOOSE
-- Evalúa una expresión de entero y devuelve el valor correspondiente 
-- de una lista en función de su posición ordinal (basada en 1):
SELECT SalesOrderID, Status,
CHOOSE(Status, 'Ordered', 'Shipped', 'Delivered') AS OrderStatus
FROM Sales.SalesOrderHeader;

