insert into Banks values ('Banco del Pacífico'),('Banco Bolivariano'),('Banco Pichincha'),('Banco de Guayaquil'),
('Produbanco'),('Banco Internacional'),('Banco del Austro'),('Banco General Rumiñahui'),('Banco de Machala')
select * from Banks

INSERT INTO Companies (RUC, Name) VALUES
('1234567890123', 'Ecuatoriana de Comercio S.A.'),
('2345678901234', 'Industrias del Pacífico Ltda.'),
('3456789012345', 'Agrícola Andina Cía. Ltda.'),
('4567890123456', 'Tecnología y Servicios del Ecuador S.A.'),
('5678901234567', 'Construcciones Modernas Cía. Ltda.'),
('6789012345678', 'Transportes Nacionales S.A.'),
('7890123456789', 'Exportadora Amazónica Cía. Ltda.'),
('8901234567890', 'Importaciones Andinas S.A.'),
('9012345678901', 'Servicios Financieros del Norte Cía. Ltda.'),
('0123456789012', 'Comercializadora del Sur S.A.');

select * from Companies

INSERT INTO Accounts (CompanyId,BankId,AccountNumber) VALUES
(1,1,'0011223344556677'),
(2,1,'1122334455667788'),
(3,3,'2233445566778899'),
(4,5,'3344556677889900'),
(5,6,'4455667788990011'),
(6,6,'5566778899001122'),
(7,7,'6677889900112233'),
(8,4,'7788990011223344'),
(9,3,'8899001122334455'),
(10,8,'9900112233445566');

select * from  Accounts

INSERT INTO Beneficiaries VALUES(1,'Carlos Ramirez'),(2,'Domenika Salazar'),(3,'Emily Franco'),
(4,'Dario Lozano'),(5,'Melissa Seminario'),
(6,'Maximo Peñas'),(7,'Carolina Rosales'),(8,'Rubi Castillo'),(9,'Abel Bajaña'),(10,'Daniel Burgos'),(11,'Victori Bedoya')


select * from Beneficiaries

CREATE PROCEDURE sp_ChequeCreate (
@AccountId int,
@BeneficiaryId nvarchar(10),
@ReportTypeId nvarchar(10),
@CityId int,
@ChequeNumber nvarchar(50),
@Amount decimal(18, 2),
@Date date ,
@PaymentDetail nvarchar(500))
AS 
BEGIN
INSERT INTO Cheques(
AccountId,
BeneficiaryId,
ReportTypeId,
CityId,
ChequeNumber,
Amount,
[Date],
PaymentDetail
)
VALUES (
@AccountId,
@BeneficiaryId,
@ReportTypeId,
@CityId,
@ChequeNumber,
@Amount,
@Date,
@PaymentDetail)
END;

CREATE PROCEDURE sp_CityGetAll 
AS
BEGIN
SELECT Id, [Name] 
From Cities
order by [Name] asc 


END;

EXEC sp_CityGetAll 

CREATE PROCEDURE sp_ReportsTypesGetAll
AS
BEGIN
SELECT Id,[Name]
FROM ReportsTypes
ORDER BY [Name] asc
END;

CREATE PROCEDURE sp_AccountGetAll
AS
BEGIN
SELECT 
A.Id,
A.AccountNumber,
B.Id AS BankId,
B.[Name] AS BankName,
C.Id AS CompanyId,
C.[Name] AS CompanyName
FROM 
Accounts A INNER JOIN Banks B ON A.BankId = B.Id INNER JOIN Companies C ON A.CompanyId = C.Id 
ORDER BY C.[Name], B.[Name], A.AccountNumber

END;

exec sp_AccountGetAll

--ordenado con prioridad en company name, bank name y por ultimo accountnumber

CREATE PROCEDURE sp_ChequesGetByDateRange (@AccountId int, @StarDate date, @EndDate date)
AS
BEGIN
SELECT
C.[Name] AS CompanyName,
B.[Name] AS BankName,
A.AccountNumber,
BF.[Name] AS BeneficiaryName,
R.[Name] AS ReportTypeName,
CI.[Name] AS CityName,
CH.ChequeNumber,
CH.Amount,
CH.[Date],
CH.PaymentDetail
FROM
Accounts A INNER JOIN Banks B ON A.BankId = B.Id INNER JOIN Companies C ON A.CompanyId = C.Id,
Cheques CH INNER JOIN Beneficiaries BF ON CH.BeneficiaryId = BF.Id INNER JOIN ReportsTypes R ON CH.ReportTypeId = R.Id INNER JOIN Cities CI ON CH.CityId = CI.Id 
WHERE CH.AccountId = @AccountId AND CH.[Date] BETWEEN @Stardate And @EndDate
Order By CH.[Date], CH.ChequeNumber
END;

CREATE PROCEDURE sp_BeneficiariesCreate (@Id nvarchar(10), @Name nvarchar(200))
AS
BEGIN
INSERT INTO Beneficiaries (Id,[Name]) VALUES (@Id,@Name)

END;

CREATE PROCEDURE sp_ChequesGetReport(@ReportTypeId nvarchar(10), @StartChequeNumber nvarchar(50), @EndChequeNumber nvarchar(50))
AS
BEGIN
SELECT
C.[Name] AS CompanyName,
B.[Name] AS BankName,
A.AccountNumber,
BF.[Name] AS BeneficiaryName,
CI.[Name] AS CityName,
CH.ChequeNumber,
CH.Amount,
CH.[Date],
CH.PaymentDetail
FROM 
Accounts A INNER JOIN Banks B ON A.BankId = B.Id INNER JOIN Companies C ON A.CompanyId = C.Id,
Cheques CH INNER JOIN Beneficiaries BF ON CH.BeneficiaryId = BF.Id INNER JOIN Cities CI ON CH.CityId = CI.Id 
WHERE CH.ReportTypeId = @ReportTypeId AND CH.ChequeNumber BETWEEN @StartChequeNumber AND @EndChequeNumber
Order By CH.[Date], CH.ChequeNumber
END;





