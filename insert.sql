
INSERT INTO clientes (nombre) VALUES
('María González'),
('Juan Pérez'),
('Carlos Rodríguez'),
('Ana Martínez'),
('Luis Sánchez'),
('Laura Díaz'),
('Roberto Fernández'),
('Carmen López'),
('Miguel Torres'),
('Sofia Ramírez');

INSERT INTO proovedores (nombre) VALUES
('TechSupply Inc.'),
('Electro Componentes'),
('Innovación Digital'),
('Mayorista Tecnológico'),
('Global Electronics');

INSERT INTO productos (nombre, stock, proovedores_id) VALUES
('Laptop Dell XPS 13', 10, 1),
('Monitor LG 27"', 15, 2),
('Teclado Mecanico Logitech', 8, 3),
('Mouse Inalámbrico', 4, 3),
('Disco Duro SSD 1TB', 12, 1),
('Memoria RAM 16GB', 3, 4),
('Tarjeta Grafica NVIDIA', 2, 5),
('Audífonos Bluetooth Sony', 20, 2),
('Tablet Samsung', 7, 5),
('Cable HDMI 2m', 25, 4),
('WebCam HD', 6, 1),
('Router WiFi', 9, 3),
('Cargador USB-C', 2, 2),
('Impresora Laser', 5, 5),
('Altavoces Bluetooth', 8, 3);

INSERT INTO historial (id_producto, id_cliente, fecha) VALUES
(1, 3, '2025-03-15 10:30:00'),
(5, 2, '2025-03-20 14:45:00'),
(8, 5, '2025-03-25 16:20:00'),
(3, 1, '2025-03-02 09:15:00'),
(10, 8, '2025-02-18 11:30:00'),
(4, 6, '2025-02-22 13:45:00'),
(7, 4, '2025-02-10 15:50:00'),
(2, 9, '2025-02-05 17:20:00'),
(6, 7, '2025-01-28 10:10:00'),
(9, 10, '2025-01-15 12:30:00'),
(1, 2, '2025-01-10 14:15:00'),
(3, 5, '2025-01-05 16:40:00'),
(2, 1, '2024-12-20 09:30:00'),
(5, 3, '2024-12-15 11:45:00'),
(8, 7, '2024-12-10 13:20:00'),
(4, 9, '2024-11-28 15:35:00'),
(6, 8, '2024-11-15 17:50:00'),
(1, 6, '2024-11-05 10:25:00'),
(9, 4, '2024-10-25 12:40:00'),
(7, 2, '2024-10-16 14:55:00'),
(10, 5, '2024-09-30 16:10:00'),
(3, 10, '2024-09-15 09:25:00'),
(5, 1, '2024-08-28 11:40:00'),
(2, 3, '2024-08-10 13:05:00'),
(4, 7, '2024-07-25 15:30:00'),
(8, 9, '2024-07-15 17:45:00'),
(6, 4, '2024-06-30 10:15:00'),
(1, 8, '2024-06-20 12:30:00'),
(1, 5, '2025-03-10 14:20:00'),
(1, 9, '2025-02-28 16:35:00'),
(3, 2, '2025-01-25 09:50:00'),
(3, 4, '2024-12-05 11:15:00'),
(5, 6, '2024-11-20 13:30:00'),
(5, 8, '2023-5-10 15:45:00'),
(8, 1, '2025-03-05 18:00:00'),
(8, 3, '2025-02-15 10:20:00');