USE Gestion_Parques_Naturales;
-- Administrador
-- rol
drop role if exists administrador;
create role administrador;
grant all privileges on gestion_parques_naturales.* to administrador;
-- ususario 
drop user if exists 'usuario_admin'@'localhost';
create user 'usuario_admin'@'localhost' identified by 'AdminPas111s';
grant administrador to 'usuario_admin'@'localhost';
flush privileges;


-- gestion   Gestión de parques, áreas y especies.
-- rol
drop role if exists gestor_parques;
create role gestor_parques;
-- Otorgar permisos para gestionar parques, áreas y especies
grant select, insert, update, delete on Parque to gestor_parques;
grant select, insert, update, delete on Area to gestor_parques;
grant select, insert, update, delete on Especie to gestor_parques;	
-- usuario
drop user if exists 'usuario_gestor'@'localhost';
create user 'usuario_gestor'@'localhost' identified by 'Gestor1234Pass';
grant gestor_parques to 'usuario_gestor'@'localhost';
flush privileges;

-- INVESTIGADOR   Acceso a datos de proyectos y especies.

-- rol 
drop role if exists investigador;
create role investigador;
grant select on ProyectoInvestigacion to investigador;
grant select on Especies_Investigadas to investigador;
grant select on Especie to investigador; 

-- usuario
drop user if exists 'usuario_investigador'@'localhost';
create user 'usuario_investigador'@'localhost' identified by 'Investigador5678Pass';
grant investigador to 'usuario_investigador'@'localhost';
flush privileges;

-- Audior  Acceso a reportes financieros.
-- rol
drop role if exists auditoria;
create role auditoria;
grant select on ProyectoInvestigacion to auditoria;
-- usuario 
drop user if exists 'usuario_auditoria'@'localhost';
create user 'usuario_auditoria'@'localhost' identified by 'AuditorPass123';
grant auditoria to 'usuario_auditoria'@'localhost';
flush privileges;


-- Encargado de visitantes: Gestión de visitantes y alojamientos.
-- no precisamente el rol de gestion pues puede ser parte del personal que registra los visitante
-- rol
drop role if exists encargado_visitantes;
create role encargado_visitantes;
grant select, insert, update, delete on Visitante to encargado_visitantes;
grant select, insert, update, delete on Alojamiento to encargado_visitantes;
-- usuario
drop user if exists 'usuario_encargado'@'localhost';
create user 'usuario_encargado'@'localhost' identified by 'EncargadoPass987';
grant encargado_visitantes to 'usuario_encargado'@'localhost';
flush privileges;

