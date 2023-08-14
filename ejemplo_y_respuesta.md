# Registrar un nuevo usuario
POST http://localhost:5000/api/register
Content-Type: application/json

{
  "username": "nuevo_usuario",
  "password": "contrasena_secreta"
}

# Iniciar sesión
POST http://localhost:5000/api/login
Content-Type: application/json

{
  "username": "usuario_existente",
  "password": "contrasena_secreta"
}

# Obtener lista de clientes
GET http://localhost:5000/api/clientes?nombre=Cliente+1

# Obtener detalles de un cliente
GET http://localhost:5000/api/clientes/1

# Crear un nuevo cliente
POST http://localhost:5000/api/clientes
Content-Type: application/json

{
  "Nombre": "Nuevo Cliente",
  "Direccion": "Calle 789",
  "Ciudad": "Ciudad C",
  "Pais": "País Z",
  "Telefono": "5555555555",
  "Email": "nuevo@cliente.com"
}

# Actualizar un cliente
PUT http://localhost:5000/api/clientes/1
Content-Type: application/json

{
  "Nombre": "Cliente Actualizado",
  "Direccion": "Nueva Dirección",
  "Ciudad": "Nueva Ciudad",
  "Pais": "Nuevo País",
  "Telefono": "9876543210",
  "Email": "actualizado@cliente.com"
}

# Eliminar un cliente
DELETE http://localhost:5000/api/clientes/1