--crear base de datos
CREATE DATABASE prueba;

\c prueba
--Creando Tablas

CREATE TABLE Cliente(
    ID_Cliente SERIAL,
    RUT VARCHAR(10),
    Direccion VARCHAR(300),
    Nombre_Cliente VARCHAR(300),
    PRIMARY KEY (ID_Cliente)
);

CREATE TABLE Factura(
    Numero_Factura SERIAL,
    Fecha_factura DATE,
    ID_Cliente INT,
    PRIMARY KEY (Numero_Factura),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Categoria(
    ID_Categoria SERIAL,
    Descripcion_Categoria VARCHAR(300),
    Nombre_Categoria VARCHAR (300),
    PRIMARY KEY (ID_Categoria)
);

CREATE TABLE Producto(
    ID_Producto SERIAL,
    Descripcion_Producto VARCHAR(270),
    Nombre_Producto VARCHAR(270),
    Valor_Unitario FLOAT,
    Categoria_Producto INT,
    PRIMARY KEY (ID_Producto),
    FOREIGN KEY (Categoria_Producto) REFERENCES Categoria(ID_Categoria)
);

CREATE TABLE Compuesta_Por(
    Numero_Factura INT,
    ID_Prod INT,
    Cantidad_Producto INT,
    PRIMARY KEY (ID_Prod,Numero_Factura),
    FOREIGN KEY (ID_Prod) REFERENCES Producto(ID_Producto),
    FOREIGN KEY (Numero_Factura) REFERENCES Factura(Numero_Factura) 
);


-- Agregando Registros CLIENTES

INSERT INTO Cliente (RUT,Direccion,Nombre_Cliente) VALUES
 ('19077470-8','San Feliciano 1570','Eustaquio Fernandez');

INSERT INTO Cliente (RUT,Direccion,Nombre_Cliente) VALUES
('9159070-0','Arturo Prat 15555','Leonidas Manolo');

INSERT INTO Cliente (RUT,Direccion,Nombre_Cliente) VALUES
('20202020-2','Jose Pedro Alessandri','Javiera Contador');

INSERT INTO Cliente (RUT,Direccion,Nombre_Cliente) VALUES
('1111111-1','Javiera Carrera1111','Audolia Amestica');

INSERT INTO Cliente (RUT,Direccion,Nombre_Cliente) VALUES
('15151515-1','Isidora Goyenechea 1541','Isidora Paz');

-- Agregando Categorias

INSERT INTO Categoria(Descripcion_Categoria,Nombre_Categoria)
VALUES ('Productos Derivados de la leche','LACTEOS');

INSERT INTO Categoria (Descripcion_Categoria,Nombre_Categoria)
VALUES ('Producto Alcoholicos','Alcoholes');

INSERT INTO Categoria (Descripcion_Categoria,Nombre_Categoria)
VALUES ('Productos para compartir', 'Snacks');


--Agregando Productos

INSERT INTO Producto(Nombre_Producto,Descripcion_Producto,Valor_Unitario,Categoria_Producto)
VALUES ('Queso Crema','Producto para ser acompañado con salsa de soja y un snack','100',1);

INSERT INTO Producto(Nombre_Producto,Descripcion_Producto,Valor_Unitario,Categoria_Producto)
VALUES ('Queso Laminado','Producto para ser consumido con pan o pizza','150',1);

INSERT INTO Producto(Nombre_Producto,Descripcion_Producto,Valor_Unitario,Categoria_Producto)
VALUES ('Cerveza Gulden Draak','Cerveza de gran cuerpo y alto grado alcoholico','175',2);

INSERT INTO Producto(Nombre_Producto,Descripcion_Producto,Valor_Unitario,Categoria_Producto)
VALUES ('Vino Caballo Loco','Vino de gran calidad para compartir con amigos','200',2);

INSERT INTO Producto(Nombre_Producto,Descripcion_Producto,Valor_Unitario,Categoria_Producto)
VALUES ('Pisco Alto del Carmen 750 ML 35° alcohol ','Producto para ser acompañado con bebida y unos hielos','180',2);

INSERT INTO Producto(Nombre_Producto,Descripcion_Producto,Valor_Unitario,Categoria_Producto)
VALUES ('Papas fritas marco polo lisa','Papas fritas lisas perfectas para compartir con la familia','100',3);

INSERT INTO Producto(Nombre_Producto,Descripcion_Producto,Valor_Unitario,Categoria_Producto)
VALUES ('Ramitas Saladas','Snack popular muy sabroso y salado','95',3);

INSERT INTO Producto(Nombre_Producto,Descripcion_Producto,Valor_Unitario,Categoria_Producto)
VALUES ('Traga Traga','Snack Dulce y suave de gusto popular','99',3);

-- Agregando Facturas

--Facturas Cliente 1 Folio 1 y 2

INSERT INTO Factura(Fecha_factura,ID_Cliente) VALUES 
('10-06-2020',1);

INSERT INTO Factura(Fecha_factura,ID_Cliente) VALUES 
('11-06-2020',1);

--Facturas Cliente 2 Folios 3,4,5

INSERT INTO Factura(Fecha_factura,ID_Cliente) VALUES 
('10-06-2020',2);
INSERT INTO Factura(Fecha_factura,ID_Cliente) VALUES 
('11-06-2020',2);
INSERT INTO Factura(Fecha_factura,ID_Cliente) VALUES 
('12-06-2020',2);

--Factura Cliente 3 Folio 6

INSERT INTO Factura(Fecha_factura,ID_Cliente) VALUES 
('10-06-2020',3);

--Facturas Cliente 4 Folio 7,8,9,10

INSERT INTO Factura(Fecha_factura,ID_Cliente) VALUES 
('10-06-2020',4);

INSERT INTO Factura(Fecha_factura,ID_Cliente) VALUES 
('10-06-2020',4);

INSERT INTO Factura(Fecha_factura,ID_Cliente) VALUES 
('10-06-2020',4);

INSERT INTO Factura(Fecha_factura,ID_Cliente) VALUES 
('10-06-2020',4);

--Linkeando Facturas y Productos

--Factura 1
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(1,1,3);

INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(2,1,2);

--Factura 2

INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(6,2,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(8,2,5);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(7,2,4);

--Factura 3

INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(1,3,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(5,3,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(4,3,3);

--Factura 4

INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(1,4,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(8,4,3);

--Factura 5

INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(4,5,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(1,5,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(2,5,3);

--Factura 6

INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(1,6,3);

--Factura 7

INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(6,7,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(3,7,3);

--Factura 8

INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(1,8,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(5,8,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(7,8,3);

--Factura 9

INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(1,9,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(8,9,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(4,9,3);
INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(3,9,24);

--Factura 10

INSERT INTO Compuesta_Por(ID_Prod,Numero_Factura,Cantidad_Producto) VALUES
(3,10,150);

-- Consulta 1

SELECT Numero_Factura,SUM(Cantidad_Producto* Valor_Unitario) AS Subtotal
FROM Producto,Compuesta_Por
WHERE ID_Producto = ID_Prod
GROUP BY Compuesta_Por.Numero_Factura
ORDER BY Subtotal DESC
LIMIT 1;


