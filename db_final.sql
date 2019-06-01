CREATE DATABASE innguz_ventas;
GO
USE innguz_ventas;
GO



CREATE TABLE Usuarios(
	Id int primary key identity(1,1) not null,
	Usuario varchar(50) not null,
	Nombre varchar(100) not null,
	Apellido varchar(100) not null,
	Posicion varchar(100) not null,
	Telefono varchar(20) not null,
	Correo varchar(50) not null,
	Clave varchar(30) not null,
	Foto varbinary(max) not null,
	Fecha_registro date not null
)

CREATE TABLE Tipo_Producto(
	id int primary key identity(1,1) not null,
	Tipo varchar(50) not null,

	FechaInserta date,
	UsuarioInserta varchar(50),
	FechaActualiza date,
	UsuarioActualiza varchar(50)
)

CREATE TABLE Categorias(
	id int primary key identity(1,1) not null,
	Nombre varchar(100) not null,

	FechaInserta date,
	UsuarioInserta varchar(50),
	FechaActualiza date,
	UsuarioActualiza varchar(50)
)

CREATE TABLE Productos(
	id int primary key identity(1,1) not null,
	Nombre varchar(100) not null,
	Descripci�n varchar(255) not null,
	Precio decimal(4,2) not null,
	Tipo_Producto_Id int not null,
	Categoria_Id int not null,

	FechaInserta date,
	UsuarioInserta varchar(50),
	FechaActualiza date,
	UsuarioActualiza varchar(50)

)

CREATE TABLE Estados_Periodo (
	id int primary key identity(1,1) not null,
	estado varchar(25) not null
)

CREATE TABLE Periodos(
	id_periodo int primary key identity(1,1) not null,
	mes int not null,
	a�o int not null,
	estado int not null,
	FechaCreacion date,
)


CREATE TABLE Ventas(
	Id int primary key identity(1,1) not null,
	Descripcion varchar(250) not null,
	Cantidad int not null,
	Monto decimal(4, 2) not null,
	IVA decimal(4,2) not null, 
	Total decimal(4,2) not null,

	Usuario_id int,
	Producto_Servicio_id int,
	periodo_id int,
	
	FechaInserta date,
	UsuarioInserta varchar(50),
	FechaActualiza date,
	UsuarioActualiza varchar(50)
)

CREATE PROCEDURE SP_modificar_usuario 
	@id int,
	@usuario varchar(50),
	@nombre varchar(100),
	@apellido varchar(100),
	@posicion varchar(100),
	@telefono varchar(20),
	@correo varchar(50),
	@clave varchar(30),
	@foto varbinary(max)
AS
BEGIN
	update Usuarios set Usuario=@usuario, Nombre=@nombre, Apellido=@apellido, Posicion=@posicion, Telefono=@telefono, Correo=@correo, Clave=@clave,Foto=@foto
	where Id=@id;

    -- Insert statements for procedure here
	SELECT 'Datos actualizados exitosamente' Mensaje
END
GO

select * from Usuarios
