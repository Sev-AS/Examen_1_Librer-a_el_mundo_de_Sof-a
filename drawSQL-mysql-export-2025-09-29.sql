CREATE TABLE `libro`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `editorial` VARCHAR(50) NOT NULL,
    `fecha_de_publicacion` DATE NOT NULL,
    `isbn` BIGINT NOT NULL,
    `precio` INT NOT NULL,
    `id_categoria_fk` BIGINT NOT NULL,
    `id_stock_fk` BIGINT NOT NULL
);
ALTER TABLE
    `libro` ADD UNIQUE `libro_isbn_unique`(`isbn`);
CREATE TABLE `autor`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fecha_nacimiento` DATE NOT NULL,
    `nacionalidad` VARCHAR(20) NOT NULL,
    `libro_escrito` VARCHAR(50) NOT NULL,
    `nombre` VARCHAR(50) NOT NULL
);
CREATE TABLE `cliente`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `telefono` VARCHAR(12) NOT NULL,
    `id_ubicacion_fk` BIGINT NOT NULL
);
CREATE TABLE `pedido`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `fecha_pedido` DATETIME NOT NULL,
    `estado_pedido` ENUM('enviado', 'pendiente', 'saliendo') NOT NULL DEFAULT 'pendiente',
    `id_cliente_fk` BIGINT NOT NULL,
    `cantidad_libro_a_comprar_fk` INT NOT NULL,
    `id_transaccion_fk` BIGINT NOT NULL
);
CREATE TABLE `transaccion`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `metodo_pago` INT NOT NULL DEFAULT 'debito',
    `monto_a_pagar` INT NOT NULL,
    `fecha_transaccion` DATETIME NOT NULL,
    `estado_transaccion` ENUM('espera', 'pago', 'rechazado') NOT NULL DEFAULT 'espera'
);
CREATE TABLE `ubicacion`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ciudad` ENUM(
        'barranquilla',
        'bucaramanga',
        'cali',
        'bogota',
        'medellin'
    ) NOT NULL DEFAULT 'bucaramanga',
    `barrio` VARCHAR(50) NOT NULL,
    `direccion` VARCHAR(50) NOT NULL,
    `descripcion` VARCHAR(100) NOT NULL
);
CREATE TABLE `categoria`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `categoria_libro` ENUM('fantasia', 'terror', 'romance') NOT NULL DEFAULT 'fantasia',
    `id_autor_x_libro_fk` BIGINT NOT NULL
);
CREATE TABLE `cantidad_libro_a_comprar`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cantidad` INT NOT NULL,
    `id_libro_fk` BIGINT NOT NULL
);
CREATE TABLE `stock`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cantidad_en_stock` INT NOT NULL
);
CREATE TABLE `autor_x_libro`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_autor_fk` BIGINT NOT NULL,
    `id_libro_fk` BIGINT NOT NULL
);
ALTER TABLE
    `cliente` ADD CONSTRAINT `cliente_id_ubicacion_fk_foreign` FOREIGN KEY(`id_ubicacion_fk`) REFERENCES `ubicacion`(`id`);
ALTER TABLE
    `libro` ADD CONSTRAINT `libro_id_categoria_fk_foreign` FOREIGN KEY(`id_categoria_fk`) REFERENCES `categoria`(`id`);
ALTER TABLE
    `categoria` ADD CONSTRAINT `categoria_id_autor_x_libro_fk_foreign` FOREIGN KEY(`id_autor_x_libro_fk`) REFERENCES `autor_x_libro`(`id`);
ALTER TABLE
    `cantidad_libro_a_comprar` ADD CONSTRAINT `cantidad_libro_a_comprar_id_libro_fk_foreign` FOREIGN KEY(`id_libro_fk`) REFERENCES `libro`(`id`);
ALTER TABLE
    `pedido` ADD CONSTRAINT `pedido_id_cliente_fk_foreign` FOREIGN KEY(`id_cliente_fk`) REFERENCES `cliente`(`id`);
ALTER TABLE
    `autor_x_libro` ADD CONSTRAINT `autor_x_libro_id_libro_fk_foreign` FOREIGN KEY(`id_libro_fk`) REFERENCES `libro`(`id`);
ALTER TABLE
    `pedido` ADD CONSTRAINT `pedido_id_transaccion_fk_foreign` FOREIGN KEY(`id_transaccion_fk`) REFERENCES `transaccion`(`id`);
ALTER TABLE
    `libro` ADD CONSTRAINT `libro_id_stock_fk_foreign` FOREIGN KEY(`id_stock_fk`) REFERENCES `stock`(`id`);
ALTER TABLE
    `autor_x_libro` ADD CONSTRAINT `autor_x_libro_id_autor_fk_foreign` FOREIGN KEY(`id_autor_fk`) REFERENCES `autor`(`id`);
ALTER TABLE
    `pedido` ADD CONSTRAINT `pedido_cantidad_libro_a_comprar_fk_foreign` FOREIGN KEY(`cantidad_libro_a_comprar_fk`) REFERENCES `cantidad_libro_a_comprar`(`id`);