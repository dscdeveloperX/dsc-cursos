/*create table Persona (
PersonaId int identity(1,1) primary key,
Cedula varchar(10) not null,
Nombre varchar (100) not null,
EstadoCivil varchar(1) not null,
Sueldo decimal(18,2) not null
)*/





Create Procedure sp_PersonaSelect (
@EstadoCivil varchar (1) 
)

As
Begin
Select * from  Persona
Where EstadoCivil = @EstadoCivil 
Order by Nombre;
End;


EXEC sp_PersonaSelect 'S';