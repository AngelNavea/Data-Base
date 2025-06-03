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
ventas_id int,
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
id_productos INT AUTO_INCREMENT PRIMARY KEY,
nombre_Producto VARCHAR(50) NOT NULL,
precio float not null,
stock int,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
ON UPDATE CURRENT_TIMESTAMP, 
created_by INT,
updated_by INT,
deleted BOOLEAN DEFAULT FALSE
);

CREATE TABLE ventas (
id_ventas INT AUTO_INCREMENT PRIMARY KEY,
Fecha datetime not null,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
created_by INT,
updated_by INT,
deleted BOOLEAN DEFAULT FALSE
);

CREATE TABLE detalle_ventas (
id_detalle_ventas INT AUTO_INCREMENT PRIMARY KEY,
producto_id INT NOT NULL,
cantidad INT NOT NULL,
precio_unitario INT NOT NULL,
ventas_id int,
productos_id int,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
created_by INT,
updated_by INT,
deleted BOOLEAN DEFAULT FALSE
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