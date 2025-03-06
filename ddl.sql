drop database Gestion_Parques_Naturales;
CREATE database Gestion_Parques_Naturales;
use Gestion_Parques_Naturales;

CREATE TABLE Entidad( ID int auto_increment primary key, nombre varchar(100) NOT NULL);
 
 CREATE TABLE Departamento ( ID int auto_increment primary key, nombre varchar(50) NOT NULL,  capital varchar(50) NOT NULL,
  Entidad_id int,  FOREIGN KEY (Entidad_id) REFERENCES Entidad(ID));
  
 CREATE TABLE Parque (ID int auto_increment primary key,  nombre varchar(100) NOT NULL, fecha_declaracion date NOT NULL);
 
 CREATE TABLE Departamento_Parques ( Departamento_id int NOT NULL, parque_id int NOT NULL,
  PRIMARY KEY (Departamento_id,parque_id), FOREIGN KEY (Departamento_id) REFERENCES Departamento (ID),
  FOREIGN KEY (parque_id) REFERENCES Parque(ID));
  
 CREATE TABLE Areas (ID int auto_increment primary key, nombre varchar(50) NOT NULL, extencion_hectareas double NOT NULL,
  parque_id int, FOREIGN KEY (parque_id) REFERENCES Parque (ID));
  
 CREATE TABLE Especies(
  ID int auto_increment primary key, nombre_cientifico varchar(100) NOT NULL, nombre_vulgar varchar(50) DEFAULT NULL,
  inventario int NOT NULL, tipo enum('Animal','Mineral','Vegetal') NOT NULL,  Area_id int, FOREIGN KEY (Area_id) REFERENCES Areas (ID));
  
 CREATE TABLE Personal(ID int auto_increment primary key, 
 Cedula varchar(15) not null, nombre varchar(50) not null, Apellido1 varchar(50) not null, Apellido2 varchar(50) not null, 
 direccion varchar(50) not null, telefono varchar(13), telefono_movil varchar(13) not null, sueldo double not null, Area_id int,
 foreign key(Area_id) references Areas(ID));
 
CREATE table Conservacion(ID int default(003), personal_id int, especialidad varchar(50), primary key (ID, personal_id),
foreign key(personal_id) references Personal(ID));

CREATE table vigilancia(ID int default(002), personal_id int, primary key (ID, personal_id),
foreign key(personal_id) references Personal(ID));

create table Vehiculo(ID int auto_increment primary key, tipo varchar(50) not null, marca varchar(50) not null, 
personalVigilacia_id int, vigilancia_id int, 
foreign key (personalVigilacia_id, vigilancia_id)  REFERENCES vigilancia(personal_id, ID));

CREATE TABLE investigador(ID int default(004), personal_id int, foreign key(personal_id) references Personal(ID))



