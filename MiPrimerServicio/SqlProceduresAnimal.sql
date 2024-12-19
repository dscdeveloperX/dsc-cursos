create procedure sp_SelectAllAnimal
As
Begin
Select * From Animal
End;

--exec sp_SelectAllAnimal


create procedure sp_SelectByIdAnimal (@Id int)
As
Begin
Select * From Animal 
Where Id = @Id
End;

--exec sp_SelectByIdAnimal 1

create procedure sp_InsertAnimal (@Nombre varchar(100),@Color varchar(50),@Patas int)
As 
Begin
Insert into Animal (Nombre,Color,Patas) values (@Nombre,@Color,@Patas);
End;

--exec sp_InsertAnimal 'Vaca','Blanco',4


create procedure sp_UpdateAnimal (@Id int, @Nombre varchar(100), @Color varchar(50), @Patas int)
As
Begin
Update Animal 
Set Nombre = @Nombre,
Color = @Color,
Patas = @Patas
Where Id = @Id;
End;

--exec sp_UpdateAnimal  4 ,'Toro', 'Negro',4


create procedure sp_DeleteAnimal (@Id int)
As
Begin
Delete From Animal
Where Id = @Id;
End;

--exec sp_DeleteAnimal 4

select* from Animal

insert into Animal values ('Gato','Blanco',4),
('Gato','Azul',4),
('Gallina','Negro',2),
('Gallina','Azul',2)



create procedure sp_AnimalFilter (
@Patas int, 
@Color varchar(50)
)
As
Begin

Select * From Animal
where Patas > @Patas and Color <> @Color;

End;

exec sp_AnimalFilter 1, 'Negro'
