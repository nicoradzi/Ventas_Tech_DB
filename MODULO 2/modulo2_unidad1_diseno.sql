--CREACION DE TABLAS--
CREATE TABLE Clientes (
  id_cliente INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  perfil_bio TEXT,
  fecha_registro DATE NOT NULL
  );
-- id_cliente: INT porque necesitamos almacenar un número entero.
-- NOT NULL garantiza que siempre exista un valor.
-- PRIMARY KEY identifica de manera única a cada cliente.
-- IDENTITY(1,1) hace que SQL Server genere automáticamente el número de ID.
-- nombre: VARCHAR(100) porque almacena texto de hasta 100 caracteres.
-- perfil_bio: TEXT porque permite almacenar textos de mayor longitud.
-- fecha_registro: DATE porque necesitamos almacenar solamente una fecha.

--CREACION DE LA TABLA DE PRODUCTOS
CREATE TABLE Productos (
  id_producto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  descripcion VARCHAR(255),
  precio DECIMAL(10,2) NOT NULL,
  esta_activo VARCHAR(2) NOT NULL
  );

-- id_producto: INT porque necesitamos almacenar un número entero.
-- NOT NULL garantiza que siempre exista un valor.
-- PRIMARY KEY identifica de manera única a cada producto.
-- IDENTITY(1,1) genera automáticamente el número de ID.
-- descripcion: VARCHAR(255) porque almacena texto de hasta 255 caracteres.
-- precio: DECIMAL(10,2) porque necesitamos almacenar dinero con 2 decimales.
-- esta_activo: VARCHAR(2) permite representar el estado del producto mediante texto,
-- por ejemplo 'SI' o 'NO'.

  
