# Natura
Repositorio dedicado al almacenamiento de los scripts de MySQL para el proyecto de la carrera de Marketing. 

## Organización de las tablas dentro de la base de datos

```
INF = Agregado por el equipo de Informatica.
MARK = Agregado por el equipo de Marketing.
```
### Tabla Clientes (Entidad Principal)
| Columna  |   Tipo de Dato   | Descripción  |
|----------|------------------|--------------|
|id_cliente	|INT (PK) / UUID|Identificador único del cliente| ✅
|pnombre|VARCHAR(25)|primer nombre del cliente|✅
|snombre|VARCHAR(25)|segundo nombre del cliente|✅
|appaterno|VARCHAR(25)|Apellido paterno del cliente|✅
|apmaterno|VARCHAR(25)|Apellido materno del cliente|✅
|fecha_nacimiento|DATE|Fecha nacimiento Cliente|✅
|edad|INT	|Edad del cliente|✅
|id_genero|INT (FK)	|Clave foránea a la tabla Generos|✅
|id_ciudad|INT (FK)	|Clave foránea a la tabla Ciudades|✅
|id_frecuencia|INT (FK)|Clave foránea a la tabla FrecuenciaCompra|✅
|ultima_compra|DATE	|Fecha de la última compra del cliente|✅
|id_categoriaproducto| INT (FK)| Clave foránea de la tabla CategoriasProductos|✅
|monto_total_gastado|DECIMAL(10, 2)|Monto total gastado en moneda local|✅
|id_metodopago| INT (FK)|Clave foránea de la tabla MetodosPago|✅
|id_promocion| INT (FK)|Clave foránea de la tabla Promociones|✅
|nivel_satisfaccion	|INT|Nivel de satisfacción (ej. 1-5 o 1-10)|


## Atributos Categóricos
### Tabla Generos ✅
|Columna	|Tipo de Dato|	Descripción|
|-----------|------------|-------------|
|id_genero	|INT (PK)	 |Identificador único del género|
|descripcion|VARCHAR(50) |	Nombre del género (ej. "Masculino", "Femenino", "No Binario", "Prefiero no decir")|

## Tabla FrecuenciaCompra✅
|Columna	  |Tipo de Dato	  |Descripción|
|-------------|---------------|-----------|
|id_frecuencia|	INT (PK)	  |Identificador único de la frecuencia de compra|
|descripcion  |	VARCHAR(50)	  |Descripción de la frecuencia (ej. "Mensual", "Anual", "Trimestral", "Semanal")|

## Tabla MetodosPago✅
|Columna	|Tipo de Dato |	Descripción |
|-----------|-------------|-------------|
|id_metodo	|INT (PK)	  |Identificador único del método de pago
|descripcion|VARCHAR(50)  |Nombre del método (ej. "Efectivo", "Tarjeta de Crédito", "Tarjeta de Débito", "Transferencia Bancaria", "App de Pago")|

## Tabla CategoriasProductos✅
|Columna	| Tipo de Dato  | Descripción |
|-----------|---------------|-------------|
|id_categoria|	INT (PK)	|Identificador único de la categoría de producto|
|nombre_categoria|	VARCHAR(100)	|Nombre de la categoría (ej. "Electrónica", "Ropa", "Alimentos", "Hogar")|

## Tabla Comunas✅
|Columna|	Tipo de Dato|	Descripción|
|-------|---------------|--------------|
|id_comuna|	INT (PK)	|Identificador único de la comuna|
|nombre	|VARCHAR(100)	|Nombre de la comuna (ej. "Puerto Varas", "Providencia")|

## Tabla Ciudades✅
|Columna | Tipo de dato | Descripción|
|---------|---------|------------------------|
|id_ciudad|	INT (PK)|	Identificador único de la ciudad|
|nombre|	VARCHAR(100)|	Nombre de la ciudad (ej. "Puerto Varas", "Santiago")|
|id_comuna	|INT (FK)|Clave foránea a la tabla Comunas|

## Tabla Promociones✅
|Columna	|Tipo de Dato	|Descripción|
|---|----|---|
|id_promocion	|INT (PK)	|Identificador único de la promoción|
|nombre_promocion	|VARCHAR(100)	|Nombre de la promoción (ej. "Cupón, Descuento, Sin descuento.")|