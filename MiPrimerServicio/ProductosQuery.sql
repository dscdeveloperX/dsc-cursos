create table Producto (
Id int identity primary key,
Nombre nvarchar (100),
Categoria nvarchar (50),
Precio decimal (18,2),
Stock int ,
Estado tinyint

)

insert into Producto values ('Mayonesa', 'Viveres',2.99,15,0), 
('Ketchum', 'Viveres', 1.55,33,1),
('Jamon Serrano','Viveres',2.44,53,1),
('Cepillo Dental','Hogar',1.99,25,0),
('Papel Seda x5','Productos Escolares',1.09,46,1),
('Goma Blanca', 'Productos Escolares',2,33,0),
('Desodorante','Hogar',2.50,20,1),
('Reformers','Juguetes',15.99,4,0),
('Set Minerales','Juguetes',40,7,1),
('Peluche Burro Igor','Juguetes',8.37,15,1),
('Ajedrez','Juguetes',10.99,21,1),
('Sal Rosada', 'Viveres',3.89,12,1),
('Don Quijote','Libros',38.77,10,1),
('La ladrona de libros','Libros',25.96,15,1),
('Hamlet','Libros',33.77,22,0),
('Papel Aluminio','Hogar',1.50,44,1)


create procedure sp_AllProducts
As
Begin
Select * From Producto with (nolock)
End;

create procedure sp_ProductsById (@Id int)
As
Begin

Select * From Producto
Where Id = @Id

End;

create procedure sp_ProductsFilter1 (@Estado tinyint,@Stock int, @Precio decimal (18,2))
As
Begin

Select * From Producto 
Where Estado = @Estado And Stock >= @Stock And Precio <= @Precio

End;

create procedure sp_ProductsInsert (@Nombre nvarchar (100),
@Categoria nvarchar (50),
@Precio decimal (18,2),
@Stock int ,
@Estado tinyint)
As
Begin

insert into Producto (Nombre,Categoria,Precio,Stock,Estado) values (@Nombre, @Categoria,@Precio,@Stock,@Estado)

End;

exec sp_ProductsInsert 'Foca Peluche' , 'Juguetes', 18.77,20,1


exec sp_help 'Producto'

create procedure sp_ProductsUpdate (
@Id int,
@Nombre nvarchar (100),
@Categoria nvarchar (50),
@Precio decimal (18,2),
@Stock int ,
@Estado tinyint)
As
Begin



update Producto
set Nombre= @Nombre, 
Categoria = @Categoria,
Precio = @Precio,
Stock =@Stock,
Estado =@Estado
where Id = @Id; 
End;

exec sp_ProductsUpdate 1 ,'Foca' , 'Juguetes', 18.77,20,1


create procedure sp_ProductsDelete (
@Id int
)
As
Begin



delete from Producto
where Id = @Id; 
End;

exec sp_ProductsDelete 1 





 
