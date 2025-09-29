# Librería el mundo de Sofía
## Justificación del Diseño
Se cumplio con todas las entidades, atributos y relaciones propuestas en el ejercicio, cumpliendo hasta N3 exitosamente, se inicio tomando como base la entidad **libro**, ramificando y creando otras entidades como **autor**, **categoria**, **autor_x_libro**, etc. Guiandome y obserbando las necesidades de cada tabla y verificar si estas para asi, ramificarlas para crear sub entidades. 

## Restricciones y Validaciones

[X] Implementar relaciones entre libros y autores, entre clientes y pedidos, y entre pedidos y transacciones.

[X] Evitar registros duplicados de libros.

[X] La cantidad en stock de un libro debe actualizarse al realizar una compra.

## Relaciones UML
### Libro

En **libro** se noto la dependencia de otra entidad, donde nacio **stock**.

### Autor

En **autor** nacio la necesidad de dividirlo en **autor_x_libro** y **categoria**.


### Cliente
En **cliente** se vio la necesidad de crear una nueva entidad, la cual fue **ubicacion** para poder categorizar mejor y cumplir con los requerimientos.


### Pedido
En **pedido** se creo la entidad **cantidad_libro_a_comprar** para que, **pedido** pueda manejar cantidades independientes de libros.

### Transaccion
**Transaccion** se enlaza con **pedido** para poder continuar con esta, usandose para verificar el estado de pago.

