-- EXISTS
-- El predicado EXISTS determina si existen filas que cumplan una condición
-- especificada, pero en lugar de devolverlas, devuelve TRUE o FALSE.

-- La primera consulta de ejemplo usa COUNT en una subconsulta:
SELECT CustomerID, CompanyName, EmailAddress 
FROM Sales.Customer AS c 
WHERE
(SELECT COUNT(*) 
  FROM Sales.SalesOrderHeader AS o
  WHERE o.CustomerID = c.CustomerID) > 0;

-- La segunda consulta, que devuelve los mismos resultados, usa EXISTS:
SELECT CustomerID, CompanyName, EmailAddress 
FROM Sales.Customer AS c 
WHERE EXISTS
(SELECT * 
  FROM Sales.SalesOrderHeader AS o
  WHERE o.CustomerID = c.CustomerID);

-- Otra aplicación útil de EXISTS es la negación de la subconsulta con NOT,
-- El ejemplo siguiente devolverá cualquier cliente que nunca haya realizado un pedido:
SELECT CustomerID, CompanyName, EmailAddress 
FROM SalesLT.Customer AS c 
WHERE NOT EXISTS
  (SELECT * 
   FROM SalesLT.SalesOrderHeader AS o
   WHERE o.CustomerID = c.CustomerID);



