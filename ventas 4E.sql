-- Crear la base de datos
CREATE DATABASE sistema_ventas_4E;
-- Seleccionar la base de datos para trabajar
USE sistema_ventas_4E;

-- Creamos la tabla tipo_usuario
CREATE TABLE tipo_usuarios (
id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY,
-- Identificador único
nombre_tipo VARCHAR(50) NOT NULL,
-- Tipo de usuario (Admin, Cliente)
-- Campos de auditoría
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
-- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);
-- Tabla para usuarios
CREATE TABLE usuarios (
id_usuario INT AUTO_INCREMENT PRIMARY KEY, -- Id único
nombre VARCHAR(100) NOT NULL, -- Nombre de usuario
correo VARCHAR(100) UNIQUE, -- Correo electrónico único
tipo_usuario_id INT, -- Relación a tipo_usuario
-- Campos de auditoría
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
-- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico

);

ALTER TABLE usuarios -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_usuarios_tipo_usuarios
-- Añade referencia(FK)
FOREIGN KEY (tipo_usuario_id) REFERENCES
tipo_usuarios(id_tipo_usuario);

CREATE TABLE productos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
precio int not null,
stock int not null,
-- Campos de auditoría
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
-- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

CREATE TABLE ventas (
id INT AUTO_INCREMENT PRIMARY KEY,
usuario_id varchar(50) not null,-- Usuario que realizó la venta
Fecha datetime not null,-- Fecha automática de venta
-- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

CREATE TABLE detalle_ventas (
id INT AUTO_INCREMENT PRIMARY KEY,
venta_id int not null,-- Relación a la venta
producto_id int not null,-- Relación al producto
cantidad int not null,-- Cantidad vendida
precio_unitario int not null,
-- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

ALTER TABLE usuarios 
ADD CONSTRAINT fk_usuario_ventas
FOREIGN KEY (ventas_id) REFERENCES
ventas(id_ventas);

ALTER TABLE detalle_ventas 
ADD CONSTRAINT fk_detalle_ventas_ventas
FOREIGN KEY (ventas_id) REFERENCES
ventas(id_ventas);

ALTER TABLE detalle_ventas 
ADD CONSTRAINT fk_detalle_ventas_productos
FOREIGN KEY (productos_id) REFERENCES
productos(id_productos);

