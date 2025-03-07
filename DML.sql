use Gestion_Parques_Naturales;

-- Inserciones para Entidad
INSERT INTO Entidad (nombre) VALUES 
('Ministerio del Medio Ambiente'),
('Parques Nacionales Naturales'),
('Corporaciones Autónomas Regionales'),
('Instituto de Investigación Ambiental'),
('Conservación Internacional'),
('Fundación Natura'),
('WWF Colombia'),
('EcoParques'),
('Conservación de Bosques'),
('Fundación Río Vivo'),
('Vida Verde'),
('Parques del Caribe'),
('Protección Andina'),
('Guardianes de la Selva'),
('Fauna Viva'),
('Amazonía Protegida'),
('Reserva Natural Colombia'),
('EcoAmazonía'),
('Bosques de Paz'),
('Sierra Nevada Conservación'),
('Páramo Andino'),
('Humedales Colombia'),
('Vida Silvestre'),
('Selva Viva'),
('Rescate Ambiental'),
('Protección Jaguar'),
('Oso Andino Conservación'),
('Aves de Colombia'),
('Recursos Naturales Colombia'),
('Bioparque Colombia'),
('Agua Viva'),
('Ríos Libres'),
('Montaña Verde'),
('Mar Caribe Conservación'),
('Reserva Coralina'),
('Red de Parques Comunitarios'),
('Mares Vivos'),
('Sabana Protegida'),
('Guardabosques Andinos'),
('Proyecto Arrecife'),
('Ecosistemas Andinos'),
('Patrimonio Natural'),
('Rescate Manglar'),
('Guardianes del Agua'),
('Alianza Verde'),
('Conservación Litoral'),
('Jardín Botánico Nacional'),
('Fundación Biodiversidad'),
('Fauna Viva Colombia'),
('Reserva Tropical');


-- Inserciones para Departamento
INSERT INTO Departamento (nombre, capital, Entidad_id) VALUES 
('Antioquia', 'Medellín', 2),
('Cundinamarca', 'Bogotá', 3),
('Santander', 'Bucaramanga', 4),
('Valle del Cauca', 'Cali', 5),
('Amazonas', 'Leticia', 6),
('Chocó', 'Quibdó', 7),
('Boyacá', 'Tunja', 8),
('Atlántico', 'Barranquilla', 9),
('Córdoba', 'Montería', 10),
('La Guajira', 'Riohacha', 11),
('Huila', 'Neiva', 12),
('Magdalena', 'Santa Marta', 13),
('Nariño', 'Pasto', 14),
('Putumayo', 'Mocoa', 15),
('Tolima', 'Ibagué', 16),
('Cauca', 'Popayán', 17),
('Caquetá', 'Florencia', 18),
('Cesar', 'Valledupar', 19),
('Guaviare', 'San José del Guaviare', 20),
('Guainía', 'Inírida', 21),
('Meta', 'Villavicencio', 22),
('Vaupés', 'Mitú', 23),
('Vichada', 'Puerto Carreño', 24),
('Arauca', 'Arauca', 25),
('Quindío', 'Armenia', 26),
('Norte de Santander', 'Cúcuta', 27),
('San Andrés y Providencia', 'San Andrés', 28),
('Caldas', 'Manizales', 29),
('Risaralda', 'Pereira', 30),
('Bolívar', 'Cartagena', 31),
('Sucre', 'Sincelejo', 32),
('Casanare', 'Yopal', 33),
('Archipiélago de San Andrés', 'San Andrés', 34),
('Chocó', 'Quibdó', 35),
('Boyacá', 'Tunja', 36),
('Atlántico', 'Barranquilla', 37),
('Córdoba', 'Montería', 38),
('La Guajira', 'Riohacha', 39),
('Huila', 'Neiva', 40),
('Magdalena', 'Santa Marta', 41),
('Casanare', 'Yopal', 42),
('Arauca', 'Arauca', 43),
('Quindío', 'Armenia', 44),
('Norte de Santander', 'Cúcuta', 45),
('San Andrés y Providencia', 'San Andrés', 46),
('Caldas', 'Manizales', 47),
('Risaralda', 'Pereira', 48),
('Bolívar', 'Cartagena', 49),
('Sucre', 'Sincelejo', 50);

INSERT INTO Parque (nombre, fecha_declaracion) VALUES 
('Parque Nacional Natural Tayrona', '1964-04-24'),
('Parque Nacional Natural Sierra Nevada de Santa Marta', '1977-07-30'),
('Parque Nacional Natural Los Nevados', '1974-04-30'),
('Parque Nacional Natural El Cocuy', '1977-05-02'),
('Parque Nacional Natural Macuira', '1977-06-01'),
('Parque Nacional Natural Amacayacu', '1975-10-06'),
('Parque Nacional Natural Chingaza', '1977-05-06'),
('Parque Nacional Natural Farallones de Cali', '1968-01-01'),
('Parque Nacional Natural Las Orquídeas', '1974-03-03'),
('Parque Nacional Natural Utría', '1987-11-19'),
('Parque Nacional Natural Paramillo', '1977-08-08'),
('Parque Nacional Natural Gorgona', '1984-06-18'),
('Parque Nacional Natural Sumapaz', '1977-02-07'),
('Parque Nacional Natural Los Katíos', '1974-08-06'),
('Parque Nacional Natural Cahuinarí', '1987-08-26'),
('Parque Nacional Natural Old Providence McBean Lagoon', '1995-06-20'),
('Parque Nacional Natural Serranía de Chiribiquete', '1989-09-21'),
('Parque Nacional Natural Tinigua', '1989-10-22'),
('Parque Nacional Natural Puracé', '1961-04-22'),
('Parque Nacional Natural Tuparro', '1970-07-12'),
('Parque Nacional Natural Pisba', '1977-02-13'),
('Parque Nacional Natural Cordillera de los Picachos', '1977-09-28'),
('Parque Nacional Natural Los Flamencos', '1977-11-06'),
('Parque Nacional Natural Munchique', '1977-03-14'),
('Parque Nacional Natural La Paya', '1984-05-16'),
('Parque Nacional Natural Otún Quimbaya', '1996-06-10'),
('Parque Nacional Natural Isla de Salamanca', '1964-06-02'),
('Parque Nacional Natural Selva de Florencia', '1977-05-28'),
('Parque Nacional Natural Doña Juana Cascabel', '1989-10-04'),
('Parque Nacional Natural Galeras', '1985-06-17'),
('Parque Nacional Natural Sanquianga', '1977-11-13'),
('Parque Nacional Natural Corales del Rosario y San Bernardo', '1977-08-01'),
('Parque Nacional Natural Chorro El Indio', '1999-09-15'),
('Parque Nacional Natural Bahía Portete', '2003-08-06'),
('Parque Nacional Natural Serranía de Macuira', '1977-07-30'),
('Parque Nacional Natural Sierra de la Macarena', '1989-06-06'),
('Parque Nacional Natural Nukak', '1989-08-16'),
('Parque Nacional Natural Río Puré', '2002-10-05'),
('Parque Nacional Natural Acandí', '1987-09-30'),
('Parque Nacional Natural Churumbelos', '1999-06-22'),
('Parque Nacional Natural La Guajira', '1977-07-06'),
('Parque Nacional Natural Las Hermosas', '1977-05-17'),
('Parque Nacional Natural Bahía Málaga', '2010-02-08'),
('Parque Nacional Natural Guácharos', '1975-10-29'),
('Parque Nacional Natural Iguaque', '1977-02-13'),
('Parque Nacional Natural Puracé', '1977-09-29'),
('Parque Nacional Natural Yariguíes', '2005-08-08'),
('Parque Nacional Natural Uramba', '2010-10-19'),
('Parque Nacional Natural Los Colorados', '1977-02-19'),
('Parque Nacional Natural Serranía de los Motilones', '1990-07-05');


-- Inserciones para Departamento_Parque
INSERT INTO Departamento_Parque (Departamento_id, parque_id) VALUES 
(12, 1),
(13, 2),
(29, 3),
(7, 4),
(10, 5),
(5, 6),
(2, 7),
(4, 8),
(6, 9),
(35, 10),
(38, 11),
(4, 12),
(2, 13),
(6, 14),
(5, 15),
(28, 16),
(22, 17),
(22, 18),
(17, 19),
(24, 20),
(36, 21),
(22, 22),
(11, 23),
(17, 24),
(18, 25),
(48, 26),
(13, 27),
(29, 28),
(14, 29),
(14, 30),
(15, 31),
(31, 32),
(45, 33),
(11, 34),
(22, 35),
(20, 36),
(20, 37),
(21, 38),
(6, 39),
(14, 40),
(11, 41),
(17, 42),
(4, 43),
(18, 44),
(36, 45),
(17, 46),
(26, 47),
(30, 48),
(31, 49),
(41, 50);

INSERT INTO Area (nombre, extencion_hectareas, parque_id) VALUES
('Área Tayrona - Sector Norte', 5000.0, 1),
('Área Tayrona - Sector Sur', 3000.0, 1),
('Área Sierra Nevada - Sector Occidental', 4500.0, 2),
('Área Sierra Nevada - Sector Central', 6000.0, 2),
('Área Los Nevados - Sector Alto', 7000.0, 3),
('Área Los Nevados - Sector Bajo', 8000.0, 3),
('Área El Cocuy - Sector Oriental', 3500.0, 4),
('Área El Cocuy - Sector Central', 4200.0, 4),
('Área Macuira - Sector Este', 2500.0, 5),
('Área Macuira - Sector Oeste', 3000.0, 5),
('Área Amacayacu - Sector Amazonas', 4000.0, 6),
('Área Amacayacu - Sector Caribe', 4500.0, 6),
('Área Chingaza - Sector Bosque', 5200.0, 7),
('Área Chingaza - Sector Páramo', 5700.0, 7),
('Área Farallones de Cali - Sector Norte', 3300.0, 8),
('Área Farallones de Cali - Sector Sur', 3500.0, 8),
('Área Las Orquídeas - Sector Central', 2800.0, 9),
('Área Las Orquídeas - Sector Occidental', 3500.0, 9),
('Área Utría - Sector Costero', 1800.0, 10),
('Área Utría - Sector Marino', 2200.0, 10),
('Área Paramillo - Sector Alto', 4300.0, 11),
('Área Paramillo - Sector Bajo', 4800.0, 11),
('Área Gorgona - Sector Insular', 2000.0, 12),
('Área Gorgona - Sector Marino', 2500.0, 12),
('Área Sumapaz - Sector Alto', 6000.0, 13),
('Área Sumapaz - Sector Bajo', 6500.0, 13),
('Área Los Katíos - Sector Chocó', 7000.0, 14),
('Área Los Katíos - Sector Urabá', 7200.0, 14),
('Área Cahuinarí - Sector Amazonas', 5500.0, 15),
('Área Cahuinarí - Sector Llanos', 6000.0, 15),
('Área Old Providence McBean Lagoon - Sector Coral', 1500.0, 16),
('Área Old Providence McBean Lagoon - Sector Playa', 1800.0, 16),
('Área Chiribiquete - Sector Sur', 8000.0, 17),
('Área Chiribiquete - Sector Norte', 8500.0, 17),
('Área Tinigua - Sector Páramo', 5500.0, 18),
('Área Tinigua - Sector Bosque', 6000.0, 18),
('Área Puracé - Sector Páramo', 2300.0, 19),
('Área Puracé - Sector Andino', 2700.0, 19),
('Área Tuparro - Sector Llanos', 4000.0, 20),
('Área Tuparro - Sector Río', 4500.0, 20),
('Área Pisba - Sector Alto', 3000.0, 21),
('Área Pisba - Sector Bajo', 3500.0, 21),
('Área Cordillera de los Picachos - Sector Norte', 5000.0, 22),
('Área Cordillera de los Picachos - Sector Sur', 5500.0, 22),
('Área Los Flamencos - Sector Costero', 2200.0, 23),
('Área Los Flamencos - Sector Manglar', 2700.0, 23),
('Área Munchique - Sector Alto', 3900.0, 24),
('Área Munchique - Sector Bajo', 4200.0, 24),
('Área La Paya - Sector Norte', 2500.0, 25),
('Área La Paya - Sector Sur', 3000.0, 25);

-- Categoría Animal 
INSERT INTO Especie (nombre_cientifico, nombre_comun, numero_inventario, tipo, Area_id) VALUES
('Panthera onca', 'Jaguar', 101, 'Animal', 1),
('Atelopus varius', 'Sapo de los Andes', 102, 'Animal', 2),
('Tayassu tajacu', 'Jabali', 103, 'Animal', 3),
('Cuniculus paca', 'Paca', 104, 'Animal', 4),
('Amazona ochrocephala', 'Loro cabeza amarilla', 105, 'Animal', 5),
('Puma concolor', 'Puma', 106, 'Animal', 6),
('Brachyteles arachnoides', 'Mono araña', 107, 'Animal', 7),
('Anoura fistulata', 'Murciélago trompetero', 108, 'Animal', 8),
('Crocodylus acutus', 'Cocodrilo americano', 109, 'Animal', 9),
('Cervus elaphus', 'Ciervo rojo', 110, 'Animal', 10);

-- Categoría Vegetal 
INSERT INTO Especie (nombre_cientifico, nombre_comun, numero_inventario, tipo, Area_id) VALUES
('Quercus humboldtii', 'Roble', 201, 'Vegetal', 11),
('Pinus radiata', 'Pino', 202, 'Vegetal', 12),
('Bactris gasipaes', 'Palma de pejibaye', 203, 'Vegetal', 13),
('Erythrina fusca', 'Caña fleha', 204, 'Vegetal', 14),
('Coffea arabica', 'Café', 205, 'Vegetal', 15),
('Ginkgo biloba', 'Ginkgo', 206, 'Vegetal', 16),
('Piper nigrum', 'Pimienta', 207, 'Vegetal', 17),
('Vitis vinifera', 'Uva', 208, 'Vegetal', 18),
('Tectona grandis', 'Teak', 209, 'Vegetal', 19),
('Ficus carica', 'Higuera', 210, 'Vegetal', 20);

-- Categoría Mineral 
INSERT INTO Especie (nombre_cientifico, nombre_comun, numero_inventario, tipo, Area_id) VALUES
('Fe2O3', 'Hematita', 301, 'Mineral', 21),
('Cu2O', 'Óxido cuproso', 302, 'Mineral', 22),
('SiO2', 'Sílice', 303, 'Mineral', 23),
('NaCl', 'Sal común', 304, 'Mineral', 24),
('CaCO3', 'Carbonato de calcio', 305, 'Mineral', 25),
('Al2O3', 'Alúmina', 306, 'Mineral', 26),
('ZnS', 'Blenda', 307, 'Mineral', 27),
('MgCO3', 'Magnesita', 308, 'Mineral', 28),
('TiO2', 'Dióxido de titanio', 309, 'Mineral', 29),
('PbS', 'Galena', 310, 'Mineral', 30);

-- Categoría Animal 
INSERT INTO Especie (nombre_cientifico, nombre_comun, numero_inventario, tipo, Area_id) VALUES
('Aratinga erythrogenys', 'Cotorra de pico rojo', 111, 'Animal', 11),
('Amazona amazonica', 'Loro verde', 112, 'Animal', 12),
('Corvus corax', 'Cuervo', 113, 'Animal', 13),
('Alouatta palliata', 'Mono aullador', 114, 'Animal', 14),
('Lagothrix lagotricha', 'Mono nocturno', 115, 'Animal', 15);

-- Categoría Vegetal 
INSERT INTO Especie (nombre_cientifico, nombre_comun, numero_inventario, tipo, Area_id) VALUES
('Alnus acuminata', 'Aliso', 211, 'Vegetal', 21),
('Myrcianthes leucoxyla', 'Guayabo', 212, 'Vegetal', 22),
('Cinnamomum verum', 'Canela', 213, 'Vegetal', 23),
('Solanum tuberosum', 'Papa', 214, 'Vegetal', 24),
('Capsicum annuum', 'Pimiento', 215, 'Vegetal', 25);

-- Categoría Mineral 
INSERT INTO Especie (nombre_cientifico, nombre_comun, numero_inventario, tipo, Area_id) VALUES
('BaSO4', 'Barita', 311, 'Mineral', 31),
('KAlSi3O8', 'Ortoclasa', 312, 'Mineral', 32),
('FeS2', 'Pirita', 313, 'Mineral', 33),
('CaSO4', 'Yeso', 314, 'Mineral', 34),
('Cr2O3', 'Óxido de cromo', 315, 'Mineral', 35);

-- Categoría Animal 
INSERT INTO Especie (nombre_cientifico, nombre_comun, numero_inventario, tipo, Area_id) VALUES
('Loxodonta africana', 'Elefante africano', 116, 'Animal', 16),
('Rangifer tarandus', 'Reno', 117, 'Animal', 17),
('Mammuthus primigenius', 'Mamut lanudo', 118, 'Animal', 18),
('Ctenosaura pectinata', 'Iguana de cola espinosa', 119, 'Animal', 19),
('Rhea americana', 'Ñandú', 120, 'Animal', 20);


-- Insertar registros en la tabla Personal (50 registros)
INSERT INTO Personal (cedula, nombre, Apellido1, Apellido2, direccion, telefono, telefono_movil, tipoCodigo, tipoPersonal, especialidad, sueldo, Area_id) VALUES
('1012345678', 'Juan', 'Pérez', 'García', 'Carrera 5 # 23-45', '3123456789', '3151234567', '001', 'Vigilancia', 'Vigilante', 1500, 1),
('1012345679', 'María', 'Rodríguez', 'López', 'Calle 6 # 11-23', '3123456790', '3151234568', '002', 'Gestión', 'Coordinadora de Proyectos', 2000, 2),
('1012345680', 'Carlos', 'Martínez', 'Ramírez', 'Avenida 8 # 45-67', '3123456791', '3151234569', '003', 'Conservacion', 'Botánico', 1800, 3),
('1012345681', 'Ana', 'González', 'Sánchez', 'Carrera 10 # 12-34', '3123456792', '3151234570', '004', 'Investigador', 'Ecólogo', 2500, 4),
('1012345682', 'Luis', 'Fernández', 'Torres', 'Calle 4 # 56-78', '3123456793', '3151234571', '001', 'Vigilancia', 'Vigilante', 1600, 5),
('1012345683', 'Elena', 'Vargas', 'Díaz', 'Avenida 7 # 22-33', '3123456794', '3151234572', '002', 'Gestión', 'Administradora', 2200, 6),
('1012345684', 'Ricardo', 'López', 'Mora', 'Calle 9 # 65-32', '3123456795', '3151234573', '003', 'Conservacion', 'Guardabosques', 1700, 7),
('1012345685', 'Julia', 'Castro', 'Paredes', 'Carrera 11 # 34-12', '3123456796', '3151234574', '004', 'Investigador', 'Biomédica', 2300, 8),
('1012345686', 'Pedro', 'Jiménez', 'Gómez', 'Calle 12 # 78-90', '3123456797', '3151234575', '001', 'Vigilancia', 'Vigilante', 1400, 9),
('1012345687', 'Sofía', 'Martínez', 'Hernández', 'Avenida 13 # 89-01', '3123456798', '3151234576', '002', 'Gestión', 'Contadora', 2100, 10),
('1012345688', 'Eduardo', 'Ruiz', 'Ramírez', 'Calle 14 # 23-45', '3123456799', '3151234577', '003', 'Conservacion', 'Biólogo', 1900, 11),
('1012345689', 'Paula', 'Sánchez', 'Morales', 'Carrera 15 # 34-56', '3123456800', '3151234578', '004', 'Investigador', 'Arqueóloga', 2400, 12),
('1012345690', 'Gabriel', 'Gómez', 'Díaz', 'Calle 16 # 56-78', '3123456801', '3151234579', '001', 'Vigilancia', 'Vigilante', 1500, 13),
('1012345691', 'Claudia', 'Torres', 'Lozano', 'Carrera 17 # 67-89', '3123456802', '3151234580', '002', 'Gestión', 'Supervisor', 2000, 14),
('1012345692', 'Fernando', 'Rojas', 'Hernández', 'Avenida 18 # 12-34', '3123456803', '3151234581', '003', 'Conservacion', 'Zoologo', 1800, 15),
('1012345693', 'Isabel', 'Ramírez', 'Castro', 'Calle 19 # 34-56', '3123456804', '3151234582', '004', 'Investigador', 'Meteorólogo', 2500, 16),
('1012345694', 'Jorge', 'Rodríguez', 'Pérez', 'Calle 20 # 45-67', '3123456805', '3151234583', '001', 'Vigilancia', 'Vigilante', 1600, 17),
('1012345695', 'Antonio', 'Mendoza', 'Vargas', 'Avenida 21 # 56-78', '3123456806', '3151234584', '002', 'Gestión', 'Planificador', 2200, 18),
('1012345696', 'Martín', 'García', 'Pérez', 'Carrera 22 # 67-89', '3123456807', '3151234585', '003', 'Conservacion', 'Ecologista', 1700, 19),
('1012345697', 'Laura', 'López', 'Molina', 'Calle 23 # 78-90', '3123456808', '3151234586', '004', 'Investigador', 'Geógrafa', 2300, 20),
('1012345698', 'Julián', 'Vásquez', 'Castillo', 'Carrera 24 # 89-01', '3123456809', '3151234587', '001', 'Vigilancia', 'Vigilante', 1400, 21),
('1012345699', 'Nicolás', 'Serrano', 'Jiménez', 'Avenida 25 # 01-23', '3123456810', '3151234588', '002', 'Gestión', 'Técnico', 2100, 22),
('1012345700', 'Lina', 'Álvarez', 'Núñez', 'Calle 26 # 34-56', '3123456811', '3151234589', '003', 'Conservacion', 'Botánico', 1900, 23),
('1012345701', 'Ricardo', 'Salazar', 'Rodríguez', 'Carrera 27 # 12-34', '3123456812', '3151234590', '004', 'Investigador', 'Antropólogo', 2400, 24),
('1012345702', 'Patricia', 'Castro', 'Paredes', 'Avenida 28 # 23-45', '3123456813', '3151234591', '001', 'Vigilancia', 'Vigilante', 1500, 25),
('1012345703', 'Felipe', 'Castaño', 'Muñoz', 'Calle 29 # 45-67', '3123456814', '3151234592', '002', 'Gestión', 'Coordinador', 2000, 26),
('1012345704', 'Alejandra', 'Cardenas', 'González', 'Carrera 30 # 56-78', '3123456815', '3151234593', '003', 'Conservacion', 'Técnico de campo', 1800, 27),
('1012345705', 'Andrés', 'Bermúdez', 'Gómez', 'Calle 31 # 67-89', '3123456816', '3151234594', '004', 'Investigador', 'Entomólogo', 2300, 28),
('1012345706', 'Mónica', 'Cordero', 'Soto', 'Avenida 32 # 78-90', '3123456817', '3151234595', '001', 'Vigilancia', 'Vigilante', 1600, 29),
('1012345707', 'Ricardo', 'Martínez', 'Romero', 'Carrera 33 # 12-34', '3123456818', '3151234596', '002', 'Gestión', 'Administrador', 2200, 30),
('1012345708', 'Gabriela', 'Gómez', 'Sánchez', 'Calle 34 # 56-78', '3123456819', '3151234597', '003', 'Conservacion', 'Biólogo marino', 1700, 31),
('1012345709', 'Felipe', 'Mora', 'Cano', 'Carrera 35 # 67-89', '3123456820', '3151234598', '004', 'Investigador', 'Botánico', 2400, 32),
('1012345710', 'Carlos', 'Ruíz', 'Olivares', 'Avenida 36 # 78-90', '3123456821', '3151234599', '001', 'Vigilancia', 'Vigilante', 1400, 33),
('1012345711', 'Luisa', 'González', 'Díaz', 'Calle 37 # 12-34', '3123456822', '3151234600', '002', 'Gestión', 'Analista', 2100, 34),
('1012345712', 'Eduardo', 'Castaño', 'Figueroa', 'Carrera 38 # 45-67', '3123456823', '3151234601', '003', 'Conservacion', 'Ornitólogo', 1900, 35),
('1012345713', 'Isabel', 'Vásquez', 'Morales', 'Avenida 39 # 56-78', '3123456824', '3151234602', '004', 'Investigador', 'Luminiscencia', 2300, 36),
('1012345714', 'Carlos', 'Mendoza', 'Silva', 'Calle 40 # 45-67', '3123456825', '3151234603', '001', 'Vigilancia', 'Vigilante', 1500, 37),
('1012345715', 'Verónica', 'Jiménez', 'Martínez', 'Carrera 41 # 12-34', '3123456826', '3151234604', '002', 'Gestión', 'Consultora', 2000, 38),
('1012345716', 'Raúl', 'González', 'Méndez', 'Avenida 42 # 34-56', '3123456827', '3151234605', '003', 'Conservacion', 'Ecólogo', 1800, 39),
('1012345717', 'Marta', 'Serrano', 'Ríos', 'Calle 43 # 56-78', '3123456828', '3151234606', '004', 'Investigador', 'Físico', 2500, 40),
('1012345718', 'Tomás', 'López', 'Hernández', 'Carrera 44 # 67-89', '3123456829', '3151234607', '001', 'Vigilancia', 'Vigilante', 1600, 41),
('1012345719', 'Mariana', 'Cruz', 'Gómez', 'Avenida 45 # 01-23', '3123456830', '3151234608', '002', 'Gestión', 'Gerente', 2300, 42),
('1012345720', 'José', 'Ramírez', 'Salazar', 'Calle 46 # 12-34', '3123456831', '3151234609', '003', 'Conservacion', 'Veterinario', 2000, 43),
('1012345721', 'Elena', 'Castro', 'Ortiz', 'Carrera 47 # 34-56', '3123456832', '3151234610', '004', 'Investigador', 'Antropóloga', 2400, 44),
('1012345722', 'Carlos', 'Gutiérrez', 'Paredes', 'Avenida 48 # 45-67', '3123456833', '3151234611', '001', 'Vigilancia', 'Vigilante', 1500, 45),
('1012345723', 'Sara', 'Pérez', 'Ramírez', 'Calle 49 # 56-78', '3123456834', '3151234612', '002', 'Gestión', 'Ingeniera', 2200, 46),
('1012345724', 'Fabiola', 'Vega', 'Torres', 'Carrera 50 # 67-89', '3123456835', '3151234613', '003', 'Conservacion', 'Agrónoma', 1800, 47),
('1012345725', 'Oscar', 'Moreno', 'Hernández', 'Avenida 51 # 78-90', '3123456836', '3151234614', '004', 'Investigador', 'Físico', 2300, 48),
('1012345726', 'Clara', 'Martínez', 'Ruiz', 'Calle 52 # 12-34', '3123456837', '3151234615', '001', 'Vigilancia', 'Vigilante', 1400, 49),
('1012345727', 'Pablo', 'Fernández', 'Mora', 'Carrera 53 # 34-56', '3123456838', '3151234616', '002', 'Gestión', 'Director', 2500, 50);

-- Insertar registros en la tabla Vehiculo (50 registros)
INSERT INTO Vehiculo (tipo, marca) VALUES
('Patrullero', 'Toyota'),
('Motocicleta', 'Honda'),
('Camioneta', 'Chevrolet'),
('Patrullero', 'Nissan'),
('Motocicleta', 'Yamaha'),
('Camioneta', 'Ford'),
('Patrullero', 'Mitsubishi'),
('Motocicleta', 'Kawasaki'),
('Camioneta', 'Ram'),
('Patrullero', 'Hyundai'),
('Motocicleta', 'Suzuki'),
('Camioneta', 'Isuzu'),
('Patrullero', 'Mazda'),
('Motocicleta', 'BMW'),
('Camioneta', 'GMC'),
('Patrullero', 'Volkswagen'),
('Motocicleta', 'Ducati'),
('Camioneta', 'Jeep'),
('Patrullero', 'Peugeot'),
('Motocicleta', 'Harley-Davidson'),
('Camioneta', 'Chrysler'),
('Patrullero', 'Renault'),
('Motocicleta', 'Triumph'),
('Camioneta', 'Fiat'),
('Patrullero', 'Subaru'),
('Motocicleta', 'Aprilia'),
('Camioneta', 'Land Rover'),
('Patrullero', 'Citroën'),
('Motocicleta', 'KTM'),
('Camioneta', 'Toyota'),
('Patrullero', 'Ford'),
('Motocicleta', 'Honda'),
('Camioneta', 'Chevrolet'),
('Patrullero', 'Mercedes-Benz'),
('Motocicleta', 'Yamaha'),
('Camioneta', 'Nissan'),
('Patrullero', 'BMW'),
('Motocicleta', 'Kawasaki'),
('Camioneta', 'Ram'),
('Patrullero', 'Mitsubishi'),
('Motocicleta', 'Ducati'),
('Camioneta', 'GMC'),
('Patrullero', 'Hyundai'),
('Motocicleta', 'Suzuki'),
('Camioneta', 'Isuzu'),
('Patrullero', 'Mazda'),
('Motocicleta', 'BMW'),
('Camioneta', 'Jeep'),
('Patrullero', 'Peugeot');

-- Insertar registros en la tabla Vigilante_vehiculo (50 registros)
INSERT INTO Vigilante_vehiculo (vigilante_id, vehiculo_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48),
(49, 49);

-- Insertar registros en la tabla ProyectoInvestigacion (50 proyectos)
INSERT INTO ProyectoInvestigacion (nombre, presupuesto, inicioInvestigacio, finInvestigacion) VALUES
('Monitoreo de la fauna en el Parque Nacional Natural Tayrona', 1500000.00, '2024-01-01', '2026-01-01'),
('Estudio de la biodiversidad en el Parque Nacional Natural Sierra Nevada de Santa Marta', 2000000.00, '2024-02-15', '2026-02-15'),
('Conservación de especies endémicas en el Parque Nacional Natural Los Nevados', 1200000.00, '2024-03-01', '2025-12-01'),
('Investigación sobre la flora del Parque Nacional Natural El Cocuy', 1000000.00, '2024-05-01', '2025-04-01'),
('Estudio de los ecosistemas acuáticos del Parque Nacional Natural Macuira', 1300000.00, '2024-06-01', '2025-06-01'),
('Monitoreo de especies en el Parque Nacional Natural Amacayacu', 1500000.00, '2024-04-10', '2026-04-10'),
('Investigación sobre el impacto humano en el Parque Nacional Natural Chingaza', 1800000.00, '2024-07-01', '2026-07-01'),
('Estudio de especies migratorias en el Parque Nacional Natural Farallones de Cali', 900000.00, '2024-08-01', '2025-08-01'),
('Conservación de orquídeas en el Parque Nacional Natural Las Orquídeas', 1100000.00, '2024-09-15', '2025-09-15'),
('Investigación sobre especies marinas en el Parque Nacional Natural Utría', 1400000.00, '2024-10-01', '2025-10-01'),
('Monitoreo de mamíferos en el Parque Nacional Natural Paramillo', 1200000.00, '2024-11-01', '2026-11-01'),
('Estudio sobre aves en el Parque Nacional Natural Gorgona', 950000.00, '2024-12-01', '2025-12-01'),
('Conservación de reptiles en el Parque Nacional Natural Sumapaz', 1300000.00, '2025-01-01', '2026-01-01'),
('Investigación sobre los ecosistemas en el Parque Nacional Natural Los Katíos', 1700000.00, '2025-02-01', '2026-02-01'),
('Estudio sobre flora y fauna en el Parque Nacional Natural Cahuinarí', 1100000.00, '2025-03-01', '2026-03-01'),
('Monitoreo de especies de aves en el Parque Nacional Natural Old Providence McBean Lagoon', 1000000.00, '2025-04-01', '2026-04-01'),
('Conservación de especies en el Parque Nacional Natural Serranía de Chiribiquete', 1500000.00, '2025-05-01', '2026-05-01'),
('Estudio de las especies de fauna en el Parque Nacional Natural Tinigua', 1300000.00, '2025-06-01', '2026-06-01'),
('Investigación sobre los ecosistemas en el Parque Nacional Natural Puracé', 1200000.00, '2025-07-01', '2026-07-01'),
('Monitoreo de especies en el Parque Nacional Natural Tuparro', 900000.00, '2025-08-01', '2026-08-01'),
('Estudio sobre flora y fauna en el Parque Nacional Natural Pisba', 1400000.00, '2025-09-01', '2026-09-01'),
('Investigación sobre especies endémicas en el Parque Nacional Natural Cordillera de los Picachos', 1200000.00, '2025-10-01', '2026-10-01'),
('Conservación de especies en el Parque Nacional Natural Los Flamencos', 1000000.00, '2025-11-01', '2026-11-01'),
('Estudio de mamíferos en el Parque Nacional Natural Munchique', 1100000.00, '2025-12-01', '2026-12-01'),
('Monitoreo de flora y fauna en el Parque Nacional Natural La Paya', 1300000.00, '2026-01-01', '2027-01-01'),
('Investigación sobre especies de flora en el Parque Nacional Natural Otún Quimbaya', 1200000.00, '2026-02-01', '2027-02-01'),
('Estudio sobre biodiversidad en el Parque Nacional Natural Isla de Salamanca', 1400000.00, '2026-03-01', '2027-03-01'),
('Investigación sobre ecosistemas en el Parque Nacional Natural Selva de Florencia', 1100000.00, '2026-04-01', '2027-04-01'),
('Monitoreo de especies de aves en el Parque Nacional Natural Doña Juana Cascabel', 900000.00, '2026-05-01', '2027-05-01'),
('Estudio de especies marinas en el Parque Nacional Natural Galeras', 1300000.00, '2026-06-01', '2027-06-01'),
('Investigación sobre ecosistemas acuáticos en el Parque Nacional Natural Sanquianga', 1200000.00, '2026-07-01', '2027-07-01'),
('Conservación de fauna en el Parque Nacional Natural Corales del Rosario y San Bernardo', 1500000.00, '2026-08-01', '2027-08-01'),
('Estudio sobre flora y fauna en el Parque Nacional Natural Chorro El Indio', 1400000.00, '2026-09-01', '2027-09-01'),
('Monitoreo de especies endémicas en el Parque Nacional Natural Bahía Portete', 1300000.00, '2026-10-01', '2027-10-01'),
('Investigación sobre la fauna en el Parque Nacional Natural Serranía de Macuira', 1100000.00, '2026-11-01', '2027-11-01'),
('Estudio de la biodiversidad en el Parque Nacional Natural Sierra de la Macarena', 1200000.00, '2026-12-01', '2027-12-01'),
('Conservación de especies en el Parque Nacional Natural Nukak', 1300000.00, '2027-01-01', '2028-01-01'),
('Investigación sobre flora en el Parque Nacional Natural Río Puré', 1400000.00, '2027-02-01', '2028-02-01'),
('Monitoreo de ecosistemas en el Parque Nacional Natural Acandí', 1100000.00, '2027-03-01', '2028-03-01'),
('Estudio sobre flora y fauna en el Parque Nacional Natural Churumbelos', 1200000.00, '2027-04-01', '2028-04-01'),
('Investigación sobre las especies en el Parque Nacional Natural La Guajira', 1000000.00, '2027-05-01', '2028-05-01'),
('Conservación de especies acuáticas en el Parque Nacional Natural Las Hermosas', 1100000.00, '2027-06-01', '2028-06-01'),
('Estudio sobre la fauna en el Parque Nacional Natural Bahía Málaga', 1300000.00, '2027-07-01', '2028-07-01'),
('Investigación sobre biodiversidad en el Parque Nacional Natural Guácharos', 1200000.00, '2027-08-01', '2028-08-01'),
('Monitoreo de especies en el Parque Nacional Natural Iguaque', 1400000.00, '2027-09-01', '2028-09-01'),
('Estudio sobre la fauna del Parque Nacional Natural Puracé', 1000000.00, '2027-10-01', '2028-10-01'),
('Investigación sobre flora endémica en el Parque Nacional Natural Yariguíes', 1300000.00, '2027-11-01', '2028-11-01'),
('Monitoreo de ecosistemas en el Parque Nacional Natural Uramba', 1400000.00, '2027-12-01', '2028-12-01');

-- Asociar investigadores a proyectos
INSERT INTO investigador_proyecto (investigador, proyecto) VALUES
(1, 1),  -- Investigador 1 asignado al Proyecto 1
(1, 2),  -- Investigador 1 asignado al Proyecto 2
(2, 2),  -- Investigador 2 asignado al Proyecto 2
(2, 3),  -- Investigador 2 asignado al Proyecto 3
(3, 3),  -- Investigador 3 asignado al Proyecto 3
(3, 4),  -- Investigador 3 asignado al Proyecto 4
(4, 4),  -- Investigador 4 asignado al Proyecto 4
(4, 5),  -- Investigador 4 asignado al Proyecto 5
(5, 5),  -- Investigador 5 asignado al Proyecto 5
(5, 6),  -- Investigador 5 asignado al Proyecto 6
(6, 6),  -- Investigador 6 asignado al Proyecto 6
(6, 7),  -- Investigador 6 asignado al Proyecto 7
(7, 7),  -- Investigador 7 asignado al Proyecto 7
(7, 8),  -- Investigador 7 asignado al Proyecto 8
(8, 8),  -- Investigador 8 asignado al Proyecto 8
(8, 9),  -- Investigador 8 asignado al Proyecto 9
(9, 9),  -- Investigador 9 asignado al Proyecto 9
(9, 10), -- Investigador 9 asignado al Proyecto 10
(10, 10), -- Investigador 10 asignado al Proyecto 10
(10, 11), -- Investigador 10 asignado al Proyecto 11
(11, 11), -- Investigador 11 asignado al Proyecto 11
(11, 12), -- Investigador 11 asignado al Proyecto 12
(12, 12), -- Investigador 12 asignado al Proyecto 12
(12, 13), -- Investigador 12 asignado al Proyecto 13
(13, 13), -- Investigador 13 asignado al Proyecto 13
(13, 14), -- Investigador 13 asignado al Proyecto 14
(14, 14), -- Investigador 14 asignado al Proyecto 14
(14, 15), -- Investigador 14 asignado al Proyecto 15
(15, 15), -- Investigador 15 asignado al Proyecto 15
(15, 16), -- Investigador 15 asignado al Proyecto 16
(16, 16), -- Investigador 16 asignado al Proyecto 16
(16, 17), -- Investigador 16 asignado al Proyecto 17
(17, 17), -- Investigador 17 asignado al Proyecto 17
(17, 18), -- Investigador 17 asignado al Proyecto 18
(18, 18), -- Investigador 18 asignado al Proyecto 18
(18, 19), -- Investigador 18 asignado al Proyecto 19
(19, 19), -- Investigador 19 asignado al Proyecto 19
(19, 20), -- Investigador 19 asignado al Proyecto 20
(20, 20), -- Investigador 20 asignado al Proyecto 20
(20, 21), -- Investigador 20 asignado al Proyecto 21
(21, 21), -- Investigador 21 asignado al Proyecto 21
(21, 22), -- Investigador 21 asignado al Proyecto 22
(22, 22), -- Investigador 22 asignado al Proyecto 22
(22, 23), -- Investigador 22 asignado al Proyecto 23
(23, 23), -- Investigador 23 asignado al Proyecto 23
(23, 24), -- Investigador 23 asignado al Proyecto 24
(24, 24), -- Investigador 24 asignado al Proyecto 24
(24, 25), -- Investigador 24 asignado al Proyecto 25
(25, 25), -- Investigador 25 asignado al Proyecto 25
(25, 26), -- Investigador 25 asignado al Proyecto 26
(26, 26), -- Investigador 26 asignado al Proyecto 26
(26, 27), -- Investigador 26 asignado al Proyecto 27
(27, 27), -- Investigador 27 asignado al Proyecto 27
(27, 28), -- Investigador 27 asignado al Proyecto 28
(28, 28), -- Investigador 28 asignado al Proyecto 28
(28, 29), -- Investigador 28 asignado al Proyecto 29
(29, 29), -- Investigador 29 asignado al Proyecto 29
(29, 30), -- Investigador 29 asignado al Proyecto 30
(30, 30), -- Investigador 30 asignado al Proyecto 30
(30, 31), -- Investigador 30 asignado al Proyecto 31
(31, 31), -- Investigador 31 asignado al Proyecto 31
(31, 32), -- Investigador 31 asignado al Proyecto 32
(32, 32), -- Investigador 32 asignado al Proyecto 32
(32, 33), -- Investigador 32 asignado al Proyecto 33
(33, 33), -- Investigador 33 asignado al Proyecto 33
(33, 34), -- Investigador 33 asignado al Proyecto 34
(34, 34), -- Investigador 34 asignado al Proyecto 34
(34, 35), -- Investigador 34 asignado al Proyecto 35
(35, 35), -- Investigador 35 asignado al Proyecto 35
(35, 36), -- Investigador 35 asignado al Proyecto 36
(36, 36), -- Investigador 36 asignado al Proyecto 36
(36, 37), -- Investigador 36 asignado al Proyecto 37
(37, 37), -- Investigador 37 asignado al Proyecto 37
(37, 38), -- Investigador 37 asignado al Proyecto 38
(38, 38), -- Investigador 38 asignado al Proyecto 38
(38, 39), -- Investigador 38 asignado al Proyecto 39
(39, 39), -- Investigador 39 asignado al Proyecto 39
(39, 40), -- Investigador 39 asignado al Proyecto 40
(40, 40), -- Investigador 40 asignado al Proyecto 40
(40, 41), -- Investigador 40 asignado al Proyecto 41
(41, 41), -- Investigador 41 asignado al Proyecto 41
(41, 42), -- Investigador 41 asignado al Proyecto 42
(42, 42), -- Investigador 42 asignado al Proyecto 42
(42, 43), -- Investigador 42 asignado al Proyecto 43
(43, 43), -- Investigador 43 asignado al Proyecto 43
(43, 44), -- Investigador 43 asignado al Proyecto 44
(44, 44), -- Investigador 44 asignado al Proyecto 44
(44, 45), -- Investigador 44 asignado al Proyecto 45
(45, 45), -- Investigador 45 asignado al Proyecto 45
(45, 46), -- Investigador 45 asignado al Proyecto 46
(46, 46), -- Investigador 46 asignado al Proyecto 46
(46, 47), -- Investigador 46 asignado al Proyecto 47
(47, 47), -- Investigador 47 asignado al Proyecto 47
(47, 48), -- Investigador 47 asignado al Proyecto 48
(48, 48); 

INSERT INTO especies_investigadas (especie, investigacion) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32),
(33, 33),
(34, 34),
(35, 35),
(36, 36),
(37, 37),
(38, 38),
(39, 39),
(40, 40),
(41, 41),
(42, 42),
(43, 43),
(44, 44),
(45, 45),
(46, 46),
(47, 47),
(48, 48);

INSERT INTO Alojamiento (categoria, capacidad, parque) VALUES
('cabaña', 4, 1),
('hotel', 30, 1),
('campings', 100, 2),
('cabaña', 5, 2),
('hotel', 50, 3),
('campings', 80, 3),
('cabaña', 6, 4),
('hotel', 40, 4),
('campings', 60, 5),
('cabaña', 4, 5),
('hotel', 35, 6),
('campings', 90, 6),
('cabaña', 7, 7),
('hotel', 25, 7),
('campings', 110, 8),
('cabaña', 8, 8),
('hotel', 45, 9),
('campings', 70, 9),
('cabaña', 4, 10),
('hotel', 50, 10),
('campings', 120, 11),
('cabaña', 5, 11),
('hotel', 30, 12),
('campings', 100, 12),
('cabaña', 6, 13),
('hotel', 40, 13),
('campings', 80, 14),
('cabaña', 7, 14),
('hotel', 45, 15),
('campings', 90, 15),
('cabaña', 4, 16),
('hotel', 50, 16),
('campings', 70, 17),
('cabaña', 6, 17),
('hotel', 35, 18),
('campings', 100, 18),
('cabaña', 5, 19),
('hotel', 40, 19),
('campings', 60, 20),
('cabaña', 7, 20),
('hotel', 45, 21),
('campings', 80, 21),
('cabaña', 4, 22),
('hotel', 50, 22),
('campings', 120, 23),
('cabaña', 5, 23),
('hotel', 30, 24),
('campings', 90, 24),
('cabaña', 6, 25),
('hotel', 40, 25),
('campings', 100, 26),
('cabaña', 7, 26);

INSERT INTO Visitante (cedula, nombre, Apellido1, Apellido2, direccion, telefono, profesion, alojamiento) VALUES
('1234567890', 'Carlos', 'Gómez', 'Martínez', 'Calle 12 #45-67', '3001234567', 'Biólogo', 1),
('2345678901', 'Ana', 'Pérez', 'Rodríguez', 'Carrera 8 #23-45', '3002345678', 'Ecóloga', 1),
('3456789012', 'Luis', 'Ramírez', 'Sánchez', 'Avenida 4 #12-56', '3003456789', 'Guía turístico', 2),
('4567890123', 'María', 'López', 'González', 'Calle 10 #34-78', '3004567890', 'Antropóloga', 3),
('5678901234', 'Pedro', 'Hernández', 'Martínez', 'Carrera 15 #56-89', '3005678901', 'Geógrafo', 4),
('6789012345', 'Laura', 'González', 'Moreno', 'Avenida 6 #23-45', '3006789012', 'Zoologa', 5),
('7890123456', 'Javier', 'Martínez', 'Lozano', 'Calle 8 #45-67', '3007890123', 'Ornitólogo', 6),
('8901234567', 'Carolina', 'Fernández', 'Vargas', 'Carrera 3 #21-34', '3008901234', 'Fotógrafa', 7),
('9012345678', 'Rafael', 'Ruiz', 'Paredes', 'Avenida 1 #78-90', '3009012345', 'Estadista ambiental', 8),
('1122334455', 'Juan', 'Díaz', 'Sánchez', 'Calle 5 #12-34', '3001122334', 'Botánico', 9),
('2233445566', 'María', 'Pérez', 'Alvarez', 'Carrera 2 #67-89', '3002233445', 'Vigilante ambiental', 10),
('3344556677', 'José', 'González', 'Martínez', 'Avenida 9 #56-12', '3003344556', 'Conservacionista', 11),
('4455667788', 'Sofía', 'Torres', 'González', 'Calle 11 #34-56', '3004455667', 'Investigadora', 12),
('5566778899', 'David', 'Rodríguez', 'Hernández', 'Carrera 4 #45-67', '3005566778', 'Geógrafo', 13),
('6677889900', 'Luis', 'Vega', 'Martínez', 'Avenida 7 #23-56', '3006677889', 'Zoológico', 14),
('7788990011', 'Claudia', 'Ramírez', 'López', 'Calle 3 #12-45', '3007788990', 'Antropóloga', 15),
('8899001122', 'Alberto', 'Sánchez', 'Lozano', 'Carrera 6 #56-78', '3008899001', 'Biólogo', 16),
('9900112233', 'Santiago', 'Vásquez', 'Gómez', 'Avenida 10 #34-56', '3009900112', 'Fotógrafo', 17),
('1022334455', 'Luis', 'Pérez', 'Méndez', 'Calle 9 #78-90', '3001022334', 'Ecoturista', 18),
('2133445566', 'Patricia', 'Hernández', 'Álvarez', 'Carrera 1 #12-45', '3002133445', 'Conservación', 19),
('3244556677', 'Isabel', 'Torres', 'Romero', 'Avenida 5 #23-56', '3003244556', 'Investigadora', 20),
('4355667788', 'Carlos', 'Ríos', 'González', 'Calle 2 #67-89', '3004355667', 'Guía de naturaleza', 21),
('5466778899', 'María', 'Vásquez', 'Sánchez', 'Carrera 9 #45-67', '3005466778', 'Educadora ambiental', 22),
('6577889900', 'Carlos', 'López', 'Hernández', 'Avenida 8 #12-34', '3006577889', 'Bióloga', 23),
('7688990011', 'Eduardo', 'Pérez', 'Ramírez', 'Calle 4 #78-90', '3007688990', 'Fotógrafo', 24),
('8799001122', 'César', 'Sánchez', 'Rodríguez', 'Carrera 3 #23-45', '3008799001', 'Biólogo', 25),
('9900112233', 'Ana', 'Díaz', 'González', 'Avenida 6 #34-56', '3009900112', 'Botánica', 26),
('1122334455', 'Raúl', 'Vega', 'Martínez', 'Calle 11 #45-67', '3001122334', 'Ecólogo', 27),
('2233445566', 'Lucía', 'González', 'Lozano', 'Carrera 7 #56-78', '3002233445', 'Vigilante de fauna', 28),
('3344556677', 'José', 'Mora', 'Sánchez', 'Avenida 3 #12-34', '3003344556', 'Ingeniero ambiental', 29),
('4455667788', 'Martina', 'Rodríguez', 'López', 'Calle 7 #45-67', '3004455667', 'Investigadora', 30),
('5566778899', 'Gerardo', 'Vargas', 'Martínez', 'Carrera 5 #23-45', '3005566778', 'Zoologista', 31),
('6677889900', 'Silvia', 'López', 'Hernández', 'Avenida 9 #67-89', '3006677889', 'Bióloga', 32),
('7788990011', 'Mario', 'Martínez', 'Lozano', 'Calle 8 #12-34', '3007788990', 'Antropóloga', 33),
('8899001122', 'Antonio', 'Sánchez', 'González', 'Carrera 2 #56-78', '3008899001', 'Ornitólogo', 34),
('9900112233', 'Elena', 'Ruiz', 'Serrano', 'Avenida 10 #34-56', '3009900112', 'Fotógrafa', 35),
('1022334455', 'Luz', 'Ramírez', 'Paredes', 'Calle 1 #12-45', '3001022334', 'Conservación', 36),
('2133445566', 'David', 'Hernández', 'González', 'Carrera 4 #67-89', '3002133445', 'Educadora ambiental', 37),
('3244556677', 'Nora', 'Vásquez', 'Sánchez', 'Avenida 12 #78-90', '3003244556', 'Bióloga', 38),
('4355667788', 'Eduardo', 'Sánchez', 'Lozano', 'Calle 13 #56-78', '3004355667', 'Guía ecológico', 39),
('5466778899', 'Fernando', 'López', 'Martínez', 'Carrera 8 #12-34', '3005466778', 'Zoologista', 40),
('6577889900', 'Susana', 'Torres', 'Gómez', 'Avenida 4 #23-45', '3006577889', 'Geógrafa', 41),
('7688990011', 'Lucía', 'Mora', 'Rodríguez', 'Calle 9 #45-67', '3007688990', 'Antropóloga', 42),
('8799001122', 'César', 'Ramírez', 'Méndez', 'Carrera 6 #78-90', '3008799001', 'Investigadora', 43),
('9900112233', 'Marta', 'Vega', 'Hernández', 'Avenida 2 #12-34', '3009900112', 'Conservacionista', 44),
('1122334455', 'Antonio', 'Sánchez', 'González', 'Calle 10 #67-89', '3001122334', 'Guía de fauna', 45),
('2233445566', 'Victoria', 'Pérez', 'Alvarez', 'Carrera 5 #23-45', '3002233445', 'Fotógrafa', 46),
('3344556677', 'Héctor', 'López', 'Paredes', 'Avenida 6 #34-56', '3003344556', 'Investigadora', 47),
('4455667788', 'Sofía', 'Torres', 'Sánchez', 'Calle 2 #12-34', '3004455667', 'Botánica', 48),
('5566778899', 'Miguel', 'Mora', 'González', 'Carrera 1 #23-45', '3005566778', 'Biólogo', 49),
('6677889900', 'Ángel', 'Martínez', 'Ramírez', 'Avenida 9 #78-90', '3006677889', 'Ornitólogo', 50);

INSERT INTO Visita (ingreso, salida, area, visitante) VALUES
('2025-03-01 08:00:00', '2025-03-01 18:00:00', 1, 1),
('2025-03-02 09:00:00', '2025-03-02 17:00:00', 2, 2),
('2025-03-03 10:00:00', '2025-03-03 16:00:00', 3, 3),
('2025-03-04 08:30:00', '2025-03-04 18:30:00', 4, 4),
('2025-03-05 07:45:00', '2025-03-05 17:45:00', 5, 5),
('2025-03-06 09:15:00', '2025-03-06 19:15:00', 6, 6),
('2025-03-07 10:00:00', '2025-03-07 16:00:00', 7, 7),
('2025-03-08 08:30:00', '2025-03-08 18:30:00', 8, 8),
('2025-03-09 09:00:00', '2025-03-09 17:00:00', 9, 9),
('2025-03-10 10:30:00', '2025-03-10 18:30:00', 10, 10),
('2025-03-11 08:00:00', '2025-03-11 16:00:00', 11, 11),
('2025-03-12 09:15:00', '2025-03-12 17:15:00', 12, 12),
('2025-03-13 10:30:00', '2025-03-13 16:30:00', 13, 13),
('2025-03-14 08:45:00', '2025-03-14 18:45:00', 14, 14),
('2025-03-15 09:30:00', '2025-03-15 19:30:00', 15, 15),
('2025-03-16 08:30:00', '2025-03-16 18:30:00', 16, 16),
('2025-03-17 07:45:00', '2025-03-17 17:45:00', 17, 17),
('2025-03-18 10:00:00', '2025-03-18 16:00:00', 18, 18),
('2025-03-19 09:00:00', '2025-03-19 17:00:00', 19, 19),
('2025-03-20 08:30:00', '2025-03-20 18:30:00', 20, 20),
('2025-03-21 10:00:00', '2025-03-21 16:00:00', 21, 21),
('2025-03-22 09:15:00', '2025-03-22 17:15:00', 22, 22),
('2025-03-23 08:00:00', '2025-03-23 18:00:00', 23, 23),
('2025-03-24 09:30:00', '2025-03-24 19:30:00', 24, 24),
('2025-03-25 10:00:00', '2025-03-25 16:00:00', 25, 25),
('2025-03-26 08:15:00', '2025-03-26 18:15:00', 26, 26),
('2025-03-27 09:45:00', '2025-03-27 19:45:00', 27, 27),
('2025-03-28 08:00:00', '2025-03-28 18:00:00', 28, 28),
('2025-03-29 10:30:00', '2025-03-29 16:30:00', 29, 29),
('2025-03-30 09:15:00', '2025-03-30 17:15:00', 30, 30),
('2025-03-31 08:30:00', '2025-03-31 18:30:00', 31, 31),
('2025-04-01 10:00:00', '2025-04-01 16:00:00', 32, 32),
('2025-04-02 08:15:00', '2025-04-02 18:15:00', 33, 33),
('2025-04-03 09:00:00', '2025-04-03 19:00:00', 34, 34),
('2025-04-04 10:30:00', '2025-04-04 16:30:00', 35, 35),
('2025-04-05 08:00:00', '2025-04-05 18:00:00', 36, 36),
('2025-04-06 09:15:00', '2025-04-06 19:15:00', 37, 37),
('2025-04-07 10:30:00', '2025-04-07 16:30:00', 38, 38),
('2025-04-08 08:30:00', '2025-04-08 18:30:00', 39, 39),
('2025-04-09 09:00:00', '2025-04-09 17:00:00', 40, 40),
('2025-04-10 10:00:00', '2025-04-10 16:00:00', 41, 41),
('2025-04-11 08:30:00', '2025-04-11 18:30:00', 42, 42),
('2025-04-12 09:15:00', '2025-04-12 19:15:00', 43, 43),
('2025-04-13 08:00:00', '2025-04-13 18:00:00', 44, 44),
('2025-04-14 10:30:00', '2025-04-14 16:30:00', 45, 45),
('2025-04-15 09:00:00', '2025-04-15 17:00:00', 46, 46),
('2025-04-16 08:30:00', '2025-04-16 18:30:00', 47, 47),
('2025-04-17 10:00:00', '2025-04-17 16:00:00', 48, 48),
('2025-04-18 09:15:00', '2025-04-18 19:15:00', 49, 49),
('2025-04-19 08:00:00', '2025-04-19 18:00:00', 50, 50);

-- Insertar registros en la tabla Personal_Gestion_Visita (50 registros)
INSERT INTO Personal_Gestion_Visita (gestion, visita) VALUES
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(6, 5),
(6, 6),
(7, 7),
(7, 8),
(10, 9),
(10, 10),
(12, 11),
(12, 12),
(14, 13),
(14, 14),
(16, 15),
(16, 16),
(18, 17),
(18, 18),
(20, 19),
(20, 20),
(22, 21),
(22, 22),
(24, 23),
(24, 24),
(26, 25),
(26, 26),
(28, 27),
(28, 28),
(30, 29),
(30, 30),
(32, 31),
(32, 32),
(34, 33),
(34, 34),
(36, 35),
(36, 36),
(38, 37),
(38, 38),
(40, 39),
(40, 40),
(42, 41),
(42, 42),
(44, 43),
(44, 44),
(46, 45),
(46, 46),
(48, 47),
(48, 48),
(50, 49),
(50, 50);


