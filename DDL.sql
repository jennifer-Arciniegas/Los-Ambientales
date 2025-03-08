
DROP DATABASE IF EXISTS Gestion_Parques_Naturales;

CREATE DATABASE Gestion_Parques_Naturales;
USE Gestion_Parques_Naturales;

-- Crear la tabla Entidad
CREATE TABLE Entidad (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla Departamento
CREATE TABLE Departamento (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    capital VARCHAR(50) NOT NULL,
    Entidad_id INT,
    FOREIGN KEY (Entidad_id) REFERENCES Entidad(ID)
);

-- Crear la tabla Parque
CREATE TABLE Parque (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_declaracion DATE NOT NULL
);

-- Crear la tabla Departamento_Parque
CREATE TABLE Departamento_Parque (
    Departamento_id INT NOT NULL,
    parque_id INT NOT NULL,
    PRIMARY KEY (Departamento_id, parque_id),
    FOREIGN KEY (Departamento_id) REFERENCES Departamento(ID),
    FOREIGN KEY (parque_id) REFERENCES Parque(ID)
);

-- Crear la tabla Area
CREATE TABLE Area (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    extencion_hectareas DOUBLE NOT NULL,
    parque_id INT,
    FOREIGN KEY (parque_id) REFERENCES Parque(ID)
);

-- Crear la tabla Especie
CREATE TABLE Especie (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cientifico VARCHAR(100) NOT NULL,
    nombre_comun VARCHAR(50),
    numero_inventario INT NOT NULL,
    tipo ENUM('Animal', 'Mineral', 'Vegetal') NOT NULL,
    Area_id INT,
    FOREIGN KEY (Area_id) REFERENCES Area(ID)
);

-- Crear la tabla Cargo
CREATE TABLE Cargo (
    ID INT PRIMARY KEY,  -- No auto-increment, valores fijos 001, 002, 003, 004
    nombre VARCHAR(50) NOT NULL,  -- Cambiado de ENUM a VARCHAR
    especialidad VARCHAR(50)
);


-- Crear la tabla Personal
CREATE TABLE Personal (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(15) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(13),
    telefono_movil VARCHAR(13) NOT NULL,
    sueldo DOUBLE NOT NULL,
    Area_id INT,
    cargo_id INT NOT NULL,  -- Requerido, referencia a Cargo
    FOREIGN KEY (Area_id) REFERENCES Area(ID),
    FOREIGN KEY (cargo_id) REFERENCES Cargo(ID)
);

-- Crear la tabla Vehiculo
CREATE TABLE Vehiculo (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL
);

-- Crear la tabla Vigilante_vehiculo
CREATE TABLE Vigilante_vehiculo (
    vigilante_id INT,
    vehiculo_id INT,
    PRIMARY KEY (vigilante_id, vehiculo_id),
    FOREIGN KEY (vigilante_id) REFERENCES Personal(ID),
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculo(ID));

-- Crear la tabla ProyectoInvestigacion
CREATE TABLE ProyectoInvestigacion (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nombre TEXT NOT NULL,
    presupuesto DOUBLE NOT NULL,
    inicioInvestigacion DATE NOT NULL,  -- Renombrado para consistencia
    finInvestigacion DATE  -- Renombrado para consistencia
);

-- Crear la tabla Investigador_Proyecto
CREATE TABLE Investigador_Proyecto (
    investigador INT,
    proyecto INT,
    PRIMARY KEY (investigador, proyecto),
    FOREIGN KEY (investigador) REFERENCES Personal(ID),
    FOREIGN KEY (proyecto) REFERENCES ProyectoInvestigacion(ID));

-- Crear la tabla Especies_Investigadas
CREATE TABLE Especies_Investigadas (
    especie INT,
    investigacion INT,
    PRIMARY KEY (especie, investigacion),
    FOREIGN KEY (especie) REFERENCES Especie(ID),
    FOREIGN KEY (investigacion) REFERENCES ProyectoInvestigacion(ID)
);

-- Crear la tabla Alojamiento
CREATE TABLE Alojamiento (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    categoria ENUM('cabaña', 'hotel', 'campings'),
    capacidad INT,
    parque INT,
    FOREIGN KEY (parque) REFERENCES Parque(ID)
);

-- Crear la tabla Visitante
CREATE TABLE Visitante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    cedula VARCHAR(15) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(13),
    profesion VARCHAR(50) NOT NULL,
    alojamiento INT,
    FOREIGN KEY (alojamiento) REFERENCES Alojamiento(ID)
);

-- Crear la tabla Visita
CREATE TABLE Visita (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
    salida DATETIME NULL,
    area INT,
    visitante INT,
    FOREIGN KEY (area) REFERENCES Area(ID),
    FOREIGN KEY (visitante) REFERENCES Visitante(ID));

-- Crear la tabla Personal_Gestion_Visita
CREATE TABLE Personal_Gestion_Visita (
    gestion INT,
    visita INT,
    PRIMARY KEY (gestion, visita),
    FOREIGN KEY (gestion) REFERENCES Personal(ID),
    FOREIGN KEY (visita) REFERENCES Visita(ID));