USE Gestion_Parques_Naturales;

-- 1. Superficie total de un parque específico
delimiter $$
create function SuperficieTotalParque(IDparque int)
returns double
deterministic 
begin
	declare superficie double;
	select sum(extencion_hectareas) into superficie
	from Area
	where ID = IDparque;
	return superficie;
end $$
delimiter ;
-- prueba de funcionamiento
-- select SuperficieTotalParque(1);

-- 2. Superficie total de parques por departamento
delimiter $$
create function SuperficieDepartamento(IDdepartamento int)
returns double
deterministic
begin
	declare superficieTotal double;

	select sum(a.extencion_hectareas) into superficieTotal 
	from Departamento_Parque dp
	join Parque p on p.ID = dp.parque_id
	join Area a on p.ID = a.parque_id
	where dp.Departamento_id = IDdepartamento;
	return superficieTotal;
end $$

delimiter ;

-- prueba de funcionamiento
-- select SuperficieDepartamento(3);

-- 3. Cantidad total de especies en un área
delimiter $$
create function CantidadEspeciesArea(IDarea int)
returns int
deterministic
begin
	declare cantidad int;
	select count(ID) into cantidad
	from Especie
	where Area_id = IDarea;
	return cantidad;
	
end$$
delimiter ;
-- prueba de funcionamiento
-- select CantidadEspeciesArea(1);

-- 4. Cantidad de especies por tipo en un área
delimiter $$
create function CantidadEspeciesPorTipo(IDarea int, p_tipo varchar(50))
returns int
deterministic
begin
    declare cantidad int;
    select count(id) into cantidad
    from Especie
    where area_id = IDarea and tipo = p_tipo;
    return ifnull(cantidad, 0);
end$$
delimiter ;
-- prueba de funcionamiento
-- SELECT CantidadEspeciesPorTipo(1, 'Animal');

-- 5. Total de individuos inventariados en un área
delimiter $$
create function TotalIndividuosArea(IDarea int)
returns int
deterministic
begin
    declare total int;
    select sum(numero_inventario) into total
    from Especie
    where area_id = IDarea;
    return total;
end $$
delimiter ;
-- prueba de funcionamiento
-- select TotalIndividuosArea(1);


-- 6. Cantidad total de áreas en un parque
delimiter $$
create function CantidadAreasParque(IDarea int)
returns int
deterministic
begin
    declare cantidad int;
    select count(id) into cantidad
    from Area
    where parque_id = IDarea;
    return cantidad;
end $$
delimiter ;
-- prueba de funcionamiento
-- select CantidadAreasParque(2);

-- 7. Superficie promedio de áreas por parque
delimiter $$
create function SuperficiePromedioParque(IDparque int)
returns double
deterministic
begin
    declare promedio double;
    select avg(extencion_hectareas) into promedio
    from Area
    where parque_id = IDparque;
    return promedio;
end $$
delimiter ;
-- prueba de funcionamiento
-- select SuperficiePromedioParque(1);

-- 8. Costo operativo total de un proyecto de investigación
delimiter $$
create function CostoOperativoProyecto(IDproyecto int)
returns double
deterministic
begin
	declare costo double;
	select  presupuesto into costo
	from ProyectoInvestigacion
	where ID = IDproyecto;
	return costo;
end$$

delimiter ;
-- prueba de funcionamiento
-- select CostoOperativoProyecto(52);

-- 9. Costo promedio de proyectos por investigador
delimiter $$
create function CostoPromedioInvestigador(IDinvestigador int)
returns double
deterministic
begin
    declare costo double;
    select avg(pi.presupuesto) into costo
    from Investigador_Proyecto ip
    join ProyectoInvestigacion pi on ip.proyecto = pi.id
    where ip.investigador = IDinvestigador;
    return costo;
end $$
delimiter ;
-- prueba de funcionamiento
-- select CostoPromedioInvestigador(40);

-- 10. Cantidad de proyectos por parque (indirectamente via áreas)
delimiter //
create function CantidadProyectosParque(IDparque int)
returns int
deterministic
begin
    declare cantidad int;
    select count(distinct pi.id) into cantidad
    from ProyectoInvestigacion pi
    join Especies_Investigadas ei on pi.id = ei.investigacion
    join Especie e on ei.especie = e.id
    join Area a on e.area_id = a.id
    where a.parque_id = IDparque;
    return cantidad;
end //
delimiter ;
-- prueba de funcionamiento
-- select CantidadProyectosParque(1);

-- 11. Total de sueldos de personal por área
delimiter $$
create function SueldosTotalArea(IDarea int)
returns double
deterministic
begin
    declare total double;
    select sum(p.sueldo) into total
    from Personal p
    where p.area_id = IDarea;
    return total ;
end $$
delimiter ;
-- prueba de funcionamiento
-- select SueldosTotalArea(2);

-- 12. Promedio de sueldos por cargo
delimiter $$
create function PromedioSueldoCargo(IDcargo int)
returns double
deterministic
begin
    declare promedio double;
    select avg(sueldo) into promedio
    from Personal
    where cargo_id = IDcargo;
    return promedio;
end $$
delimiter ;
-- prueba de funcionamiento
-- select PromedioSueldoCargo(2);

-- 13. Cantidad de visitantes por alojamiento
delimiter $$
create function CantidadVisitantesAlojamiento(IDalojamiento int)
returns int
deterministic
begin
    declare cantidad int;
    select count(id) into cantidad
    from Visitante
    where alojamiento = IDalojamiento;
    return cantidad;
end $$
delimiter ;
-- prueba de funcionamiento
--  select CantidadVisitantesAlojamiento(1);

-- 14. Duración promedio de visitas por área
delimiter $$
create function DuracionPromedioVisitasenHoras(IDarea int)
returns double
deterministic
begin
    declare promedio double;
    select avg(timestampdiff(hour, ingreso, salida)) into promedio
    from Visita
    where area = IDarea and salida is not null;
    return promedio;
end $$
delimiter ;
-- prueba de funcionamiento
-- select DuracionPromedioVisitasenHoras(2);

-- 15. Cantidad de vehículos por vigilante
delimiter $$
create function CantidadVehiculosVigilante(IDvigilante int)
returns int
deterministic
begin
    declare cantidad int;
    select count(vehiculo_id) into cantidad
    from Vigilante_vehiculo
    where vigilante_id = IDvigilante;
    return ifnull(cantidad, 0);
end $$
delimiter ;
-- prueba de funcionamiento
-- select CantidadVehiculosVigilante(14);

-- 16. Capacidad total de alojamientos por parque
delimiter $$
create function CapacidadAlojamientosParque(IDparque int)
returns int
deterministic
begin
    declare capacidades int;
    select sum(capacidad) into capacidades
    from Alojamiento
    where parque = IDparque;
    return ifnull(capacidades, 0);
end $$
delimiter ;
-- prueba de funcionamiento
-- select CapacidadAlojamientosParque(4);

-- 17. Total de presupuesto por parque (via proyectos)
delimiter $$
create function PresupuestoTotalParque(IDparque int)
returns double
deterministic
begin
    declare total double;
    select sum(pi.presupuesto) into total
    from ProyectoInvestigacion pi
    join Especies_Investigadas ei on pi.id = ei.investigacion
    join Especie e on ei.especie = e.id
    join Area a on e.area_id = a.id
    where a.parque_id = IDparque;
    return ifnull(total, 0);
end $$
delimiter ;
-- prueba de funcionamiento
-- select PresupuestoTotalParque(1);

-- 18. Total de visitas por parque
delimiter $$
create function TotalVisitasParque(idparque int)
returns int
deterministic
begin
    declare total int;
    select count(v.id) into total
    from Visita v
    join Area a on v.area = a.id
    where a.parque_id = idparque;
    return ifnull(total, 0);
end $$
delimiter ;
-- prueba de funcionamiento
-- select TotalVisitasParque(1);

-- 19. Cantidad de visitas abiertas (sin salida) en un área
delimiter $$
create function CantidadVisitasAbiertas(IDarea int)
returns int
deterministic
begin
    declare cantidad int;
    select count(id) into cantidad
    from Visita
    where area = IDarea and salida is null;
    return ifnull(cantidad, 0);
end $$
delimiter ;
-- prueba de funcionamiento
-- select CantidadVisitasAbiertas(1);

-- 20. Cantidad de vehículos de un tipo específico
delimiter $$
create function CantidadVehiculosTipo(tipo varchar(50))
returns int
deterministic
begin
    declare cantidad int;
    select count(id) into cantidad
    from Vehiculo
    where tipo = tipo;
    return ifnull(cantidad, 0);
end $$
delimiter ;
-- prueba de funcionamiento
-- select CantidadVehiculosTipo("Camioneta");