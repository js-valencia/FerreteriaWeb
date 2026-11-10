# Consultas de álgebra relacional

Este documento presenta una serie de consultas sobre el modelo relacional de la ferretería. Cada una incluye la intención, la expresión relacional y el resultado esperado.

---

## 1. Selección, proyección y unión (σ, π, ∪)

### Descripción
Obtener el nombre, la categoría y el stock actual de los productos que son de la categoría PINTURA o que tienen el stock por debajo del mínimo.

### Expresión relacional

```text
S1 = π nombre, categoria, stock_actual (
      σ categoria = "PINTURA" (producto)
     )
     ∪
     π nombre, categoria, stock_actual (
      σ stock_actual < stock_minimo (producto)
     )
```

### Resultado esperado
Devuelve cuatro productos:
- pintura látex blanca
- brocha de 3 pulgadas
- destornillador plano de 6"
- cemento gris de 50 kg

> La pintura látex blanca cumple ambas condiciones, pero aparece una sola vez porque la unión elimina duplicados.

---

## 2. Reunión natural e intersección (⋈, ∩)

### Descripción
Obtener el código y el nombre de los clientes que han comprado tanto con el empleado 1 (Ana López) como con el empleado 5 (Diego Herrera), excluyendo las ventas anuladas.

### Expresión relacional

```text
S2 = π id_cliente, nombres (
      cliente ⋈ (σ id_empleado = 1 ∧ estado ≠ "ANULADA" (venta))
     )
     ∩
     π id_cliente, nombres (
      cliente ⋈ (σ id_empleado = 5 ∧ estado ≠ "ANULADA" (venta))
     )
```

### Resultado esperado
Devuelve dos clientes:
- María Gómez Ordóñez
- Constructora Vivienda Sur S.A.

Estos son los únicos clientes atendidos por ambos empleados.

---

## 3. Producto cartesiano y renombrar (×, ρ)

### Descripción
Obtener el nombre de los productos que suministra el proveedor de código 5.

### Expresión relacional

```text
S3 = π nombre (
      σ id_producto = id_prod (
        producto × ρ id_producto → id_prod (
          σ id_proveedor = 5 (proveedor_producto)
        )
      )
     )
```

### Resultado esperado
Devuelve dos productos:
- pintura látex blanca
- brocha de 3 pulgadas

> El producto cartesiano combina todas las filas de las dos tablas y la selección conserva solo las coincidencias por código de producto.

---

## 4. Diferencia (−)

### Descripción
Obtener el código y el nombre de los productos que nunca se han vendido.

### Expresión relacional

```text
S4 = π id_producto, nombre (producto)
     −
     π id_producto, nombre (producto ⋈ detalle_venta)
```

### Resultado esperado
Devuelve un solo producto:
- interruptor simple (código 9)

Este producto se encuentra en el inventario, pero no aparece en ninguna venta registrada.

---

## 5. División (÷)

### Descripción
Obtener el nombre de los clientes que han comprado todos los productos de la categoría PINTURA (la pintura y la brocha), sin contar las ventas anuladas.

### Expresión relacional

```text
S5a = π id_cliente, id_producto (
       σ estado ≠ "ANULADA" (venta) ⋈ detalle_venta
      )
      ÷
      π id_producto (
       σ categoria = "PINTURA" (producto)
      )

S5 = π nombres (
      cliente ⋈ S5a
     )
```

### Resultado esperado
Devuelve dos clientes:
- María Gómez Ordóñez
- Constructora Vivienda Sur S.A.

> La división se interpreta como: “clientes que compraron todos los productos de pintura existentes”. Es decir, cada cliente ha adquirido cada uno de los productos de esa categoría.

---

## Resumen

Las consultas anteriores muestran el uso de operaciones fundamentales del álgebra relacional:
- selección (σ)
- proyección (π)
- unión (∪)
- intersección (∩)
- reunión natural (⋈)
- producto cartesiano (×)
- renombrado (ρ)
- diferencia (−)
- división (÷)

Estas operaciones permiten responder preguntas de negocio sobre inventarios, ventas, clientes y proveedores de forma estructurada y precisa.