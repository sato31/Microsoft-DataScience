-- CROSS JOIN

-- Esta operación crea un conjunto de resultados con todas 
-- combinaciones posibles de las filas de entrada
SELECT <select_list>
FROM table1 AS t1
CROSS JOIN table2 AS t2;

-- No se realiza ninguna coincidencia de filas, por lo que no se usa ninguna
-- cláusula ON. (Es un error usar una cláusula ON con CROSS JOIN).

-- La consulta siguiente es un ejemplo del uso de CROSS JOIN para
-- crear todas las combinaciones de empleados y productos:
SELECT emp.FirstName, prd.Name
FROM HR.Employee AS emp
CROSS JOIN Production.Product AS prd;