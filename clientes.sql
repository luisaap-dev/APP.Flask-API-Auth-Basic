-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS api_rest_clientes;
USE api_rest_clientes;

-- Crear tabla de clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200),
    Ciudad VARCHAR(100),
    Pais VARCHAR(50),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

-- Crear tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Usuario VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL
);

INSERT INTO clientes (Nombre, Direccion, Ciudad, Pais, Telefono, Email)
VALUES
  ('Juan Perez', 'Calle Principal 123', 'Ciudad de México', 'México', '+52 1234567890', 'juan.perez@example.com'),
  ('María García', 'Avenida Central 456', 'Madrid', 'España', '+34 987654321', 'maria.garcia@example.com'),
  ('John Smith', '123 Main Street', 'New York', 'United States', '+1 1234567890', 'john.smith@example.com'),
  ('Ana Silva', 'Rua Principal 789', 'São Paulo', 'Brasil', '+55 987654321', 'ana.silva@example.com'),
  ('Mohammed Ali', 'Al-Hamra Street', 'Dubai', 'United Arab Emirates', '+971 123456789', 'mohammed.ali@example.com'),
  ('Luisa Fernández', 'Carrera Principal 456', 'Bogotá', 'Colombia', '+57 987654321', 'luisa.fernandez@example.com'),
  ('Hiroshi Tanaka', 'Shibuya 1-2-3', 'Tokio', 'Japón', '+81 1234567890', 'hiroshi.tanaka@example.com'),
  ('Elena Petrova', 'Nevsky Prospekt 789', 'San Petersburgo', 'Rusia', '+7 987654321', 'elena.petrova@example.com'),
  ('Carlos González', 'Avenida Principal 456', 'Santiago', 'Chile', '+56 987654321', 'carlos.gonzalez@example.com'),
  ('Sophie Dupont', 'Rue Principale 789', 'París', 'Francia', '+33 1234567890', 'sophie.dupont@example.com'),
  ('Pedro López', 'Calle Principal 456', 'Barcelona', 'España', '+34 654321987', 'pedro.lopez@example.com'),
  ('Laura Martínez', 'Avenida Central 789', 'Buenos Aires', 'Argentina', '+54 987654321', 'laura.martinez@example.com'),
  ('Roberto Fernández', 'Carrera Principal 123', 'Caracas', 'Venezuela', '+58 123456789', 'roberto.fernandez@example.com'),
  ('Isabel Rodríguez', 'Avenida Principal 789', 'Lima', 'Perú', '+51 987654321', 'isabel.rodriguez@example.com'),
  ('Diego Gómez', 'Rua Principal 123', 'Rio de Janeiro', 'Brasil', '+55 123456789', 'diego.gomez@example.com'),
  ('Carmen Sánchez', 'Calle Mayor 456', 'Madrid', 'España', '+34 654987321', 'carmen.sanchez@example.com'),
  ('Andrés Ramírez', 'Avenida Central 789', 'Santiago de Chile', 'Chile', '+56 987654987', 'andres.ramirez@example.com'),
  ('María Torres', 'Carrera Principal 123', 'Bogotá', 'Colombia', '+57 123456987', 'maria.torres@example.com'),
  ('Javier Romero', 'Calle Principal 789', 'Ciudad de México', 'México', '+52 987654123', 'javier.romero@example.com'),
  ('Carolina Herrera', 'Avenida Central 456', 'Caracas', 'Venezuela', '+58 654321789', 'carolina.herrera@example.com'),
  ('Alejandro González', 'Calle Principal 789', 'Guadalajara', 'México', '+52 9876543210', 'alejandro.gonzalez@example.com'),
  ('Sofía López', 'Avenida Central 123', 'Bogotá', 'Colombia', '+57 1234567890', 'sofia.lopez@example.com'),
  ('Manuel Torres', 'Carrera Principal 456', 'Lima', 'Perú', '+51 9876543210', 'manuel.torres@example.com'),
  ('Elena García', 'Calle Mayor 123', 'Madrid', 'España', '+34 1234567890', 'elena.garcia@example.com'),
  ('Diego Fernández', 'Rua Principal 789', 'São Paulo', 'Brasil', '+55 9876543210', 'diego.fernandez@example.com'),
  ('Laura Martínez', 'Avenida Central 456', 'Buenos Aires', 'Argentina', '+54 1234567890', 'laura.martinez@example.com'),
  ('Carlos Rodríguez', 'Carrera Principal 123', 'Caracas', 'Venezuela', '+58 9876543210', 'carlos.rodriguez@example.com'),
  ('Isabela Silva', 'Calle Principal 789', 'Rio de Janeiro', 'Brasil', '+55 1234567890', 'isabela.silva@example.com'),
  ('Martín López', 'Avenida Central 123', 'Santiago', 'Chile', '+56 9876543210', 'martin.lopez@example.com'),
  ('Ana Ramírez', 'Carrera Principal 456', 'Ciudad de México', 'México', '+52 1234567890', 'ana.ramirez@example.com'),
  ('Andrés García', 'Calle Principal 456', 'Barcelona', 'España', '+34 654321987', 'andres.garcia@example.com'),
  ('María Martínez', 'Avenida Central 789', 'Buenos Aires', 'Argentina', '+54 987654321', 'maria.martinez@example.com'),
  ('Roberto Fernández', 'Carrera Principal 123', 'Caracas', 'Venezuela', '+58 123456789', 'roberto.fernandez@example.com'),
  ('Isabel Rodríguez', 'Avenida Principal 789', 'Lima', 'Perú', '+51 987654321', 'isabel.rodriguez@example.com'),
  ('Diego Gómez', 'Rua Principal 123', 'Rio de Janeiro', 'Brasil', '+55 123456789', 'diego.gomez@example.com'),
  ('Carmen Sánchez', 'Calle Mayor 456', 'Madrid', 'España', '+34 654987321', 'carmen.sanchez@example.com'),
  ('Andrea Ramírez', 'Avenida Central 789', 'Santiago de Chile', 'Chile', '+56 987654987', 'andrea.ramirez@example.com'),
  ('María Torres', 'Carrera Principal 123', 'Bogotá', 'Colombia', '+57 123456987', 'maria.torres@example.com'),
  ('Javier Romero', 'Calle Principal 789', 'Ciudad de México', 'México', '+52 987654123', 'javier.romero@example.com'),
  ('Carolina Herrera', 'Avenida Central 456', 'Caracas', 'Venezuela', '+58 654321789', 'carolina.herrera@example.com'),
  ('Gabriel López', 'Calle Principal 456', 'Buenos Aires', 'Argentina', '+54 987654321', 'gabriel.lopez@example.com'),
  ('Valentina Martínez', 'Avenida Central 789', 'Santiago', 'Chile', '+56 123456789', 'valentina.martinez@example.com'),
  ('Fernando Fernández', 'Carrera Principal 123', 'Lima', 'Perú', '+51 987654321', 'fernando.fernandez@example.com'),
  ('Sara Rodríguez', 'Calle Mayor 789', 'Madrid', 'España', '+34 654321987', 'sara.rodriguez@example.com'),
  ('Luis Gómez', 'Rua Principal 123', 'São Paulo', 'Brasil', '+55 123456789', 'luis.gomez@example.com'),
  ('Laura Sánchez', 'Avenida Central 456', 'Ciudad de México', 'México', '+52 987654321', 'laura.sanchez@example.com'),
  ('Andrés Ramírez', 'Carrera Principal 789', 'Caracas', 'Venezuela', '+58 123456789', 'andres.ramirez@example.com'),
  ('María Torres', 'Calle Principal 123', 'Bogotá', 'Colombia', '+57 987654321', 'maria.torres@example.com'),
  ('Javier Romero', 'Avenida Central 789', 'Lima', 'Perú', '+51 123456789', 'javier.romero@example.com'),
  ('Carolina Herrera', 'Carrera Principal 456', 'Buenos Aires', 'Argentina', '+54 987654321', 'carolina.herrera@example.com');


-- Insertar datos de prueba en la tabla de usuarios
INSERT INTO usuarios (Usuario, Password)
VALUES 
    ('John',  '123'),
    ('Jane',  '123'),
    ('Robert',  '123'),
    ('Emily', '123'),
    ('Michael', '123');
