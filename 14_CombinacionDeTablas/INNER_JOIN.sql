-- INNER JOIN

SELECT emp.FirstName, ord.Amount
FROM HR.Employee AS emp 
JOIN Sales.SalesOrder AS ord
    ON emp.EmployeeID = ord.EmployeeID;

-- El resultado de la consulta completada es una lista de empleados
-- y las cantidades de sus pedidos. Los empleados que no tienen 
-- ningún pedido asociado se han filtrado por la cláusula ON,
-- al igual que los pedidos que tienen un valor EmployeeID que no
-- se corresponde con una entrada en la tabla HR.Employee.

-- INNER JOIN es el tipo predeterminado de operación JOIN y la
-- palabra clave INNER opcional está implícita en la cláusula JOIN

-- EJEMPLOS DE INNER JOIN

-- Se realiza combinación en una sola columna coincidente,
-- lo que relaciona ProductModelID de la tabla Production.Product
-- con ProductModelID de la tabla Production.ProductModel:
SELECT p.ProductID, m.Name AS Model, p.Name AS Product
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS m
    ON p.ProductModelID = m.ProductModelID
ORDER BY p.ProductID;

-- Se muestra cómo se puede extender una combinación interna para
-- incluir más de dos tablas. La tabla Sales.SalesOrderDetail se une
-- a la salida de JOIN entre Production.Product y Production.ProductModel. 
SELECT od.SalesOrderID, m.Name AS Model, p.Name AS ProductName, od.OrderQty
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS m
    ON p.ProductModelID = m.ProductModelID
INNER JOIN Sales.SalesOrderDetail AS od
    ON p.ProductID = od.ProductID
ORDER BY od.SalesOrderID;


