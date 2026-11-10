SELECT nombre, categoria, stock_actual
FROM   producto
WHERE  categoria = 'PINTURA'
UNION
SELECT nombre, categoria, stock_actual
FROM   producto
WHERE  stock_actual < stock_minimo;