-- ORDER BY
-- Además de especificar qué columnas se deben usar para determinar el criterio de ordenación,
-- también puede controlar la dirección de la ordenación. Puede usar ASC para una ordenación 
-- ascendente (A-Z, 0-9) o DESC para una descendente (Z-A, 9-0). 
-- El valor predeterminado son las ordenaciones ascendentes. 
-- Cada columna puede tener especificada su propia dirección, como en el ejemplo siguiente:
SELECT ProductCategoryID AS Category, ProductName
FROM Production.Product
ORDER BY Category ASC, Price DESC;


