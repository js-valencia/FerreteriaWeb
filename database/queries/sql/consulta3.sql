SELECT p.nombre
FROM   producto p, proveedor_producto pp   -- la coma es el producto cartesiano
WHERE  pp.id_proveedor = 5
  AND  p.id_producto = pp.id_producto;     -- deja solo las filas que coinciden