INSERT INTO genero (nombre) VALUES
('Hombre'),
('Mujer'),
('Otro');

INSERT INTO comuna (nombre) VALUES
('Calbuco'),
('Puerto Montt'),
('Puerto Varas'),
('Los Muermos'),
('Otro')
;

INSERT INTO ciudad (id_comuna, nombre) VALUES
(1,'Calbuco'),
(2,'Puerto Montt'),
(3,'Puerto Varas'),
(4,'Los Muermos'),
(2,'Alerce');

INSERT INTO frecuencia (descripcion) VALUES
('Anual'),
('Mensual'),
('Semanal');

INSERT INTO categoria (nombre) VALUES
('Cabello'),
('Cuidado personal'),
('Maquillaje');

INSERT INTO metodo_pago (descripcion) VALUES
('Tarjeta credito'),
('Tarjeta debito'),
('Efectivo');

INSERT INTO promocion (nombre) VALUES
('Cupon'),
('Descuento'),
('Sin descuento');

DELIMITER //
CREATE PROCEDURE InsertarClientesFalsos()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE v_pnombre VARCHAR(25);
    DECLARE v_snombre VARCHAR(25);
    DECLARE v_appaterno VARCHAR(25);
    DECLARE v_apmaterno VARCHAR(25);
    DECLARE v_edad INT;
    DECLARE v_id_genero TINYINT;
    DECLARE v_id_ciudad INT;
    DECLARE v_id_frecuencia TINYINT;
    DECLARE v_ultima_compra DATE;
    DECLARE v_id_categoria INT;
    DECLARE v_monto_total_gastado DECIMAL(10,2);
    DECLARE v_id_metodo_pago TINYINT;
    DECLARE v_id_promocion INT;
    DECLARE v_nivel_satisfaccion INT;

    -- Creamos tablas temporales para almacenar nombres y apellidos para la aleatoriedad
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_nombres (nombre VARCHAR(25));
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_apellidos (apellido VARCHAR(25));

    -- Poblamos las tablas temporales
    INSERT INTO temp_nombres VALUES ('Juan'), ('María'), ('Pedro'), ('Ana'), ('Luis'), ('Laura'), ('Carlos'), ('Sofía'), ('Miguel'), ('Valentina'), ('José'), ('Camila'), ('Andrés'), ('Isabella'), ('Diego'), ('Gabriela');
    INSERT INTO temp_apellidos VALUES ('González'), ('Rodríguez'), ('Pérez'), ('Sánchez'), ('López'), ('Martínez'), ('Gómez'), ('Díaz'), ('Hernández'), ('Vargas'), ('Romero'), ('Suárez'), ('Castillo'), ('Rojas'), ('Soto'), ('Morales');

    -- Bucle para insertar 500 registros
    WHILE i < 500 DO
        -- Asignación de datos aleatorios a las variables
        
        -- Nombres y apellidos aleatorios de las tablas temporales
        SET v_pnombre = (SELECT nombre FROM temp_nombres ORDER BY RAND() LIMIT 1);
        SET v_snombre = (SELECT CASE WHEN RAND() > 0.5 THEN (SELECT nombre FROM temp_nombres ORDER BY RAND() LIMIT 1) ELSE NULL END); -- Segundo nombre opcional
        SET v_appaterno = (SELECT apellido FROM temp_apellidos ORDER BY RAND() LIMIT 1);
        SET v_apmaterno = (SELECT apellido FROM temp_apellidos ORDER BY RAND() LIMIT 1);
        
        -- Edad aleatoria entre 18 y 75 años
        SET v_edad = FLOOR(18 + RAND() * 58);
        
        SET v_id_genero = FLOOR(1 + RAND() * 3); -- IDs: 1, 2, 3
        SET v_id_ciudad = FLOOR(1 + RAND() * 5); -- IDs: 1, 2, 3, 4, 5
        SET v_id_frecuencia = FLOOR(1 + RAND() * 3); -- IDs: 1, 2, 3
        SET v_id_categoria = FLOOR(1 + RAND() * 3); -- IDs: 1, 2, 3
        SET v_id_metodo_pago = FLOOR(1 + RAND() * 3); -- IDs: 1, 2, 3
        SET v_id_promocion = FLOOR(1 + RAND() * 3); -- IDs: 1, 2, 3
        
        -- Fecha de última compra aleatoria en los últimos 2 años
        SET v_ultima_compra = DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 730) DAY);
        
        -- Monto total gastado aleatorio
        SET v_monto_total_gastado = ROUND(5000 + RAND() * 495000, 2);
        
        -- Nivel de satisfacción aleatorio entre 1 y 5
        SET v_nivel_satisfaccion = FLOOR(1 + RAND() * 5);

        -- Inserción del nuevo registro en la tabla cliente
        INSERT INTO cliente (pnombre, snombre, appaterno, apmaterno, edad, id_genero, id_ciudad, id_frecuencia, ultima_compra, id_categoria, monto_total_gastado, id_metodo_pago, id_promocion, nivel_satisfaccion)
        VALUES (v_pnombre, v_snombre, v_appaterno, v_apmaterno, v_edad, v_id_genero, v_id_ciudad, v_id_frecuencia, v_ultima_compra, v_id_categoria, v_monto_total_gastado, v_id_metodo_pago, v_id_promocion, v_nivel_satisfaccion);
        
        -- Incrementamos el contador
        SET i = i + 1;
    END WHILE;

    -- Eliminamos las tablas temporales
    DROP TEMPORARY TABLE temp_nombres;
    DROP TEMPORARY TABLE temp_apellidos;

END //

-- Devolvemos el delimitador a su estado original
DELIMITER ;

CALL InsertarClientesFalsos();