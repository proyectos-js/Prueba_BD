---- Creacion de base de datos
CREATE DATABASE prueba;

---- Conectar a la base de datos
\c prueba;

--- Creacion tabla clientes
CREATE TABLE Clientes(
    idCliente SERIAL, 
    nombre VARCHAR(25), 
    rut VARCHAR(10), 
    direccion VARCHAR(50),
    PRIMARY KEY (idCliente)
    );

--- Creacion tabla facturas
CREATE TABLE Facturas(
    idfactura SERIAL,
    fecha DATE,
    subtotal FLOAT,
    iva FLOAT,
    preciototal FLOAT,
    idcliente INT,
    PRIMARY KEY (idFactura),
    FOREIGN KEY (idcliente) REFERENCES Clientes(idcliente)                          
    );

--- Creacion tabla categorias
CREATE TABLE Categorias(
    idCategoria SERIAL, 
    nombre VARCHAR(25), 
    descripcion VARCHAR(50),
    PRIMARY KEY (idcategoria)
    );

--- Creacion tabla productos
CREATE TABLE Productos(
    idproducto SERIAL, 
    nombre VARCHAR(25), 
    descripcion VARCHAR(50), 
    valorunitario INT, 
    idcategoria INT,
    PRIMARY KEY (idproducto),
    FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria)
    );

--- Creacion tabla detalles
CREATE TABLE Detalles(
    iddetalle SERIAL, 
    precioUnitario INT,
    cantidad INT, 
    valortotal INT, 
    idfactura INT, 
    idproducto INT,
    PRIMARY KEY (iddetalle),
    FOREIGN KEY (idproducto) REFERENCES productos(idproducto),
    FOREIGN KEY (idfactura)  REFERENCES facturas(idfactura)
    );


--- Insert Registros tabla Clientes -----

    INSERT INTO Clientes (nombre, rut, direccion) VALUES ('Julio Saavedra','102295402','San Juan 1520');
    INSERT INTO Clientes (nombre, rut, direccion) VALUES ('Pedro Rebolledo','092368894','Santiago 88');
    INSERT INTO Clientes (nombre, rut, direccion) VALUES ('Carlos Sanchez','126774306','San Diago 233');
    INSERT INTO Clientes (nombre, rut, direccion) VALUES ('Cristina Veas','111348876','Maipu 3345');
    INSERT INTO Clientes (nombre, rut, direccion) VALUES ('Pedro Lira','176563432','La Florida 225');
    
 
---- Insert registros tabla categorias -----

    INSERT INTO categorias (nombre, descripcion) VALUES ('Electro','Línea Blanca Cocinas-Refrigeradores');
    INSERT INTO categorias (nombre, descripcion) VALUES ('Tecnología','Notebooks-Impresoras-Celulares');
    INSERT INTO categorias (nombre, descripcion) VALUES ('Hogar','Camas-Colchones-Cubrecamas');

---- Insert registros tabla productos -----

    INSERT INTO productos (nombre, descripcion, valorunitario, idCategoria) VALUES ('Refrig.Fensa','1 puerta',3600,1);
    INSERT INTO productos (nombre, descripcion, valorunitario, idCategoria) VALUES ('Cocina Daewoo','4 Platos',2390,1);
    INSERT INTO productos (nombre, descripcion, valorunitario, idCategoria) VALUES ('Lavadora Samsung','Redonda',5459,1);
    INSERT INTO productos (nombre, descripcion, valorunitario, idCategoria) VALUES ('Notebook','Lenovo',3400,2);
    INSERT INTO productos (nombre, descripcion, valorunitario, idCategoria) VALUES ('Celular','LG-x3',1200,2);
    INSERT INTO productos (nombre, descripcion, valorunitario, idCategoria) VALUES ('TV 55 Pul','Sony',5670,2);
    INSERT INTO productos (nombre, descripcion, valorunitario, idCategoria) VALUES ('Cama y colchon Rosen','2 plaza',3200,3);
    INSERT INTO productos (nombre, descripcion, valorunitario, idCategoria) VALUES ('Cubrecama Negro','1 plaza',1500,3);


-- cliente 1 , 2 facturas / 2 y 3 productos
-- Factura 1
    INSERT INTO facturas (fecha, subtotal, iva, preciototal, idcliente) VALUES ('2020-06-23',5990,1138.1,7128.1,1);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (3600,1,3600,1,1);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (2390,1,2390,1,2);
    

 -- Factura 2
    INSERT INTO facturas (fecha, subtotal, iva, preciototal, idcliente) VALUES ('2020-06-24',14329,2722.51,17051.51,1);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (5459,1,5459,2,3);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (5670,1,5670,2,6);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (3200,1,3200,2,7);
    

-- cliente 2 , 3 facturas /3,  2 y 3 productos

-- Factura 3
    INSERT INTO facturas (fecha, subtotal, iva, preciototal, idcliente) VALUES ('2020-06-05',6990,1328.1,8318.1,2);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (2390,1,2390,3,1);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal,idfactura,idproducto) VALUES (3400,1,3400,3,4);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal,idfactura,idproducto) VALUES (1200,1,1200,3,5);
    

-- Factura 4
    INSERT INTO facturas (fecha,subtotal, iva, preciototal, idcliente) VALUES ('2020-06-10',2700,513,3213,2);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (1500,1,1500,4,8);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (1200,1,1200,4,5);
    

--Factura 5
    INSERT INTO facturas (fecha, subtotal, iva, preciototal, idcliente) VALUES ('2020-04-23',10770,2046.3,12816.3,2);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (3600,1,3600,5,1);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (5670,1,5670,5,6);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (1500,1,1500,5,8);
    


-- cliente 3 , 1 facturas / 1 productos
    --Factura 6
    INSERT INTO facturas (fecha, subtotal, iva, preciototal, idcliente) VALUES ('2020-03-18',3400,646,4046,3);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (3400,1,3400,6,4);
    

-- cliente 4 , 4 facturas / 2,3,4 y 1 productos
   
    --Factura 7    - 2 productos
    INSERT INTO facturas (fecha, subtotal, iva, preciototal, idcliente) VALUES ('2020-03-27',8459,1607.21,10066.21,4);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (5459,1,5459,7,3);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (1500,2,3000,7,8);
    


    --Factura 8    - 3 productos
    INSERT INTO facturas (fecha, subtotal, iva, preciototal, idcliente) VALUES ('2020-04-15',6990,1328.1,8318.1,4);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (3400,1,3400,8,4);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (1200,1,1200,8,5);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (2390,1,2390,8,2);
    

    --Factura 9    - 4 productos
    INSERT INTO facturas (fecha, subtotal, iva, preciototal, idcliente) VALUES ('2020-02-21',10500,1995,12495,4);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (1500,1,1500,9,8);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (3400,1,3400,9,4);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (3200,1,3200,9,7);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (1200,2,2400,9,5);
    

    --Factura 10   - 1 producto
    INSERT INTO facturas (fecha, subtotal, iva, preciototal, idcliente) VALUES ('2020-02-14',5670,1077.3,6747.3,4);
    INSERT INTO detalles (precioUnitario, cantidad, valortotal, idfactura, idproducto) VALUES (5670,1,5670,10,6);
    

--  SELECT CONSULTAS -----

-- ¿Qué cliente realizó la compra más cara?

SELECT a.nombre FROM Clientes a LEFT JOIN Facturas b ON a.idcliente=b.idcliente
WHERE  b.preciototal = (SELECT max(preciototal) FROM Facturas);

-- ¿Qué cliente pago sobre 100 de monto?

SELECT DISTINCT(a.nombre) FROM Clientes a LEFT JOIN Facturas b ON a.idcliente=b.idcliente
WHERE  b.preciototal > 100;

-- ¿Cuántos clientes han comprado el producto 6?

SELECT count(DISTINCT(a.nombre)) AS cantidad FROM Clientes a 
LEFT JOIN Facturas b 
ON a.idcliente=b.idcliente LEFT JOIN detalles c 
ON b.idfactura=c.idfactura LEFT JOIN productos d
ON c.idproducto = d.idproducto
WHERE  d.idproducto = 6;