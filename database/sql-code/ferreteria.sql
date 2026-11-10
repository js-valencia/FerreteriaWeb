-- =====================================================================
-- Sistema de gestión para una ferretería
-- Productos, proveedores, compras, clientes, empleados, ventas, pagos y facturas
-- Motor: MySQL 8 / MariaDB 10.5+ (phpMyAdmin)
-- =====================================================================

CREATE DATABASE IF NOT EXISTS ferreteriaweb
    CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ferreteriaweb;

-- ---------------------------------------------------------------------
-- PRODUCTO
-- La categoría es un conjunto fijo de valores (enum en Java -> ENUM en MySQL).
-- Las cantidades son DECIMAL porque se vende por metro, libra, galón, etc.
-- ---------------------------------------------------------------------
CREATE TABLE producto (
    id_producto   INT AUTO_INCREMENT,
    nombre        VARCHAR(100)  NOT NULL,
    marca         VARCHAR(60),
    descripcion   VARCHAR(255),
    categoria     ENUM('HERRAMIENTAS','ELECTRICIDAD','PLOMERIA',
                       'CONSTRUCCION','PINTURA','TORNILLERIA') NOT NULL,
    unidad_medida ENUM('UNIDAD','METRO','LIBRA','KILOGRAMO',
                       'GALON','SACO','CAJA') NOT NULL DEFAULT 'UNIDAD',
    precio_venta  DECIMAL(10,2) NOT NULL,
    stock_actual  DECIMAL(10,2) NOT NULL DEFAULT 0,
    stock_minimo  DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado        ENUM('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',
    PRIMARY KEY (id_producto),
    CONSTRAINT ck_producto_precio       CHECK (precio_venta >= 0),
    CONSTRAINT ck_producto_stock_actual CHECK (stock_actual >= 0),
    CONSTRAINT ck_producto_stock_minimo CHECK (stock_minimo >= 0)
);

-- ---------------------------------------------------------------------
-- PROVEEDOR y relación N:M con PRODUCTO (suministra)
-- ---------------------------------------------------------------------
CREATE TABLE proveedor (
    id_proveedor INT AUTO_INCREMENT,
    ruc          VARCHAR(13)  NOT NULL,
    razon_social VARCHAR(120) NOT NULL,
    direccion    VARCHAR(150),
    telefono     VARCHAR(20),
    correo       VARCHAR(100),
    PRIMARY KEY (id_proveedor),
    UNIQUE (ruc)
);

CREATE TABLE proveedor_producto (
    id_proveedor INT NOT NULL,
    id_producto  INT NOT NULL,
    PRIMARY KEY (id_proveedor, id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) ON DELETE CASCADE,
    FOREIGN KEY (id_producto)  REFERENCES producto(id_producto)   ON DELETE CASCADE
);

-- ---------------------------------------------------------------------
-- COMPRAS A PROVEEDORES
-- ---------------------------------------------------------------------
CREATE TABLE compra (
    id_compra                INT AUTO_INCREMENT,
    fecha                    DATE NOT NULL,
    numero_factura_proveedor VARCHAR(20),
    subtotal                 DECIMAL(10,2) NOT NULL,
    impuesto                 DECIMAL(10,2) NOT NULL DEFAULT 0,
    total                    DECIMAL(10,2) NOT NULL,
    id_proveedor             INT NOT NULL,
    PRIMARY KEY (id_compra),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor) ON DELETE RESTRICT,
    CONSTRAINT ck_compra_valores CHECK (subtotal >= 0 AND impuesto >= 0),
    CONSTRAINT ck_compra_total   CHECK (total = subtotal + impuesto)
);

-- El costo unitario se guarda en cada compra: es el costo histórico.
CREATE TABLE detalle_compra (
    id_compra      INT NOT NULL,
    id_producto    INT NOT NULL,
    cantidad       DECIMAL(10,2) NOT NULL,
    costo_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_compra, id_producto),
    FOREIGN KEY (id_compra)   REFERENCES compra(id_compra)     ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE RESTRICT,
    CONSTRAINT ck_detcompra_cantidad CHECK (cantidad > 0),
    CONSTRAINT ck_detcompra_costo    CHECK (costo_unitario >= 0)
);

-- ---------------------------------------------------------------------
-- CLIENTE y EMPLEADO
-- ---------------------------------------------------------------------
CREATE TABLE cliente (
    id_cliente     INT AUTO_INCREMENT,
    identificacion VARCHAR(13)  NOT NULL,          -- cédula o RUC
    nombres        VARCHAR(120) NOT NULL,          -- nombres o razón social
    direccion      VARCHAR(150),
    telefono       VARCHAR(20),
    correo         VARCHAR(100),
    limite_credito DECIMAL(10,2) NOT NULL DEFAULT 0,  -- 0 = no se vende a crédito
    PRIMARY KEY (id_cliente),
    UNIQUE (identificacion),
    CONSTRAINT ck_cliente_credito CHECK (limite_credito >= 0)
);

CREATE TABLE empleado (
    id_empleado    INT AUTO_INCREMENT,
    identificacion VARCHAR(13) NOT NULL,
    nombres        VARCHAR(80) NOT NULL,
    apellidos      VARCHAR(80) NOT NULL,
    cargo          ENUM('VENDEDOR','CAJERO','BODEGUERO','ADMINISTRADOR') NOT NULL,
    telefono       VARCHAR(20),
    PRIMARY KEY (id_empleado),
    UNIQUE (identificacion)
);

-- ---------------------------------------------------------------------
-- VENTA y DETALLE_VENTA
-- No se pueden borrar clientes ni empleados que tengan ventas (RESTRICT).
-- ---------------------------------------------------------------------
CREATE TABLE venta (
    id_venta            INT AUTO_INCREMENT,
    fecha_hora          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    subtotal            DECIMAL(10,2) NOT NULL,
    descuento           DECIMAL(10,2) NOT NULL DEFAULT 0,
    porcentaje_impuesto DECIMAL(5,2)  NOT NULL DEFAULT 15,
    monto_impuesto      DECIMAL(10,2) NOT NULL DEFAULT 0,
    total               DECIMAL(10,2) NOT NULL,
    estado              ENUM('PENDIENTE_DE_PAGO','PAGADA','ANULADA')
                        NOT NULL DEFAULT 'PENDIENTE_DE_PAGO',
    id_cliente          INT NOT NULL,
    id_empleado         INT NOT NULL,
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_cliente)  REFERENCES cliente(id_cliente)   ON DELETE RESTRICT,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado) ON DELETE RESTRICT,
    CONSTRAINT ck_venta_subtotal  CHECK (subtotal >= 0),
    CONSTRAINT ck_venta_descuento CHECK (descuento >= 0 AND descuento <= subtotal),
    CONSTRAINT ck_venta_porc      CHECK (porcentaje_impuesto BETWEEN 0 AND 100),
    CONSTRAINT ck_venta_impuesto  CHECK (monto_impuesto >= 0),
    CONSTRAINT ck_venta_total     CHECK (total = subtotal - descuento + monto_impuesto)
);

-- precio_unitario conserva el precio histórico aunque producto.precio_venta cambie.
CREATE TABLE detalle_venta (
    id_venta        INT NOT NULL,
    id_producto     INT NOT NULL,
    cantidad        DECIMAL(10,2) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_venta, id_producto),
    FOREIGN KEY (id_venta)    REFERENCES venta(id_venta)       ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON DELETE RESTRICT,
    CONSTRAINT ck_detventa_cantidad CHECK (cantidad > 0),
    CONSTRAINT ck_detventa_precio   CHECK (precio_unitario >= 0)
);

-- ---------------------------------------------------------------------
-- PAGO: una venta puede pagarse en uno o varios abonos
-- ---------------------------------------------------------------------
CREATE TABLE pago (
    id_pago     INT AUTO_INCREMENT,
    fecha       DATE NOT NULL,
    monto       DECIMAL(10,2) NOT NULL,
    forma_pago  ENUM('EFECTIVO','TRANSFERENCIA','TARJETA','CHEQUE') NOT NULL,
    referencia  VARCHAR(40),                      -- comprobante, opcional
    id_venta    INT NOT NULL,
    id_empleado INT NOT NULL,                     -- empleado que recibe el pago
    PRIMARY KEY (id_pago),
    FOREIGN KEY (id_venta)    REFERENCES venta(id_venta)       ON DELETE RESTRICT,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado) ON DELETE RESTRICT,
    CONSTRAINT ck_pago_monto CHECK (monto > 0)
);

-- ---------------------------------------------------------------------
-- FACTURA: una venta genera como máximo una factura (UNIQUE en id_venta).
-- subtotal de la factura = subtotal de la venta menos el descuento.
-- ---------------------------------------------------------------------
CREATE TABLE factura (
    id_factura     INT AUTO_INCREMENT,
    numero_factura VARCHAR(17) NOT NULL,          -- formato 001-001-000000123
    fecha_emision  DATE NOT NULL,
    subtotal       DECIMAL(10,2) NOT NULL,
    impuesto       DECIMAL(10,2) NOT NULL DEFAULT 0,
    total          DECIMAL(10,2) NOT NULL,
    estado         ENUM('EMITIDA','ANULADA') NOT NULL DEFAULT 'EMITIDA',
    id_venta       INT NOT NULL,
    PRIMARY KEY (id_factura),
    UNIQUE (numero_factura),
    UNIQUE (id_venta),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta) ON DELETE RESTRICT,
    CONSTRAINT ck_factura_numero  CHECK (numero_factura REGEXP '^[0-9]{3}-[0-9]{3}-[0-9]{9}$'),
    CONSTRAINT ck_factura_valores CHECK (subtotal >= 0 AND impuesto >= 0),
    CONSTRAINT ck_factura_total   CHECK (total = subtotal + impuesto)
);

-- ---------------------------------------------------------------------
-- Cliente genérico para ventas sin datos del comprador
-- ---------------------------------------------------------------------
INSERT INTO cliente (identificacion, nombres, limite_credito)
VALUES ('9999999999999', 'CONSUMIDOR FINAL', 0);