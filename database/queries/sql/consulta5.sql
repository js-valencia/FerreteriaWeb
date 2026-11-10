SELECT c.id_cliente, c.nombres
FROM   cliente c
JOIN   venta v          ON c.id_cliente = v.id_cliente
JOIN   detalle_venta dv ON v.id_venta   = dv.id_venta
JOIN   producto p       ON dv.id_producto = p.id_producto
WHERE  p.categoria = 'PINTURA'
  AND  v.estado <> 'ANULADA'
GROUP BY c.id_cliente, c.nombres
HAVING COUNT(DISTINCT p.id_producto) = (SELECT COUNT(*)
                                        FROM   producto
                                        WHERE  categoria = 'PINTURA');