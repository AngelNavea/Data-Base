create database Evaluacion_proyectos;

use Evaluacion_proyectos;

CREATE TABLE tipo_usuarios (
id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre_tipo VARCHAR(50) NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
created_by INT,
updated_by INT,
deleted BOOLEAN DEFAULT FALSE
);

CREATE TABLE usuarios (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
correo VARCHAR(50) UNIQUE,
tipo_usuario_id INT,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
created_by INT,
updated_by INT,
deleted BOOLEAN DEFAULT FALSE
);

CREATE TABLE proyectos (
id_proyectos INT AUTO_INCREMENT PRIMARY KEY,
nombre_preoyecto text NOT NULL,
resumen text not null,
Fecha_postulacion datetime not null,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
created_by INT,
updated_by INT,
deleted BOOLEAN DEFAULT FALSE
);

create table Estados_del_proyecto (
id_estado INT AUTO_INCREMENT PRIMARY KEY,
postulado boolean NOT NULL,
en_evaluación boolean NOT NULL,
aprobado boolean NOT NULL,
rechazado boolean NOT NULL,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
created_by INT,
updated_by INT,
deleted BOOLEAN DEFAULT FALSE
);

create table Evaluaciones(
id_evaluaciones INT auto_increment primary key,
criterios text not null,
puntajes float not null,
observaciones text not null,
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
created_by INT,
updated_by INT,
deleted BOOLEAN DEFAULT FALSE
);

create table nota ()