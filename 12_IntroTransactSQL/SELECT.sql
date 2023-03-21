SELECT OrderDate, COUNT(OrderID) AS Orders
FROM Sales.SalesOrder
WHERE Status = 'Shipped'
GROUP BY OrderDate
HAVING COUNT(OrderID) > 1
ORDER BY OrderDate DESC;

-- La cláusula SELECT devuelve la columna OrderDate y el recuento
-- de valores OrderID, a los que se asigna el nombre (o alias) Orders.

-- La cláusula FROM identifica qué tabla es el origen de las filas 
-- de la consulta; en este caso, es la tabla Sales.SalesOrder

-- La cláusula WHERE filtra las filas de los resultados, 
-- manteniendo solo las filas que cumplen la condición especificada; 
-- en este caso, los pedidos que tienen el estado "enviado"

-- La cláusula GROUP BY toma las filas que cumplen la condición del filtro 
-- y las agrupa por OrderDate, de modo que todas las filas 
-- con el mismo valor OrderDate se consideren como un único grupo 
-- y se devuelva una fila para cada grupo.

-- Una vez formados los grupos, la cláusula HAVING filtra los
-- grupos en función de su propio predicado. 
-- Solo las fechas con más de un pedido se incluirán en los resultados.

-- Para obtener una vista previa de esta consulta, la cláusula final
-- es ORDER BY, que ordena la salida en orden descendente de OrderDate.

-- SELECCIÓN DE TODAS LAS COLUMNAS
SELECT * FROM Production.Product;

-- SELECCIÓN DE COLUMNAS ESPECIFICAS
SELECT ProductID, Name, ListPrice, StandardCost
FROM Production.Product;

-- SELECCIÓN DE EXPRESIONES
SELECT ProductID,
      Name + '(' + ProductNumber + ')',
  ListPrice - StandardCost
FROM Production.Product;

-- ESPECIFICACIÓN DE ALIAS DE COLUMNA
SELECT ProductID AS ID,
      Name + '(' + ProductNumber + ')' AS ProductName,
  ListPrice - StandardCost AS Markup
FROM Production.Product;


