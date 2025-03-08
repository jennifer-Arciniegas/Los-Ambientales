USE Gestion_Parques_Naturales;
-- 1. Registrar un nuevo parque en un departamto expesificado por su ID el cual devuelve el registro
delimiter $$
create procedure RegistrarParque(in nombre varchar(100), in fechaDeclaracion date, in departamento int)
begin
	declare recienReg int; 
	-- insertar el nuevo parque
	INSERT into Parque(nombre, fecha_declaracion) values (nombre, fechaDeclaracion);
	
	-- obetener el ultimo, recien registrado
	set recienReg = LAST_INSERT_ID();
	
	-- insertar en la tabla relacion deapartamento - parque
	-- para que este asociado
	insert into Departamento_Parque(Departamento_id, parque_id) values (departamento, recienReg);
	-- lo que se vera al momento del registro
	select p.*, d.*
	from Departamento_Parque dp
	join Parque p on p.ID = dp.parque_id 
	JOIN Departamento d on d.ID = dp.Departamento_id 
	where p.ID = recienReg;
		
	
end$$
delimiter ;
-- prueba de funcionamiento
-- CALL RegistrarParque("Parque laguna lunar", "2025-02-13", 3);

-- 2. Actualizar datos de un parque existente y muestra la cantida de registros actualizados
delimiter $$
CREATE procedure ActualizarParque(in u_ID int, in u_nombre varchar(100), in u_fechaDeclaracion date)
begin
	UPDATE Parque 
	SET nombre = u_nombre, 
	fecha_declaracion = u_fechaDeclaracion where ID = u_ID;
	SELECT row_count() as "Registro Actualizado";
end $$
delimiter ;
CALL ActualizarParque(51,"Parque Lagos de Luna", "2025-02-13");




