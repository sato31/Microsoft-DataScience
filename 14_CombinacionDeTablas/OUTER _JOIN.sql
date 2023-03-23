-- OUTER JOIN
-- Con OUTER JOIN, puede optar por mostrar todas las filas que tienen
-- filas coincidentes entre las tablas, además de todas las filas
-- que no tienen ninguna coincidencia en la otra tabla
SELECT emp.FirstName, ord.Amount
FROM HR.Employee AS emp
LEFT OUTER JOIN Sales.SalesOrder AS ord
    ON emp.EmployeeID = ord.EmployeeID;
-- LEFT OUTER JOIN, que indica al procesador de consultas que 
-- conserve todas las filas de la tabla de la izquierda (HR.Employee)
-- y muestre los valores Amount para las filas coincidentes en 
-- Sales.SalesOrder. Pero se devuelven todos los empleados,
-- independientemente de si han realizado o no un pedido de ventas.
-- En lugar del valor Amount, la consulta devolverá NULL para los
-- empleados sin pedidos de ventas correspondientes.

-- El propósito de la palabra clave es indicar qué tabla
-- (en qué lado de la palabra clave JOIN) se debe conservar y
-- mostrar todas sus filas, haya coincidencias o no.

-- Al usar LEFT, RIGHT o FULL para definir una combinación,
-- puede omitir la palabra clave OUTER como se muestra aquí:
SELECT emp.FirstName, ord.Amount
FROM HR.Employee AS emp
LEFT JOIN Sales.SalesOrder AS ord
    ON emp.EmployeeID = ord.EmployeeID;

-- AUTOCOMBINACIONES

SELECT emp.FirstName AS Employee, 
       mgr.FirstName AS Manager
FROM HR.Employee AS emp
LEFT OUTER JOIN HR.Employee AS mgr
  ON emp.ManagerID = mgr.EmployeeID;d;
-- Los resultados de esta consulta incluyen una fila para cada empleado
-- con el nombre de su jefe. El director general de la empresa no tiene
-- ningún jefe. Para incluir al director general en los resultados,
-- se usa una combinación externa y el nombre del jefe se devuelve 
-- como NULL para las filas en las que el campo ManagerID no tiene
-- ningún campo EmployeeID coincidente.
