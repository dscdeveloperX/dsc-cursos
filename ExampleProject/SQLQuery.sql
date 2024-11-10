USE DARWIN_SANCHEZ_DB;
GO
--clave: dsc123456

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

create  procedure sp_SelectByIdClub(
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


create  procedure sp_SelectAllClub
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


create  procedure sp_InsertClub(
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





create  procedure sp_UpdateClub(
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





create  procedure sp_DeleteClub(
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



