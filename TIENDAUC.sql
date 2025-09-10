


-- ELIMINA Y CREA LA BASE DE DATOS
USE master;
GO

IF DB_ID('ERD') IS NOT NULL
    DROP DATABASE ERD;
GO

CREATE DATABASE ERD;
GO

USE ERD;
GO

-- TABLAS

CREATE TABLE Cliente(
    DNI VARCHAR(10) NOT NULL PRIMARY KEY,
    cliApellidoPaterno VARCHAR(15) NOT NULL,
    cliApellidoMaterno VARCHAR(15) NOT NULL,
    cliNombres VARCHAR(15) NOT NULL,
    cliSexo VARCHAR(1) NOT NULL,
    cliFechaNacimiento DATE,
    cliDireccion VARCHAR(25) NOT NULL,
    cliDistrito VARCHAR(25) NOT NULL,
    cliTelefono VARCHAR(9) NOT NULL,
    cliEmail VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Empleado(
    IDEmpleado VARCHAR(5) NOT NULL PRIMARY KEY,
    empNumSegSocial VARCHAR(10) NOT NULL,
    empApellidoPaterno VARCHAR(15) NOT NULL,
    empApellidoMaterno VARCHAR(15) NOT NULL,
    empNombre VARCHAR(15) NOT NULL,
    empSueldo DECIMAL(9,2) NOT NULL
);
GO

CREATE TABLE VENTAS (
    IDVent VARCHAR(10) NOT NULL PRIMARY KEY,
    venFecha DATETIME NOT NULL,
    DNI VARCHAR(10) NOT NULL,
    IDEmpleado VARCHAR(5) NOT NULL,
    FOREIGN KEY (DNI) REFERENCES Cliente(DNI),
    FOREIGN KEY (IDEmpleado) REFERENCES Empleado(IDEmpleado)
);
GO

-- CAMBIO IMPORTANTE AQUÍ: IDRUC → BIGINT
CREATE TABLE Proveedor(
    IDRUC BIGINT NOT NULL PRIMARY KEY,
    provNombre VARCHAR(15) NOT NULL,
    provDireccion VARCHAR(25) NOT NULL,
    provTelefono VARCHAR(10) NOT NULL
);
GO

CREATE TABLE Categoria(
    IDcat VARCHAR(49) NOT NULL PRIMARY KEY,
    catNombre VARCHAR(15) NOT NULL
);
GO

CREATE TABLE Producto (
    IDProduc VARCHAR(10) NOT NULL PRIMARY KEY,
    proNombre VARCHAR(15) NOT NULL,
    proPrecioPropuesto DECIMAL(9,2) NOT NULL,
    proStock VARCHAR(10) NOT NULL,
    IDRUC BIGINT NOT NULL,
    IDcat VARCHAR(49) NOT NULL,
    FOREIGN KEY (IDRUC) REFERENCES Proveedor(IDRUC),
    FOREIGN KEY (IDcat) REFERENCES Categoria(IDcat)
);
GO

CREATE TABLE tblDetalleVenta (
    dvenCantidad INT NOT NULL,
    IDVent VARCHAR(10) NOT NULL,
    IDProduc VARCHAR(10) NOT NULL,
    FOREIGN KEY (IDVent) REFERENCES VENTAS(IDVent),
    FOREIGN KEY (IDProduc) REFERENCES Producto(IDProduc)
);
GO

-- INSERTS

-- Cliente
INSERT INTO Cliente VALUES 
('1234567890', 'Pérez', 'Quispe', 'Juan', 'M', '1990-05-12', 'Av. Sol 123', 'Cusco', '987654321', 'juan.perez@email.com'),
('0987654321', 'Lopez', 'Mamani', 'Ana', 'F', '1985-08-24', 'Jr. Lima 456', 'Arequipa', '912345678', 'ana.lopez@email.com');
GO

-- Empleado
INSERT INTO Empleado VALUES 
('E001', 'SS123456', 'Ramirez', 'Gomez', 'Lucia', 2500.00),
('E002', 'SS654321', 'Sanchez', 'Torres', 'Miguel', 2200.00);
GO

-- Proveedor
INSERT INTO Proveedor VALUES 
(20123456789, 'Distrib Sur', 'Jr. Comercio 321', '955123456'),
(20456789123, 'Alim Norte', 'Av. Central 456', '912678901');
GO

-- Categoria
INSERT INTO Categoria VALUES 
('CAT001', 'Bebidas'),
('CAT002', 'Lácteos');
GO

-- Producto
INSERT INTO Producto VALUES 
('PRD001', 'Inka Kola', 2.50, '100', 20123456789, 'CAT001'),
('PRD002', 'Leche Gloria', 4.20, '50', 20456789123, 'CAT002');
GO

-- Ventas
INSERT INTO VENTAS VALUES 
('V001', '2025-06-22 14:00:00', '1234567890', 'E001'),
('V002', '2025-06-23 09:30:00', '0987654321', 'E002');
GO

-- Detalle de venta
INSERT INTO tblDetalleVenta VALUES 
(3, 'V001', 'PRD001'),
(2, 'V001', 'PRD002'),
(1, 'V002', 'PRD002');
GO

INSERT INTO Cliente VALUES 
('1478925501', 'Dominges', 'Quispe', 'Luis', 'M', '1990-05-12', 'Av. Sol 123', 'tacna', '485965489', 'luis.quispe@email.com'),
('0567847410', 'bombilla', 'perez', 'lisa', 'F', '1985-08-24', 'Jr. Lima 456', 'lima', '489612525', 'li.perez@email.com');
GO

INSERT INTO Empleado VALUES 
('E003', 'SS123756', 'Dominges', 'Gomez', 'lucy', 1560.00),
('E004', 'SS654341', 'Federico', 'Marinez', 'Anguel', 1956.00),
('E005', 'SS123486', 'Duran', 'Gomez', 'Paulia', 2000.00),
('E006', 'SS654329', 'Fernandez', 'Torres', 'Saul', 1999.00);
GO

-- CONSULTA FINAL (ya no genera error)
SELECT 
    V.IDVent AS ID_Venta,
    C.cliNombres + ' ' + C.cliApellidoPaterno AS Cliente,
    E.empNombre + ' ' + E.empApellidoPaterno AS Empleado,
    P.proNombre AS Producto,
    DV.dvenCantidad AS Cantidad,
    P.proPrecioPropuesto AS PrecioUnitario,
    (DV.dvenCantidad * P.proPrecioPropuesto) AS TotalParcial
FROM VENTAS V
JOIN Cliente C ON V.DNI = C.DNI
JOIN Empleado E ON V.IDEmpleado = E.IDEmpleado
JOIN tblDetalleVenta DV ON V.IDVent = DV.IDVent
JOIN Producto P ON DV.IDProduc = P.IDProduc;
GO


USE master;
GO

-- Terminar conexiones activas a la base de datos
ALTER DATABASE lunes SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- Eliminar la base de datos
DROP DATABASE lunes;

GO

select*
from Cliente


------ seleccion (seleccion de filas )alegra  relacioanl,, quiero distrito por cliente-
select cliDistrito
from Cliente
where cliDistrito = 'Arequipa';

select cliSexo
from Cliente
where cliSexo = 'M';

----------------proyeccion (seelccion de columnas)

select DNI,cliSexo,cliNombres
from Cliente;

-------------------- Producto cartesiano (×) → FROM A, B (sin JOIN) esto solo junta las tablas.

select *
from Cliente,Producto;

----------------------------------

SELECT * FROM Producto, Categoria;


------------Producto cartesiano (todas las combinaciones, incluso sin sentido):usando join.....usando alias 

select c.DNI,p.IDproduc
from Cliente c , Producto p;

--------------Esto mostrará las tablas  combinadas , aunque no tengan relacion.

-----------//**Ahora un JOIN lógico (por relación real entre ellos):
select C.DNI, V.venFecha
from Cliente C
join ventas V on  C.DNI = V.DNI;


SELECT P.proNombre, C.catNombre
FROM Producto P
JOIN Categoria C ON P.IDcat = C.IDcat;

---------Un JOIN sirve para relacionar datos entre dos o más tablas que tienen algo en común. Para que funcione, 
---necesitas un campo que exista en ambas tablas y que tenga un significado relacionado (por ejemplo, una clave primaria y una clave foránea
---- estrucrura de join 

SELECT dato tabla 1, dato tabla 2
FROM tabla 1
JOIN tabla 2 V ON v.pk = V.fk;

-----------------Unión (∪) → UNION en SQL
---Álgebra relacional:
--Combina filas de dos tablas (eliminando duplicados).
----Ambas relaciones deben tener el mismo número y tipo de columnas.

SELECT cliTelefono FROM Cliente
UNION
SELECT provTelefono FROM Proveedor;

-------junta ambos datos en una sola COLUMNA

--------------------- Consulta compuesta: JOIN + WHERE + SELECT
------------Consulta: Nombre del cliente, producto comprado y cantidad (detalle de ventas)


SELECT C.cliNombres, P.proNombre, D.dvenCantidad
FROM tblDetalleVenta D
JOIN VENTAS V ON D.IDVent = V.IDVent
JOIN Cliente C ON V.DNI = C.DNI
JOIN Producto P ON D.IDProduc = P.IDProduc;


-----INNER JOIN
----Devuelve solo registros que coinciden en ambas tablas.
SELECT columnas
FROM Tabla1
INNER JOIN Tabla2 ON PkTabla1.columna = Fktabla2.columna;

---Ejemplo: Productos y sus categorías.
SELECT P.proNombre, C.catNombre
FROM Producto P
INNER JOIN Categoria C ON P.IDcat = C.IDcat;

---------Solo muestra productos que tienen categoría asignada.

 ---RIGHT JOIN (o RIGHT OUTER JOIN)
---Igual que LEFT, pero devuelve todo de la derecha.

----Ejemplo: Todas las categorías, incluso sin productos:

SELECT P.proNombre, C.catNombre
FROM Producto P
RIGHT JOIN Categoria C ON P.IDcat = C.IDcat;

---Si una categoría no tiene productos, también se muestra

----FULL OUTER JOIN
---Muestra todo: combinaciones válidas y filas sin coincidencias de ambos lados.

SELECT P.proNombre, C.catNombre
FROM Producto P
FULL OUTER JOIN Categoria C ON P.IDcat = C.IDcat;

 ---Devuelve todos los productos y todas las categorías, emparejando cuando se puede, usando NULL cuando no.



 -------------PROCEDIMEINTOS ALMACENADOS---------------------------------------------------------

 CREATE PROCEDURE NombreProcedimiento
    @param1 TipoDato,
    @param2 TipoDato
AS
BEGIN
    -- Instrucciones SQL
END;


-------------------------------------- Mostrar todos los productos con stock mayor a cierto valor
CREATE PROCEDURE sp_ProductosConStockMayor
    @stockMinimo INT
AS
BEGIN
    SELECT proNombre, proStock
    FROM Producto
    WHERE CAST(proStock AS INT) > @stockMinimo;
END;

EXEC sp_ProductosConStockMayor @stockMinimo = 50;



----------------------- Insertar un nuevo cliente--------------
CREATE PROCEDURE sp_InsertarCliente
    @DNI VARCHAR(10),
    @ApellidoP VARCHAR(15),
    @ApellidoM VARCHAR(15),
    @Nombres VARCHAR(15),
    @Sexo VARCHAR(1),
    @FechaNacimiento DATE,
    @Direccion VARCHAR(25),
    @Distrito VARCHAR(25),
    @Telefono VARCHAR(9),
    @Email VARCHAR(50)
AS
BEGIN
    INSERT INTO Cliente VALUES (
        @DNI, @ApellidoP, @ApellidoM, @Nombres,
        @Sexo, @FechaNacimiento, @Direccion,
        @Distrito, @Telefono, @Email
    );
END;

EXEC sp_InsertarCliente 
    '1122334455', 'Condori', 'Huaman', 'Luis', 'M',
    '2000-01-15', 'Av. Qosqo 123', 'Cusco', '999888777', 'luis@email.com';


-----------------------------Mostrar ventas por cliente
CREATE PROCEDURE sp_VentasPorCliente
    @DNICliente VARCHAR(10)
AS
BEGIN
    SELECT V.IDVent, V.venFecha, E.empNombre
    FROM VENTAS V
    JOIN Empleado E ON V.IDEmpleado = E.IDEmpleado
    WHERE V.DNI = @DNICliente;
END;
EXEC sp_VentasPorCliente @DNICliente = '1234567890';

---------------------A. Insertar una venta con detalle (transacción)
CREATE PROCEDURE sp_InsertarVentaConDetalle
    @IDVent VARCHAR(10),
    @Fecha DATETIME,
    @DNI VARCHAR(10),
    @IDEmpleado VARCHAR(5),
    @IDProduc VARCHAR(10),
    @Cantidad INT
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        INSERT INTO VENTAS VALUES (@IDVent, @Fecha, @DNI, @IDEmpleado);

        INSERT INTO tblDetalleVenta VALUES (@Cantidad, @IDVent, @IDProduc);

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error en la transacción';
    END CATCH
END;
EXEC sp_InsertarVentaConDetalle 
'V003', '2025-06-24 10:00:00', '1234567890', 'E001', 'PRD001', 4;

------------------------- B. Buscar productos por categoría--------
CREATE PROCEDURE sp_ProductosPorCategoria
    @NombreCategoria VARCHAR(15)
AS
BEGIN
    SELECT P.proNombre, P.proPrecioPropuesto
    FROM Producto P
    JOIN Categoria C ON P.IDcat = C.IDcat
    WHERE C.catNombre = @NombreCategoria;
END;

EXEC sp_ProductosPorCategoria @NombreCategoria = 'Lácteos';


-------------------------ESTRUCTURA DE UNA FUNCIÓN ESCALAR------------------------

CREATE FUNCTION NombreFuncion (
    @param1 TipoDato,
    @param2 TipoDato
)
RETURNS TipoResultado
AS
BEGIN
    DECLARE @Resultado TipoResultado;

    -- Lógica
    SET @Resultado = ...;

    RETURN @Resultado;
END;

--------------------------------------------------------------------

-------------A. Obtener la cantidad de letras en el nombre de un producto

CREATE FUNCTION fn_LargoNombreProducto (
    @IDProduc VARCHAR(10)
)
RETURNS INT
AS
BEGIN
    DECLARE @Longitud INT;
    SELECT @Longitud = LEN(proNombre)
    FROM Producto
    WHERE IDProduc = @IDProduc;

    RETURN ISNULL(@Longitud, 0);
END;

SELECT IDProduc, proNombre, dbo.fn_LargoNombreProducto(IDProduc) AS LargoNombre
FROM Producto;

-------------------------------------------------------------------------------
---------B. Obtener las iniciales del nombre completo de un cliente

CREATE FUNCTION fn_InicialesCliente (
    @DNI VARCHAR(10)
)
RETURNS VARCHAR(5)
AS
BEGIN
    DECLARE @Iniciales VARCHAR(5);
    SELECT @Iniciales = 
        LEFT(cliApellidoPaterno, 1) +
        LEFT(cliApellidoMaterno, 1) +
        LEFT(cliNombres, 1)
    FROM Cliente
    WHERE DNI = @DNI;

    RETURN @Iniciales;
END;
SELECT DNI, cliNombres, dbo.fn_InicialesCliente(DNI) AS Iniciales
FROM Cliente;
-------------------------------------------------------------------------
----------C. Aplicar un descuento al precio de un producto

CREATE FUNCTION fn_PrecioConDescuento (
    @IDProduc VARCHAR(10),
    @PorcentajeDescuento DECIMAL(5,2)
)
RETURNS DECIMAL(9,2)
AS
BEGIN
    DECLARE @PrecioFinal DECIMAL(9,2);
    DECLARE @PrecioBase DECIMAL(9,2);

    SELECT @PrecioBase = proPrecioPropuesto
    FROM Producto
    WHERE IDProduc = @IDProduc;

    SET @PrecioFinal = @PrecioBase - (@PrecioBase * @PorcentajeDescuento / 100);

    RETURN ISNULL(@PrecioFinal, 0);
END;
SELECT IDProduc, proNombre, dbo.fn_PrecioConDescuento(IDProduc, 10) AS PrecioCon10PorcDescuento
FROM Producto;

-----------------------------------------------------------------------------------------------
---------- D. Verificar qué dígito está en el medio del DNI (posición 5 si tiene 9 caracteres)

CREATE FUNCTION fn_DigitoCentralDNI (
    @DNI VARCHAR(10)
)
RETURNS CHAR(1)
AS
BEGIN
    DECLARE @Digito CHAR(1);
    DECLARE @Len INT;

    SET @Len = LEN(@DNI);
    SET @Digito = SUBSTRING(@DNI, (@Len / 2) + 1, 1);

    RETURN @Digito;
END;
SELECT DNI, dbo.fn_DigitoCentralDNI(DNI) AS DigitoCentral
FROM Cliente;


----------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-----------ESTRUCTURA BÁSICA DE UNA VISTA

CREATE VIEW NombreVista
AS
SELECT columnas
FROM tablas
[JOIN ...]
[WHERE condiciones]
[GROUP BY ...]
[ORDER BY ...] -- solo en vistas con TOP


----------------------------------------------------------------------------------------
-----------------Vista simple: productos con stock bajo

CREATE VIEW vw_ProductosStockBajo
AS
SELECT IDProduc, proNombre, CAST(proStock AS INT) AS Stock
FROM Producto
WHERE CAST(proStock AS INT) < 50;

SELECT * FROM vw_ProductosStockBajo;


-----------------------------------------------------------------------------------
--------------------------------------Vista con JOIN: ventas detalladas

CREATE VIEW vw_VentasDetalladas
AS
SELECT 
    V.IDVent,
    V.venFecha,
    C.cliNombres AS Cliente,
    P.proNombre AS Producto,
    D.dvenCantidad,
    (D.dvenCantidad * P.proPrecioPropuesto) AS SubTotal
FROM VENTAS V
JOIN Cliente C ON V.DNI = C.DNI
JOIN tblDetalleVenta D ON V.IDVent = D.IDVent
JOIN Producto P ON D.IDProduc = P.IDProduc;


SELECT * FROM vw_VentasDetalladas;

-----------------------------------------------------------------------------
------------ Vista con GROUP BY: total vendido por producto

CREATE VIEW vw_ResumenVentasProducto
AS
SELECT 
    P.proNombre,
    SUM(D.dvenCantidad) AS CantidadVendida,
    SUM(D.dvenCantidad * P.proPrecioPropuesto) AS TotalGanado
FROM tblDetalleVenta D
JOIN Producto P ON D.IDProduc = P.IDProduc
GROUP BY P.proNombre;

SELECT * FROM vw_ResumenVentasProducto;


-------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-----------------------------ESTRUCTURA DE GROUP BY

SELECT columnaAgrupada, funciónAgregada(...)
FROM tabla
GROUP BY columnaAgrupada;
------------------------------------------------------
--------------------- A. Total de ventas por cliente (COUNT, SUM)

SELECT 
    C.DNI,
    C.cliNombres,
    COUNT(V.IDVent) AS NumeroVentas,
    SUM(D.dvenCantidad * P.proPrecioPropuesto) AS TotalGastado
FROM Cliente C
JOIN VENTAS V ON C.DNI = V.DNI
JOIN tblDetalleVenta D ON V.IDVent = D.IDVent
JOIN Producto P ON D.IDProduc = P.IDProduc
GROUP BY C.DNI, C.cliNombres;

-----------------------------------------------------------------
-----------------------B. Total de productos vendidos por producto (SUM)
SELECT 
    P.proNombre,
    SUM(D.dvenCantidad) AS TotalVendidos
FROM Producto P
JOIN tblDetalleVenta D ON P.IDProduc = D.IDProduc
GROUP BY P.proNombre;

--------------------------------------------------------------------------------
----------------------C. Precio total + IGV (SUM, +, *)

SELECT 
    P.proNombre,
    SUM(D.dvenCantidad * P.proPrecioPropuesto) AS SubTotal,
    SUM(D.dvenCantidad * P.proPrecioPropuesto * 0.18) AS IGV,
    SUM(D.dvenCantidad * P.proPrecioPropuesto * 1.18) AS TotalConIGV
FROM Producto P
JOIN tblDetalleVenta D ON P.IDProduc = D.IDProduc
GROUP BY P.proNombre;

------------------------------------------------------------------------------------------
------------------------------------D. Promedio de ventas por empleado (AVG)
SELECT 
    E.empNombre,
    AVG(D.dvenCantidad * P.proPrecioPropuesto) AS PromedioVenta
FROM Empleado E
JOIN VENTAS V ON E.IDEmpleado = V.IDEmpleado
JOIN tblDetalleVenta D ON V.IDVent = D.IDVent
JOIN Producto P ON D.IDProduc = P.IDProduc
GROUP BY E.empNombre;

---------------------------------------------------------------------------------------
--------------E. Mayor y menor precio de producto (MAX, MIN)
SELECT 
    MAX(proPrecioPropuesto) AS PrecioMaximo,
    MIN(proPrecioPropuesto) AS PrecioMinimo
FROM Producto;

--------------------------------------------------------------------------------------
-------------- F. Agrupar clientes por distrito y contar (COUNT)
SELECT 
    cliDistrito,
    COUNT(*) AS TotalClientes
FROM Cliente
GROUP BY cliDistrito;

----------------------------------------------------------------------------------------
-------------G. Agrupar productos por categoría y sumar stock
SELECT 
    C.catNombre,
    SUM(CAST(P.proStock AS INT)) AS StockTotal
FROM Categoria C
JOIN Producto P ON C.IDcat = P.IDcat
GROUP BY C.catNombre;

----------------------------------------------------------------------------------------------
---------INCLUYENDO HAVING , HAVING filtra los grupos, como WHERE pero después de agrupar.
SELECT 
    P.proNombre,
    SUM(D.dvenCantidad) AS TotalVendidos
FROM Producto P
JOIN tblDetalleVenta D ON P.IDProduc = D.IDProduc
GROUP BY P.proNombre
HAVING SUM(D.dvenCantidad) > 2;


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--------------------------------- ESTRUCTURA OFICIAL DE CASE 🔷 Forma simple (cuando comparas UNA columna):
CASE columna
    WHEN valor1 THEN resultado1
    WHEN valor2 THEN resultado2
    ELSE resultadoPorDefecto
END
------------------------------------------Forma buscada (más flexible, puedes usar condiciones):

CASE 
    WHEN condición1 THEN resultado1
    WHEN condición2 THEN resultado2
    ELSE resultadoPorDefecto
END

---------------------------------------------------------------------------------------------------
-----------------A. CASE en un SELECT (para mostrar una etiqueta)

SELECT 
    proNombre,
    CAST(proStock AS INT) AS Stock,
    CASE 
        WHEN CAST(proStock AS INT) >= 100 THEN 'Stock Alto'
        WHEN CAST(proStock AS INT) BETWEEN 50 AND 99 THEN 'Stock Medio'
        ELSE 'Stock Bajo'
    END AS NivelStock
FROM Producto;

---------------------------------------------------------------------------------------------------
--------------------B. CASE dentro de una función escalar
CREATE FUNCTION fn_TipoEdad (@FechaNac DATE)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Edad INT = DATEDIFF(YEAR, @FechaNac, GETDATE());
    DECLARE @Categoria VARCHAR(20);

    SET @Categoria = CASE
        WHEN @Edad < 18 THEN 'Menor de Edad'
        WHEN @Edad BETWEEN 18 AND 60 THEN 'Adulto'
        ELSE 'Adulto Mayor'
    END;

    RETURN @Categoria;
END;

SELECT cliNombres, dbo.fn_TipoEdad(cliFechaNacimiento) AS TipoEdad
FROM Cliente;

---------------------------------------------------------------------------------------------
----------------------C. CASE con ORDER BY (orden personalizado)
SELECT proNombre, proPrecioPropuesto
FROM Producto
ORDER BY 
    CASE 
        WHEN proNombre = 'Leche Gloria' THEN 1
        WHEN proNombre = 'Inka Kola' THEN 2
        ELSE 3
    END;

-----------------------------------------------------------------------------------------------
-------------------- D. CASE dentro de un cálculo aritmético
SELECT 
    proNombre,
    proPrecioPropuesto,
    dvenCantidad,
    dvenCantidad * proPrecioPropuesto * 
        CASE 
            WHEN dvenCantidad >= 3 THEN 0.9 -- 10% de descuento
            ELSE 1
        END AS PrecioConDescuento
FROM tblDetalleVenta D
JOIN Producto P ON D.IDProduc = P.IDProduc;

---------------------------------------------------------------------------------------------
------------------------ E. CASE dentro de GROUP BY (clasificar por rangos)
SELECT 
    CASE 
        WHEN empSueldo < 2000 THEN 'Bajo'
        WHEN empSueldo BETWEEN 2000 AND 3000 THEN 'Medio'
        ELSE 'Alto'
    END AS RangoSueldo,
    COUNT(*) AS TotalEmpleados
FROM Empleado
GROUP BY 
    CASE 
        WHEN empSueldo < 2000 THEN 'Bajo'
        WHEN empSueldo BETWEEN 2000 AND 3000 THEN 'Medio'
        ELSE 'Alto'
    END;

	-----------------------------------------------------------------------------------------------
	----------- F. CASE con NULL (evitar errores)
	SELECT 
    cliNombres,
    cliEmail,
    CASE 
        WHEN cliEmail IS NULL THEN 'Sin correo'
        ELSE cliEmail
    END AS CorreoMostrado
FROM Cliente;
------------------------------------------------------------------------------------------------------
----------G. CASE como reemplazo de IF-ELSE simple en procedimientos

CREATE PROCEDURE sp_ClasificarClienteEdad
    @DNI VARCHAR(10)
AS
BEGIN
    SELECT cliNombres,
        CASE 
            WHEN DATEDIFF(YEAR, cliFechaNacimiento, GETDATE()) < 18 THEN 'Joven'
            ELSE 'Adulto'
        END AS TipoCliente
    FROM Cliente
    WHERE DNI = @DNI;
END;

----------------------------------------------------------------------------------------------------
--------------------------examen 24 junio:
USE lunes;
GO

-- ============================================
-- DROP SI EXISTEN
-- ============================================
IF OBJECT_ID('sp_EmpleadosSueldoApellido') IS NOT NULL DROP PROCEDURE sp_EmpleadosSueldoApellido;
IF OBJECT_ID('sp_ClientesMarzo1989') IS NOT NULL DROP PROCEDURE sp_ClientesMarzo1989;
IF OBJECT_ID('sp_ProductosLetraCat') IS NOT NULL DROP PROCEDURE sp_ProductosLetraCat;
IF OBJECT_ID('sp_ProductosPrecioCategoria') IS NOT NULL DROP PROCEDURE sp_ProductosPrecioCategoria;
IF OBJECT_ID('sp_DetalleVentasPorRango') IS NOT NULL DROP PROCEDURE sp_DetalleVentasPorRango;
IF OBJECT_ID('sp_GastoTotalCliente') IS NOT NULL DROP PROCEDURE sp_GastoTotalCliente;
IF OBJECT_ID('fn_ClientesPorAnioNacimiento') IS NOT NULL DROP FUNCTION fn_ClientesPorAnioNacimiento;
IF OBJECT_ID('fn_ProductosPorProveedor') IS NOT NULL DROP FUNCTION fn_ProductosPorProveedor;
IF OBJECT_ID('fn_SueldosFinales') IS NOT NULL DROP FUNCTION fn_SueldosFinales;
IF OBJECT_ID('vw_VentasDetalle') IS NOT NULL DROP VIEW vw_VentasDetalle;
GO

-- ============================================
-- PROCEDIMIENTOS
-- ============================================

-- 1. Empleados con sueldo entre 1500 y 2000 y apellido D o F
CREATE PROCEDURE sp_EmpleadosSueldoApellido
AS
BEGIN
    SELECT
        IDEmpleado,
        empApellidoPaterno + ' ' + empNombre AS NombreCompleto,
        empSueldo
    FROM Empleado
    WHERE empSueldo BETWEEN 1500 AND 2000
      AND LEFT(empApellidoPaterno,1) IN ('D','F')
END
GO

-- 2. Clientes nacidos en marzo desde 1989
CREATE PROCEDURE sp_ClientesMarzo1989
AS
BEGIN
    SELECT
        DNI,
        cliApellidoPaterno,
        cliNombres,
        cliFechaNacimiento
    FROM Cliente
    WHERE YEAR(cliFechaNacimiento) >= 1989
      AND MONTH(cliFechaNacimiento) = 3
END
GO

-- 3. Productos con segunda letra 'E' y categoría terminada en 1 o 3
CREATE PROCEDURE sp_ProductosLetraCat
AS
BEGIN
    SELECT
        p.IDProduc,
        p.proNombre,
        p.IDcat,
        c.catNombre
    FROM Producto p
    INNER JOIN Categoria c ON p.IDcat = c.IDcat
    WHERE SUBSTRING(p.proNombre,2,1) = 'E'
      AND RIGHT(p.IDcat,1) IN ('1','3')
END
GO

-- 4. Productos con precio <= parámetro y categoría = parámetro
CREATE PROCEDURE sp_ProductosPrecioCategoria
    @PrecioMax DECIMAL(9,2) = 20,
    @Categoria VARCHAR(49) = 'CA03'
AS
BEGIN
    SELECT
        p.IDProduc,
        p.proNombre,
        p.IDcat,
        c.catNombre,
        pr.provNombre,
        p.proPrecioPropuesto
    FROM Producto p
    INNER JOIN Categoria c ON p.IDcat = c.IDcat
    INNER JOIN Proveedor pr ON p.IDRUC = pr.IDRUC
    WHERE p.proPrecioPropuesto <= @PrecioMax
      AND p.IDcat = @Categoria
END
GO

-- ============================================
-- FUNCIONES
-- ============================================

-- 5. Año de nacimiento y cantidad de clientes
CREATE FUNCTION fn_ClientesPorAnioNacimiento()
RETURNS TABLE
AS
RETURN
(
    SELECT
        YEAR(cliFechaNacimiento) AS AnioNacimiento,
        COUNT(*) AS CantidadClientes
    FROM Cliente
    GROUP BY YEAR(cliFechaNacimiento)
)
GO

-- 6. Proveedor y cantidad de productos
CREATE FUNCTION fn_ProductosPorProveedor()
RETURNS TABLE
AS
RETURN
(
    SELECT
        pr.provNombre,
        COUNT(p.IDProduc) AS CantidadProductos
    FROM Proveedor pr
    LEFT JOIN Producto p ON pr.IDRUC = p.IDRUC
    GROUP BY pr.provNombre
)
GO

-- 7. Código, nombre completo, sueldo mensual y sueldo anual neto
CREATE FUNCTION fn_SueldosFinales()
RETURNS TABLE
AS
RETURN
(
    SELECT
        IDEmpleado,
        empApellidoPaterno + ' ' + empNombre AS NombreCompleto,
        empSueldo,
        (empSueldo * 12) * 0.70 AS SueldoAnualNeto
    FROM Empleado
)
GO

-- ============================================
-- VISTA
-- ============================================

-- 8. Vista de ventas con totales
CREATE VIEW vw_VentasDetalle
AS
SELECT
    v.IDVent,
    v.venFecha,
    c.DNI,
    c.cliApellidoPaterno + ' ' + c.cliNombres AS ClienteNombre,
    e.empApellidoPaterno + ' ' + e.empNombre AS EmpleadoNombre,
    SUM(dv.dvenCantidad) AS TotalProductos,
    SUM(dv.dvenCantidad * p.proPrecioPropuesto) AS MontoTotal
FROM VENTAS v
INNER JOIN Cliente c ON v.DNI = c.DNI
INNER JOIN Empleado e ON v.IDEmpleado = e.IDEmpleado
INNER JOIN tblDetalleVenta dv ON v.IDVent = dv.IDVent
INNER JOIN Producto p ON dv.IDProduc = p.IDProduc
GROUP BY
    v.IDVent,
    v.venFecha,
    c.DNI,
    c.cliApellidoPaterno,
    c.cliNombres,
    e.empApellidoPaterno,
    e.empNombre
GO

-- 9. Detalle de ventas por rango de fechas
CREATE PROCEDURE sp_DetalleVentasPorRango
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SELECT
        v.IDVent,
        v.venFecha,
        c.DNI,
        c.cliApellidoPaterno + ' ' + c.cliNombres AS ClienteNombre,
        p.proNombre,
        dv.dvenCantidad,
        p.proPrecioPropuesto,
        dv.dvenCantidad * p.proPrecioPropuesto AS Subtotal
    FROM VENTAS v
    INNER JOIN Cliente c ON v.DNI = c.DNI
    INNER JOIN tblDetalleVenta dv ON v.IDVent = dv.IDVent
    INNER JOIN Producto p ON dv.IDProduc = p.IDProduc
    WHERE v.venFecha BETWEEN @FechaInicio AND @FechaFin
END
GO

-- 10. Gasto total de un cliente con cantidad de compras en rango de fechas
CREATE PROCEDURE sp_GastoTotalCliente
    @DNICliente VARCHAR(10),
    @CantidadCompras INT,
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SELECT
        v.DNI,
        COUNT(DISTINCT v.IDVent) AS TotalCompras,
        SUM(dv.dvenCantidad * p.proPrecioPropuesto) AS GastoTotal
    FROM VENTAS v
    INNER JOIN tblDetalleVenta dv ON v.IDVent = dv.IDVent
    INNER JOIN Producto p ON dv.IDProduc = p.IDProduc
    WHERE v.DNI = @DNICliente
      AND v.venFecha BETWEEN @FechaInicio AND @FechaFin
    GROUP BY v.DNI
    HAVING COUNT(DISTINCT v.IDVent) = @CantidadCompras
END
GO

-- ============================================
-- EJECUTABLES DE PRUEBA
-- ============================================

-- 1
EXEC sp_EmpleadosSueldoApellido;
GO

-- 2
EXEC sp_ClientesMarzo1989;
GO

-- 3
EXEC sp_ProductosLetraCat;
GO

-- 4
EXEC sp_ProductosPrecioCategoria @PrecioMax=10, @Categoria='CAT001';
GO

-- 5
SELECT * FROM fn_ClientesPorAnioNacimiento();
GO

-- 6
SELECT * FROM fn_ProductosPorProveedor();
GO

-- 7
SELECT * FROM fn_SueldosFinales();
GO

-- 8
SELECT * FROM vw_VentasDetalle;
GO

-- 9
EXEC sp_DetalleVentasPorRango '2025-01-01', '2025-12-31';
GO

-- 10
EXEC sp_GastoTotalCliente
    @DNICliente='1234567890',
    @CantidadCompras=1,
    @FechaInicio='2025-01-01',
    @FechaFin='2025-12-31';
GO