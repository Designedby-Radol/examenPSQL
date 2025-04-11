-- 1️⃣ Listar los productos con stock menor a 5 unidades.
SELECT id, nombre, stock
FROM productos
WHERE stock < 5
ORDER BY stock ASC;

-- 2️⃣ Calcular ventas totales de un mes específico.
SELECT COUNT(*) AS total_ventas
FROM historial
WHERE EXTRACT(MONTH FROM fecha) = 3 
  AND EXTRACT(YEAR FROM fecha) = 2025;

-- 3️⃣ Obtener el cliente con más compras realizadas.
SELECT c.id, c.nombre, COUNT(h.id) AS total_compras
FROM clientes c
JOIN historial h ON c.id = h.id_cliente
GROUP BY c.id, c.nombre
ORDER BY total_compras DESC
LIMIT 1;

-- 4️⃣ Listar los 5 productos más vendidos.
SELECT p.id, p.nombre, COUNT(h.id) AS total_ventas
FROM productos p
JOIN historial h ON p.id = h.id_producto
GROUP BY p.id, p.nombre
ORDER BY total_ventas DESC
LIMIT 5;

-- 5️⃣ Consultar ventas realizadas en un rango de fechas de tres Días y un Mes.
SELECT h.id, p.nombre AS producto, c.nombre AS cliente, h.fecha
FROM historial h
JOIN productos p ON h.id_producto = p.id
JOIN clientes c ON h.id_cliente = c.id
WHERE h.fecha BETWEEN '2025-03-01' AND '2025-03-03'
ORDER BY h.fecha;

-- 6️⃣ Identificar clientes que no han comprado en los últimos 6 meses.
SELECT c.id, c.nombre
FROM clientes c
WHERE c.id NOT IN (
    SELECT DISTINCT id_cliente
    FROM historial
    WHERE fecha < '2024-10-11'
)
ORDER BY c.nombre;