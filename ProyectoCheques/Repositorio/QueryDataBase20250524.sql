/*use master
GO
--DROP DATABASE ChequeManagerDB
--GO
CREATE DATABASE ChequeManagerDB
GO
*/

USE [ChequeManagerDB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 24/5/2025 20:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[BankId] [int] NOT NULL,
	[AccountNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Accounts_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Banks_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beneficiaries]    Script Date: 24/5/2025 20:38:41 ******/
/*SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficiaries](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Beneficiaries_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO*/
/****** Object:  Table [dbo].[Cheques]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheques](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[BeneficiaryId] [nvarchar](10) NOT NULL,
	[BeneficiaryName] [nvarchar](200) NOT NULL,
	[ReportTypeId] [nvarchar](10) NOT NULL,
	[CityId] [int] NOT NULL,
	[ChequeNumber] INT NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Date] [date] NOT NULL,
	[PaymentDetail] [nvarchar](500) NULL,
 CONSTRAINT [PK_Cheques_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
 CONSTRAINT [PK_Cities_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companies]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RUC] [nvarchar](13) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Companies_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportsTypes]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportsTypes](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ReportsTypes_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [CompanyId], [BankId], [AccountNumber]) VALUES (1, 1, 1, N'0011223344556677')
INSERT [dbo].[Accounts] ([Id], [CompanyId], [BankId], [AccountNumber]) VALUES (2, 2, 1, N'1122334455667788')
INSERT [dbo].[Accounts] ([Id], [CompanyId], [BankId], [AccountNumber]) VALUES (3, 3, 3, N'2233445566778899')
INSERT [dbo].[Accounts] ([Id], [CompanyId], [BankId], [AccountNumber]) VALUES (4, 4, 5, N'3344556677889900')
INSERT [dbo].[Accounts] ([Id], [CompanyId], [BankId], [AccountNumber]) VALUES (5, 5, 6, N'4455667788990011')
INSERT [dbo].[Accounts] ([Id], [CompanyId], [BankId], [AccountNumber]) VALUES (6, 6, 6, N'5566778899001122')
INSERT [dbo].[Accounts] ([Id], [CompanyId], [BankId], [AccountNumber]) VALUES (7, 7, 7, N'6677889900112233')
INSERT [dbo].[Accounts] ([Id], [CompanyId], [BankId], [AccountNumber]) VALUES (8, 8, 4, N'7788990011223344')
INSERT [dbo].[Accounts] ([Id], [CompanyId], [BankId], [AccountNumber]) VALUES (9, 9, 3, N'8899001122334455')
INSERT [dbo].[Accounts] ([Id], [CompanyId], [BankId], [AccountNumber]) VALUES (10, 10, 8, N'9900112233445566')
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Banks] ON 

INSERT [dbo].[Banks] ([Id], [Name]) VALUES (1, N'Banco del Pacífico')
INSERT [dbo].[Banks] ([Id], [Name]) VALUES (2, N'Banco Bolivariano')
INSERT [dbo].[Banks] ([Id], [Name]) VALUES (3, N'Banco Pichincha')
INSERT [dbo].[Banks] ([Id], [Name]) VALUES (4, N'Banco de Guayaquil')
INSERT [dbo].[Banks] ([Id], [Name]) VALUES (5, N'Produbanco')
INSERT [dbo].[Banks] ([Id], [Name]) VALUES (6, N'Banco Internacional')
INSERT [dbo].[Banks] ([Id], [Name]) VALUES (7, N'Banco del Austro')
INSERT [dbo].[Banks] ([Id], [Name]) VALUES (8, N'Banco General Rumiñahui')
INSERT [dbo].[Banks] ([Id], [Name]) VALUES (9, N'Banco de Machala')
SET IDENTITY_INSERT [dbo].[Banks] OFF
GO
/*
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0912618223', N'Melissa Seminario')
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0922612412', N'Emily Franco')
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0922618211', N'Dario Lozano')
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0924097689', N'Abel Bajaña')
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0939312412', N'Domenika Salazar')
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0944090998', N'Victori Bedoya')
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0944120282', N'Rubi Castillo')
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0944120905', N'Daniel Burgos')
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0957018282', N'Carolina Rosales')
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0958718203', N'Maximo Peñas')
INSERT [dbo].[Beneficiaries] ([Id], [Name]) VALUES (N'0959317413', N'Carlos Ramirez')
GO*/
SET IDENTITY_INSERT [dbo].[Cheques] ON 

INSERT [dbo].[Cheques] ([Id], [AccountId], [BeneficiaryId], BeneficiaryName, [ReportTypeId], [CityId], [ChequeNumber], [Amount], [Date], [PaymentDetail]) VALUES (1, 1, N'0959317413', N'DARWIN RODOLFO SANCHEZ CORREA', N'GRP', 1, 55, CAST(500.55 AS Decimal(18, 2)), CAST(N'2025-05-25' AS Date), N'nosexdxd')
INSERT [dbo].[Cheques] ([Id], [AccountId], [BeneficiaryId], BeneficiaryName,[ReportTypeId], [CityId], [ChequeNumber], [Amount], [Date], [PaymentDetail]) VALUES (2, 2, N'0944120282', N'ANGEL ANDRES ALVARADO ALVAREZ', N'IND', 5, 68, CAST(38.44 AS Decimal(18, 2)), CAST(N'2025-05-12' AS Date), N'peubeseta')
INSERT [dbo].[Cheques] ([Id], [AccountId], [BeneficiaryId], BeneficiaryName,[ReportTypeId], [CityId], [ChequeNumber], [Amount], [Date], [PaymentDetail]) VALUES (3, 2, N'0959317413', N'BYRON BILL BRUNO BRITO', N'IND', 7, 48, CAST(600.22 AS Decimal(18, 2)), CAST(N'2025-05-22' AS Date), N'jenny')
SET IDENTITY_INSERT [dbo].[Cheques] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name]) VALUES (1, N' 28 de Mayo (San José de Yacuambi)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (2, N' Alamor')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (3, N' Alausí')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (4, N' Alfredo Baquerizo Moreno (Jujan)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (5, N' Amaluza')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (6, N' Ambato')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (7, N' Arajuno')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (8, N' Archidona')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (9, N' Arenillas')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (10, N' Atacames')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (11, N' Atuntaqui')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (12, N' Azogues')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (13, N' Baba')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (14, N' Babahoyo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (15, N' Baeza')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (16, N' Bahía de Caráquez')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (17, N' Balao')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (18, N' Balsas')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (19, N' Balzar')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (20, N' Baños de Agua Santa')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (21, N' Biblián')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (22, N' Bolívar')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (23, N' Buena Fe')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (24, N' Calceta')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (25, N' Caluma')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (26, N' Camilo Ponce Enríquez')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (27, N' Cañar')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (28, N' Cariamanga')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (29, N' Carlos Julio Arosemena Tola')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (30, N' Catacocha')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (31, N' Catamayo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (32, N' Catarama')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (33, N' Cayambe')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (34, N' Celica')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (35, N' Cevallos')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (36, N' Chaguarpamba')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (37, N' Chambo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (38, N' Chilla')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (39, N' Chillanes')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (40, N' Chone')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (41, N' Chordeleg')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (42, N' Chunchi')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (43, N' Colimes')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (44, N' Coronel Marcelino Maridueña')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (45, N' Cotacachi')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (46, N' Cumandá')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (47, N' Daule')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (48, N' Déleg')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (49, N' Durán')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (50, N' Echeandía')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (51, N' El Ángel')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (52, N' El Carmen')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (53, N' El Chaco')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (54, N' El Corazón')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (55, N' El Dorado de Cascales')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (56, N' El Guabo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (57, N' El Pan')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (58, N' El Pangui')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (59, N' El Tambo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (60, N' El Triunfo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (61, N' Esmeraldas')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (62, N' Flavio Alfaro')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (63, N' General Antonio Elizalde (Bucay)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (64, N' General Leonidas Plaza Gutiérrez (Limón)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (65, N' General Villamil (Playas)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (66, N' Girón')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (67, N' Gonzanamá')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (68, N' Guachapala')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (69, N' Gualaceo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (70, N' Gualaquiza')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (71, N' Guamote')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (72, N' Guano')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (73, N' Guaranda')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (74, N' Guayaquil')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (75, N' Guayzimi')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (76, N' Huaca')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (77, N' Huamboya')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (78, N' Huaquillas')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (79, N' Ibarra')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (80, N' Isidro Ayora')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (81, N' Jama')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (82, N' Jaramijó')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (83, N' Jipijapa')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (84, N' Junín')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (85, N' La Bonita')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (86, N' La Concordia')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (87, N' La Joya de los Sachas')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (88, N' La Libertad')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (89, N' La Maná')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (90, N' La Troncal')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (91, N' La Victoria')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (92, N' Las Naves')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (93, N' Latacunga')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (94, N' Logroño')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (95, N' Loja')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (96, N' Lomas de Sargentillo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (97, N' Loreto')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (98, N' Lumbaqui')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (99, N' Macará')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (100, N' Macas')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (101, N' Machachi')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (102, N' Machala')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (103, N' Manta')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (104, N' Marcabelí')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (105, N' Mera')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (106, N' Milagro')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (107, N' Mira')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (108, N' Mocache')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (109, N' Montalvo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (110, N' Montecristi')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (111, N' Muisne')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (112, N' Nabón')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (113, N' Naranjal')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (114, N' Naranjito')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (115, N' Narcisa de Jesús (Nobol)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (116, N' Nueva Loja')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (117, N' Nuevo Rocafuerte')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (118, N' Olmedo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (119, N' Olmedo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (120, N' Otavalo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (121, N' Pablo Sexto')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (122, N' Paccha')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (123, N' Paján')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (124, N' Palanda')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (125, N' Palenque')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (126, N' Palestina')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (127, N' Pallatanga')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (128, N' Palora')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (129, N' Paquisha')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (130, N' Pasaje')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (131, N' Patate')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (132, N' Paute')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (133, N' Pedernales')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (134, N' Pedro Carbo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (135, N' Pedro Vicente Maldonado')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (136, N' Pelileo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (137, N' Penipe')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (138, N' Pichincha')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (139, N' Píllaro')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (140, N' Pimampiro')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (141, N' Pindal')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (142, N' Piñas')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (143, N' Portovelo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (144, N' Portoviejo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (145, N' Pucará')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (146, N' Puebloviejo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (147, N' Puerto Ayora')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (148, N' Puerto Baquerizo Moreno')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (149, N' Puerto El Carmen de Putumayo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (150, N' Puerto Francisco de Orellana')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (151, N' Puerto López')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (152, N' Puerto Quito')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (153, N' Puerto Villamil')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (154, N' Pujilí')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (155, N' Puyo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (156, N' Quero')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (157, N' Quevedo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (158, N' Quilanga')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (159, N' Quinsaloma')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (160, N' Quito')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (161, N' Riobamba')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (162, N' Rioverde')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (163, N' Rocafuerte')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (164, N' Rosa Zárate (Quinindé)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (165, N' Salinas')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (166, N' Salitre')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (167, N' Samborondón')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (168, N' San Felipe de Oña')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (169, N' San Fernando')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (170, N' San Gabriel')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (171, N' San José de Chimbo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (172, N' San Juan Bosco')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (173, N' San Lorenzo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (174, N' San Miguel')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (175, N' San Miguel (Salcedo)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (176, N' San Miguel de Los Bancos')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (177, N' San Vicente')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (178, N' Sangolquí')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (179, N' Santa Ana de Vuelta Larga')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (180, N' Santa Clara')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (181, N' Santa Elena')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (182, N' Santa Isabel')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (183, N' Santa Lucía')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (184, N' Santa Rosa')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (185, N' Santiago')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (186, N' Santiago de Méndez')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (187, N' Santo Domingo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (188, N' Saquisilí')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (189, N' Saraguro')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (190, N' Sevilla de Oro')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (191, N' Shushufindi')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (192, N' Sigchos')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (193, N' Sígsig')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (194, N' Simón Bolívar')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (195, N' Sozoranga')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (196, N' Sucre')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (197, N' Sucúa')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (198, N' Suscal')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (199, N' Tabacundo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (200, N' Taisha')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (201, N' Tarapoa')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (202, N' Tena')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (203, N' Tiputini')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (204, N' Tisaleo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (205, N' Tosagua')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (206, N' Tulcán')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (207, N' Urcuquí')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (208, N' Valdez (Limones)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (209, N' Valencia')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (210, N' Velasco Ibarra (El Empalme)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (211, N' Ventanas')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (212, N' Villa La Unión (Cajabamba)')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (213, N' Vinces')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (214, N' Yaguachi')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (215, N' Yantzaza')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (216, N' Zamora')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (217, N' Zapotillo')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (218, N' Zaruma')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (219, N' Zumba')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (220, N' Zumbi')
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (221, N'Mocha')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([Id], [RUC], [Name]) VALUES (1, N'1234567890123', N'Ecuatoriana de Comercio S.A.')
INSERT [dbo].[Companies] ([Id], [RUC], [Name]) VALUES (2, N'2345678901234', N'Industrias del Pacífico Ltda.')
INSERT [dbo].[Companies] ([Id], [RUC], [Name]) VALUES (3, N'3456789012345', N'Agrícola Andina Cía. Ltda.')
INSERT [dbo].[Companies] ([Id], [RUC], [Name]) VALUES (4, N'4567890123456', N'Tecnología y Servicios del Ecuador S.A.')
INSERT [dbo].[Companies] ([Id], [RUC], [Name]) VALUES (5, N'5678901234567', N'Construcciones Modernas Cía. Ltda.')
INSERT [dbo].[Companies] ([Id], [RUC], [Name]) VALUES (6, N'6789012345678', N'Transportes Nacionales S.A.')
INSERT [dbo].[Companies] ([Id], [RUC], [Name]) VALUES (7, N'7890123456789', N'Exportadora Amazónica Cía. Ltda.')
INSERT [dbo].[Companies] ([Id], [RUC], [Name]) VALUES (8, N'8901234567890', N'Importaciones Andinas S.A.')
INSERT [dbo].[Companies] ([Id], [RUC], [Name]) VALUES (9, N'9012345678901', N'Servicios Financieros del Norte Cía. Ltda.')
INSERT [dbo].[Companies] ([Id], [RUC], [Name]) VALUES (10, N'0123456789012', N'Comercializadora del Sur S.A.')
SET IDENTITY_INSERT [dbo].[Companies] OFF
GO
INSERT [dbo].[ReportsTypes] ([Id], [Name]) VALUES (N'GRP', N'Reporte Grupal')
INSERT [dbo].[ReportsTypes] ([Id], [Name]) VALUES (N'IND', N'Reporte Individual')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Id]    Script Date: 24/5/2025 20:38:41 ******/
/*ALTER TABLE [dbo].[Beneficiaries] ADD  CONSTRAINT [UQ_Id] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO*/
ALTER TABLE [dbo].[Cheques] ADD  DEFAULT ((74)) FOR [CityId]
GO
ALTER TABLE [dbo].[Cheques] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_BankId] FOREIGN KEY([BankId])
REFERENCES [dbo].[Banks] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_BankId]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Companies] ([Id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_CompanyId]
GO
ALTER TABLE [dbo].[Cheques]  WITH CHECK ADD  CONSTRAINT [FK_Cheques_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
GO
ALTER TABLE [dbo].[Cheques] CHECK CONSTRAINT [FK_Cheques_AccountId]
GO
/*ALTER TABLE [dbo].[Cheques]  WITH CHECK ADD  CONSTRAINT [FK_Cheques_BeneficiaryId] FOREIGN KEY([BeneficiaryId])
REFERENCES [dbo].[Beneficiaries] ([Id])
GO*/
--ALTER TABLE [dbo].[Cheques] CHECK CONSTRAINT [FK_Cheques_BeneficiaryId]
--GO
ALTER TABLE [dbo].[Cheques]  WITH CHECK ADD  CONSTRAINT [FK_Cheques_CityId] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Cheques] CHECK CONSTRAINT [FK_Cheques_CityId]
GO
ALTER TABLE [dbo].[Cheques]  WITH CHECK ADD  CONSTRAINT [FK_Cheques_ReportTypeId] FOREIGN KEY([ReportTypeId])
REFERENCES [dbo].[ReportsTypes] ([Id])
GO
ALTER TABLE [dbo].[Cheques] CHECK CONSTRAINT [FK_Cheques_ReportTypeId]
GO
/****** Object:  StoredProcedure [dbo].[sp_AccountGetAll]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AccountGetAll]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_BeneficiariesCreate]    Script Date: 24/5/2025 20:38:41 ******/
/*SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BeneficiariesCreate] (@Id nvarchar(10), @Name nvarchar(200))
AS
BEGIN
INSERT INTO Beneficiaries (Id,[Name]) VALUES (@Id,@Name)

END;
GO*/
/****** Object:  StoredProcedure [dbo].[sp_ChequeCreate]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[sp_ChequeCreate] (
@AccountId int,
@BeneficiaryId nvarchar(10),
@BeneficiaryName nvarchar(200),
@ReportTypeId nvarchar(10),
@CityId int,
@ChequeNumber INT,
@Amount decimal(18, 2),
@Date date ,
@PaymentDetail nvarchar(500))
AS 
BEGIN
INSERT INTO Cheques(
AccountId,
BeneficiaryId,
BeneficiaryName,
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
@BeneficiaryName,
@ReportTypeId,
@CityId,
@ChequeNumber,
@Amount,
@Date,
@PaymentDetail)
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ChequesGetByDateRange]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChequesGetByDateRange] (
@AccountId int, 
@StarDate date, 
@EndDate date)
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ChequesGetReport]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  PROCEDURE [dbo].[sp_ChequeGetReport](
@ReportTypeId nvarchar(10), 
@StartChequeNumber INT, 
@EndChequeNumber INT)
AS
BEGIN
SELECT
C.[Name] AS CompanyName,
B.[Name] AS BankName,
A.AccountNumber,
CH.BeneficiaryId,
R.Name AS ReportTypeName,
CH.BeneficiaryName,
CI.[Name] AS CityName,
CH.ChequeNumber,
CH.Amount,
CH.[Date],
CH.PaymentDetail
FROM Cheques CH 
INNER JOIN Accounts A ON CH.AccountId = A.Id
INNER JOIN Cities CI ON CH.CityId = CI.Id 
INNER JOIN ReportsTypes R ON CH.ReportTypeId = R.Id
INNER JOIN Banks B ON A.BankId = B.Id
INNER JOIN Companies C ON A.CompanyId = C.Id
WHERE CH.ReportTypeId = @ReportTypeId AND CH.ChequeNumber BETWEEN @StartChequeNumber AND @EndChequeNumber
Order By CH.[Date], CH.ChequeNumber;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CityGetAll]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CityGetAll] 
AS
BEGIN
SELECT Id, [Name] 
From Cities
order by [Name] asc 


END;
GO
/****** Object:  StoredProcedure [dbo].[sp_ReportsTypesGetAll]    Script Date: 24/5/2025 20:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ReportsTypesGetAll]
AS
BEGIN
SELECT Id,[Name]
FROM ReportsTypes
ORDER BY [Name] asc
END;
GO
