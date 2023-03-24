
-- Funciones de clasificación y conjunto de filas
-- Las funciones de clasificación y conjunto de filas no son 
-- funciones escalares porque no devuelven un solo valor. 
-- Estas funciones aceptan un conjunto de filas como entrada 
-- y devuelven un conjunto de filas como salida.

-- Funciones de categoría
-- Las funciones de clasificación permiten realizar cálculos
-- en un conjunto de filas definido por el usuario. Estas 
-- funciones incluyen funciones de clasificación, desplazamiento,
-- agregado y distribución.

-- RANK
-- Calcular una clasificación basada en ListPrice, con el precio
-- más alto clasificado en 1:
SELECT TOP 100 ProductID, Name, ListPrice,
RANK() OVER(ORDER BY ListPrice DESC) AS RankByPrice
FROM Production.Product AS p
ORDER BY RankByPrice;

-- OVER
-- Para definir particiones o agrupaciones dentro de los datos.
-- La consulta siguiente amplía el ejemplo anterior para calcular
-- las clasificaciones basadas en precios de los productos dentro
-- de cada categoría.
SELECT c.Name AS Category, p.Name AS Product, ListPrice,
  RANK() OVER(PARTITION BY c.Name ORDER BY ListPrice DESC) AS RankByPrice
FROM Production.Product AS p
JOIN Production.ProductCategory AS c
ON p.ProductCategoryID = c.ProductcategoryID
ORDER BY Category, RankByPrice;

-- Funciones de conjuntos de filas
-- Devuelven una tabla virtual que se puede usar en la cláusula FROM
-- como origen de datos. Estas funciones toman parámetros específicos
-- de la propia función de conjunto de filas. Incluyen OPENDATASOURCE,
-- OPENQUERY, OPENROWSET, OPENXML y OPENJSON.
-- Las funciones OPENDATASOURCE, OPENQUERY y OPENROWSET permiten pasar
-- una consulta a un servidor de bases de datos remoto. A continuación,
-- el servidor remoto devolverá un conjunto de filas de resultados.
-- Por ejemplo, la consulta siguiente usa OPENROWSET para obtener los
-- resultados de una consulta de una instancia de SQL Server llamada SalesDB.
SELECT a.*
FROM OPENROWSET('SQLNCLI', 'Server=SalesDB;Trusted_Connection=yes;',
    'SELECT Name, ListPrice
    FROM AdventureWorks.Production.Product') AS a;

--Las funciones OPENXML y OPENJSON permiten consultar datos estructurados
-- en formato XML o JSON y extraer valores en un conjunto de filas tabular.