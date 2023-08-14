from flask import Flask, jsonify, request,session
import mysql.connector
from flask_httpauth import HTTPBasicAuth
from config import db_config
from flask_cors import CORS



app = Flask(__name__)
auth_basic = HTTPBasicAuth()
app.secret_key = 'afdadasdasdqwe123*Aasd%'
CORS(app)

# Función para establecer la conexión a la base de datos
def get_db_connection():
    return mysql.connector.connect(**db_config)

# Autenticación básica 
@auth_basic.verify_password
def verify_password(username, password):
    try:
        with get_db_connection() as connection, connection.cursor(
            dictionary=True
        ) as cursor:
            cursor.execute("SELECT Usuario, Password FROM usuarios WHERE Usuario = %s", (username,))
            user = cursor.fetchone()
        
        if user and user["Password"] == password:
            # Si las credenciales son válidas, establece el nombre de usuario en la sesión
            session['username'] = user["Usuario"]
            return user["Usuario"]
    except Exception as e:
        print("Error:", e)
    
    return None



# Ruta para registrar un nuevo usuario
@app.route("/api/register", methods=["POST"])
def register_user():
    data = request.get_json()
    username = data["username"]
    password = data["password"]

    # Verificar si el usuario ya existe en la base de datos
    with get_db_connection() as connection, connection.cursor() as cursor:
        cursor.execute("SELECT Usuario FROM usuarios WHERE Usuario = %s", (username,))
        existing_user = cursor.fetchone()
        if existing_user:
            return jsonify({"error": "El usuario ya existe"}), 400

        # Insertar nuevo usuario en la base de datos (sin hashear la contraseña)
        cursor.execute("INSERT INTO usuarios (Usuario, Password) VALUES (%s, %s)", (username, password))
        connection.commit()

    return jsonify({"message": "Usuario registrado correctamente"}), 201


# Ruta para iniciar sesión
@app.route("/api/login", methods=["POST"])
def login():
    return jsonify({"message": "Inicio de sesión exitoso"}), 200

# Ruta para obtener la lista de clientes
# Ejemplo de uso: http://localhost:5000/api/clientes?nombre=Juan+perez
@app.route("/api/clientes", methods=["GET"])
@auth_basic.login_required
def get_clientes():
    search_params = {}
    for param, value in request.args.items():
        search_params[param] = value

    with get_db_connection() as connection, connection.cursor(
        dictionary=True
    ) as cursor:
        if search_params:
            conditions = []
            values = []
            for field, value in search_params.items():
                conditions.append(f"{field} = %s")
                values.append(value)
            where_clause = " AND ".join(conditions)
            query = f"SELECT * FROM clientes WHERE {where_clause}"
            cursor.execute(query, tuple(values))
        else:
            cursor.execute("SELECT * FROM clientes")

        clientes = cursor.fetchall()
        return jsonify(clientes)


# Ruta para obtener un cliente por ID
# Ejemplo de uso: http://localhost:5000/api/clientes/2
@app.route("/api/clientes/<int:id>", methods=["GET"])
@auth_basic.login_required
def get_cliente(id):
    with get_db_connection() as connection, connection.cursor(
        dictionary=True
    ) as cursor:
        cursor.execute("SELECT * FROM clientes WHERE id = %s", (id,))
        cliente = cursor.fetchone()
        if cliente:
            return jsonify(cliente)
        else:
            return jsonify({"error": "Cliente no encontrado"}), 404


# Ruta para crear un nuevo cliente
# Ejemplo de datos JSON en el cuerpo de la solicitud:
# {"Nombre": "Nuevo Cliente", "Direccion": "Calle 123", "Ciudad": "Ciudad Nueva", "Pais": "País Nuevo", "Telefono": "1234567890", "Email": "nuevo@cliente.com"}
@app.route("/api/clientes", methods=["POST"])
@auth_basic.login_required
def crear_cliente():
    new_cliente = request.get_json()
    with get_db_connection() as connection, connection.cursor() as cursor:
        cursor.execute(
            "INSERT INTO clientes (Nombre, Direccion, Ciudad, Pais, Telefono, Email) VALUES (%s, %s, %s, %s, %s, %s)",
            (
                new_cliente["Nombre"],
                new_cliente["Direccion"],
                new_cliente["Ciudad"],
                new_cliente["Pais"],
                new_cliente["Telefono"],
                new_cliente["Email"],
            ),
        )
        connection.commit()
    return jsonify({"message": "Cliente creado correctamente"}), 201


# Ruta para actualizar un cliente por ID
# Ejemplo de datos JSON en el cuerpo de la solicitud para actualizar:
# {"Nombre": "Cliente Actualizado", "Direccion": "Nueva Dirección", "Ciudad": "Nueva Ciudad", "Pais": "Nuevo País", "Telefono": "9876543210", "Email": "actualizado@cliente.com"}
@app.route("/api/clientes/<int:id>", methods=["PUT"])
@auth_basic.login_required
def actualizar_cliente(id):
    updated_cliente = request.get_json()
    with get_db_connection() as connection, connection.cursor() as cursor:
        cursor.execute(
            "UPDATE clientes SET Nombre = %s, Direccion = %s, Ciudad = %s, Pais = %s, Telefono = %s, Email = %s WHERE id = %s",
            (
                updated_cliente["Nombre"],
                updated_cliente["Direccion"],
                updated_cliente["Ciudad"],
                updated_cliente["Pais"],
                updated_cliente["Telefono"],
                updated_cliente["Email"],
                id,
            ),
        )
        connection.commit()
    return jsonify({"message": f"Cliente con ID {id} actualizado correctamente"})


# Ruta para eliminar un cliente por ID
# Ejemplo de uso: DELETE http://localhost:5000/api//clientes/2
@app.route("/api/clientes/<int:id>", methods=["DELETE"])
@auth_basic.login_required
def eliminar_cliente(id):
    with get_db_connection() as connection, connection.cursor() as cursor:
        cursor.execute("DELETE FROM clientes WHERE id = %s", (id,))
        connection.commit()
    return jsonify({"message": f"Cliente con ID {id} eliminado correctamente"})



if __name__ == "__main__":
    app.run(port=5000, debug=True)  # Para app_ui.py