# Ejercicio CRUD con JSP y BBDD

# ¡ Nuevo en esta versión !

### Uso de ArrayList

Se ha implementado una nueva utilidad de búsqueda por juego para saber que amigo lo tiene

|<img src="capturas/16.png" alt="alt text" width="450" height="250">|<img src="capturas/17.png" alt="alt text" width="450" height="250">|
|-----|--------------|
|Principal|Buscador|
## Introducción

La aplicación web creada para este ejercicio gestiona los juegos de mesa que tienen los usuarios que se registran en la aplicación.
Además de añadir y eliminar juegos, los usuarios podrán modificar sus datos personales y ver los juegos de los dems usuarios.

Por otra parte, el administrador será el encargado de dar de alta los juegos en la base de datos o eliminarlos, además de poder gestionar el alta y borrado de usuarios.


## Base de Datos

La base de datos consta de las tablas:
- Amigo: Son los usuarios registrados.
- Admin: El administrador o administradores.
- Juego: Los juegos que están almacenados en la base de datos y que serán mostrados para añadir o eliminar.
- Categoria: Lista de categorias de los juegos, lo que nos evitará escribir a mano este campo, eligiendolo mediante una barra 
  de selección.
- Tienen: Almacena los juegos que tiene cada usuario.

<img src="capturas/bbdd2.png" alt="alt text">



## Vistas de la aplicación

### Usuario
Empezamos con el index, el cual nos muestra una ventana de login con contraseña para acceder.
Si nos equivocamos nos muestra un mensaje de error que desaparece con un click.
 
 
|<img src="capturas/01.png" alt="alt text" width="450" height="250">|<img src="capturas/02.png" alt="alt text" width="450" height="250">|
|-----|--------------|
|Login|Error en Login|


Si accedemos vemos la pantalla principal del usuario, que se divide en 4 zonas diferenciadas.
- La barra de navegación, donde tenemos el buscador, para encontrar amigos por su nombre. Si hacemos click en el nombre, nos 
  llevará a la pantalla del perfil de amigo.
  Además encontramos nuestro nombre de usuario que nos llevará a la patalla que modifica nuestros datos.
  Al lado de nuestro nombre de usuario tenemos el logout.
- A la izquierda nos encontramos la lista de juegos del usuario, que tiene una medida fija, asi que si la superamos, deberemos   hacer scroll para verla completa.
- Derecha superior, muestra el top 3 de amigos con más juegos.
- Derecha inferior, nos permite añadir o eliminar juegos de nuestro perfil.


|<img src="capturas/03.png" alt="alt text" width="450" height="250">|<img src="capturas/04.png" alt="alt text" width="450" height="250">|
|---------|--------|
|Principal|Buscador|


|<img src="capturas/05.png" alt="alt text" width="450" height="250">|<img src="capturas/06.png" alt="alt text" width="450" height="250">|
|---------------|------------|
|Filtrado nombre|Perfil amigo|


Cuando añadimos o eliminamos un juego o modificamos nuestro perfil de usuario, se nos mostrará durante unos segundos un mensaje de confirmación. "Actualizado correctamente"
Si por el contrario, intentamos añadir un juego que ya tenemos o intentamos borrar uno que no tenemos, se nos mostrará un mensaje de error.


|<img src="capturas/07.png" alt="alt text" width="450" height="250">|<img src="capturas/08.png" alt="alt text" width="450" height="250">|
|-------------------------|-----|
|Actualizado correctamente|Error|


Desde la pantalla de login tenemos la opción de registrarnos, lo que nos llevará a un formulario.
Si el correo electrónico o el usuario están en uso, se nos mostrará un mensaje de error.
Si el registro es correcto, nos enviará a la pantalla de login para poder acceder.


|<img src="capturas/09.png" alt="alt text" width="450" height="250">|<img src="capturas/10.png" alt="alt text" width="450" height="250">|
|-----|-----|
|     |     |

|<img src="capturas/11.png" alt="alt text" width="417" height="250">|
|-----|
|     |     


### Administrador

El login es similar al de usuario, pero no nos permite el regitro.
Si accedemos como administrador la pantalla sigue teniendo 4 zonas, pero funciona de forma diferente:
- En la barra de navegación tenemos el buscador que nos filtra los usuarios que aparecen en el lado izquierdo de la pantalla.
  También incluye el logout, pero el nombre Admin simplmente nos recuerda que estamos logeados en ese perfil, sin llevarnos a   ninguna modificación de datos personales.
- El lado izquierdo tiene la tabla con todos los usuarios, con su correspondiente boton de modificación, que nos lleva a un     formulario como el que tienen los propios usuarios para cambiar los datos.
  El botón de borrado que elimina al usuario de la base de datos, borrando también sus registros.
- Derecha superior tiene un formulario para agregar usuarios, que nos mostrará un mensaje de error si no es posible           
  registrarlo, o de confirmación si lo registra.
- Derecha inferior, gestiona los juegos de la base de datos, permite añadir juegos poniendo nombre y tipo de categoría.
  También podemos eliminarlos usando la barra de selección que tenemos.
  Igual que en todos los casos anteriores, mostrará mensaje de error o confirmación.
  
  
|<img src="capturas/12.png" alt="alt text" width="450" height="250">|<img src="capturas/13.png" alt="alt text" width="450" height="250">|
|-----------|--------------|
|Login Admin|Pantalla Admin|

|<img src="capturas/14.png" alt="alt text" width="450" height="250">|<img src="capturas/15.png" alt="alt text" width="450" height="250">|
|--------------------|----------------|
|Filtrado de usuarios|Mensaje de error|


Todas las actualizaciones que se realizan las veremos al momento, si añadimos un juego como usuario o lo eliminamos, veremos al momento el cambio realizado, sin pasar por otra pantalla, ya que como hemos visto, las confirmaciones o errores son alertas en la pantalla actual del usuario.

Para las vista del administrador será igual, los usuarios añadidos o eliminados será actualizados en la tabla de la izquierda sin necesidad de visualizar otra pantalla intermedia.







