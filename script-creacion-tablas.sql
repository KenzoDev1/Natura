CREATE TABLE genero(
    id_genero TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    nombre VARCHAR(50) NOT NULL UNIQUE COMMENT 'Nombre genero'
) COMMENT 'Tabla para almacenar los generos';

CREATE TABLE ciudad(
    id_ciudad INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    nombre VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nombre ciudad'
) COMMENT 'Tabla para almacenar las ciudades';

CREATE TABLE frecuencia(
    id_frecuencia TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    descripcion VARCHAR(50) NOT NULL UNIQUE COMMENT 'Descripcion frecuencia'
)COMMENT 'Tabla para almacenar las descripciones de la frecuencia de compras';

CREATE TABLE cliente(  
    id_cliente INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    pnombre VARCHAR(25) NOT NULL,
    snombre VARCHAR(25),
    appaterno VARCHAR(25) NOT NULL,
    apmaterno VARCHAR(25),
    id_genero TINYINT UNSIGNED NOT NULL COMMENT 'Foreign Key genero',
    id_ciudad INT UNSIGNED NOT NULL COMMENT 'Foreign Key ciudad',
    id_frecuencia TINYINT UNSIGNED NOT NULL COMMENT 'Foreign Key frecuencia',
    ultima_compra DATE NOT NULL,
    monto_total_gastado DECIMAL(10,2) NOT NULL,
    nivel_satisfaccion INT UNSIGNED NOT NULL,

    CONSTRAINT fk_cliente_genero
    FOREIGN KEY (id_genero) REFERENCES genero(id_genero)
    ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_cliente_ciudad
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
    ON DELETE RESTRICT ON UPDATE CASCADE,

    CONSTRAINT fk_cliente_frecuencia
    FOREIGN KEY (id_frecuencia) REFERENCES frecuencia(id_frecuencia)
    ON DELETE RESTRICT ON UPDATE CASCADE 
) COMMENT 'Tabla para almacenar los clientes';

CREATE TABLE metodo_pago (
    id_metodo_pago TINYINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    descripcion VARCHAR(50) NOT NULL UNIQUE COMMENT 'Descripcion metodo de pago'
) COMMENT 'Tabla para almacenar metodos de pago';

CREATE TABLE categoria (
    id_categoria INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    nombre VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nombre de la categoria del producto'
) COMMENT 'Tabla para almacenar categorias de productos';

CREATE TABLE comuna (
    id_comuna INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    nombre VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nombre de la comuna'
) COMMENT 'Tabla para almacenar comunas';

CREATE TABLE ciudad (
    id_ciudad INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',
    id_comuna INT UNSIGNED NOT NULL UNIQUE COMMENT 'Foreign Key comuna',
    nombre VARCHAR(100) NOT NULL UNIQUE COMMENT 'Nombre de la ciudad',

    CONSTRAINT fk_ciudad_comuna
    FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna)
    ON DELETE RESTRICT ON UPDATE CASCADE
) COMMENT 'Tabla para almacenar ciudades';