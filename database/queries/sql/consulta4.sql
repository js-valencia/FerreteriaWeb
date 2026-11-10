SELECT id_producto, nombre
FROM   producto
WHERE  id_producto NOT IN (SELECT id_producto FROM detalle_venta);