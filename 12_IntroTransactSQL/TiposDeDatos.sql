-- CAST y TRY_CAST
--
-- La función CAST convierte un valor en un tipo de datos especificado
-- si dicho valor es compatible con el tipo de datos de destino.
-- Se devolverá un error si no es compatible.
SELECT CAST(ProductID AS varchar(4)) + ': ' + Name AS ProductName
FROM Production.Product;
-- Se usa CAST para convertir los valores integer de la columna
-- ProductID en valores varchar (con un máximo de 4 caracteres) para 
-- concatenarlos con otro valor basado en caracteres

-- La consulta siguiente intenta convertir valores de esta columna
-- en un tipo de datos integer:
SELECT CAST(Size AS integer) As NumericSize
FROM Production.Product;
-- Esta consulta produce el siguiente error:
-- Error: Error de conversión al convertir el valor nvarchar "M" al tipo de datos int.

-- Puede usar la función TRY_CAST para convertir tipos de datos.
SELECT TRY_CAST(Size AS integer) As NumericSize
FROM Production.Product;
-- Los valores que se pueden convertir en un tipo de datos numérico se 
-- devuelven como valores decimales y los valores incompatibles se devuelven
-- como NULL, que se usa para indicar que un valor es desconocido.

-- CONVERT y TRY_CONVERT
--
SELECT CONVERT(varchar(4), ProductID) + ': ' + Name AS ProductName
FROM Production.Product;
-- TRY_CONVERT devuelve NULL para valores incompatibles.

-- Otra ventaja de usar CONVERT sobre CAST es que CONVERT también
-- incluye un parámetro que permite especificar un estilo de formato
-- al convertir valores numéricos y de fecha en cadenas:
SELECT SellStartDate,
       CONVERT(varchar(20), SellStartDate) AS StartDate,
       CONVERT(varchar(10), SellStartDate, 101) AS FormattedStartDate 
FROM SalesLT.Product;

-- PARSE y TRY_PARSE
--
-- La función PARSE está diseñada para convertir cadenas con formato
-- que representan valores numéricos o de fecha y hora.
SELECT PARSE('01/01/2021' AS date) AS DateValue,
   PARSE('$199.99' AS money) AS MoneyValue;
-- PARSE tiene una variante TRY_PARSE que devuelve valores incompatibles como NULL.

-- STR
--
-- La función STR convierte un valor numerico en varchar.
SELECT ProductID,  '$' + STR(ListPrice) AS Price
FROM Production.Product;