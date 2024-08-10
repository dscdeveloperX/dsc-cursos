USE NORTHWIND
GO

-------------------------------------------------------------------------------------------------------------------
--CUENTA REGISTROS QUE CUMPLEN CONDICION
-------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE P_COUNT
AS
SELECT COUNT(*) as CONTADO 
FROM Products 
WHERE UnitPrice > 100;

-------------------------------------------------------------------------------------------------------------------
--REDONDEA AL ENTERO MAYOR 16.30 = 17
-------------------------------------------------------------------------------------------------------------------
SELECT UnitPrice, CEILING(UnitPrice) as RESULTADO 
FROM Products;




-------------------------------------------------------------------------------------------------------------------
--INDICE DE LA PALABRA A BUSCAR
-------------------------------------------------------------------------------------------------------------------
SELECT ProductName, CHARINDEX('Tofu', ProductName) AS NOMBRE_PRODUCTO 
FROM Products;



-------------------------------------------------------------------------------------------------------------------
--LARGO DE LA CADENA
-------------------------------------------------------------------------------------------------------------------
SELECT ProductName, LEN(ProductName) AS LARGO 
FROM Products;




-------------------------------------------------------------------------------------------------------------------
--REDONDEA AL ENTERO SIN DECIMALES 16.30 = 16
-------------------------------------------------------------------------------------------------------------------

SELECT UnitPrice, FLOOR(UnitPrice)AS RESULTADO 
FROM Products;




-------------------------------------------------------------------------------------------------------------------
--PROMEDIO
-------------------------------------------------------------------------------------------------------------------
SELECT AVG(UnitPrice) AS RESPUESTA 
FROM Products; 




-------------------------------------------------------------------------------------------------------------------
--MAYUSCULA Y MINUSCULA
-------------------------------------------------------------------------------------------------------------------
SELECT UPPER(LastName) AS MINUSCULA, LOWER(FirstName) AS MINUSCULA 
FROM Employees;




-------------------------------------------------------------------------------------------------------------------
--QUITA ESPACIOS A LA IZQUIERDA Y DERECHA
-------------------------------------------------------------------------------------------------------------------
SELECT LTRIM([Address]) AS ESPACIO_IZQUIERDA, RTRIM([Address]) AS ESPACIO_DERECHA 
FROM Employees;




-------------------------------------------------------------------------------------------------------------------
--CONDICIONA CONTENIDO DE COLUMNAS
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE T_CHECK
(
INDICE INT IDENTITY(1,1) CONSTRAINT PK_INDICE PRIMARY KEY NONCLUSTERED NOT NULL,
CEDULA NVARCHAR(10) CHECK(LEN(CEDULA) > 9 AND LEN(CEDULA)< 11 ) NOT NULL
)




-------------------------------------------------------------------------------------------------------------------
--OBTIENE VALORES ENTRE 50 Y 100
SELECT ProductName, UnitPrice 
FROM Products 
WHERE UnitPrice BETWEEN 50 AND 100;




-------------------------------------------------------------------------------------------------------------------
-- REEMPLAZA TEXTO DE COLUMNA POR OTRO TEXTO
-------------------------------------------------------------------------------------------------------------------
SELECT LastName, REPLACE([LastName], 'King', 'King kong') AS REMPLAZO 
FROM Employees;



-------------------------------------------------------------------------------------------------------------------
-- CREAMOS PROCEDIMIETO ALMACENA INSERT
-------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE P_Customers
(
@CustomerID NCHAR(5),
@CompanyName NVARCHAR(40),
@ContactName NVARCHAR(30),
@ContactTitle NVARCHAR(30),
@Address NVARCHAR(60),
@City NVARCHAR(15),
@Region NVARCHAR(15),
@PostalCode NVARCHAR(10),
@Country NVARCHAR(15),
@Phone NVARCHAR(24),
@Fax NVARCHAR(24)
)
AS
BEGIN;
INSERT INTO Customers(CustomerID,CompanyName,ContactName,ContactTitle,[Address],City,Region,PostalCode,Country,Phone,Fax) 
VALUES (@CustomerID,@CompanyName,@ContactName,@ContactTitle,@Address,@City,@Region,@PostalCode,@Country,@Phone,@Fax);
END;

--EXECUTE P_Customers 'AABBC','GALMAN S. A.','DARWIN SANCHEZ','ING','LA OCTAVA Y EL ORO','GUAYAQUIL','COSTA','0000000001','ECUADOR','2443335','093333222';




-------------------------------------------------------------------------------------------------------------------
--PROCEDIMIENTO ALMACENADO UPDATE
-------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE PU_Customers
(
@CustomerID2 NCHAR(5),
@CustomerID NCHAR(5),
@CompanyName NVARCHAR(40),
@ContactName NVARCHAR(30),
@ContactTitle NVARCHAR(30),
@Address NVARCHAR(60),
@City NVARCHAR(15),
@Region NVARCHAR(15),
@PostalCode NVARCHAR(10),
@Country NVARCHAR(15),
@Phone NVARCHAR(24),
@Fax NVARCHAR(24)
)
AS
BEGIN;
UPDATE Customers
SET CustomerID = @CustomerID,CompanyName = @CompanyName,ContactName = @ContactName,ContactTitle = @ContactTitle,[Address] = @Address,City = @City,Region = @Region,PostalCode = @PostalCode,Country = @Country,Phone = @Phone,Fax = @Fax
WHERE CustomerID = @CustomerID2;
END;

--EXECUTE PU_Customers 'AABBC', 'XXXXX','JEHODAYOSC S. A.','DARWIN SANCHEZ','ING','LA OCTAVA Y EL ORO','GUAYAQUIL','COSTA','0000000001','ECUADOR','2443335','093333222';




-------------------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTO ALMACENADO SELECT
-------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE PS_Customers
(
@CustomerID NCHAR(5)
)
AS
BEGIN;
SELECT * 
FROM Customers 
WHERE CustomerID = @CustomerID;
END;

--EXECUTE PS_Customers 'XXXXX'




-------------------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTO ALMACENADO DELETE
-------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE PD_Customers
(
@CustomerID NCHAR(5)
)
AS
BEGIN;
DELETE 
FROM Customers 
WHERE CustomerID = @CustomerID;
END;

--EXECUTE PD_Customers 'XXXXX'




-------------------------------------------------------------------------------------------------------------------
--REPLICAS DEL VALOR DE UNA COLUMNA
-------------------------------------------------------------------------------------------------------------------

SELECT REPLICATE(CustomerID + ' - ', 3) AS REPLICAR 
FROM Customers;




-------------------------------------------------------------------------------------------------------------------
--REGION ES NULL
-------------------------------------------------------------------------------------------------------------------

SELECT CompanyName, Region
FROM Customers 
WHERE Region IS NULL


--REGION NO ES NULL
SELECT CompanyName, Region
FROM Customers 
WHERE Region IS NOT NULL




-------------------------------------------------------------------------------------------------------------------
-- REDONDEA 12.75 (0 = 13.00) (2, 12.75)
-------------------------------------------------------------------------------------------------------------------

SELECT UnitPrice, ROUND(UnitPrice, 0) AS REDONDEAR_0, ROUND(UnitPrice, 2) AS REDONDEAR_2
FROM Products




-------------------------------------------------------------------------------------------------------------------
--CONCATENACION DE COLUMNA
-------------------------------------------------------------------------------------------------------------------
SELECT LastName + ', ' + FirstName AS [APELLIDOS Y NOMBRE] 
FROM Employees




-------------------------------------------------------------------------------------------------------------------
--GENERA SU VALOR DE LOS VALORES DE OTRAS COLUMNAS
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE T1
(
INDICE_ID2 INT IDENTITY(1,1) CONSTRAINT PK_INDICE_ID2 PRIMARY KEY NONCLUSTERED NOT NULL,
APELLIDOS NVARCHAR(30) NOT NULL,
NOMBRES NVARCHAR(30) NOT NULL,
APELLIDOS_NOMBRES AS APELLIDOS + ', ' + NOMBRES
);





-------------------------------------------------------------------------------------------------------------------
--SE UBICA EN EL INDICE 4 Y REEMPLAZA 2 CARACTERES POR EL TEXTO INDICADO
-------------------------------------------------------------------------------------------------------------------

DECLARE @COLUMNA NVARCHAR(20)
SET @COLUMNA = 'DARGUIN'
SELECT STUFF(@COLUMNA, 4, 2, 'W') AS REEMPLADO;



-------------------------------------------------------------------------------------------------------------------
--UNIQUE : NO PERMITE VALORES REPETIDOS
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE TABLA_A1
(
INDICE_C1 INT IDENTITY(1,1) CONSTRAINT PK_INDICE_C1 PRIMARY KEY NONCLUSTERED NOT NULL,
CEDULA NVARCHAR(10) UNIQUE NOT NULL,
COD_X NVARCHAR(5)UNIQUE NOT NULL,
NOMBRES NVARCHAR(50) NOT NULL
)





-------------------------------------------------------------------------------------------------------------------
-- DEFAULT : PREDEFINE VALORES EN CAUSA DE AUSENCIA
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE TABLA_A1
(
INDICE_C1 INT IDENTITY(1,1) CONSTRAINT PK_INDICE_C1 PRIMARY KEY NONCLUSTERED NOT NULL,
CEDULA NVARCHAR(10) DEFAULT '0000000000' NOT NULL,
NOMBRES NVARCHAR(50) DEFAULT '-' NOT NULL,
SUELDO MONEY DEFAULT 0.10 NOT NULL
)





-------------------------------------------------------------------------------------------------------------------
--INSERTA EN TABLA_B1 LOS VALORES DE LA COLUMNA (LastName, FirstName ) DE LA TABLA Employees
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE TABLA_B1
(
INDICE_C2 INT IDENTITY(1,1) CONSTRAINT PK_INDICE_C2 PRIMARY KEY NONCLUSTERED NOT NULL,
NOMBRES NVARCHAR(20) NOT NULL,
APELLIDOS NVARCHAR(10)NOT NULL
)

--
INSERT INTO TABLA_B1 (NOMBRES, APELLIDOS) 
SELECT LastName, FirstName 
FROM Employees;

--VISUALIZAMOS RESULTADO
SELECT * 
FROM TABLA_B1;




-------------------------------------------------------------------------------------------------------------------
-- ALTER TABLE ADD : AGREGA COLUMNA A UNA TABLA
-- ALTER TABLE DROP COLUMN : ELIMINA COLUMNA A UNA TABLA
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE TABLA_B2
(
INDICEB2 INT IDENTITY(1,1) CONSTRAINT PK_INDICEB2 PRIMARY KEY NONCLUSTERED NOT NULL,
NOMBRES NVARCHAR(60) NOT NULL,
EDAD TINYINT NOT NULL
)
--
INSERT INTO TABLA_B2 VALUES('DARWIN', 10);
INSERT INTO TABLA_B2 VALUES('WILSON', 12);
INSERT INTO TABLA_B2 VALUES('SANSON', 20);
--

ALTER TABLE TABLA_B2
ADD CEDULA NVARCHAR(10) DEFAULT '0000000000' NOT NULL;
--
ALTER TABLE TABLA_B2
DROP COLUMN EDAD;
--
SELECT * 
FROM TABLA_B2;





-------------------------------------------------------------------------------------------------------------------
-- AGREGA ESPACIOS QUE DESEE
-------------------------------------------------------------------------------------------------------------------

DECLARE @NOMBRE NVARCHAR(20), @APELLIDO NVARCHAR(40)
--
SET @NOMBRE = 'DARWIN'
SET @APELLIDO = 'SANCHEZ'
--
SELECT @NOMBRE + SPACE(10) + @APELLIDO AS [NOMBRE Y APELLIDO];





-------------------------------------------------------------------------------------------------------------------
-- NOT : NO ES -- LO CONTRARIO 
-------------------------------------------------------------------------------------------------------------------

-- ES MAYOR A 20
SELECT ProductName, UnitPrice 
FROM Products
WHERE UnitPrice > 20

-- NO ES MAYOR A 20
SELECT ProductName, UnitPrice 
FROM Products
WHERE NOT UnitPrice > 20





-------------------------------------------------------------------------------------------------------------------
-- SUBSTING : SUBSTRAE UNA FRACCION DE LA CADENA
-------------------------------------------------------------------------------------------------------------------

DECLARE @CODIGOS NVARCHAR(60)
SET @CODIGOS = 'ABC-00013'
--
SELECT SUBSTRING(@CODIGOS, 1, 3) AS [CODIGO EMPRESA], SUBSTRING(@CODIGOS, 5,5) AS [CODIGO EMPLEADO];





-------------------------------------------------------------------------------------------------------------------
--TOP: OBTIENE UNA CANTIDAD DE REGISTROS O PORCENTAJE DE REGISTROS QUE CUMPLEN CON LA CONDICION
--50 REGISTROS
-------------------------------------------------------------------------------------------------------------------

SELECT TOP 50 ProductName, UnitPrice 
FROM Products;

-- 50% DE LOS REGISTROS
SELECT TOP 50 PERCENT ProductName, UnitPrice 
FROM Products;





-------------------------------------------------------------------------------------------------------------------
-- DISTINCT : VALORES DISTINTOS DE UNA COLUMNA
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE TABLA_B3
(
INDICEB3 INT IDENTITY(1,1) CONSTRAINT PK_INDICEB3 PRIMARY KEY NONCLUSTERED NOT NULL,
CATEGORIA_DEPORTE NVARCHAR(60)NOT NULL
)
INSERT INTO TABLA_B3 VALUES('FUTBOL');
INSERT INTO TABLA_B3 VALUES('TENIS');
INSERT INTO TABLA_B3 VALUES('BASQUET');
INSERT INTO TABLA_B3 VALUES('TENIS');
INSERT INTO TABLA_B3 VALUES('FUTBOL');
--
SELECT DISTINCT CATEGORIA_DEPORTE AS DEPORTES 
FROM TABLA_B3;



 

-------------------------------------------------------------------------------------------------------------------
-- CAST : CONVIERTE EL TIPO DE UN VALOR A OTRO
-------------------------------------------------------------------------------------------------------------------

DECLARE @VALOR MONEY
SET @VALOR = 1000000.3456
--
SELECT (@VALOR * 5.34)AS VALOR_NORMAL,  CAST((@VALOR * 5.34) AS DECIMAL(12,2)) AS VALOR_DECIMAL
--RESPUESTA : 5340001.845504	5340001.85




-------------------------------------------------------------------------------------------------------------------
-- CONVERT : A DIFERENCIA DE CAST PODEMOS CONVERTIR EN UN TEXTO CON FORMATO NUMERICO
-------------------------------------------------------------------------------------------------------------------

DECLARE @VALOR MONEY
SET @VALOR = 1000000.3456
--
SELECT CONVERT(NVARCHAR, @VALOR, 0) AS VALOR1, CONVERT(NVARCHAR, @VALOR, 1) AS VALOR2, CONVERT(NVARCHAR, @VALOR, 2) AS VALOR3
-- RESPUEST 1000000.35	1,000,000.35	1000000.3456





-------------------------------------------------------------------------------------------------------------------
--IDENTITY : INICIA CON UN VALOR ENTERO EL CUAL SE INCREMENTA SEGUN VALOR ESPECIFICADO
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE TABLA_B5
(
INDICEB5 INT IDENTITY(2,3)CONSTRAINT PK_INDICEB5 PRIMARY KEY NONCLUSTERED NOT NULL,
PRUDUCTOS NVARCHAR(40)NOT NULL
);
--
INSERT INTO TABLA_B5 
SELECT ProductName FROM Products;
--
SELECT * 
FROM TABLA_B5;





-------------------------------------------------------------------------------------------------------------------
--LIKE: FILTRA POR UN PATRON 
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE TB1
(
INDICEB1 INT IDENTITY(1,1) CONSTRAINT PK_INDICEB1 PRIMARY KEY NONCLUSTERED NOT NULL,
TEXTOS NVARCHAR(60) NOT NULL
)



INSERT INTO TB1 VALUES ('SANCHEZ CORREA DARWIN RODOLFO');
INSERT INTO TB1 VALUES ('LLANOS GOMEZ YOSELIN TATIANA');
INSERT INTO TB1 VALUES ('AREAS SORIA GALO ERNESTO')
INSERT INTO TB1 VALUES ('SAENZ CORREA WILSON RODRIGO');

-- % : VARIOS CARACTERES CUALQUIERA
SELECT * 
FROM TB1 
WHERE TEXTOS LIKE '%DOLFO';
--R: SANCHEZ CORREA DARWIN RODOLFO

SELECT * 
FROM TB1 
WHERE TEXTOS LIKE 'LLAN%';
--R: LLANOS GOMEZ YOSELIN TATIANA

SELECT * 
FROM TB1 
WHERE TEXTOS LIKE '%REA%';
--R : SANCHEZ CORREA DARWIN RODOLFO
--R : AREAS SORIA GALO ERNESTO


SELECT * 
FROM TB1 
WHERE TEXTOS LIKE 'S%Z%';--ENTRE PALABRA
--R: SANCHEZ CORREA DARWIN RODOLFO
--R: SAENZ CORREA WILSON RODRIGO




-------------------------------------------------------------------------------------------------------------------
INSERT INTO TB1 VALUES ('ALEJANDRO DARWIN');
INSERT INTO TB1 VALUES ('ALDO MANUEL');
INSERT INTO TB1 VALUES ('AUSTRO CARLOS');
INSERT INTO TB1 VALUES ('ASTUDILLO JAVIER');

-- _ : UN CARACTER CUALQUIERA
SELECT * FROM TB1 WHERE TEXTOS LIKE 'A_______O_J%';
--R : ASTUDILLO JAVIER





-------------------------------------------------------------------------------------------------------------------
INSERT INTO TB1 VALUES ('ALVARADO DARWIN');
INSERT INTO TB1 VALUES ('BRAVO DARWIN');
INSERT INTO TB1 VALUES ('CASTRO DARWIN')
INSERT INTO TB1 VALUES ('DUARTE DARWIN');
INSERT INTO TB1 VALUES ('ESPANIA DARWIN');

--[^A]INDISTINTO AL CARACTER CONTENIDO 
SELECT * 
FROM TB1 
WHERE TEXTOS LIKE '[^A]%';

--BRAVO DARWIN
--CASTRO DARWIN
--DUARTE DARWIN
--ESPANIA DARWIN

SELECT * 
FROM TB1 
WHERE TEXTOS LIKE '[^A,D]%';
--BRAVO DARWIN
--CASTRO DARWIN
--ESPANIA DARWIN


SELECT * 
FROM TB1 
WHERE TEXTOS LIKE '[^A,C-E]%';
--BRAVO DARWIN

SELECT * 
FROM TB1 
WHERE TEXTOS LIKE '[^B___O]%';
--ALVARADO DARWIN
--CASTRO DARWIN
--DUARTE DARWIN
--ESPANIA DARWIN





-------------------------------------------------------------------------------------------------------------------
INSERT INTO TB1 VALUES ('ALVARADO DARWIN');
INSERT INTO TB1 VALUES ('BRAVO DARWIN');
INSERT INTO TB1 VALUES ('CASTRO DARWIN')
INSERT INTO TB1 VALUES ('DUARTE DARWIN');
INSERT INTO TB1 VALUES ('ESPANIA DARWIN');

-- [A,C-E] ; CUALQUIER CARACTER INDIVIDUAL O DE INTERVALO
SELECT * FROM TB1 WHERE TEXTOS LIKE '[ESP]%';
--ESPANIA DARWIN
SELECT * FROM TB1 WHERE TEXTOS LIKE '[A,C]%';
--ALVARADO DARWIN
--CASTRO DARWIN

SELECT * FROM TB1 WHERE TEXTOS LIKE '[A,C-E]%';
--ALVARADO DARWIN
--CASTRO DARWIN
--DUARTE DARWIN
--ESPANIA DARWIN



-------------------------------------------------------------------------------------------------------------------
-- IN () : CONTIENE LO SIGUIENTES VALORES
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE TB4
(
INDICEB4 INT IDENTITY(1,1) CONSTRAINT PK_INDICEB4 PRIMARY KEY NONCLUSTERED NOT NULL,
TEXTOS NVARCHAR(60) NOT NULL
)
--
INSERT INTO TB4 VALUES ('ALVARADO');
INSERT INTO TB4 VALUES ('BRAVO');
INSERT INTO TB4 VALUES ('CASTRO')
INSERT INTO TB4 VALUES ('DUARTE');
INSERT INTO TB4 VALUES ('ESPANIA');
--

SELECT * 
FROM TB4 
WHERE TEXTOS IN ('BRAVO', 'CASTRO', 'DUARTE');
--BRAVO
--CASTRO
--DUARTE






-------------------------------------------------------------------------------------------------------------------
-- RIGHT ( VALOR ,2) : TOMA 2 CARACTERES DE LA IZQUIERDA 
-- LEFT ( VALOR ,3) : TOMA 2 CARACTERES DE LA DERECHA
-------------------------------------------------------------------------------------------------------------------

CREATE TABLE TB6
(
INDICEB6 INT IDENTITY(1,1) CONSTRAINT PK_INDICEB6 PRIMARY KEY NONCLUSTERED NOT NULL,
TEXTOS NVARCHAR(60) NOT NULL
)
--
INSERT INTO TB6 VALUES ('ALVARADO');
INSERT INTO TB6 VALUES ('BRAVO');
INSERT INTO TB6 VALUES ('CASTRO')
INSERT INTO TB6 VALUES ('DUARTE');
INSERT INTO TB6 VALUES ('ESPANIA');
--

SELECT RIGHT(TEXTOS, 2) AS DERECHA, LEFT(TEXTOS, 3) AS IZQUIERDA 
FROM TB6;
--DO	ALV
--VO	BRA
--RO	CAS
--TE	DUA
--IA	ESP

SELECT * 
FROM TB6 
WHERE LEFT(TEXTOS,1) IN ('A', 'D');
--ALVARADO
--DUARTE





-------------------------------------------------------------------------------------------------------------------
--DATADIFF(DAY, FI, FF) : DIFERENCIA ENTRE 2 FECHA EN DIAS, MES, ANIOS
-------------------------------------------------------------------------------------------------------------------

DECLARE @FECHAINICIO DATETIME, @FECHAFINAL DATETIME
SET @FECHAINICIO = '1977/07/21'
SET @FECHAFINAL = GETDATE()
--
SELECT DATEDIFF(DAY, @FECHAINICIO, @FECHAFINAL) AS DIAS,
DATEDIFF(MONTH, @FECHAINICIO, @FECHAFINAL)AS MESES,
DATEDIFF(YEAR, @FECHAINICIO, @FECHAFINAL) AS ANIOS;




-------------------------------------------------------------------------------------------------------------------
-- AGREGA DIAS MESES O ANIOS A UNA FECHA
-------------------------------------------------------------------------------------------------------------------

DECLARE @FECHA DATETIME
SET @FECHA = '1977/07/21'
--
SELECT DATEADD(DAY, 3,@FECHA) AS ADD_3_DIAS,
DATEADD(MONTH, 3, @FECHA) AS ADD_3_MESES,
DATEADD(YEAR,3, @FECHA)AS ADD_3_ANIOS






-------------------------------------------------------------------------------------------------------------------
-- DATEPART : UNA PARTE DE LA FECHA DIA, MES, ANIO,ETC..
-------------------------------------------------------------------------------------------------------------------

DECLARE @FECHA DATETIME
SET @FECHA = '1977/07/21 14:30:15:998'
--
SELECT DATEPART(DAY, @FECHA) AS DIA,
DATEPART(MONTH, @FECHA) AS MES,
DATEPART(YEAR, @FECHA)AS ANIO,
DATEPART(HOUR, @FECHA) AS HORAS,
DATEPART(MINUTE, @FECHA) AS MINUTOS,
DATEPART(SECOND, @FECHA) AS SEGUNDOS,
DATEPART(MILLISECOND, @FECHA) AS MILISEGUNDOS,
DATEPART( QUARTER, @FECHA) AS TRIMESTRE,
DATEPART(DAYOFYEAR, @FECHA) AS [DIAS DEL ANIO],
DATEPART(WEEK, @FECHA) AS NoSEMANA





-------------------------------------------------------------------------------------------------------------------
-- DATENAME(MONTH, FECHA) : NOMBRE DEL MES
-------------------------------------------------------------------------------------------------------------------

DECLARE @FECHA DATETIME
SET @FECHA = '1977/07/21 14:30:15:998'
--
SELECT DATENAME(MONTH, @FECHA) AS MES






-------------------------------------------------------------------------------------------------------------------
--ORDER BY campo ASC, campo DESC
-------------------------------------------------------------------------------------------------------------------

-- CATEGORIA DE FORMA ASCENDENTE
-- PRODUCTO DE FORMA DESCENDENTE

SELECT CategoryID, ProductName, UnitPrice 
FROM Products
ORDER BY CategoryID ASC, ProductName DESC




-- PRIMERO AGRUPA Y SI DESEAMOS LO AGRUPADO LO ORDENAMOS
-- SI LO DESEA PUEDE REALIZAR UNA OPERACION CON SUS VALORES
-------------------------------------------------------------------------------------------------------------------
SELECT CategoryID, 
SupplierID AS PROVEEDOR, 
SUM(UnitPrice) AS [ TOTAL PROVEEDOR ],
AVG(UnitPrice) AS [ PROMEDIO PROVEEDOR ], 
MIN(UnitPrice) AS [ MINIMO PROVEEDOR ],
MAX(UnitPrice) AS [ MAXIMO PROVEEDOR ] 
FROM Products
GROUP BY CategoryID, SupplierID
ORDER BY CategoryID ASC, SupplierID ASC

SELECT CategoryID, SupplierID AS PROVEEDOR
FROM Products
GROUP BY CategoryID, SupplierID
ORDER BY CategoryID ASC, SupplierID ASC





-------------------------------------------------------------------------------------------------------------------
-- SUM - MIN - MAX: SUMA MAXIMO O MINIMO VALORES DE REGISTROS COINCIDENTES QUE SON AGRUPADOS
-------------------------------------------------------------------------------------------------------------------

SELECT CategoryID, 
SUM(UnitPrice) AS [ TOTAL x CATEGORIA ],
MAX(UnitPrice) AS [ MAXIMO x CATEGORIA ],
MIN(UnitPrice) AS [ MINIMO x CATEGORIA ]
FROM Products
GROUP BY CategoryID



-------------------------------------------------------------------------------------------------------------------
--WHILE : INSERTA VALORES A UNA TABLA
-------------------------------------------------------------------------------------------------------------------

DELETE FROM TB7;
--
DECLARE @I INT, @NOMBRE NVARCHAR(60), @SUELDO DECIMAL(12,2)
SET @I = 0
--
WHILE ( @I < 50 )
BEGIN

SET @I = @I + 1
SET @NOMBRE = 'DARWINCITO -' + CAST(@I AS NVARCHAR(60))
SET @SUELDO = CAST( @I AS DECIMAL(12,4))* 2
INSERT INTO TB7 VALUES (@NOMBRE, @SUELDO);

END

SELECT * FROM TB7





-------------------------------------------------------------------------------------------------------------------
-- CUENTA LA CANTIDAD DE REGISTROS BORRADOS U AFECTADOS
-------------------------------------------------------------------------------------------------------------------

DECLARE @FILAS_BORRADAS TABLE
(
COL1 INT,
COL2 NVARCHAR(60),
COL3 DECIMAL(12,2)
)

DELETE FROM TB7;
--CUENTA EL TOTAL DE REGISTROS AFECTADOS
INSERT INTO TB7 VALUES('ALVARADO', 100.10);
INSERT INTO TB7 VALUES('BRAVO', 200.20);
INSERT INTO TB7 VALUES('CASTRO', 300.30);
--
DELETE 
FROM TB7 
WHERE SUELDO < 300
--
SELECT @@ROWCOUNT
-- R: 2





-------------------------------------------------------------------------------------------------------------------
-- CAPTURA LA CANTIDAD DE FILAS AFECTADAS
-------------------------------------------------------------------------------------------------------------------

DELETE FROM TB7;

--CUENTA EL TOTAL DE REGISTROS AFECTADOS
INSERT INTO TB7 VALUES('ALVARADO', 100.10);
INSERT INTO TB7 VALUES('BRAVO', 200.20);
INSERT INTO TB7 VALUES('CASTRO', 300.30);
--
DELETE 
FROM TB7 
OUTPUT DELETED.* INTO @FILAS_BORRADAS
--ESTE RESULTADO SE GUARDA EN UNA TABLA CON 2 CAMPOS NO CON 3
--OUTPUT DELETED.[NOMBRES Y APELLIDOS], DELETED.SUELDO INTO @FILAS_BORRADAS
WHERE SUELDO < 300
--
SELECT * FROM @FILAS_BORRADAS;






-------------------------------------------------------------------------------------------------------------------
-- TRUNCATE : ELIMINA TODOS LOS REGISTROS DE LA TABLA
-------------------------------------------------------------------------------------------------------------------

DELETE FROM TB7;
--CUENTA EL TOTAL DE REGISTROS AFECTADOS
INSERT INTO TB7 VALUES('ALVARADO', 100.10);
INSERT INTO TB7 VALUES('BRAVO', 200.20);
INSERT INTO TB7 VALUES('CASTRO', 300.30);
--
TRUNCATE TABLE TB7;
--
SELECT * FROM TB7;



-------------------------------------------------------------------------------------------------------------------
-- CONVERT : OJO TIPOS DE FORMATOS
-------------------------------------------------------------------------------------------------------------------

DECLARE @FECHA NVARCHAR(60), @FECHA1 DATETIME, @FECHA2 DATETIME
SET @FECHA = '1977/07/21'
SET @FECHA1 = '1977/07/21'
SET @FECHA2 = GETUTCDATE()
--
SELECT CONVERT(DATETIME, @FECHA, 101) AS FECHA
--1977-07-21 00:00:00.000
SELECT CONVERT(NVARCHAR(60), @FECHA1, 101) AS FECHA
--1977/07/21
SELECT CONVERT(NVARCHAR(60), @FECHA2, 101) AS FECHA





-------------------------------------------------------------------------------------------------------------------
--HAVING : CONDICIONA LOS VALORES AGRUPADOS
-------------------------------------------------------------------------------------------------------------------

SELECT CategoryID, SupplierID, SUM(UnitPrice) AS [TOTALES PRECIOS], UnitsInStock
FROM Products
WHERE UnitsInStock > 10
GROUP BY CategoryId, supplierID, UnitsInStock
HAVING SUM(UnitPrice) > 20
ORDER BY CategoryId ASC, supplierID ASC






-------------------------------------------------------------------------------------------------------------------
-- ASIGNAMOS A UNA VARIABLE EL UNICO VALOR COMO RESULTADO DE UNA CONSULTA
-------------------------------------------------------------------------------------------------------------------

INSERT INTO TB7 VALUES('ALVARADO', 100.10);
INSERT INTO TB7 VALUES('BRAVO', 200.20);
INSERT INTO TB7 VALUES('CASTRO', 300.30);

DECLARE @NOMBRE NVARCHAR(60)
SET @NOMBRE = (SELECT [NOMBRES Y APELLIDOS] FROM TB7 WHERE SUELDO = 100.10)
SELECT @NOMBRE;
--R : ALVARADO




-------------------------------------------------------------------------------------------------------------------
--TABLA DE TRABAJO 
-------------------------------------------------------------------------------------------------------------------

DROP TABLE TB8
GO
CREATE TABLE TB8
(
INDICEB8 INT CONSTRAINT PK_INDICEB8 PRIMARY KEY NONCLUSTERED NOT NULL,
NOMBRE NVARCHAR(60)NOT NULL,
EDAD INT NOT NULL
)





-------------------------------------------------------------------------------------------------------------------
--ASIGNA A CADA VARIABLE EL VALOR DE CADA CAMPO EN UNA CONSULTA SELECT
-- QUE DEVUELVE UN REGISTRO UNICO
-------------------------------------------------------------------------------------------------------------------

INSERT INTO TB8 VALUES (1, 'DARWIN1', 10);
INSERT INTO TB8 VALUES (2, 'DARWIN2', 20);
INSERT INTO TB8 VALUES (3, 'DARWIN3', 30);
--
DECLARE @NOMBRE NVARCHAR(60), @EDAD INT

--ASIGNA A CADA VARIABLE EL VALOR UNICO DE CADA CAMPO
SELECT @NOMBRE = NOMBRE, @EDAD = EDAD 
FROM TB8 
WHERE INDICEB8 = 2;

--
SELECT @NOMBRE, @EDAD;





-------------------------------------------------------------------------------------------------------------------
-- IF : INSTRUCCION CONDICIONAL
-------------------------------------------------------------------------------------------------------------------

DECLARE @VALOR INT , @TEXTO NVARCHAR(60)
SET @VALOR = 2
--
IF( @VALOR != 1)
	BEGIN;
	SET @TEXTO = 'VALOR = 1'
	SELECT @TEXTO AS RESPUESTA;
	END;
ELSE
	BEGIN;
	SET @TEXTO = 'VALOR != 1'
	SELECT @TEXTO AS RESPUESTA;
	END;





-------------------------------------------------------------------------------------------------------------------
-- IF NOT EXISTS () : CONDICION IF NOT EXISTS
-------------------------------------------------------------------------------------------------------------------

DELETE FROM TB8;

INSERT INTO TB8 VALUES (1, 'DARWIN1', 10);
INSERT INTO TB8 VALUES (2, 'DARWIN2', 20);
INSERT INTO TB8 VALUES (3, 'DARWIN3', 30);


DECLARE @NOMBRE NVARCHAR(60), @EDAD INT, @INDICE INT

SET @NOMBRE = 'SUPER DARWIN'
SET @EDAD = 33
SET @INDICE = 3

--CON ESTE INDICE NO ARROJA REGISTROS ASI QUE INSERTARA
--SET @INDICE = 4

IF NOT EXISTS(SELECT * FROM TB8 WHERE INDICEB8 = @INDICE)
BEGIN;
	UPDATE TB8 
	SET NOMBRE = @NOMBRE, EDAD = @EDAD
	WHERE INDICEB8 = @INDICE;
END;

ELSE

BEGIN;
INSERT INTO TB8 VALUES (@INDICE, @NOMBRE, @EDAD);
END;

SELECT * FROM TB8;






-------------------------------------------------------------------------------------------------------------------
-- CASE END:
--EVALUA UN VALOR Y PERMITE DEVOLVER UNA EXPRESION U OTRA
--SOLO PERMITE EVALUAR 1 EXPRESION
-------------------------------------------------------------------------------------------------------------------

DECLARE @RESULTADO NVARCHAR(40), @VARIABLE NVARCHAR(1)
SET @VARIABLE = 'A'
--SET @VARIABLE = 'B'

SET @RESULTADO = (CASE @VARIABLE
	
	WHEN 'A'	 THEN (SELECT ProductName FROM Products WHERE ProductID = 1)
	WHEN 'B'	 THEN (SELECT ProductName FROM Products WHERE ProductID = 2)
	WHEN 'C'	 THEN (SELECT ProductName FROM Products WHERE ProductID = 3)
	ELSE		 (SELECT ProductName FROM Products WHERE ProductID = 4)

				  END)

SELECT @RESULTADO




-------------------------------------------------------------------------------------------------------------------
--CASE END:
--EVALUA UN VALOR Y PERMITE DEVOLVER UNA EXPRESION U OTRA
--SOLO PERMITE EVALUAR VARIAS EXPRESION
-------------------------------------------------------------------------------------------------------------------

DECLARE @RESULTADO NVARCHAR(40), @VARIABLE INT
SET @VARIABLE = 5

SET @RESULTADO = (CASE
	
	WHEN @VARIABLE != 5		 THEN (SELECT ProductName FROM Products WHERE ProductID = 1)
	WHEN @VARIABLE !< 6		 THEN (SELECT ProductName FROM Products WHERE ProductID = 2)
	WHEN @VARIABLE > 4		 THEN (SELECT ProductName FROM Products WHERE ProductID = 3)
	ELSE					 (SELECT ProductName FROM Products WHERE ProductID = 4)

				  END)

SELECT @RESULTADO 

--1- Chai
--2- Chang
--3- Aniseed Syrup
--4- Chef Anton's Cajun Seasoning





-------------------------------------------------------------------------------------------------------------------
--WHILE CONTINUE : BUCLE SALE DEL CICLO Y CONTINUA CON EL SIGUIENTE
-------------------------------------------------------------------------------------------------------------------

DECLARE @I INT
SET @I = 0

WHILE( @I < 10 )
	BEGIN
		SET @I = @I + 1
		----------
		IF(@I = 3)
		BEGIN
		PRINT 'XXX : ' + CAST(@I AS VARCHAR)
		CONTINUE
		END

		--
		PRINT 'VALOR :' + CAST(@I AS VARCHAR)

	END

--VALOR :1
--VALOR :2
--XXX : 3
--VALOR :4
--VALOR :5
--VALOR :6
--VALOR :7
--VALOR :8
--VALOR :9
--VALOR :10





-------------------------------------------------------------------------------------------------------------------
--WHILE BREAK : BUCLE FINALIZA CON BREAK
-------------------------------------------------------------------------------------------------------------------

DECLARE @I INT
SET @I = 0

WHILE( @I < 10 )
	BEGIN
		SET @I = @I + 1
		----------
		IF( @I = 3 )
		BEGIN
		PRINT 'XXX : ' + CAST(@I AS VARCHAR)
		BREAK
		END

		--
		PRINT 'VALOR :' + CAST(@I AS VARCHAR)

	END

--VALOR :1
--VALOR :2
--XXX : 3





-------------------------------------------------------------------------------------------------------------------
--INNER JOIN ON : RELACIONA TABLAS MEDIANTE SUS INDICES
--COL1 C1 INNER JOIN COL2 C2 ON (C1.ID = C2.ID)
-------------------------------------------------------------------------------------------------------------------

SELECT C.CategoryName, P.ProductName, OD.Discount
FROM Categories C INNER JOIN Products P			  ON (C.CategoryID = P.CategoryID)
				  INNER JOIN [Order Details] OD   ON (P.ProductID = OD.ProductID)






-------------------------------------------------------------------------------------------------------------------
--AGRUPACION DE CONSULTAS JOIN
-------------------------------------------------------------------------------------------------------------------

SELECT C.CategoryName, P.ProductName, OD.Discount
FROM Categories C INNER JOIN Products P			  ON (C.CategoryID = P.CategoryID)
				  INNER JOIN [Order Details] OD   ON (P.ProductID = OD.ProductID)

GROUP BY C.CategoryName, P.ProductName, OD.Discount





-------------------------------------------------------------------------------------------------------------------
-- UNION : JUNTA VARIAS COLUMNAS DE UNA TABLA 
-- EXCEPT : EXCENTUA REGISTROS CON LA MISMA ESTRUCTURA
-- INTERSEPT : INTERSEPTA LOS REGISTROS
-------------------------------------------------------------------------------------------------------------------


DROP TABLE ENE2009;
DROP TABLE FEB2009;

CREATE TABLE ENE2009
(
INDICE_B1 INT IDENTITY(1,1) CONSTRAINT PK_INDICE_B1 PRIMARY KEY NONCLUSTERED NOT NULL,
NOMBRES NVARCHAR(60) NOT NULL,
SUELDO MONEY NOT NULL,
DATOS NVARCHAR(40)NULL
)
CREATE TABLE FEB2009
(
INDICE_B2 INT IDENTITY(1,1) CONSTRAINT PK_INDICE_B2 PRIMARY KEY NONCLUSTERED NOT NULL,
NOMBRES NVARCHAR(60) NOT NULL,
SUELDO MONEY NOT NULL
)
--
INSERT INTO ENE2009 VALUES('DARWIN1',100, 'A');
INSERT INTO ENE2009 VALUES('DARWIN2',200, 'B');
INSERT INTO ENE2009 VALUES('DARWIN3',300, 'C');
INSERT INTO ENE2009 VALUES('WILSON3',300, 'E');
--
INSERT INTO FEB2009 VALUES('WILSON1',100);
INSERT INTO FEB2009 VALUES('DARWIN1',100);
INSERT INTO FEB2009 VALUES('WILSON2',200);
INSERT INTO FEB2009 VALUES('WILSON3',300);
--


-- UNE TABLAS
SELECT NOMBRES, SUELDO FROM ENE2009
UNION
SELECT NOMBRES, SUELDO FROM FEB2009
GO


DARWIN1	100,00
DARWIN2	200,00
DARWIN3	300,00
WILSON1	100,00
WILSON2	200,00
WILSON3	300,00


--EXCEPTUA TABLAS

SELECT NOMBRES, SUELDO FROM ENE2009
EXCEPT
SELECT NOMBRES, SUELDO FROM FEB2009


DARWIN2	200,00
DARWIN3	300,00


--INTERCEPTA TABLAS

SELECT NOMBRES, SUELDO FROM ENE2009
INTERSECT
SELECT NOMBRES, SUELDO FROM FEB2009


DARWIN1	100,00
WILSON3	300,00






-------------------------------------------------------------------------------------------------------------------
-- INSERT DINAMICO : INSERPCION DINAMICA DE REGISTROS
-------------------------------------------------------------------------------------------------------------------


DROP TABLE TB10;

CREATE TABLE TB10
(
INDICEB10 INT IDENTITY(1,1) CONSTRAINT PK_INDICEB10 PRIMARY KEY NONCLUSTERED NOT NULL,
NOMBRE NVARCHAR(60) NOT NULL,
FECHA_INICIAL DATETIME NOT NULL,
FECHA_FINAL DATETIME NOT NULL
)


DECLARE @I INT
SET @I = 0

WHILE ( @I < 10 )
BEGIN
	SET @I = @I + 1
	--OJO NO PERMITE INSETAR SIN PRESENTAR COLUMNAS
	INSERT INTO TB10 (NOMBRE, FECHA_INICIAL, FECHA_FINAL) VALUES ('AAAA', GETDATE(), GETDATE() + 10);
END

SELECT * FROM TB10;






-------------------------------------------------------------------------------------------------------------------
--INSERTA REGISTRO CON :
--VALORES PREDEFINIDOS (DEFAULT '-')
--VALORES NULL (NULL)
-------------------------------------------------------------------------------------------------------------------


DROP TABLE TB11;

CREATE TABLE TB11
(
INDICEB11 INT IDENTITY(1,1)CONSTRAINT PK_INDICEB11 PRIMARY KEY NONCLUSTERED NOT NULL,
NOMBRES NVARCHAR(20) DEFAULT '-' NOT NULL,
EDAD INT NULL,
SUELDO MONEY NULL,
FECHA SMALLDATETIME DEFAULT GETDATE() NULL
)

INSERT INTO TB11 DEFAULT VALUES;
INSERT INTO TB11 DEFAULT VALUES;
INSERT INTO TB11 DEFAULT VALUES;

SELECT * FROM TB11;


-------------------------------------------------------------------------------------------------------------------
--OBTIENE EL VALOR IDENTITY DE LA TABLA
-------------------------------------------------------------------------------------------------------------------

SELECT * FROM TB11;
--
DECLARE @IDENTIDAD1 INT, @IDENTIDAD2 INT

SET @IDENTIDAD1 = @@Identity
SET @IDENTIDAD2 = SCOPE_IDENTITY()
--
SELECT @IDENTIDAD1 AS [NUMERO DE IDENTIDAD];
SELECT @IDENTIDAD2 AS [NUMERO DE IDENTIDAD];






-------------------------------------------------------------------------------------------------------------------
--GUARDAR DATOS DE UNA TABLA EN VARIABLE DE TIPO TABLE

DROP TABLE TB7;

--BASE DE DATOS DE EJEMPLO
CREATE TABLE TB7
(
INDICEB7 INT IDENTITY(1,1) CONSTRAINT PK_INDICEB7 PRIMARY KEY NONCLUSTERED NOT NULL,
[NOMBRES Y APELLIDOS] NVARCHAR(60) NOT NULL,
SUELDO MONEY NOT NULL
)

INSERT INTO TB7 VALUES('ALVARADO', 100.10);
INSERT INTO TB7 VALUES('BRAVO', 200.20);
INSERT INTO TB7 VALUES('CASTRO', 300.30);
--






-------------------------------------------------------------------------------------------------------------------
--PAGINAR
-------------------------------------------------------------------------------------------------------------------

SELECT * FROM Products
ORDER BY ProductName
OFFSET 5 ROWS
FETCH NEXT 10 ROWS ONLY;


