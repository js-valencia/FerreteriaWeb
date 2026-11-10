SELECT DISTINCT c.id_cliente, c.nombres
FROM   cliente c
JOIN   venta v ON c.id_cliente = v.id_cliente
WHERE  v.id_empleado = 1
  AND  v.estado <> 'ANULADA'
  AND  c.id_cliente IN (SELECT id_cliente
                        FROM   venta
                        WHERE  id_empleado = 5
                          AND  estado <> 'ANULADA');