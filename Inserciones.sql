USE autoservicio;

INSERT INTO Cargo(Nombre_Cargo) VALUES ('Gerente'), ('Empleado');

INSERT INTO Categoria (ID, Nombre, Descripcion) VALUES
(1, 'Lácteos', 'Productos derivados de la leche'),
(2, 'Panes', 'Productos de panadería'),
(3, 'Cervezas', 'Bebidas alcohólicas fermentadas'),
(4, 'Arroz', 'Grano básico para la alimentación'),
(5, 'Jugos', 'Bebidas elaboradas a partir de frutas');

INSERT INTO DetalleProductos (Codigo, FechaEntrada, FechaVence, Cantidad, Valorentrada, Valorsalida) VALUES
(1, '2024-01-01 08:00:00', '2024-12-31 23:59:59', 100, 20000, 25000),
(2, '2024-02-15 09:00:00', '2024-11-30 23:59:59', 50, 15000, 18000),
(3, '2024-03-10 10:00:00', '2024-09-30 23:59:59', 200, 10000, 13000),
(4, '2024-04-05 11:00:00', '2024-08-31 23:59:59', 30, 5000, 8000),
(5, '2024-05-01 12:00:00', '2024-07-31 23:59:59', 75, 3000, 4000);

INSERT INTO DetalleProductosIngresados (Codigo, FechaEntrada, FechaVence, Cantidad, Valorentrada, Valorsalida, ProductosIngresados_Codigo) VALUES
(1, '2024-01-01 08:00:00', '2024-12-31 23:59:59', 120, 18000, 22000, 1),
(2, '2024-02-10 09:00:00', '2024-11-25 23:59:59', 60, 14000, 17000, 2),
(3, '2024-03-12 10:00:00', '2024-09-25 23:59:59', 250, 9500, 12500, 3),
(4, '2024-04-07 11:00:00', '2024-08-25 23:59:59', 40, 4500, 7500, 4),
(5, '2024-05-03 12:00:00', '2024-07-25 23:59:59', 90, 2800, 3800, 5);

INSERT INTO Usuarios (ID, Nombres, Apellidos, Correo, Contraseña, Telefono, Segundo_Telefono, Documento, Direccion, Cargo_ID) VALUES
(1, 'Juan', 'Pérez', 'juan.perez@ejemplo.com', '12345', 3214567890, 3112345678, 10203040, 'Calle 123 #45-67', 1),
(2, 'Ana', 'Gómez', 'ana.gomez@ejemplo.com', 'abcde', 3009876543, 3123456789, 20304050, 'Carrera 45 #67-89', 2),
(3, 'Luis', 'Martínez', 'luis.martinez@ejemplo.com', '67890', 3229876543, 3132345678, 30405060, 'Avenida 10 #11-12', 2),
(4, 'Marta', 'López', 'marta.lopez@ejemplo.com', 'qwerty', 3109876543, 3152345678, 40506070, 'Calle 20 #30-40', 2),
(5, 'Carlos', 'Díaz', 'carlos.diaz@ejemplo.com', 'zxcvb', 3209876543, 3162345678, 50607080, 'Carrera 80 #90-100', 2);

INSERT INTO DetalleFactura (Codigo, Fechaentrada, Fechasalida, Cantidad, Valorsalida) VALUES
(1, '2024-01-15 14:00:00', '2024-01-20 10:00:00', 10, 50000),
(2, '2024-02-10 12:00:00', '2024-02-15 09:00:00', 5, 25000),
(3, '2024-03-05 13:00:00', '2024-03-10 11:00:00', 15, 75000),
(4, '2024-04-20 16:00:00', '2024-04-25 08:00:00', 20, 100000),
(5, '2024-05-18 15:00:00', '2024-05-23 12:00:00', 8, 40000);

INSERT INTO Factura (Codigo, Presentacion, Producto, DetalleFacturaID, ID_Usu, ID_Categoria) VALUES
(1, 'Caja', 'Yogur', 1, 1, 1),
(2, 'Botella', 'Jugo', 2, 2, 2),
(3, 'Bolsa', 'Pan', 3, 3, 3),
(4, 'Caja', 'Cerveza', 4, 4, 4),
(5, 'Bolsa', 'Avena', 5, 5, 5);

INSERT INTO Productos (Codigo, Producto, Presentacion, CategoriaID, DetalleProductoID) VALUES
(1, 'Leche', 'Botella', 1, 1),
(2, 'Pan de trigo', 'Bolsa', 2, 2),
(3, 'Cerveza artesanal', 'Botella', 3, 3),
(4, 'Arroz integral', 'Caja', 4, 4),
(5, 'Jugo de naranja', 'Botella', 5, 5);

INSERT INTO ProductosIngresados (Codigo, Producto, Presentacion, CategoriaID, DetalleProductoID) VALUES
(1, 'Arroz', 'Caja', 1, 1),
(2, 'Pan', 'Bolsa', 2, 2),
(3, 'Leche', 'Botella', 3, 3),
(4, 'Mayonesa', 'Caja', 4, 4),
(5, 'Papas', 'Sobre', 5, 5);

INSERT INTO Movimientos (Codigo, Fecha, Tipo, Cantidad, Producto_codigo) VALUES
(1, '2024-06-01 09:00:00', 'Entrada', 50, 1),
(2, '2024-06-10 11:00:00', 'Salida', 10, 2),
(3, '2024-07-15 14:00:00', 'Entrada', 100, 3),
(4, '2024-07-20 10:00:00', 'Salida', 25, 4),
(5, '2024-08-05 12:00:00', 'Entrada', 75, 5);

INSERT INTO Alerta (ID, Nombre, Stock_Minimo, Stock_Actual, ID_Productos) VALUES
(1, 'Bajo stock de Leche', 10, 5, 1),
(2, 'Bajo stock de Pan', 15, 8, 2),
(3, 'Bajo stock de Cerveza', 20, 12, 3),
(4, 'Bajo stock de Arroz', 5, 2, 4),
(5, 'Bajo stock de Jugo', 25, 18, 5);
