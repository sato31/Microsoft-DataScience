-- CHALLENGES

-- CHALLENGE 1: Recuperar datos para informes de transporte
-- 1.  Recuperar una lista de ciudades
-- Consulte la tabla SalesLT.Address y recupere los valores de City y StateProvince,
-- quitando duplicados y ordenados en orden ascendente de ciudad.
SELECT DISTINCT City, StateProvince
FROM SalesLT.Address
ORDER BY City ASC;

-- 2. Recuperar los productos más pesados
-- Recupere los nombres del diez por ciento superior de los productos por peso.
SELECT TOP (10) PERCENT WITH TIES Name, Weight
FROM SalesLT.Product
ORDER BY Weight DESC;

-- CHALLENGE 2: Recuperar datos del producto
-- 1. Recuperar detalles del producto para el modelo de producto 1
-- Inicialmente, debe encontrar los nombres, colores y tamaños de los productos 
-- con un ID de modelo de producto 1.
SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID = 1;

-- 2. Filtrar productos por color y tamaño
-- Recupere el número de producto y el nombre de los productos que tienen un 
-- color negro, rojo o blanco y un tamaño de S o M.
SELECT ProductNumber, Name
FROM SalesLT.Product
WHERE Color IN ('Black', 'Red', 'White') AND Size IN ('S', 'M');

-- 3. Filtrar productos por número de producto
-- Recuperar el número de producto, el nombre y el precio de lista de los productos
-- cuyo número de producto comienza BK-
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';

-- 4. Recuperar productos específicos por número de producto
-- Modifique la consulta anterior para recuperar el número de producto, el nombre y el
-- precio de lista de los productos cuyo número de producto comienza BK- seguido de 
-- cualquier carácter que no sea R, y termina con un - seguido de dos números cualesquiera.
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';
