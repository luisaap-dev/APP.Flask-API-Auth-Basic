# Flask API para Gestión de Clientes con autenticación básica

Esta es una API simple construida utilizando Flask para administrar clientes y autenticación básica. La API permite registrar nuevos usuarios, iniciar sesión, y realizar operaciones CRUD en una base de datos de clientes.

## Configuración

1. Clona el repositorio o descarga los archivos.
2. Crea un entorno virtual (opcional pero recomendado).
3. Instala las dependencias utilizando `pip install -r requirements.txt`.
4. Configura la base de datos en el archivo `config.py`.
5. Ejecuta la aplicación con `python app_api.py`.

## Rutas / ## Endpoints

### Registro de Usuario

**URL:** `/api/register`

**Método:** POST

**Cuerpo de la solicitud:**
```json
{
  "username": "nuevo_usuario",
  "password": "contrasena_secreta"
}
```

**Respuesta exitosa:**
```json
{
  "message": "Usuario registrado correctamente"
}
```

### Inicio de Sesión

**URL:** `/api/login`

**Método:** POST

**Cuerpo de la solicitud:**
```json
{
  "username": "usuario_existente",
  "password": "contrasena_secreta"
}
```

**Respuesta exitosa:**
```json
{
  "message": "Inicio de sesión exitoso"
}
```

### Obtener Lista de Clientes

**URL:** `/api/clientes`

**Método:** GET

**Parámetros de consulta opcionales:**
- `nombre`: Filtrar por nombre del cliente

**Respuesta exitosa:**
```json
[
  {
    "id": 1,
    "Nombre": "Cliente 1",
    "Direccion": "Calle 123",
    "Ciudad": "Ciudad A",
    "Pais": "País X",
    "Telefono": "1234567890",
    "Email": "cliente1@example.com"
  },
  {
    "id": 2,
    "Nombre": "Cliente 2",
    "Direccion": "Calle 456",
    "Ciudad": "Ciudad B",
    "Pais": "País Y",
    "Telefono": "9876543210",
    "Email": "cliente2@example.com"
  }
  // ...
]
```

### Obtener Detalles de un Cliente

**URL:** `/api/clientes/<int:id>`

**Método:** GET

**Respuesta exitosa:**
```json
{
  "id": 1,
  "Nombre": "Cliente 1",
  "Direccion": "Calle 123",
  "Ciudad": "Ciudad A",
  "Pais": "País X",
  "Telefono": "1234567890",
  "Email": "cliente1@example.com"
}
```

### Crear un Nuevo Cliente

**URL:** `/api/clientes`

**Método:** POST

**Cuerpo de la solicitud:**
```json
{
  "Nombre": "Nuevo Cliente",
  "Direccion": "Calle 789",
  "Ciudad": "Ciudad C",
  "Pais": "País Z",
  "Telefono": "5555555555",
  "Email": "nuevo@cliente.com"
}
```

**Respuesta exitosa:**
```json
{
  "message": "Cliente creado correctamente"
}
```

### Actualizar un Cliente

**URL:** `/api/clientes/<int:id>`

**Método:** PUT

**Cuerpo de la solicitud:**
```json
{
  "Nombre": "Cliente Actualizado",
  "Direccion": "Nueva Dirección",
  "Ciudad": "Nueva Ciudad",
  "Pais": "Nuevo País",
  "Telefono": "9876543210",
  "Email": "actualizado@cliente.com"
}
```

**Respuesta exitosa:**
```json
{
  "message": "Cliente con ID <id> actualizado correctamente"
}
```

### Eliminar un Cliente

**URL:** `/api/clientes/<int:id>`

**Método:** DELETE

**Respuesta exitosa:**
```json
{
  "message": "Cliente con ID <id> eliminado correctamente"
}
```

**Nota:** Asegúrate de haber configurado correctamente la conexión a la base de datos en `config.py`.

## Autor

Luis Ares - [Perfil de GitHub](https://github.com/luisaap-dev)

## Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.
