USE autoservicio;

SELECT * FROM Categoria;
SELECT ID, Nombre FROM Categoria;
SELECT Descripcion FROM Categoria;
SELECT Nombre, Descripcion FROM Categoria;
SELECT * FROM Categoria WHERE Descripcion <> '';
SELECT * FROM Categoria WHERE Descripcion LIKE '%bebida%';
SELECT * FROM Categoria WHERE ID > 3;
SELECT * FROM Categoria WHERE ID < 5;
SELECT * FROM Categoria ORDER BY Nombre ASC;
SELECT * FROM Categoria ORDER BY ID DESC;
SELECT COUNT(*) AS TotalCategorias FROM Categoria;
SELECT MAX(ID) AS MaxID FROM Categoria;
SELECT MIN(ID) AS MinID FROM Categoria;
SELECT COUNT(*) AS TotalConProductos FROM Categoria WHERE Descripcion LIKE '%Productos%';

SELECT * FROM DetalleProductos;
SELECT Codigo, FechaEntrada, Cantidad FROM DetalleProductos WHERE FechaEntrada > '2024-01-01';
SELECT Codigo, FechaVence, Cantidad FROM DetalleProductos WHERE FechaVence BETWEEN '2024-12-01' AND '2024-12-31';
SELECT Codigo, Cantidad FROM DetalleProductos WHERE Cantidad > 100;
SELECT Codigo, Valorentrada FROM DetalleProductos WHERE Valorentrada > 5000;
SELECT Codigo, Valorentrada, Valorsalida FROM DetalleProductos WHERE Valorsalida > Valorentrada;
SELECT Codigo, Valorsalida FROM DetalleProductos ORDER BY Valorsalida DESC LIMIT 1;
SELECT COUNT(Codigo) AS TotalProductos FROM DetalleProductos WHERE Cantidad > 100;
SELECT SUM(Cantidad) AS TotalCantidad FROM DetalleProductos;
SELECT Codigo, FechaVence, Cantidad FROM DetalleProductos WHERE FechaVence < NOW() + INTERVAL 30 DAY;
SELECT Codigo, FechaEntrada, Cantidad FROM DetalleProductos ORDER BY FechaEntrada DESC;

SELECT * FROM DetalleProductosIngresados;
SELECT Codigo, FechaEntrada, Cantidad FROM DetalleProductosIngresados WHERE FechaEntrada > '2024-01-01';
SELECT Codigo, FechaVence, Cantidad FROM DetalleProductosIngresados WHERE FechaVence BETWEEN '2024-12-01' AND '2024-12-31';
SELECT Codigo, Cantidad FROM DetalleProductosIngresados WHERE Cantidad > 100;
SELECT Codigo, Valorentrada FROM DetalleProductosIngresados WHERE Valorentrada > 5000;
SELECT Codigo, Valorentrada, Valorsalida FROM DetalleProductosIngresados WHERE Valorsalida > Valorentrada;
SELECT Codigo, Valorsalida FROM DetalleProductosIngresados ORDER BY Valorsalida DESC LIMIT 1;
SELECT COUNT(Codigo) AS TotalProductos FROM DetalleProductosIngresados WHERE Cantidad > 100;
SELECT SUM(Cantidad) AS TotalCantidad FROM DetalleProductosIngresados;
SELECT Codigo, FechaVence, Cantidad FROM DetalleProductosIngresados WHERE FechaVence < NOW() + INTERVAL 30 DAY;
SELECT Codigo, FechaEntrada, Cantidad FROM DetalleProductosIngresados ORDER BY FechaEntrada DESC;

SELECT * FROM Usuarios;
SELECT ID, Nombres, Apellidos FROM Usuarios WHERE Correo LIKE '%@gmail.com';
SELECT Nombres, Apellidos, Telefono FROM Usuarios WHERE Telefono IS NOT NULL;
SELECT ID, Correo FROM Usuarios WHERE Documento = 123456789;
SELECT Nombres, Apellidos FROM Usuarios WHERE Cargo_ID = 1;
SELECT COUNT(ID) AS TotalUsuarios FROM Usuarios;
SELECT Nombres, Apellidos, Direccion FROM Usuarios WHERE Telefono BETWEEN 300000000 AND 399999999;
SELECT ID, Nombres FROM Usuarios ORDER BY Apellidos ASC;
SELECT Nombres, Apellidos, Telefono, Segundo_Telefono FROM Usuarios WHERE Segundo_Telefono IS NOT NULL;
SELECT ID, Nombres, Apellidos FROM Usuarios WHERE ID < 10;

SELECT * FROM DetalleFactura;
SELECT Codigo, Fechaentrada, Fechasalida FROM DetalleFactura WHERE Cantidad > 0;
SELECT Cantidad, Valorsalida FROM DetalleFactura WHERE Fechasalida >= NOW();
SELECT Codigo, Fechaentrada FROM DetalleFactura WHERE Valorsalida BETWEEN 1000 AND 5000;
SELECT COUNT(Codigo) AS TotalFacturas FROM DetalleFactura;
SELECT SUM(Valorsalida) AS TotalValor FROM DetalleFactura;
SELECT Cantidad, Valorsalida FROM DetalleFactura ORDER BY Fechaentrada DESC;
SELECT Codigo, Fechaentrada FROM DetalleFactura WHERE Fechaentrada BETWEEN '2024-01-01' AND '2024-12-31';
SELECT Cantidad FROM DetalleFactura WHERE Codigo < 10;

SELECT * FROM Factura;
SELECT Codigo, Presentacion, Producto FROM Factura WHERE ID_Usu > 0;
SELECT Producto, Presentacion FROM Factura WHERE ID_Categoria = 1;
SELECT COUNT(Codigo) AS TotalFacturas FROM Factura;
SELECT SUM(DetalleFacturaID) AS TotalDetalles FROM Factura WHERE ID_Usu = 1;
SELECT Producto, ID_Usu FROM Factura ORDER BY Codigo DESC;
SELECT ID_Categoria, COUNT(Codigo) AS CantidadPorCategoria FROM Factura GROUP BY ID_Categoria;
SELECT Producto FROM Factura WHERE DetalleFacturaID IN (SELECT Codigo FROM DetalleFactura WHERE Cantidad > 5);
SELECT Presentacion FROM Factura WHERE Codigo < 10;

SELECT * FROM Productos;
SELECT Producto FROM Productos WHERE CategoriaID = 1;
SELECT COUNT(*) AS TotalProductos FROM Productos;
SELECT Producto, Presentacion FROM Productos WHERE DetalleProductoID = 1;
SELECT * FROM Productos WHERE Codigo = 1;
SELECT DISTINCT CategoriaID FROM Productos;
SELECT Producto, Presentacion FROM Productos ORDER BY Producto ASC;
SELECT * FROM Productos WHERE CategoriaID IN (SELECT ID FROM Categoria WHERE Nombre LIKE '%bebida%');
SELECT Producto FROM Productos WHERE Valor < 10000;
SELECT * FROM Productos WHERE Codigo BETWEEN 1 AND 10;

SELECT * FROM ProductosIngresados;
SELECT Codigo, Producto FROM ProductosIngresados;
SELECT Producto, Presentacion FROM ProductosIngresados WHERE CategoriaID = 1;
SELECT COUNT(*) AS TotalProductosIngresados FROM ProductosIngresados;
SELECT * FROM ProductosIngresados WHERE DetalleProductoID = 1;
SELECT DISTINCT CategoriaID FROM ProductosIngresados;
SELECT Producto, Presentacion FROM ProductosIngresados ORDER BY Producto ASC;
SELECT * FROM ProductosIngresados WHERE CategoriaID IN (SELECT ID FROM Categoria WHERE Nombre LIKE '%Panes%');
SELECT Codigo, Producto FROM ProductosIngresados WHERE Producto LIKE '%leche%';
SELECT * FROM ProductosIngresados WHERE Codigo BETWEEN 1 AND 10;
SELECT * FROM ProductosIngresados WHERE Presentacion = 'Caja';
SELECT COUNT(*) AS TotalPresentaciones FROM ProductosIngresados WHERE Presentacion IS NOT NULL;
SELECT * FROM ProductosIngresados WHERE CategoriaID = (SELECT ID FROM Categoria WHERE Nombre = 'Lácteos');
SELECT SUM(DetalleProductoID) AS TotalDetalles FROM ProductosIngresados WHERE DetalleProductoID > 0;
SELECT * FROM ProductosIngresados ORDER BY Codigo DESC LIMIT 5;
SELECT Producto, Presentacion FROM ProductosIngresados WHERE CategoriaID = 3;
SELECT * FROM ProductosIngresados WHERE Codigo IN (SELECT Codigo FROM DetalleProductos WHERE Cantidad < 50);

SELECT * FROM Movimientos;
SELECT Codigo, Fecha, Tipo, Cantidad FROM Movimientos WHERE Tipo = 'Entrada';
SELECT Codigo, Fecha, Tipo, Cantidad FROM Movimientos WHERE Tipo = 'Salida';
SELECT COUNT(*) AS TotalMovimientos FROM Movimientos;
SELECT SUM(Cantidad) AS TotalEntradas FROM Movimientos WHERE Tipo = 'Entrada';
SELECT SUM(Cantidad) AS TotalSalidas FROM Movimientos WHERE Tipo = 'Salida';
SELECT * FROM Movimientos ORDER BY Fecha DESC;
SELECT DISTINCT Tipo FROM Movimientos;
SELECT * FROM Movimientos WHERE Producto_codigo IN (SELECT Codigo FROM Productos WHERE CategoriaID = 2);
SELECT Cantidad FROM Movimientos WHERE Fecha BETWEEN '2024-01-01' AND '2024-12-31';
SELECT * FROM Movimientos WHERE Cantidad > 100;
SELECT * FROM Movimientos WHERE Producto_codigo = 1;
SELECT Codigo, Fecha, Tipo FROM Movimientos WHERE Fecha > NOW() - INTERVAL 30 DAY;
SELECT Cantidad FROM Movimientos WHERE Fecha < '2024-06-01';
SELECT * FROM Movimientos WHERE Cantidad BETWEEN 10 AND 50;
SELECT * FROM Movimientos WHERE Producto_codigo = (SELECT Codigo FROM Productos WHERE Producto = 'Leche');
SELECT COUNT(*) AS TotalMovimientosPorProducto FROM Movimientos WHERE Producto_codigo = 1;
SELECT * FROM Movimientos WHERE Fecha >= '2024-01-01' AND Fecha <= '2024-12-31' ORDER BY Fecha ASC;

SELECT * FROM Alerta;
SELECT ID, Nombre, Stock_Minimo, Stock_Actual FROM Alerta WHERE Stock_Actual < Stock_Minimo;
SELECT COUNT(*) AS TotalAlertas FROM Alerta;
SELECT * FROM Alerta WHERE ID_Productos = 1;
SELECT * FROM Alerta ORDER BY Stock_Actual ASC;
SELECT DISTINCT ID_Productos FROM Alerta;
SELECT * FROM Alerta WHERE Stock_Actual > 0;
SELECT Nombre FROM Alerta WHERE Stock_Actual < 5;
SELECT Stock_Minimo, Stock_Actual FROM Alerta WHERE Stock_Actual < Stock_Minimo;
SELECT ID, Nombre FROM Alerta WHERE Stock_Actual < Stock_Minimo ORDER BY Stock_Minimo;
SELECT ID, Nombre, Stock_Actual FROM Alerta WHERE ID_Productos IN (SELECT Codigo FROM Productos WHERE CategoriaID = 2);
SELECT * FROM Alerta WHERE Stock_Actual = Stock_Minimo;
SELECT * FROM Alerta WHERE Stock_Actual BETWEEN 0 AND Stock_Minimo;
SELECT COUNT(*) AS TotalAlertasBajas FROM Alerta WHERE Stock_Actual < 10;
SELECT ID, Nombre, Stock_Minimo, Stock_Actual FROM Alerta WHERE ID_Productos IN (SELECT Codigo FROM Productos WHERE Presentacion = 'Caja');
SELECT * FROM Alerta WHERE Stock_Actual = Stock_Minimo ORDER BY Nombre ASC;
