CREATE DATABASE ChequeManagerDB;
GO

USE ChequeManagerDB;
GO



CREATE TABLE Banks (
    Id INT IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_Banks_Id PRIMARY KEY (Id)
);


CREATE TABLE Companies (
    Id INT IDENTITY(1,1),
	RUC NVARCHAR(13) NOT NULL,
    Name NVARCHAR(200) NOT NULL,
    CONSTRAINT PK_Companies_Id PRIMARY KEY (Id)
);


CREATE TABLE Accounts (
    Id INT IDENTITY(1,1),
	CompanyId INT NOT NULL,
	BankId INT NOT NULL,
    AccountNumber NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Accounts_Id PRIMARY KEY (Id),
	CONSTRAINT FK_Accounts_CompanyId FOREIGN KEY (CompanyId) REFERENCES Companies(Id),
	CONSTRAINT FK_Accounts_BankId FOREIGN KEY (BankId) REFERENCES Banks(Id)
);






CREATE TABLE Beneficiaries (
    Id NVARCHAR(10) NOT NULL,--cedula
    Name NVARCHAR(200) NOT NULL,
    CONSTRAINT PK_Beneficiaries_Id PRIMARY KEY (Id)
);
ALTER TABLE Beneficiaries
ADD CONSTRAINT UQ_Id UNIQUE (Id);

CREATE  TABLE  ReportsTypes (
    Id NVARCHAR(10),
	Name NVARCHAR(200) NOT NULL,
    CONSTRAINT PK_ReportsTypes_Id PRIMARY KEY (Id)
);


INSERT [dbo].[ReportsTypes] ([Id], [Name]) VALUES ('IND',  'Reporte general Individual')
GO
INSERT [dbo].[ReportsTypes] ([Id], [Name]) VALUES ('GRP',  'Reporte general Grupal')
GO




CREATE TABLE [dbo].Cities(
	Id int IDENTITY(1,1),
	Name varchar(100) NULL,
	CONSTRAINT PK_Cities_Id PRIMARY KEY (Id)
)




SET IDENTITY_INSERT [dbo].[Cities] ON 
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (1,  N' 28 de Mayo (San José de Yacuambi)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (2,  N' Alamor')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (3, N' Alausí')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (4,  N' Alfredo Baquerizo Moreno (Jujan)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (5,  N' Amaluza')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (6,  N' Ambato')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (7,  N' Arajuno')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (8,  N' Archidona')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (9, N' Arenillas')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (10, N' Atacames')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (11,  N' Atuntaqui')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (12, N' Azogues')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (13,  N' Baba')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (14,  N' Babahoyo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (15,  N' Baeza')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (16,  N' Bahía de Caráquez')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (17,  N' Balao')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (18, N' Balsas')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (19,  N' Balzar')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (20, N' Baños de Agua Santa')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (21,  N' Biblián')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (22,  N' Bolívar')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (23,  N' Buena Fe')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (24,  N' Calceta')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (25,  N' Caluma')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (26,  N' Camilo Ponce Enríquez')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (27,  N' Cañar')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (28, N' Cariamanga')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (29,  N' Carlos Julio Arosemena Tola')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (30,  N' Catacocha')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (31,  N' Catamayo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (32,  N' Catarama')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (33,  N' Cayambe')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (34,  N' Celica')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (35,  N' Cevallos')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (36,  N' Chaguarpamba')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (37, N' Chambo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (38, N' Chilla')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (39, N' Chillanes')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (40,  N' Chone')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (41, N' Chordeleg')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (42, N' Chunchi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (43,  N' Colimes')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (44,  N' Coronel Marcelino Maridueña')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (45,  N' Cotacachi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (46, N' Cumandá')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (47,  N' Daule')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (48, N' Déleg')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (49,  N' Durán')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (50, N' Echeandía')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (51, N' El Ángel')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (52,  N' El Carmen')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (53,  N' El Chaco')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (54, N' El Corazón')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (55,  N' El Dorado de Cascales')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (56, N' El Guabo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (57, N' El Pan')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (58,  N' El Pangui')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (59, N' El Tambo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (60,  N' El Triunfo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (61, N' Esmeraldas')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (62,  N' Flavio Alfaro')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (63,  N' General Antonio Elizalde (Bucay)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (64,  N' General Leonidas Plaza Gutiérrez (Limón)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (65,  N' General Villamil (Playas)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (66, N' Girón')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (67,  N' Gonzanamá')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (68, N' Guachapala')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (69, N' Gualaceo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (70,  N' Gualaquiza')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (71, N' Guamote')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (72, N' Guano')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (73, N' Guaranda')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (74,  N' Guayaquil')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (75,  N' Guayzimi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (76, N' Huaca')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (77,  N' Huamboya')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (78, N' Huaquillas')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (79,  N' Ibarra')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (80, N' Isidro Ayora')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (81, N' Jama')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (82, N' Jaramijó')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (83, N' Jipijapa')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (84, N' Junín')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (85, N' La Bonita')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (86, N' La Concordia')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (87,  N' La Joya de los Sachas')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (88,  N' La Libertad')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (89, N' La Maná')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (90, N' La Troncal')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (91, N' La Victoria')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (92, N' Las Naves')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (93, N' Latacunga')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (94,  N' Logroño')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (95, N' Loja')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (96, N' Lomas de Sargentillo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (97, N' Loreto')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (98, N' Lumbaqui')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (99, N' Macará')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (100, N' Macas')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (101, N' Machachi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (102,N' Machala')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (103, N' Manta')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (104,N' Marcabelí')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (105,  N' Mera')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (106,  N' Milagro')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (107, N' Mira')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (108,  N' Mocache')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (109,  N' Montalvo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (110,  N' Montecristi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (111, N' Muisne')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (112, N' Nabón')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (113,  N' Naranjal')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (114,  N' Naranjito')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (115,  N' Narcisa de Jesús (Nobol)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (116,  N' Nueva Loja')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (117,  N' Nuevo Rocafuerte')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (118,  N' Olmedo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (119,  N' Olmedo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (120,  N' Otavalo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (121,  N' Pablo Sexto')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (122, N' Paccha')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (123,  N' Paján')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (124,  N' Palanda')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (125,  N' Palenque')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (126,  N' Palestina')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (127, N' Pallatanga')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (128,  N' Palora')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (129,  N' Paquisha')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (130, N' Pasaje')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (131,  N' Patate')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (132, N' Paute')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (133,  N' Pedernales')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (134,  N' Pedro Carbo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (135,  N' Pedro Vicente Maldonado')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (136,  N' Pelileo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (137, N' Penipe')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (138,  N' Pichincha')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (139,  N' Píllaro')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (140,  N' Pimampiro')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (141,  N' Pindal')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (142, N' Piñas')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (143, N' Portovelo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (144,  N' Portoviejo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (145, N' Pucará')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (146,  N' Puebloviejo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (147, N' Puerto Ayora')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (148, N' Puerto Baquerizo Moreno')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (149,  N' Puerto El Carmen de Putumayo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (150,  N' Puerto Francisco de Orellana')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (151,  N' Puerto López')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (152,  N' Puerto Quito')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (153, N' Puerto Villamil')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (154, N' Pujilí')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (155,  N' Puyo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (156,  N' Quero')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (157,  N' Quevedo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (158,  N' Quilanga')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (159,  N' Quinsaloma')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (160,  N' Quito')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (161, N' Riobamba')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (162, N' Rioverde')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (163,  N' Rocafuerte')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (164, N' Rosa Zárate (Quinindé)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (165,  N' Salinas')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (166,  N' Salitre')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (167,  N' Samborondón')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (168, N' San Felipe de Oña')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (169, N' San Fernando')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (170, N' San Gabriel')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (171, N' San José de Chimbo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (172,  N' San Juan Bosco')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (173, N' San Lorenzo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (174, N' San Miguel')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (175, N' San Miguel (Salcedo)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (176,  N' San Miguel de Los Bancos')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (177,  N' San Vicente')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (178,  N' Sangolquí')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (179,  N' Santa Ana de Vuelta Larga')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (180,  N' Santa Clara')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (181,  N' Santa Elena')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (182, N' Santa Isabel')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (183,  N' Santa Lucía')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (184, N' Santa Rosa')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (185,  N' Santiago')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (186,  N' Santiago de Méndez')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (187,  N' Santo Domingo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (188, N' Saquisilí')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (189,  N' Saraguro')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (190, N' Sevilla de Oro')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (191,  N' Shushufindi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (192, N' Sigchos')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (193, N' Sígsig')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (194,  N' Simón Bolívar')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (195,  N' Sozoranga')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (196,  N' Sucre')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (197,  N' Sucúa')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (198, N' Suscal')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (199,  N' Tabacundo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (200,  N' Taisha')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (201,  N' Tarapoa')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (202,  N' Tena')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (203,  N' Tiputini')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (204,  N' Tisaleo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (205,  N' Tosagua')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (206, N' Tulcán')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (207,  N' Urcuquí')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (208, N' Valdez (Limones)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (209,  N' Valencia')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (210,  N' Velasco Ibarra (El Empalme)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (211,  N' Ventanas')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (212, N' Villa La Unión (Cajabamba)')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (213,  N' Vinces')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (214,  N' Yaguachi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (215,  N' Yantzaza')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (216,  N' Zamora')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (217,  N' Zapotillo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (218, N' Zaruma')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (219,  N' Zumba')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (220,  N' Zumbi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (221,  N'Mocha')
GO
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO


CREATE TABLE  Cheques (
    Id INT IDENTITY(1,1),
    AccountId INT NOT NULL,
	BeneficiaryId NVARCHAR(10) NOT NULL,
	ReportTypeId NVARCHAR(10) NOT NULL,
	CityId INT NOT NULL DEFAULT 74,--Guayaquil
    ChequeNumber NVARCHAR(50) NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    Date DATE NOT NULL DEFAULT GETDATE(),
    PaymentDetail NVARCHAR(500) NULL,
	CONSTRAINT PK_Cheques_Id PRIMARY KEY (Id),
    CONSTRAINT FK_Cheques_AccountId FOREIGN KEY (AccountId) REFERENCES Accounts(Id),
    CONSTRAINT FK_Cheques_BeneficiaryId FOREIGN KEY (BeneficiaryId) REFERENCES Beneficiaries(Id),
	CONSTRAINT FK_Cheques_ReportTypeId FOREIGN KEY (ReportTypeId) REFERENCES ReportsTypes(Id),
	CONSTRAINT FK_Cheques_CityId FOREIGN KEY (CityId) REFERENCES Cities(Id)
);


