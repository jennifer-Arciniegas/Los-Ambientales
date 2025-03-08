drop database Gestion_Parques_Naturales;
create database Gestion_Parques_Naturales;
use Gestion_Parques_Naturales;

create table Entidad( ID int auto_increment primary key, nombre varchar(100) not null);

create table Departamento ( ID int auto_increment primary key, nombre varchar(50) not null,  capital varchar(50) not null,
 Entidad_id int,  foreign key (Entidad_id) references Entidad(ID));

create table Parque (ID int auto_increment primary key,  nombre varchar(100) not null, fecha_declaracion date  not null);
 
 create table Departamento_Parque ( Departamento_id int not null, parque_id int not null,
  primary key (Departamento_id, parque_id),
  foreign key (Departamento_id) references Departamento(ID),
  foreign key (parque_id) references Parque(ID));
 
 create table Area (ID int auto_increment primary key, nombre varchar(50) not null, extencion_hectareas double not null,
  parque_id int, foreign key(parque_id) references Parque (ID));
 
 create table Especie(ID int auto_increment primary key, nombre_cientifico varchar(100) not null, nombre_comun varchar(50),
  numero_inventario int not null, tipo enum('Animal','Mineral','Vegetal') not null,  Area_id int, foreign key (Area_id) references Area(ID));
 
 create table Personal(ID int auto_increment primary key, 
 cedula varchar(15) not null, nombre varchar(100) not null, Apellido1 varchar(50) not null, Apellido2 varchar(50) not null, 
 direccion varchar(50) not null, telefono varchar(13), telefono_movil varchar(13) not null, tipoCodigo enum("001", "002", "003", "004"),
 tipoPersonal enum("Gestion", "Vigilancia", "Conservacion", "Investigador"),  especialidad varchar(50), sueldo double not null,
 Area_id int, foreign key(Area_id) references Area(ID));
 
create table Vehiculo(ID int auto_increment primary key, tipo varchar(50) not null, marca varchar(50) not null);

create table Vigilante_vehiculo(vigilante_id int, vehiculo_id int,
foreign key(vigilante_id) references Personal(ID), foreign key(vehiculo_id) references Vehiculo(ID), primary key(vigilante_id,vehiculo_id));

create table ProyectoInvestigacion (ID int auto_increment primary key, nombre text not null, presupuesto double not null,
inicioInvestigacio date not null, finInvestigacion date );

create table investigador_proyecto(investigador int, proyecto int, 
foreign key(investigador) references Personal(ID), foreign key(proyecto) references ProyectoInvestigacion(ID), primary key(investigador,proyecto));

create table especies_investigadas(especie int, investigacion int, 
foreign key(especie) references Especie(ID), foreign key(investigacion) references ProyectoInvestigacion(ID), 
primary key(especie, investigacion));

create table Alojamiento (ID int auto_increment primary key, categoria enum ("cabaña", "hotel", "campings"), capacidad int, 
parque int, foreign key(parque) references Parque(ID));

create table Visitante(ID int auto_increment primary key, cedula varchar(15) not null, nombre varchar(50) not null,
Apellido1 varchar(50) not null, Apellido2 varchar(50) not null, direccion varchar(50) not null, telefono varchar(13),
profesion varchar(50) not null, alojamiento int, foreign key(alojamiento) references Alojamiento(ID));

create table Visita(ID int auto_increment primary key,
ingreso datetime default CURRENT_TIMESTAMP, salida datetime null, area int, visitante int,
foreign key(area) references Area(ID), foreign key(visitante) references Visitante(ID));

create table Personal_Gestion_Visita(gestion int, visita int, foreign key(gestion) references Personal(ID),
foreign key(visita) references Visita(ID), primary key(gestion, visita ));

  