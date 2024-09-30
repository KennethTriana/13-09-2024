DROP DATABASE IF EXISTS autoservicio;
CREATE DATABASE autoservicio;
USE autoservicio;
CREATE TABLE Categoria (
	ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	Nombre VARCHAR (50) NOT NULL,
	Descripcion VARCHAR(50) NOT NULL
);
CREATE TABLE Cargo (
	ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	Nombre_Cargo VARCHAR(50) NOT NULL
);
CREATE TABLE DetalleProductos (
	Codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	FechaEntrada DATETIME NOT NULL,
    FechaVence DATETIME NOT NULL,
    Cantidad INT NOT NULL,
    Valorentrada INT NOT NULL,
    Valorsalida INT NOT NULL
);

CREATE TABLE Usuarios (
	ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	Nombres VARCHAR(50) NOT NULL,
	Apellidos VARCHAR(50) NOT NULL,
	Correo VARCHAR(50) NOT NULL,
	Contraseña VARCHAR(50) NOT NULL,
	Telefono INT NOT NULL,
    Segundo_Telefono INT NOT NULL,
    Documento int not null,
	Direccion VARCHAR(50) NOT NULL,
	Cargo_ID INT NOT NULL,
	FOREIGN KEY (Cargo_ID) REFERENCES Cargo(ID)
);
CREATE TABLE DetalleFactura (
	Codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Fechaentrada DATETIME NOT NULL,
    Fechasalida DATETIME NOT NULL,
    Cantidad INT NOT NULL,
    Valorsalida INT NOT NULL
);
CREATE TABLE Factura (
	Codigo INT PRIMARY KEY auto_increment NOT NULL,
	Presentacion VARCHAR (50) NOT NULL,
    Producto VARCHAR (50) NOT NULL, 
	DetalleFacturaID INT NOT NULL,
	ID_Usu INT NOT NULL,
    ID_Categoria INT NOT NULL,
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID),
	FOREIGN KEY (ID_Usu) REFERENCES Usuarios(ID),
	FOREIGN KEY (DetalleFacturaID) REFERENCES DetalleFactura(Codigo)
);
CREATE TABLE Productos (
    Codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Producto VARCHAR(50) NOT NULL,
    Presentacion VARCHAR (50) NOT NULL,
    CategoriaID INT NOT NULL,
    DetalleProductoID INT NOT NULL,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria (ID),
    FOREIGN KEY (DetalleProductoID) REFERENCES DetalleProductos (Codigo)
);
CREATE TABLE ProductosIngresados (
	Codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    Producto VARCHAR(50) NOT NULL,
    Presentacion VARCHAR(50) NOT NULL,
    CategoriaID INT NOT NULL,
    DetalleProductoID INT NOT NULL,
	FOREIGN KEY (CategoriaID) REFERENCES Categoria (ID),
    FOREIGN KEY (DetalleProductoID) REFERENCES DetalleProductos (Codigo)
);
CREATE TABLE DetalleProductosIngresados (
	Codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	FechaEntrada DATETIME NOT NULL,
    FechaVence DATETIME NOT NULL,
    Cantidad INT NOT NULL,
    Valorentrada INT NOT NULL,
    Valorsalida INT NOT NULL,
    ProductosIngresados_Codigo INT NOT NULL,
    FOREIGN KEY (ProductosIngresados_Codigo) REFERENCES ProductosIngresados(Codigo)
);
CREATE TABLE Movimientos (
	Codigo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	Fecha DATETIME NOT NULL,
	Tipo VARCHAR(50) NOT NULL,
    Cantidad INT NOT NULL,
    Producto_codigo INT NOT NULL,
    FOREIGN KEY (Producto_codigo) REFERENCES Productos(Codigo)
);
CREATE TABLE Alerta (
	ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(50) NOT NULL, 
    Stock_Minimo INT NOT NULL,
    Stock_Actual INT NOT NULL,
    ID_Productos INT NOT NULL,
    FOREIGN KEY (ID_Productos) REFERENCES Productos(Codigo)
);