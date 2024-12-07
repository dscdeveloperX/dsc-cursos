use darwincito_db
go

create table Animal (
Id int identity primary key ,
Nombre varchar(100),
Color varchar (50),
Patas int 
)

insert into Animal values ('Araña','Roja',8)
insert into Animal values ('Gato','Negro',4)
insert into Animal values ('Gallina','Blanco',2)

select * from Animal