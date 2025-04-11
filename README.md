# Proyecto: Base de Datos Campuslands

## Descripción del Proyecto

La tienda TechZone es un negocio dedicado a la venta de productos tecnológicos, desde laptops y
teléfonos hasta accesorios y componentes electrónicos. Con el crecimiento del comercio digital y
la alta demanda de dispositivos electrónicos, la empresa ha notado la necesidad de mejorar la
gestión de su inventario y ventas. Hasta ahora, han llevado el control de productos y
transacciones en hojas de cálculo, lo que ha generado problemas como:
🔹 Errores en el control de stock: No saben con certeza qué productos están por agotarse, lo
que ha llevado a problemas de desabastecimiento o acumulación innecesaria de productos en
bodega.
🔹 Dificultades en el seguimiento de ventas: No cuentan con un sistema eficiente para analizar
qué productos se venden más, en qué períodos del año hay mayor demanda o quiénes son sus
clientes más frecuentes.
🔹 Gestión manual de proveedores: Los pedidos a proveedores se han realizado sin un historial
claro de compras y ventas, dificultando la negociación de mejores precios y la planificación del
abastecimiento.
🔹 Falta de automatización en el registro de compras: Cada vez que un cliente realiza una
compra, los empleados deben registrar manualmente los productos vendidos y actualizar el
inventario, lo que consume tiempo y es propenso a errores.
Para solucionar estos problemas, TechZone ha decidido implementar una base de datos en
PostgreSQL que le permita gestionar de manera eficiente su inventario, las ventas, los clientes y
los proveedores.

---

## Requisitos del Sistema

Para ejecutar correctamente este proyecto, asegúrate de contar con los siguientes requisitos:

- PSQL.
- Un entorno de desarrollo con acceso a una terminal SQL.

---

## Instalación y Configuración

Para desplegar la base de datos, sigue estos pasos:

### 1. Crear la Base de Datos y Tablas:

Ejecuta el archivo `db.sql` en PSQL para generar la estructura de la base de datos.

### 2. Cargar Datos Iniciales:

Ejecuta el archivo `insert.sql` para poblar la base de datos con datos de prueba.

### 3. Ejecutar Procedimientos y Funciones:

Para cargar las funciones y procedimientos almacenados, ejecuta los archivos `queries.sql` y `procedureAndFunctions.sql`.

---

## Estructura de la Base de Datos

La base de datos **techzone** está compuesta por las siguientes tablas:

- **clientes**: Almacena información sobre los clientes inscritos.
- **productos**: Registra productos y sus proovedores asignados.
- **proovedores**: Contiene la info de los diferentes proovedores.
- **historial**: Lista la fecha el cliente y el producto que se compro.
---

## Ejemplos de Consultas

Algunas consultas útiles que se pueden ejecutar en la base de datos:

### Obtener la lista de campers inscritos:

```sql
SELECT COUNT(*) AS total_ventas
FROM historial
WHERE EXTRACT(MONTH FROM fecha) = 3 
  AND EXTRACT(YEAR FROM fecha) = 2025;
```

### Consultar las evaluaciones de un camper:

```sql
SELECT h.id, p.nombre AS producto, c.nombre AS cliente, h.fecha
FROM historial h
JOIN productos p ON h.id_producto = p.id
JOIN clientes c ON h.id_cliente = c.id
WHERE h.fecha BETWEEN '2025-03-01' AND '2025-03-03'
ORDER BY h.fecha;
```

### Verificar disponibilidad de un área en un horario específico:

```sql
SELECT p.id, p.nombre, COUNT(h.id) AS total_ventas
FROM productos p
JOIN historial h ON p.id = h.id_producto
GROUP BY p.id, p.nombre
ORDER BY total_ventas DESC
LIMIT 5;
```

---

## Licencia

Este proyecto está bajo la **Licencia MIT**.

---

## 📩 Contacto

Para dudas o soporte, puedes contactarme a través de **[raulsantiagoramirez1@gmail.com](mailto:raulsantiagoramirez1@gmail.com)**.

