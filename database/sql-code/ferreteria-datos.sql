-- Datos de ejemplo para la base ferreteriaweb
USE ferreteriaweb;

INSERT INTO cliente (id_cliente, identificacion, nombres, direccion, telefono, correo, limite_credito) VALUES
  (2, '1104567891', 'Juan Pérez Armijo', 'Av. Universitaria y Mercadillo, Loja', '0991234501', 'jperez@correo-ejemplo.com', 0),
  (3, '1102345678', 'María Gómez Ordóñez', 'Calle Bolívar 12-45, Loja', '0987654302', 'mgomez@correo-ejemplo.com', 150),
  (4, '1190456789001', 'Constructora Vivienda Sur S.A.', 'Av. Pío Jaramillo, Loja', '072570123', 'compras@viviendasur-ejemplo.com', 2000),
  (5, '1103456789', 'Carlos Ramírez Soto', 'Barrio San Pedro, Catamayo', '0984567803', NULL, 0),
  (6, '1103567890001', 'Taller Mecánico Rojas', 'Av. Eugenio Espejo, Loja', '072611234', 'taller.rojas@correo-ejemplo.com', 500),
  (7, '1105678901', 'Lucía Torres Vega', 'Calle Sucre 8-20, Loja', '0991122304', 'ltorres@correo-ejemplo.com', 100);

INSERT INTO empleado (id_empleado, identificacion, nombres, apellidos, cargo, telefono) VALUES
  (1, '1100123456', 'Ana', 'López Cueva', 'VENDEDOR', '0991000101'),
  (2, '1100234567', 'Pedro', 'Castillo Ruiz', 'CAJERO', '0991000102'),
  (3, '1100345678', 'Luis', 'Mora Jaramillo', 'BODEGUERO', '0991000103'),
  (4, '1100456789', 'Sofía', 'Vega Alvarado', 'ADMINISTRADOR', '0991000104'),
  (5, '1100567890', 'Diego', 'Herrera Pineda', 'VENDEDOR', '0991000105');

INSERT INTO producto (id_producto, nombre, marca, descripcion, categoria, unidad_medida, precio_venta, stock_actual, stock_minimo, estado) VALUES
  (1, 'Martillo de uña 16 oz', 'Truper', 'Mango de fibra de vidrio', 'HERRAMIENTAS', 'UNIDAD', 12.50, 18, 10, 'ACTIVO'),
  (2, 'Destornillador plano 6"', 'Stanley', 'Punta imantada', 'HERRAMIENTAS', 'UNIDAD', 4.75, 8, 12, 'ACTIVO'),
  (3, 'Cable eléctrico #12', 'Electrocables', 'Cobre, aislamiento THHN', 'ELECTRICIDAD', 'METRO', 1.20, 140, 50, 'ACTIVO'),
  (4, 'Tubo PVC 1/2" roscable', 'Plastigama', 'Tubo de 6 metros para agua fría', 'PLOMERIA', 'UNIDAD', 3.80, 42, 15, 'ACTIVO'),
  (5, 'Cemento gris 50 kg', 'Holcim', 'Uso general en construcción', 'CONSTRUCCION', 'SACO', 8.90, 24, 30, 'ACTIVO'),
  (6, 'Pintura látex blanca', 'Pintuco', 'Interior y exterior, acabado mate', 'PINTURA', 'GALON', 22.00, 7, 10, 'ACTIVO'),
  (7, 'Tornillo autorroscante 1"', 'Fischer', 'Caja suelta, se vende por libra', 'TORNILLERIA', 'LIBRA', 2.50, 62, 20, 'ACTIVO'),
  (8, 'Taladro percutor 1/2"', 'Bosch', '650 W, velocidad variable', 'HERRAMIENTAS', 'UNIDAD', 68.00, 3, 3, 'ACTIVO'),
  (9, 'Interruptor simple', 'Legrand', 'Para caja rectangular', 'ELECTRICIDAD', 'UNIDAD', 1.75, 38, 20, 'ACTIVO'),
  (10, 'Brocha de 3 pulgadas', 'Tumi', 'Cerda sintética', 'PINTURA', 'UNIDAD', 3.25, 30, 10, 'ACTIVO');

INSERT INTO proveedor (id_proveedor, ruc, razon_social, direccion, telefono, correo) VALUES
  (1, '1790012345001', 'Distribuidora Ferretera Andina S.A.', 'Av. Orillas del Zamora, Loja', '072570001', 'ventas@andina-ejemplo.com'),
  (2, '1190023456001', 'Electro Sur Cía. Ltda.', 'Calle Lourdes 14-22, Loja', '072570002', 'pedidos@electrosur-ejemplo.com'),
  (3, '0991234567001', 'Plásticos del Pacífico S.A.', 'Km 8 vía a Daule, Guayaquil', '042500003', 'comercial@plasticospacifico-ejemplo.com'),
  (4, '1190034567001', 'Cementos y Materiales Loja', 'Zona industrial, Loja', '072570004', 'ventas@cemloja-ejemplo.com'),
  (5, '1790045678001', 'Pinturas y Acabados del Ecuador S.A.', 'Av. 10 de Agosto, Quito', '022500005', 'clientes@pinturasec-ejemplo.com');

INSERT INTO proveedor_producto (id_proveedor, id_producto) VALUES
  (1, 1),
  (1, 2),
  (1, 8),
  (2, 3),
  (2, 9),
  (3, 4),
  (4, 5),
  (5, 6),
  (5, 10),
  (1, 7);

INSERT INTO compra (id_compra, fecha, numero_factura_proveedor, subtotal, impuesto, total, id_proveedor) VALUES
  (1, '2026-09-02', '001-002-000004512', 287.00, 43.05, 330.05, 1),
  (2, '2026-09-05', '002-001-000001877', 280.00, 42.00, 322.00, 2),
  (3, '2026-09-10', '001-001-000009031', 144.00, 21.60, 165.60, 3),
  (4, '2026-09-15', '001-003-000002250', 488.00, 73.20, 561.20, 4),
  (5, '2026-10-01', '003-001-000004405', 376.00, 56.40, 432.40, 5);

INSERT INTO detalle_compra (id_compra, id_producto, cantidad, costo_unitario) VALUES
  (1, 1, 25, 8.00),
  (1, 2, 30, 2.90),
  (2, 3, 300, 0.80),
  (2, 9, 40, 1.00),
  (3, 4, 60, 2.40),
  (4, 5, 80, 6.10),
  (5, 6, 20, 15.00),
  (5, 10, 40, 1.90);

INSERT INTO venta (id_venta, fecha_hora, subtotal, descuento, porcentaje_impuesto, monto_impuesto, total, estado, id_cliente, id_empleado) VALUES
  (1, '2026-10-05 10:15:00', 32.50, 0, 15.00, 4.88, 37.38, 'PAGADA', 2, 1),
  (2, '2026-10-07 11:30:00', 342.25, 10.00, 15.00, 49.84, 382.09, 'PENDIENTE_DE_PAGO', 4, 5),
  (3, '2026-10-08 09:40:00', 22.00, 0, 15.00, 3.30, 25.30, 'PAGADA', 1, 1),
  (4, '2026-10-12 16:05:00', 94.75, 0, 15.00, 14.21, 108.96, 'PENDIENTE_DE_PAGO', 6, 5),
  (5, '2026-10-15 10:20:00', 50.50, 0, 15.00, 7.58, 58.08, 'PAGADA', 3, 1),
  (6, '2026-10-20 12:45:00', 31.50, 0, 15.00, 4.73, 36.23, 'ANULADA', 7, 5),
  (7, '2026-10-22 08:55:00', 387.00, 0, 15.00, 58.05, 445.05, 'PENDIENTE_DE_PAGO', 4, 1),
  (8, '2026-10-27 15:30:00', 57.80, 0, 15.00, 8.67, 66.47, 'PAGADA', 5, 5),
  (9, '2026-10-30 10:00:00', 58.40, 0, 15.00, 8.76, 67.16, 'PAGADA', 2, 1),
  (10, '2026-10-31 11:10:00', 22.00, 0, 15.00, 3.30, 25.30, 'PAGADA', 3, 5);

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES
  (1, 1, 2, 12.50),
  (1, 7, 3, 2.50),
  (2, 5, 20, 8.90),
  (2, 6, 5, 22.00),
  (2, 10, 5, 3.25),
  (2, 4, 10, 3.80),
  (3, 3, 12, 1.20),
  (3, 4, 2, 3.80),
  (4, 8, 1, 68.00),
  (4, 7, 5, 2.50),
  (4, 2, 3, 4.75),
  (5, 6, 2, 22.00),
  (5, 10, 2, 3.25),
  (6, 2, 4, 4.75),
  (6, 1, 1, 12.50),
  (7, 5, 30, 8.90),
  (7, 3, 100, 1.20),
  (8, 3, 25, 1.20),
  (8, 7, 4, 2.50),
  (8, 5, 2, 8.90),
  (9, 5, 4, 8.90),
  (9, 4, 6, 3.80),
  (10, 6, 1, 22.00);

INSERT INTO pago (fecha, monto, forma_pago, referencia, id_venta, id_empleado) VALUES
  ('2026-10-05', 37.38, 'EFECTIVO', NULL, 1, 2),
  ('2026-10-07', 150.00, 'TRANSFERENCIA', 'TRF-20261007-01', 2, 2),
  ('2026-10-15', 100.00, 'CHEQUE', 'CHQ-004512', 2, 2),
  ('2026-10-08', 25.30, 'EFECTIVO', NULL, 3, 2),
  ('2026-10-12', 50.00, 'EFECTIVO', NULL, 4, 2),
  ('2026-10-15', 58.08, 'TARJETA', 'TRX-884521', 5, 2),
  ('2026-10-27', 66.47, 'EFECTIVO', NULL, 8, 2),
  ('2026-10-30', 40.00, 'EFECTIVO', NULL, 9, 2),
  ('2026-10-30', 27.16, 'EFECTIVO', NULL, 9, 2),
  ('2026-10-31', 25.30, 'EFECTIVO', NULL, 10, 2);

INSERT INTO factura (id_factura, numero_factura, fecha_emision, subtotal, impuesto, total, estado, id_venta) VALUES
  (1, '001-001-000000101', '2026-10-07', 332.25, 49.84, 382.09, 'EMITIDA', 2),
  (2, '001-001-000000102', '2026-10-12', 94.75, 14.21, 108.96, 'EMITIDA', 4),
  (3, '001-001-000000103', '2026-10-22', 387.00, 58.05, 445.05, 'EMITIDA', 7),
  (4, '001-001-000000104', '2026-10-15', 50.50, 7.58, 58.08, 'EMITIDA', 5),
  (5, '001-001-000000105', '2026-10-20', 31.50, 4.73, 36.23, 'ANULADA', 6);