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
|id_cliente	|INT (PK) / UUID|Identificador único del cliente|
|nombre_cliente|VARCHAR(100)|Nombre completo del cliente|
|edad|INT	|Edad del cliente|
|id_genero|INT (FK)	|Clave foránea a la tabla Generos|
|id_ciudad|INT (FK)	|Clave foránea a la tabla Ciudades|
|id_frecuencia|INT (FK)|Clave foránea a la tabla FrecuenciaCompra|
|ultima_compra|DATE	|Fecha de la última compra del cliente|
|monto_total_gastado|DECIMAL(10, 2)|Monto total gastado en moneda local|
|nivel_satisfaccion	|INT|Nivel de satisfacción (ej. 1-5 o 1-10)|


## Atributos Categóricos
### Tabla Generos 
|Columna	|Tipo de Dato|	Descripción|
|-----------|------------|-------------|
|id_genero	|INT (PK)	 |Identificador único del género|
|descripcion|VARCHAR(50) |	Nombre del género (ej. "Masculino", "Femenino", "No Binario", "Prefiero no decir")|

## Tabla FrecuenciaCompra
|Columna	  |Tipo de Dato	  |Descripción|
|-------------|---------------|-----------|
|id_frecuencia|	INT (PK)	  |Identificador único de la frecuencia de compra|
|descripcion  |	VARCHAR(50)	  |Descripción de la frecuencia (ej. "Mensual", "Anual", "Trimestral", "Semanal")|

## Tabla MetodosPago
|Columna	|Tipo de Dato |	Descripción |
|-----------|-------------|-------------|
|id_metodo	|INT (PK)	  |Identificador único del método de pago
|descripcion|VARCHAR(50)  |Nombre del método (ej. "Efectivo", "Tarjeta de Crédito", "Tarjeta de Débito", "Transferencia Bancaria", "App de Pago")|

## Tabla CategoriasProductos
|Columna	| Tipo de Dato  | Descripción |
|-----------|---------------|-------------|
|id_categoria|	INT (PK)	|Identificador único de la categoría de producto|
|nombre_categoria|	VARCHAR(100)	|Nombre de la categoría (ej. "Electrónica", "Ropa", "Alimentos", "Hogar")|

## Tabla Comunas
|Columna|	Tipo de Dato|	Descripción|
|-------|---------------|--------------|
|id_comuna|	INT (PK)	|Identificador único de la comuna|
|nombre	|VARCHAR(100)	|Nombre de la comuna (ej. "Puerto Varas", "Providencia")|

## Tabla Ciudades
|id_ciudad|	INT (PK)|	Identificador único de la ciudad|
|---------|---------|------------------------|
|nombre|	VARCHAR(100)|	Nombre de la ciudad (ej. "Puerto Varas", "Santiago")|
|id_comuna	|INT (FK)|Clave foránea a la tabla Comunas|

## Tabla Promociones
|Columna	|Tipo de Dato	|Descripción|
|---|----|---|
|id_promocion	|INT (PK)	|Identificador único de la promoción|
|nombre_promocion	|VARCHAR(100)	|Nombre de la promoción (ej. "10% Descuento Primer Compra")|
|tipo_descuento	|VARCHAR(50)	|Tipo de descuento (ej. "Porcentaje", "Monto Fijo")|
|valor_descuento	|DECIMAL(5,2)	|Valor del descuento (ej. 0.10 para 10%, 5000 para $5000)|
|fecha_inicio	|DATE	|Fecha de inicio de la promoción|
|fecha_fin	|DATE	|Fecha de fin de la promoción (NULL si es indefinida)|

## Tabla ClientePromociones
|Columna	|Tipo de Dato	|Descripción|
|--|---|--|
|id_cliente	|INT (PK, FK)	|Clave foránea a Clientes.id_cliente|
|id_promocion	|INT (PK, FK)	|Clave foránea a Promociones.id_promocion|
|fecha_uso	|DATE	|Fecha en que el cliente usó esta promoción (opcional, pero útil)|

## Tabla ClienteCategoriasAdquiridas
|Columna|	Tipo de Dato	|Descripción|
|--|--|--|
|id_cliente	|INT (PK, FK)	|Clave foránea a Clientes.id_cliente|
|id_categoria	|INT (PK, FK)	|Clave foránea a CategoriasProductos.id_categoria|
|ultima_compra_categoria	|DATE	|Fecha de la última compra en esta categoría (opcional)|