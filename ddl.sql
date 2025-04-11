CREATE DATABASE techzone;

CREATE TABLE clientes (
    id serial PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE proovedores(
    id serial PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE productos(
    id serial PRIMARY KEY,
    nombre varchar(100) NOT NULL,
    stock INTEGER,
    proovedores_id INT,
    FOREIGN KEY (proovedores_id) REFERENCES proovedores(id)
);

CREATE TABLE historial(
    id serial PRIMARY KEY,
    id_producto INTEGER,
    id_cliente INTEGER,
    fecha TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES productos(id),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);


