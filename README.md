# per_diem

# Comprehensive Viaticum Management System

## Project Routes
* index
* commissionorder
* selectedpath
* others
* lodging
* food
* taxi
* fuel
* toolbooth

## NPM Modelues for App
* `express-session`: Administra las sesiones de la aplicación, en caso de requerir autenticar un usuario dentro de ella.
* `mysql`: Permite conectar con la base de datos.
* `express-validator`: Valida los datos que envía el usuario a la apliación.
* `express-validator-session`: Almacena las sesiones en la base de datos en lugar del servidor.
* `bypcryptjs`: Cifra las contraseñas de los usuarios antes de guardarlas en la base de datos.
* `passport`: Autentica y maneja el proceso de iniciar sesión de un usuario.
* `passport-local`: Pluging de `passport` que utentica a los usuarios con la propia base de datos.
* `time-ago.js`: Convierte los timestamps ó fechas de la base de datos en un formato de: **2 minutes ago**, **2 hours ago**, etc. Para que en las vistas se representen las fechas de ésta manera.
* `connect-flash`: Permite envíar mensajes a través de múltiples vistas. Por ejemplo para mostrar mensajes de error ó éxito.
