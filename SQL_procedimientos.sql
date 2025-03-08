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

-- prueba de funcionamiento
-- CALL ActualizarParque(51,"Parque Lagos de Luna", "2025-02-13");

-- 3. Registrar una área nueva dentro de un parque
delimiter $$
create procedure RegistrarArea(in newArea varchar(50), in newExtencionHectareas double, in ParqueID int)
begin
	insert into Area (nombre, extencion_hectareas, parque_id) values (newArea, newExtencionHectareas, ParqueID );
	  select  concat('Área "', newArea, '" registrada exitosamente en el parque con ID ', ParqueID) as mensaje;

end $$

delimiter ;

-- prueba de funcionamiento
-- call RegistrarArea("lago central", 1, 51);

-- 4. Actualizar datos de un área existente
delimiter $$
create procedure ActualizarArea(in a_id int, in a_nombre varchar(50), in a_hectareas double, in parqueID int)
begin
	update Area 
	set nombre = a_nombre, extencion_hectareas = a_hectareas, parque_id = parqueID
	where ID = a_id;
	-- mostrar el registro actualizado
	select * from Area where ID = a_id;
end $$
delimiter ;
-- prueba de funcionamiento
-- call ActualizarArea(52, "Lago central - lotos", 400, 51);

-- 5. Registrar una nueva especie en un área
delimiter $$
create procedure RegistrarEspecie(in nombreCientifico varchar(100), in nombreComun varchar(50), in inventario int, 
in tipoEspecie varchar(50), in areaID int)
begin 
	insert into Especie (nombre_cientifico, nombre_comun, numero_inventario, tipo, area_id) values 
	(nombreCientifico, nombreComun, inventario, tipoEspecie, areaID);
	
end $$

delimiter ;

-- prueba de funcionamiento
-- call RegistrarEspecie("nymphaeaceae", "Loto blanco", 20, "Vegetal", 52);

-- 6. Actualizar la cantidad en el inventario de una especie existente
delimiter $$
create procedure ActualizarEspecie(in e_id int, in inventario int )
begin
	update Especie
	set  numero_inventario = inventario where ID = e_id;
	-- mostrar registro actualizado
	select * from Especie where ID = e_id;
end $$

delimiter ;
-- prueba de funcionamiento
-- call ActualizarEspecie(51, 30);

-- 7. Registrar un nuevo visitante y asignar alojamiento
delimiter $$
create procedure RegistrarVisitante(  
	in newCedula varchar(15),
    in newNombre varchar(50),
    in newApellido1 varchar(50),
    in newApellido2 varchar(50),
    in newDireccion varchar(50),
    in newTelefono varchar(13),
    in newPprofesion varchar(50),
    in alojamientoID int)
    
    begin
    	insert into Visitante (cedula, nombre, Apellido1, Apellido2, direccion, telefono, profesion, alojamiento) values
    	(newCedula, newNombre, newApellido1, newApellido2, newDireccion, newTelefono, newPprofesion, alojamientoID);
    	-- mostrar registro
    	select * from Visitante where ID = last_insert_id();
    end $$
    
delimiter ;
-- prueba de funcionamiento
-- CALL RegistrarVisitante( "1122334455",  "Ana", "Martínez", "López", "Carrera 45 #12-34", "3005678912",  "Ingeniera",  1);


-- 8. Actualizar datos de un visitante y reasignar alojamiento
delimiter $$

create procedure actualizarVisitante(
    in p_id int,
    in p_cedula varchar(15),
    in p_nombre varchar(50),
    in p_apellido1 varchar(50),
    in p_apellido2 varchar(50),
    in p_direccion varchar(50),
    in p_telefono varchar(13),
    in p_profesion varchar(50),
    in p_alojamiento_id int
)
begin
    update visitante 
    set cedula = p_cedula, nombre = p_nombre, apellido1 = p_apellido1, 
        apellido2 = p_apellido2, direccion = p_direccion, telefono = p_telefono, 
        profesion = p_profesion, alojamiento = p_alojamiento_id
    where id = p_id;
    
    select * from Visitante where ID = p_id;
end$$

delimiter ;

-- prueba de funcionamiento
-- call actualizarvisitante(  5, "987654321",  "Luis",  "González",  "Pérez", "Calle 23 #45-67",  "3123456789",  "Ecólogo",   2);

-- 9. Registrar una visita para un visitante y área específica ENTRADA
delimiter $$

create procedure registrarVisita(
    in visitanteID int,
    in areaID  int,
    in ingresa datetime
)
begin
    insert into visita (visitante, area, ingreso)
    values (visitanteID, areaID, ingresa);
    
   select * from visita where ID = LAST_INSERT_ID();
end $$

delimiter ;

-- prueba de funcionamiento
-- call registrarVisita(10, 3, '2025-03-07 14:30:00');


-- 10. registrar la salida de un visitante de un área específica - Actualizar tabla visita
delimiter $$

create procedure RegSalida_Visita(
    in id_visita int,
    in salio datetime
)
begin
	update visita set salida = salio where ID = id_visita;
	-- mostrar el registro
	 select * from visita where ID = id_visita;
end $$

delimiter ;

-- prueba de funcionamiento
-- call RegSalida_Visita(52, '2025-03-07 13:30:00');

-- 11. Asignar personal a un área específica
delimiter $$

create procedure asignar_personal_area(
    in personalID int,
    in areaID int
)
begin
    update personal 
    set area_id = areaID
    where id = personalID;
    -- muestra la asignacion 
   select p.ID, p.nombre, p.apellido1, a.nombre as Area, c.nombre as cargo
   from Personal p
   join Area a on a.ID = p.Area_id
   join Cargo c on c.ID = p.cargo_id
   where p.ID = personalID;
   
end $$

delimiter ;

-- prueba de funcionamiento
-- call asignar_personal_area(2, 2);

-- 12 Registrar personal
delimiter $$

create procedure registrarPersonal(
    in newCedula varchar(15),
    in newNombre varchar(100),
    in newApellido1 varchar(50),
    in newApellido2 varchar(50),
    in newDireccion varchar(50),
    in newTelefono varchar(13),
    in newTelefono_movil varchar(13),
    in newSueldo double,
    in area_id int,
    in cargo_id int
)
begin
    insert into personal (cedula, nombre, apellido1, apellido2, direccion, telefono, telefono_movil, sueldo, area_id, cargo_id)
    values (newCedula, newNombre, newApellido1, newApellido2, newDireccion, newTelefono, newTelefono_movil, newSueldo, area_id, cargo_id);
    
    -- Mostrar el registro recién insertado
    select * from personal where id = last_insert_id();
    
end $$

delimiter ;
-- prueba de funcionamiento
-- call registrarPersonal( '123456789', 'Carlos', 'López', 'Pérez', 'Calle 123', '601234567', '3012345678', 2500.00, 2, 3);

-- 13. Asignar vigilante a un vehículo y que muestre el registro y si ingresa otro codigo diferente al 3 muestre error 
delimiter $$

create procedure asignar_vigilante_vehiculo(
    in p_vigilante_id int,
    in p_vehiculo_id int
)
begin
    declare vigilanteID int;

    -- Obtener el cargo del vigilante
    select cargo_id into vigilanteID 
    from personal where id = p_vigilante_id;

    -- Verificar si el cargo es 3 (Vigilante)
    if vigilanteID = 3 then
    
        -- Insertar la asignación en la tabla intermedia
        insert into Vigilante_vehiculo (vigilante_id, vehiculo_id)
        values (p_vigilante_id, p_vehiculo_id);
        
        -- Mostrar el registro insertado
        select * from vigilante_vehiculo where vigilante_id = p_vigilante_id and vehiculo_id = p_vehiculo_id;
    else
        -- Mostrar mensaje de error si el cargo no es 3
        signal sqlstate '45000'
        set message_text = 'Error: El empleado no es un vigilante.';
    end if;
end $$

delimiter ;
-- prueba de funcionamiento
-- call asignar_vigilante_vehiculo(5, 2);

-- 14. Registrar un nuevo proyecto de investigación
delimiter $$

create procedure reg_proyecto_investigacion(
    in newnombre text,
    in newpresupuesto double,
    in f_inicio date,
    in f_fin date,
    in investigador_id int
)
begin
    -- Verificar si el investigador existe en la tabla Personal
    if not exists (select 1 from Personal where ID = investigador_id) then
        signal sqlstate '45000'
        set message_text = 'Error: El investigador no existe.';
    else
        -- Insertar el proyecto de investigación
        insert into ProyectoInvestigacion (nombre, presupuesto, inicioInvestigacion, finInvestigacion)
        values (newnombre, newpresupuesto, f_inicio, f_fin);

        set @proyecto_id = last_insert_id();

        -- Asignar el investigador al proyecto en la tabla Investigador_Proyecto
        insert into Investigador_Proyecto (investigador, proyecto)
        values (investigador_id, @proyecto_id);

        -- Mostrar el proyecto recién insertado con su investigador
        select pi.*, ip.investigador 
        from ProyectoInvestigacion pi
        join Investigador_Proyecto ip on pi.ID = ip.proyecto
        where pi.ID = @proyecto_id;
    end if;
end $$

delimiter ;
-- prueba de funcionamiento
 -- call reg_proyecto_investigacion( 'Estudio de Especies Marinas', 200000, '2025-04-01',  '2026-04-01',  10);


-- 15. Actualizar presupuesto de un proyecto de investigación
delimiter $$

create procedure actualizar_presupuesto_proyecto(
    in p_id int,
    in p_presupuesto double
)
begin
    -- Variable para verificar si el proyecto existe
    declare existe int default 0;

    -- Verificar si el proyecto de investigación existe
    select count(*) into existe from ProyectoInvestigacion where ID = p_id;

   
    if existe = 0 then
        signal sqlstate '45000'
        set message_text = 'Error: El proyecto de investigación no existe.';
    else
        
        update ProyectoInvestigacion 
        set presupuesto = p_presupuesto
        where ID = p_id;

        select * from ProyectoInvestigacion where ID = p_id;
    end if;
    
end $$

delimiter ;

-- prueba de funcionamiento
-- call actualizar_presupuesto_proyecto(52, 750000);

-- 16. Asignar investigador a un proyecto

delimiter $$ 

create procedure AsignarInvestigadorProyecto(in IDInvestigador int, in IDInvestigacion int)
begin
	declare existeInvestigador int default 0;
	declare existeInvestigacion int default 0;
	
	-- Verificar si el investigador existe y tiene cargo_id = 4 (investigador)
	select count(*) into existeInvestigador from Personal where ID = IDInvestigador and cargo_id = 4;
	
	-- Verificar si la investigación existe
	select count(*) into existeInvestigacion from ProyectoInvestigacion where ID = IDInvestigacion;
	
	-- Validaciones
	if existeInvestigador = 0 then
		signal sqlstate '45000'
		set message_text = 'El investigador no existe o no tiene el cargo adecuado.';
	elseif existeInvestigacion = 0 then 
		signal sqlstate '45000'
		set message_text = 'La investigación no existe.';
	else 
		-- Insertar la relación en la tabla de asignaciones
		insert into Investigador_Proyecto (investigador, proyecto) 
		values (IDInvestigador, IDInvestigacion); 
		
		-- Mostrar la asignación realizada
		select p.nombre as "Investigador", pi.nombre as "Investigación"
		from Investigador_Proyecto ip
		join Personal p on p.ID = ip.investigador
		join ProyectoInvestigacion pi on pi.ID = ip.proyecto
		where p.ID = IDInvestigador and pi.ID = IDInvestigacion;
	end if;
	
end $$

delimiter ;
-- prueba de funcionamiento
-- call AsignarInvestigadorProyecto(40, 52);

-- 18. Calcular presupuesto total de todos los proyectos
delimiter $$
create procedure CalcularPresupuestoTotal()
begin
	select ifnull(sum(presupuesto), 0) as Total from ProyectoInvestigacion;
end$$ 

delimiter ;
-- prueba de funcionamiento
-- call CalcularPresupuestoTotal;

-- 19. Actualizar fechas de un proyecto de investigación
delimiter $$
create procedure ActualizarFechasProyecto(in p_id int, in f_inicio date, in f_fin date)
begin
	update ProyectoInvestigacion 
	set inicioInvestigacion = f_inicio, finInvestigacion = f_fin
	where ID = p_id;

	select * from ProyectoInvestigacion where ID = p_id;
end$$

delimiter ;
-- prueba de funcionamiento
-- call ActualizarFechasProyecto(52, "2025-04-01", "2027-04-01");

-- 20. Generar informe de proyectos por investigador
delimiter $$ 
create procedure InformeProyectosInvestigador()
begin
	select p.nombre as Investigador, count(ip.proyecto) as Proyectos
	from Personal p 
	join Investigador_Proyecto ip on p.ID = ip.investigador
	group by p.id, p.nombre
	order by Proyectos desc;
end $$
delimiter ;

call InformeProyectosInvestigador();
