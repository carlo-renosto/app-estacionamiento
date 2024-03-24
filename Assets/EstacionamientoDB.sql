use master
go

CREATE DATABASE Estacionamiento;
go

use Estacionamiento
go

CREATE TABLE Usuario
(
Nombre varchar(30),
Contraseña varchar(10),
EsAdmin bit,
Estado bit default 1,

constraint PK_Nombre_US primary key(Nombre)
)

CREATE TABLE TipoCliente
(
Id int,
Descripcion varchar(30),

constraint PK_ID_TC primary key(Id),
)
go
	
CREATE TABLE TipoVehiculo
(
Id int,
Descripcion varchar(30),
PrecioHora int,

constraint PK_ID_TV primary key(Id),
)
go

CREATE TABLE Localidad
(
Id int identity(1, 1),
NombreL varchar(30)

constraint PK_IdLoc primary key(Id)
)
go

CREATE TABLE Cliente
(
Nombre varchar(30),
Apellido varchar(30),
Dni int,
IdLocalidad int,
Telefono int,
IdTipo int,
Estado bit default 1

constraint PK_DNI primary key(Dni),
constraint FK_LocCliente foreign key (IdLocalidad) references Localidad(Id),
constraint FK_IdTipo_C foreign key(IdTipo) references TipoCliente(Id)
)
go

CREATE TABLE MarcaVehiculo
(
IdMarca int,
NombreMarca varchar(20),

constraint PK_IdMarca_MV primary key(IdMarca)
)
go

CREATE TABLE ModeloVehiculo
(
IdMarca int,
IdModelo int,
NombreModelo varchar(20)

constraint PK_IdModelo_MV primary key(IdModelo)
constraint FK_IdMarca_MV2 foreign key(IdMarca) references MarcaVehiculo(IdMarca)
)
go

CREATE TABLE Vehiculo
(
Patente varchar(8), 
IdTipo int,
IdMarca int,
IdModelo int,
Info varchar(50),
Estado bit default 1,

constraint PK_Patente primary key(Patente),
constraint FK_IdTipo_V foreign key(IdTipo) references TipoVehiculo(Id),
constraint FK_IdMarca_V foreign key(IdMarca) references MarcaVehiculo(IdMarca),
constraint FK_IdModelo_V foreign key(IdModelo) references ModeloVehiculo(IdModelo)
)
go

CREATE TABLE Membresia
(
Dni int,
FechaInicio date, 
FechaFinalizacion date,
Estado bit default 1,

constraint PK_DNI_M primary key(Dni),
constraint FK_DNI_M foreign key(Dni) references Cliente(Dni)
)
go

CREATE TABLE Ticket
(
Id int IDENTITY(1, 1),
Patente varchar(8), 
Entrada datetime,
Estado bit default 1,

constraint PK_ID_T primary key(Id),
constraint FK_Patente foreign key(Patente) references Vehiculo(Patente)
)
go

CREATE TABLE Factura
(
Id int,
Dni int DEFAULT(0),
Salida datetime, 
Importe float,
estado bit default 1,

constraint PK_ID_F primary key(Id),
constraint FK_ID foreign key(Id) references Ticket(Id),
)
go

-- SP Usuarios

create procedure SpUsuarioInsertar @NombreU varchar(30), @ContraseñaU varchar(10), @EsAdmin bit, @Estado bit
as
begin
	insert into Usuario values(@NombreU, @ContraseñaU, @EsAdmin, @Estado)
end
go

-- SP Membresias

-- Triggers

CREATE TRIGGER TR_CalcularImporteFactura ON Factura AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @Salida datetime
	SELECT @Salida = Factura.Salida FROM Factura, Inserted WHERE Factura.Id = Inserted.Id


	IF EXISTS(SELECT * FROM Cliente, Inserted WHERE Cliente.Dni = Inserted.Dni AND Cliente.Estado = 1 AND Cliente.IdTipo = 2)
		BEGIN
		UPDATE Factura SET Importe = 0 FROM Factura, Inserted WHERE Factura.Id = Inserted.Id
	END
	ELSE
	BEGIN
		IF EXISTS(SELECT * FROM Membresia, Inserted WHERE Membresia.Dni = Inserted.Dni AND DATEDIFF(DAY, @Salida, FechaInicio) <= 0 AND DATEDIFF(DAY, @Salida, FechaFinalizacion) >= 0) 
		BEGIN
			UPDATE Factura SET Importe = 0 FROM Factura, Inserted WHERE Factura.Id = Inserted.Id
		END
		ELSE
		BEGIN
			DECLARE @Entrada datetime
			SELECT @Entrada = Entrada FROM Ticket, Inserted WHERE Ticket.Id = Inserted.Id

			DECLARE @Importe float
			SELECT @Importe = ceiling(DATEDIFF(Hour, @Entrada, @Salida))


			DECLARE @PrecioHora float
			SELECT @PrecioHora = PrecioHora FROM TipoVehiculo 
			JOIN Vehiculo ON Vehiculo.IdTipo = TipoVehiculo.Id 
			JOIN Ticket ON Ticket.Patente = Vehiculo.Patente 
			JOIN Inserted ON Ticket.Id = Inserted.Id 

			SELECT @Importe = @Importe * @PrecioHora  

			UPDATE Factura SET Importe = @Importe FROM Factura, Inserted WHERE Factura.Id = Inserted.Id
		END
	END
END 
GO

create procedure SpDarBajaCliente @Dni int
as
	update Cliente set Estado = 0 where Dni = @Dni
go

create procedure SpDarBajaMembresia @Dni int
as
	update Membresia set Estado = 0 where Dni = @Dni
go

CREATE PROCEDURE SpDarBajaTicket
@Id int
AS
	UPDATE Ticket SET Ticket.Estado = 0 FROM Ticket WHERE Ticket.Id = @Id
	UPDATE Factura SET Factura.Estado = 0 FROM Factura WHERE Factura.Id = @Id
GO

CREATE PROCEDURE SpDarBajaFactura
@Id int
AS
	UPDATE Factura SET Factura.Estado = 0 FROM Factura WHERE Factura.Id = @Id
GO

--Agregando datos

INSERT INTO TipoCliente(Id, Descripcion)
SELECT 1, 'Alumno' UNION
SELECT 2, 'Docente' UNION
SELECT 3, 'Otro'
GO

INSERT INTO TipoVehiculo(Id, Descripcion, PrecioHora)
SELECT 1, 'Moto', 250 UNION
SELECT 2, 'Auto', 300 UNION
SELECT 3, 'Camioneta', 400
GO

INSERT INTO Localidad(NombreL)
SELECT 'Malvinas Argentinas' UNION
SELECT 'Pilar' UNION
SELECT 'La Plata' UNION
SELECT 'Tigre'
GO

INSERT INTO Usuario(Nombre, Contraseña, EsAdmin)
SELECT 'UserAdmin', '2022', 1 UNION
SELECT 'User', '1234', 0 UNION
SELECT 'User2', '122', 0 
GO

INSERT INTO Cliente(Nombre, Apellido, Dni, Telefono, IdLocalidad, IdTipo)
SELECT 'Diego', N'Perez', 4205, 342, 3, 3 UNION
SELECT 'Juan', N'Gonzalez', 4303, 611, 4, 3 UNION
SELECT 'Jorge', N'Peretti', 4304, 452, 1, 1 UNION
SELECT 'Maximo', N'Rodriguez', 4305, 421, 4, 2 UNION
SELECT 'Franco', N'Messi', 4721, 921, 3, 1 UNION
SELECT 'Amadeo', N'Perez', 1263, 912, 2, 2 UNION
SELECT 'Toto', 'Quiroga', 4913, 132, 4, 2 UNION
SELECT 'Pepe', 'Martinez', 2316, 431, 3, 3
GO 

INSERT INTO MarcaVehiculo(IdMarca, NombreMarca)
SELECT 0, 'Otro' UNION
SELECT 1, 'Chevrolet' UNION
SELECT 2, 'Ford' UNION
SELECT 3, 'Nissan' UNION
SELECT 4, 'Peugeot' UNION
SELECT 5, 'Renault' UNION
SELECT 6, 'Suzuki'
GO

INSERT INTO ModeloVehiculo(IdMarca, IdModelo, NombreModelo)
SELECT 0, 0,'Otro' UNION
SELECT 5, 1, 'Captur' UNION
SELECT 5, 2, 'Duster' UNION
SELECT 4, 3, '206' UNION
SELECT 4, 4, '308' UNION
SELECT 2, 5, 'Ecosport' UNION
SELECT 2, 6, 'Fiesta' UNION
SELECT 1, 7, 'Corsa' UNION
SELECT 1, 8, 'Onix' UNION
SELECT 3, 9, 'Sentra' UNION
SELECT 3, 10, 'Versa' UNION
SELECT 6, 11, 'GN 125F' UNION
SELECT 6, 12, 'GSX S 750'
GO

INSERT INTO Vehiculo(Patente, IdMarca, IdModelo, IdTipo, Info)
SELECT '02342921', 1, 7, 2, 'Azul' UNION
SELECT '03292349', 3, 9, 2, 'Verde oscuro' UNION
SELECT '03321253', 2, 6, 3, 'Rojo y negra' UNION
SELECT '05325392', 4, 4, 2, 'Gris' UNION
SELECT '09531234', 5, 1, 3, 'Naranja' UNION
SELECT '09214921', 1, 8, 2, 'Gris' UNION
SELECT '01324321', 6, 11, 1, 'Negra' UNION
SELECT '01241523', 2, 5, 3, 'Violeta'
GO

INSERT INTO Membresia(Dni, FechaInicio, FechaFinalizacion)
SELECT 4205, GETDATE(), '2023-05-23' UNION
SELECT 4303, GETDATE(), '2024-08-15' UNION
SELECT 4304, '2022-01-25', '2022-11-10'
GO

INSERT INTO Ticket(Patente, Entrada)
SELECT '02342921', '2022-05-23 15:35:00' UNION
SELECT '03292349', '2022-05-23 15:35:00' UNION
SELECT '03321253', '2022-05-23 15:35:00' UNION
SELECT '05325392', '2022-05-23 15:35:00' UNION
SELECT '03321253', '2022-11-25 15:35:00' UNION
SELECT '03321253', '2022-11-26 15:35:00' UNION
SELECT '03321253', '2022-11-27 15:35:00' UNION
SELECT '09531234', '2022-05-23 15:35:00'
GO

INSERT INTO Factura(Id, Dni, Salida)
SELECT 1, 4205, '2022-05-24 15:35:00' 
GO

INSERT INTO Factura(Id, Dni, Salida)
SELECT 6, 4304, '2022-11-25 20:35:00' 
GO

INSERT INTO Factura(Id, Dni, Salida)
SELECT 7, 4304, '2022-11-26 16:30:00' 
GO

INSERT INTO Factura(Id, Dni, Salida)
SELECT 8, 4304, '2022-11-28 04:35:00'
GO

INSERT INTO Factura(Id, Dni, Salida)
SELECT 2, 4303, '2022-05-23 20:35:00' 
GO

INSERT INTO Factura(Id, Dni, Salida)
SELECT 3, 4304, '2022-05-23 17:35:00' 
GO

INSERT INTO Factura(Id, Dni, Salida)
SELECT 4, 4305, '2022-05-23 18:35:00' 
GO

INSERT INTO Factura(Id, Dni, Salida)
SELECT 5, 4721, '2022-06-23 15:35:00'
GO

