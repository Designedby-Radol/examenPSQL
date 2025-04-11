INSERT INTO clientes (nombre) VALUES 
('raul')
('juan'),
('pepe'),
('maira'),
('uyfahgd'),
('pedro'),
('tania'),
('juanito'),
('elpo jhon'),
('Lazo Rita'), 
('dixon mayas');

INSERT INTO proovedores (nombre) VALUES 
('Samsung'), --1
('Oppo'),    --2
('Xiaomi'),  --3
('Apple');   --4

INSERT INTO productos (nombre, stock, proovedores_id) VALUES
('laptop 2324', 65, 2), 
('samsung a34', 67, 1),
('samsung a24', 67, 1),
('samsung a55', 65, 1),
('samsung s52', 62, 1),
('samsung s24', 63, 1),
('iphone 11 promax', 89, 4),
('iphone 12 promax', 89, 4),
('iphone 14 promax', 89, 4),
('iphone 13 promax', 89, 4),
('procesador red dragon', 7, 3);

INSERT INTO historial (id_cliente,id_producto) VALUES
(1,5),
(6,3),
(5,11),
(4,1),
(3,9),
(2,8),
(7,10),
(8,6),
(9,7),
(10,4),
(11,2);
