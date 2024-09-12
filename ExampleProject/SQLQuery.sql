USE DARWIN_SANCHEZ_DB;
GO


create table Club(
ClubId int identity(1,1),
ClubNombre nvarchar(200),
ClubAlias nvarchar(200),
ClubColor nvarchar(50),
CONSTRAINT pk_Club_ClubId PRIMARY KEY (ClubId)
);

/*
@ClubId int,
@ClubNombre nvarchar(200),
@ClubAlias nvarchar(200),
@ClubColor nvarchar(50)
*/

create or alter procedure sp_ClubById(
@ClubId int
)
as
begin
SELECT 
ClubId
,ClubNombre
,ClubAlias
,ClubColor
FROM Club where ClubId = @ClubId
end;

/*
exec sp_ClubById 
1 --@ClubId int
*/


create or alter procedure sp_ClubAll
as
begin
SELECT 
ClubId
,ClubNombre
,ClubAlias
,ClubColor
FROM Club;
end;

/*
exec sp_ClubAll
*/


create or alter procedure sp_InsertClub(
@ClubNombre nvarchar(200),
@ClubAlias nvarchar(200),
@ClubColor nvarchar(50)
)
as
begin

INSERT INTO Club
           (ClubNombre
           ,ClubAlias
           ,ClubColor)
     VALUES
		   (@ClubNombre
           ,@ClubAlias
           ,@ClubColor);

end;


exec sp_InsertClub
'Emelec', --@ClubNombre nvarchar(200),
'El Bombillo',--@ClubAlias nvarchar(200),
'#1900ff'--@ClubColor nvarchar(50)

exec sp_InsertClub
'El Nacional', --@ClubNombre nvarchar(200),
'Los puros criollos',--@ClubAlias nvarchar(200),
'#ff0000'--@ClubColor nvarchar(50)

exec sp_InsertClub
'Barceloca', --@ClubNombre nvarchar(200),
'La Vaca',--@ClubAlias nvarchar(200),
'#ffd900'--@ClubColor nvarchar(50)





create or alter procedure sp_UpdateClub(
@ClubId int,
@ClubNombre nvarchar(200),
@ClubAlias nvarchar(200),
@ClubColor nvarchar(50)
)
as
begin

UPDATE Club
      SET ClubNombre = @ClubNombre
         ,ClubAlias = @ClubAlias
         ,ClubColor = @ClubColor
	  WHERE ClubId = @ClubId;

end;


/*
exec sp_UpdateClub
3,--@ClubId int,
'Barcelonga',--@ClubNombre nvarchar(200),
'La Copia',--@ClubAlias nvarchar(200),
'#ffd900'--@ClubColor nvarchar(50)
*/





create or alter procedure sp_DeleteClub(
@ClubId int
)
as
begin
DELETE
FROM Club where ClubId = @ClubId
end;

/*
exec sp_DeleteClub 
1 --@ClubId int
*/










/*
create table Persona(
PersonaId int identity(10,5),
PersonaNombre nvarchar(200),
ProvinciaId int,
CiudadId int,
CONSTRAINT pk_Persona_PersonaId PRIMARY KEY (PersonaId),
CONSTRAINT fk_Persona_ProvinciaId FOREIGN KEY (ProvinciaId) REFERENCES Provincia(ProvinciaId),
CONSTRAINT fk_Persona_CiudadId FOREIGN KEY (CiudadId) REFERENCES Ciudad(CiudadId)
)




GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 2024-09-11 16:23:42 ******/
CREATE TABLE [dbo].[Ciudad](
	[CiudadId] [int] IDENTITY(1,1) NOT NULL,
	[ProvinciaId] [int] NULL,
	[CiudadName] [varchar](50) NULL,
	[CiudadActive] [tinyint] NULL,
	CONSTRAINT PK_CIUDAD_CIUDADID PRIMARY KEY (CiudadId)
)
/****** Object:  Table [dbo].[Provincia]    Script Date: 2024-09-11 16:23:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[ProvinciaId] [int] IDENTITY(1,1) NOT NULL,
	[ProvinciaName] [varchar](50) NULL,
	[ProvinciaActive] [tinyint] NULL,
	CONSTRAINT PK_PROVINCIA_PROVINCIAID PRIMARY KEY (ProvinciaId)
) 

GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (1, 24, N' 28 de Mayo (San José de Yacuambi)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (2, 12, N' Alamor', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (3, 5, N' Alausí', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (4, 10, N' Alfredo Baquerizo Moreno (Jujan)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (5, 12, N' Amaluza', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (6, 23, N' Ambato', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (7, 18, N' Arajuno', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (8, 16, N' Archidona', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (9, 7, N' Arenillas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (10, 8, N' Atacames', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (11, 11, N' Atuntaqui', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (12, 3, N' Azogues', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (13, 13, N' Baba', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (14, 13, N' Babahoyo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (15, 16, N' Baeza', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (16, 14, N' Bahía de Caráquez', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (17, 10, N' Balao', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (18, 7, N' Balsas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (19, 10, N' Balzar', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (20, 23, N' Baños de Agua Santa', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (21, 3, N' Biblián', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (22, 4, N' Bolívar', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (23, 13, N' Buena Fe', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (24, 14, N' Calceta', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (25, 2, N' Caluma', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (26, 1, N' Camilo Ponce Enríquez', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (27, 3, N' Cañar', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (28, 12, N' Cariamanga', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (29, 16, N' Carlos Julio Arosemena Tola', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (30, 12, N' Catacocha', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (31, 12, N' Catamayo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (32, 13, N' Catarama', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (33, 19, N' Cayambe', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (34, 12, N' Celica', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (35, 23, N' Cevallos', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (36, 12, N' Chaguarpamba', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (37, 5, N' Chambo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (38, 7, N' Chilla', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (39, 2, N' Chillanes', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (40, 14, N' Chone', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (41, 1, N' Chordeleg', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (42, 5, N' Chunchi', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (43, 10, N' Colimes', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (44, 10, N' Coronel Marcelino Maridueña', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (45, 11, N' Cotacachi', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (46, 5, N' Cumandá', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (47, 10, N' Daule', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (48, 3, N' Déleg', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (49, 10, N' Durán', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (50, 2, N' Echeandía', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (51, 4, N' El Ángel', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (52, 14, N' El Carmen', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (53, 16, N' El Chaco', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (54, 6, N' El Corazón', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (55, 22, N' El Dorado de Cascales', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (56, 7, N' El Guabo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (57, 1, N' El Pan', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (58, 24, N' El Pangui', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (59, 3, N' El Tambo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (60, 10, N' El Triunfo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (61, 8, N' Esmeraldas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (62, 14, N' Flavio Alfaro', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (63, 10, N' General Antonio Elizalde (Bucay)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (64, 15, N' General Leonidas Plaza Gutiérrez (Limón)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (65, 10, N' General Villamil (Playas)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (66, 1, N' Girón', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (67, 12, N' Gonzanamá', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (68, 1, N' Guachapala', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (69, 1, N' Gualaceo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (70, 15, N' Gualaquiza', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (71, 5, N' Guamote', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (72, 5, N' Guano', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (73, 2, N' Guaranda', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (74, 10, N' Guayaquil', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (75, 24, N' Guayzimi', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (76, 4, N' Huaca', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (77, 15, N' Huamboya', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (78, 7, N' Huaquillas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (79, 11, N' Ibarra', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (80, 10, N' Isidro Ayora', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (81, 14, N' Jama', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (82, 14, N' Jaramijó', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (83, 14, N' Jipijapa', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (84, 14, N' Junín', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (85, 22, N' La Bonita', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (86, 21, N' La Concordia', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (87, 17, N' La Joya de los Sachas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (88, 20, N' La Libertad', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (89, 6, N' La Maná', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (90, 3, N' La Troncal', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (91, 7, N' La Victoria', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (92, 2, N' Las Naves', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (93, 6, N' Latacunga', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (94, 15, N' Logroño', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (95, 12, N' Loja', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (96, 10, N' Lomas de Sargentillo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (97, 17, N' Loreto', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (98, 22, N' Lumbaqui', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (99, 12, N' Macará', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (100, 15, N' Macas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (101, 19, N' Machachi', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (102, 7, N' Machala', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (103, 14, N' Manta', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (104, 7, N' Marcabelí', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (105, 18, N' Mera', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (106, 10, N' Milagro', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (107, 4, N' Mira', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (108, 13, N' Mocache', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (109, 13, N' Montalvo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (110, 14, N' Montecristi', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (111, 8, N' Muisne', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (112, 1, N' Nabón', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (113, 10, N' Naranjal', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (114, 10, N' Naranjito', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (115, 10, N' Narcisa de Jesús (Nobol)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (116, 22, N' Nueva Loja', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (117, 17, N' Nuevo Rocafuerte', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (118, 12, N' Olmedo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (119, 14, N' Olmedo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (120, 11, N' Otavalo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (121, 15, N' Pablo Sexto', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (122, 7, N' Paccha', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (123, 14, N' Paján', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (124, 24, N' Palanda', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (125, 13, N' Palenque', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (126, 10, N' Palestina', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (127, 5, N' Pallatanga', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (128, 15, N' Palora', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (129, 24, N' Paquisha', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (130, 7, N' Pasaje', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (131, 23, N' Patate', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (132, 1, N' Paute', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (133, 14, N' Pedernales', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (134, 10, N' Pedro Carbo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (135, 19, N' Pedro Vicente Maldonado', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (136, 23, N' Pelileo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (137, 5, N' Penipe', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (138, 14, N' Pichincha', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (139, 23, N' Píllaro', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (140, 11, N' Pimampiro', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (141, 12, N' Pindal', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (142, 7, N' Piñas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (143, 7, N' Portovelo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (144, 14, N' Portoviejo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (145, 1, N' Pucará', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (146, 13, N' Puebloviejo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (147, 9, N' Puerto Ayora', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (148, 9, N' Puerto Baquerizo Moreno', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (149, 22, N' Puerto El Carmen de Putumayo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (150, 17, N' Puerto Francisco de Orellana', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (151, 14, N' Puerto López', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (152, 19, N' Puerto Quito', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (153, 9, N' Puerto Villamil', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (154, 6, N' Pujilí', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (155, 18, N' Puyo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (156, 23, N' Quero', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (157, 13, N' Quevedo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (158, 12, N' Quilanga', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (159, 13, N' Quinsaloma', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (160, 19, N' Quito', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (161, 5, N' Riobamba', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (162, 8, N' Rioverde', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (163, 14, N' Rocafuerte', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (164, 8, N' Rosa Zárate (Quinindé)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (165, 20, N' Salinas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (166, 10, N' Salitre', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (167, 10, N' Samborondón', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (168, 1, N' San Felipe de Oña', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (169, 1, N' San Fernando', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (170, 4, N' San Gabriel', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (171, 2, N' San José de Chimbo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (172, 15, N' San Juan Bosco', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (173, 8, N' San Lorenzo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (174, 2, N' San Miguel', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (175, 6, N' San Miguel (Salcedo)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (176, 19, N' San Miguel de Los Bancos', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (177, 14, N' San Vicente', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (178, 19, N' Sangolquí', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (179, 14, N' Santa Ana de Vuelta Larga', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (180, 18, N' Santa Clara', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (181, 20, N' Santa Elena', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (182, 1, N' Santa Isabel', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (183, 10, N' Santa Lucía', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (184, 7, N' Santa Rosa', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (185, 15, N' Santiago', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (186, 15, N' Santiago de Méndez', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (187, 21, N' Santo Domingo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (188, 6, N' Saquisilí', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (189, 12, N' Saraguro', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (190, 1, N' Sevilla de Oro', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (191, 22, N' Shushufindi', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (192, 6, N' Sigchos', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (193, 1, N' Sígsig', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (194, 10, N' Simón Bolívar', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (195, 12, N' Sozoranga', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (196, 14, N' Sucre', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (197, 15, N' Sucúa', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (198, 3, N' Suscal', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (199, 19, N' Tabacundo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (200, 15, N' Taisha', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (201, 22, N' Tarapoa', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (202, 16, N' Tena', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (203, 17, N' Tiputini', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (204, 23, N' Tisaleo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (205, 14, N' Tosagua', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (206, 4, N' Tulcán', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (207, 11, N' Urcuquí', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (208, 8, N' Valdez (Limones)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (209, 13, N' Valencia', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (210, 10, N' Velasco Ibarra (El Empalme)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (211, 13, N' Ventanas', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (212, 5, N' Villa La Unión (Cajabamba)', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (213, 13, N' Vinces', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (214, 10, N' Yaguachi', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (215, 24, N' Yantzaza', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (216, 24, N' Zamora', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (217, 12, N' Zapotillo', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (218, 7, N' Zaruma', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (219, 24, N' Zumba', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (220, 24, N' Zumbi', 1)
GO
INSERT [dbo].[Ciudad] ([CiudadId], [ProvinciaId], [CiudadName], [CiudadActive]) VALUES (221, 23, N'Mocha', 1)
GO
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (1, N'Azuay', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (2, N'Bolívar', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (3, N'Cañar', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (4, N'Carchi', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (5, N'Chimborazo', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (6, N'Cotopaxi', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (7, N'El Oro', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (8, N'Esmeraldas', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (9, N'Galápagos', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (10, N'Guayas', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (11, N'Imbabura', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (12, N'Loja', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (13, N'Los Ríos', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (14, N'Manabí', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (15, N'Morona Santiago', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (16, N'Napo', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (17, N'Orellana', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (18, N'Pastaza', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (19, N'Pichincha', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (20, N'Santa Elena', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (21, N'Santo Domingo de los Tsáchilas', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (22, N'Sucumbíos', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (23, N'Tungurahua', 1)
GO
INSERT [dbo].[Provincia] ([ProvinciaId], [ProvinciaName], [ProvinciaActive]) VALUES (24, N'Zamora Chinchipe', 1)
GO
SET IDENTITY_INSERT [dbo].[Provincia] OFF

*/