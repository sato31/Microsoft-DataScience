-- CHALLENGES

-- CHALLENGE 1: Recuperar Datos de clientes

-- 1. Recuperar detalles del cliente
-- Una consulta que recupere todas las columnas de todos los clientes.
SELECT * FROM SalesLT.Customer;

-- 2. Recuperar datos de nombre de cliente
-- Cree una lista de todos los nombres de contacto de los clientes 
-- que incluya el título, el nombre, el segundo nombre (si lo hay), 
-- el apellido y el sufijo (si corresponde) de todos los clientes.
SELECT Title, FirstName, MiddleName, LastName, Suffix 
FROM SalesLT.Customer;

-- 3. Recuperar nombres de clientes y números de teléfono
-- Cada cliente tiene un vendedor asignado. Debe escribir una consulta
-- para crear una hoja de llamada que enumere:
--     -El vendedor
--     -Una columna denominada CustomerName que muestra cómo se debe saludar al contacto 
--      del cliente (por ejemplo, Mr Smith)
--     -El número de teléfono del cliente.
SELECT SalesPerson, Title + ' ' + FirstName AS CustomerName, Phone
FROM SalesLT.Customer;


-- CHALLENGE 2: Recuperar datos de pedidos de clientes

-- 1. Recuperar una lista de empresas clientes
-- Se le ha pedido que proporcione una lista de todas las empresas clientes en el formato
-- ID de cliente: Nombre de la empresa, por ejemplo, 78: Bicicletas preferidas.
SELECT CONVERT(varchar(5), CustomerID)+ ': ' + CompanyName AS CustomerCompany
FROM SalesLT.Customer;

-- 2. Recuperar una lista de revisiones de pedidos de ventas
-- La tabla SalesLT.SalesOrderHeader contiene registros de pedidos de ventas. 
-- Se le ha pedido que recupere datos para un informe que muestra:
--    -El número de pedido de cliente y el número de revisión en el formato (), 
--     por ejemplo, SO71774 (2).
--    -La fecha del pedido convertida al formato estándar ANSI 102 
--     (aaaa.mm.dd, por ejemplo, 2015.01.31).
SELECT SalesOrderNumber + ' (' + STR(RevisionNumber, 1) + ')' AS OrderRevision,
    CONVERT(varchar(25), OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;


-- CHALLENGE 3: Recuperar los datos de contacto del cliente

-- 1. Recuperar nombres de contacto de clientes con segundos nombres si se conocen
-- Se le ha pedido que escriba una consulta que devuelva una lista de nombres de clientes.
-- La lista debe consistir en una sola columna en el formato primer último 
-- (por ejemplo, Keith Harris) si el segundo nombre es desconocido, o el primer 
-- segundo nombre (por ejemplo, Jane M. Gates) si se conoce un segundo nombre.
SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', '') + LastName AS CustomerName
FROM SalesLT.Customer;

-- 2. Recuperar datos de contacto principales
-- Antes, se quitan direcciones de e-mail de algunos clientes, ya que todos tienen registrado una:
UPDATE SalesLT.Customer
SET EmailAddress = NULL
WHERE CustomerID % 7 =1;
-- Debe escribir una consulta que devuelva una lista de identificadores de cliente en una 
-- columna y una segunda columna denominada PrimaryContact que contenga la dirección de 
-- correo electrónico, si se conoce, y de lo contrario el número de teléfono.
SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

-- 3. Recuperar el estado del envío
-- Antes, se quitan algunas fechas de envio existentes, ya que todos los registros contienen una.
UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;
-- Se le ha pedido que cree una consulta que devuelva una lista de identificadores de pedido 
-- de ventas y fechas de pedido con una columna denominada ShippingStatus que contiene el texto
-- 'Shipped' con una fecha de envío conocida y 'Awaiting Shipment' para pedidos sin fecha de envío.
SELECT SalesOrderID, OrderDate,
    CASE
        WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
        ELSE 'Shipped'
    END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;