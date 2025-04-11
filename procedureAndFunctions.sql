-- 1. Procedimiento para validar que el cliente exista
CREATE OR REPLACE PROCEDURE validar_cliente(
    p_cliente_id INT,
    OUT v_cliente_existe BOOLEAN
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT EXISTS(SELECT 1 FROM clientes WHERE id = p_cliente_id) INTO v_cliente_existe;
    
    IF NOT v_cliente_existe THEN
        RAISE EXCEPTION 'Cliente con ID % no existe en la base de datos', p_cliente_id;
    END IF;
END;
$$;
CALL validar_cliente(3,NULL);

-- 2. Procedimiento para verificar que el stock sea suficiente
CREATE OR REPLACE PROCEDURE verificar_stock(
    p_producto_id INT,
    p_cantidad INT,
    OUT v_stock_suficiente BOOLEAN
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_stock_actual INT;
    
    v_producto_existe BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM productos WHERE id = p_producto_id) INTO v_producto_existe;
    
    IF NOT v_producto_existe THEN
        RAISE EXCEPTION 'Producto con ID % no existe en la base de datos', p_producto_id;
    END IF;
    
    SELECT stock INTO v_stock_actual FROM productos WHERE id = p_producto_id;
    
    IF v_stock_actual < p_cantidad THEN
        v_stock_suficiente := FALSE;
        RAISE NOTICE 'No hay suficiente stock para el producto ID %. Stock actual: %, Cantidad solicitada: %', 
                    p_producto_id, v_stock_actual, p_cantidad;
    ELSE
        v_stock_suficiente := TRUE;
    END IF;
END;
$$;
CALL verificar_stock(4,34,NULL);

-- 3. Procedimiento para registrar la venta una vez validados los datos
CREATE OR REPLACE PROCEDURE registrar_venta_historial(
    p_producto_id INT,
    p_cliente_id INT,
    p_cantidad INT
)
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO historial (id_producto, id_cliente, fecha)
    VALUES (p_producto_id, p_cliente_id, CURRENT_TIMESTAMP);
    UPDATE productos
    SET stock = stock - p_cantidad
    WHERE id = p_producto_id;
    
    RAISE NOTICE 'Venta registrada correctamente. Producto ID: %, Cliente ID: %, Cantidad: %', 
                p_producto_id, p_cliente_id, p_cantidad;
END;
$$;
CALL registrar_venta_historial(1,2,5);

-- 4. Procedimiento principal que integra los anteriores
CREATE OR REPLACE PROCEDURE procesar_venta(
    p_producto_id INT,
    p_cliente_id INT,
    p_cantidad INT DEFAULT 1
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_cliente_existe BOOLEAN;
    v_stock_suficiente BOOLEAN;
BEGIN

    CALL validar_cliente(p_cliente_id, v_cliente_existe);
    CALL verificar_stock(p_producto_id, p_cantidad, v_stock_suficiente);

    IF v_stock_suficiente THEN
        CALL registrar_venta_historial(p_producto_id, p_cliente_id, p_cantidad);
    ELSE
        RAISE EXCEPTION 'No se puede procesar la venta debido a stock insuficiente';
    END IF;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error al procesar la venta: %', SQLERRM;
        ROLLBACK;
END;
$$;

CALL procesar_venta(1, 3, 2);  