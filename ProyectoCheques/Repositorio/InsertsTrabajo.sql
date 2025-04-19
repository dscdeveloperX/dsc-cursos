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

INSERT INTO Beneficiaries VALUES(0000000001,'Carlos Ramirez'),(0000000002,'Domenika Salazar'),(0000000003,'Emily Franco'),
(0000000004,'Dario Lozano'),(0000000005,'Melissa Seminario'),
(0000000006,'Maximo Peñas'),(0000000007,'Carolina Rosales'),(0000000008,'Rubi Castillo'),(0000000009,'Abel Bajaña'),(0000000010,'Daniel Burgos'),(0000000011,'Victori Bedoya')

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

