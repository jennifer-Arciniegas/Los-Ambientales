USE Gestion_Parques_Naturales;

-- 1. generar reporte semanal de visitantes por parque
drop event if exists reporteVisitantesSemanales;

drop table if exists reportes_visitantes;
-- tablas exclusivas de los eventos 
create table if not exists reportes_visitantes (
    id int auto_increment primary key, 
    parque_id int not null, 
    fecha date not null, 
    total_visitantes int default 0, 
    foreign key (parque_id) references parque(id)
);

create event if not exists reporteVisitantesSemanales
on schedule every 1 week
starts current_date + interval 1 day
do
    insert into reportes_visitantes (parque_id, fecha, total_visitantes)
    select a.parque_id, current_date, count(v.id)
    from visita v
    join area a on v.area = a.id
    where v.ingreso >= current_date - interval 7 day  -- solo cuenta los últimos 7 días
    group by a.parque_id;

show events from gestion_parques_naturales;

-- ##################################################################################
-- 2. Actualizar inventario de especies por área cada mes
drop event if exists ActualizarInventarioEspecies;

create event if not exists ActualizarInventarioEspecies
on schedule every 1 month
starts current_timestamp + interval 1 day
DO
    update Especie
    set numero_inventario = numero_inventario + 1
    where area_id in (
        select ID from Area where extencion_hectareas > 500
    );


-- ##################################################################################
-- 3. Crear el evento para alertar sobre baja actividad de visitantes se considera baja actividad si tiene menos de 10 visitas en el último mes
drop event if exists AlertaBajaActividad; 
drop table if exists alertas_actividad;

-- Crear la tabla para almacenar alertas
create table if not exists alertas_actividad (
    ID int auto_increment primary key,
    parque_id INT not null,
    fecha date not null,
    mensaje varchar(255) not null,
    foreign key (parque_id) references Parque(ID)
);

create event if not exists AlertaBajaActividad
on schedule every 1 month
starts current_timestamp + interval 1 day 
do
    insert into alertas_actividad (parque_id, fecha, mensaje)
    select p.ID, current_date, 'Baja actividad de visitantes'
    from Parque p
    where (
        select  count(*) 
        from Visita v
        join Area a on v.area = a.ID
        where a.parque_id = p.ID and v.ingreso >= current_date - interval 1 month ) < 10; 

-- ##################################################################################
-- 4. Actualizar inventarios de especies periódicamente.
drop event if exists ActualizarInventarios;
drop table if exists log_inventario_actualizaciones;
-- Crear tabla de log para rastrear actualizaciones de inventarios (si no existe)
create table if not exists log_inventario_actualizaciones (
    id int auto_increment primary key,
    especie_id int,
    fecha timestamp default current_timestamp,
    accion varchar(50),
    detalle text,
    foreign key (especie_id) references ESPECIE(id)
);


delimiter $$
create event ActualizarInventarios
on schedule every 1 month
starts current_date + interval 1 day
do
begin
    -- Actualizar inventario de especies en áreas activas (con visitas abiertas)
    update ESPECIE e
    join AREA a on e.area_id = a.id
    join VISITA v on a.id = v.area
    set e.numero_inventario = e.numero_inventario + 5
    where v.salida is null;

    -- Log de las actualizaciones realizadas
    insert into log_inventario_actualizaciones (especie_id, accion, detalle)
    select e.id, 'Actualización Periódica', concat('Inventario incrementado de ', e.numero_inventario - 5, ' a ', e.numero_inventario)
    from ESPECIE e
    join AREA a on e.area_id = a.id
    join VISITA v on a.id = v.area
    where v.salida is null;
end$$
delimiter ;
-- ##################################################################################
-- 5. evento para identificar áreas con más de 50 registros de especies en 1 mes
-- crear tabla para almacenar el reporte de áreas con muchas especies
drop event if exists ReporteAreasMuchasEspecies;
drop table if exists reporte_areas_muchas_especies;

create table if not exists reporte_areas_muchas_especies (
    id int auto_increment primary key,
    area_id int,
    nombre_area varchar(50),
    total_especies int,
    fecha timestamp default current_timestamp,
    foreign key (area_id) references Area(ID));

-- evento
delimiter $$
create event ReporteAreasMuchasEspecies
on schedule at current_timestamp + interval 1 month
do
begin

    insert into reporte_areas_muchas_especies (area_id, nombre_area, total_especies)
    select a.id, a.nombre, count(e.ID) as total_especies
    from Area a
    join Especie e on e.area_id = a.id
    group by a.ID, a.nombre
    having count(e.ID) > 50;
end$$
delimiter ;

-- ##################################################################################
-- 6. Evento donde se almacenan los parque que no presentan registros de especies
-- eliminar evento y tabla si existen
drop event if exists ReporteParquesSinEspecies;
drop table if exists reporte_parques_sin_especies;

-- crear tabla para almacenar el reporte de parques sin especies
create table if not exists reporte_parques_sin_especies (
    id int auto_increment primary key,
    parque_id int,
    nombre_parque varchar(100),
    fecha timestamp default current_timestamp,
    foreign key (parque_id) references Parque(ID)
);

-- evento
delimiter $$
create event ReporteParquesSinEspecies
on schedule at current_timestamp + interval 1 month
do
begin
    insert into reporte_parques_sin_especies (parque_id, nombre_parque)
    select p.id, p.nombre
    from Parque p
    left join Area a on p.id = a.parque_id
    left join Especie e on a.id = e.area_id
    group by p.ID, p.nombre
    having count(e.ID) = 0;
end$$
delimiter ;

show events from gestion_parques_naturales;


-- ##################################################################################
-- 7. Evento donde se almacenan los parque que presentan registros de mas de 100
-- especies en un mes.

-- eliminar evento y tabla si existen
drop event if exists ReporteParquesMuchasEspecies;
drop table if exists reporte_parques_muchas_especies;

-- crear tabla para almacenar el reporte de parques con muchas especies
create table if not exists reporte_parques_muchas_especies (
    id int auto_increment primary key,
    parque_id int,
    nombre_parque varchar(100),
    total_especies int,
    fecha timestamp default current_timestamp,
    foreign key (parque_id) references Parque(ID)
);

-- evento
delimiter $$
create event ReporteParquesMuchasEspecies
on schedule at current_timestamp + interval 1 month
do
begin
    insert into reporte_parques_muchas_especies (parque_id, nombre_parque, total_especies)
    select p.ID, p.nombre, count(e.ID) as total_especies
    from Parque p
    join Area a on p.ID = a.parque_id
    join Especie e on a.ID = e.area_id
    group by p.ID, p.nombre
    having count(e.ID) > 100;
end$$
delimiter ;
-- ##################################################################################
-- 8. Evento para contar especies por tipo en cada parque
drop event if exists ReporteEspeciesPorTipo;
drop table if exists reporte_especies_por_tipo;
create table if not exists reporte_especies_por_tipo (
    id int auto_increment primary key,
    parque_id int,
    nombre_parque varchar(100),
    tipo_especie enum('Animal', 'Mineral', 'Vegetal'),
    total_especies int,
    fecha timestamp default current_timestamp,
    foreign key (parque_id) references Parque(ID)
);
-- ejemplo de ejecución manual: alter event ReporteEspeciesPorTipo enable;
delimiter $$
create event ReporteEspeciesPorTipo
on schedule at current_timestamp + interval 1 month
do
begin
    insert into reporte_especies_por_tipo (parque_id, nombre_parque, tipo_especie, total_especies)
    select p.ID, p.nombre, e.tipo, count(e.ID)
    from Parque p
    join Area a on p.ID = a.parque_id
    join Especie e on a.ID = e.area_id
    group by p.ID, p.nombre, e.tipo;
end$$
delimiter ;

-- ##################################################################################
-- 9. Evento para registrar alojamientos con alta ocupación
drop event if exists ReporteAlojamientosAltaOcupacion;
drop table if exists reporte_alojamientos_alta_ocupacion;
create table if not exists reporte_alojamientos_alta_ocupacion (
    id int auto_increment primary key,
    alojamiento_id int,
    nombre_alojamiento varchar(50),
    ocupacion_actual int,
    fecha timestamp default current_timestamp,
    foreign key (alojamiento_id) references Alojamiento(ID)
);
delimiter $$
create event ReporteAlojamientosAltaOcupacion
on schedule at current_timestamp + interval 1 month
do
begin
    insert into reporte_alojamientos_alta_ocupacion (alojamiento_id, nombre_alojamiento, ocupacion_actual)
    select a.ID, a.nombre, count(v.ID)
    from Alojamiento a
    join Visitante v on a.ID = v.alojamiento
    group by a.ID, a.nombre
    having count(v.ID) > a.capacidad * 0.9;
end$$
delimiter ;

-- ##################################################################################
-- 10. Evento para alertar visitas sin salida después de 7 días debido a que no se
-- reportaron sus salidas
drop event if exists AlertaVisitasSinSalida;
drop table if exists alerta_visitas_sin_salida;
create table if not exists alerta_visitas_sin_salida (
    id int auto_increment primary key,
    visita_id int,
    visitante_id int,
    fecha timestamp default current_timestamp,
    foreign key (visita_id) references Visita(ID),
    foreign key (visitante_id) references Visitante(ID)
);
delimiter $$
create event AlertaVisitasSinSalida
on schedule at current_timestamp + interval 1 month
do
begin
    insert into alerta_visitas_sin_salida (visita_id, visitante_id)
    select v.ID, v.visitante
    from Visita v
    where v.salida is null and datediff(current_timestamp, v.ingreso) > 7;
end$$
delimiter ;

-- ##################################################################################
-- 11. Evento para cerrar visitas vencidas automáticamente
drop event if exists CierreVisitasVencidas;
drop table if exists log_cierre_visitas_vencidas;
create table if not exists log_cierre_visitas_vencidas (
    id int auto_increment primary key,
    visita_id int,
    fecha_cierre timestamp,
    fecha timestamp default current_timestamp,
    foreign key (visita_id) references Visita(ID)
);
-- ejemplo de ejecución manual: alter event CierreVisitasVencidas enable;
delimiter $$
create event CierreVisitasVencidas
on schedule at current_timestamp + interval 1 month
do
begin
    update Visita
    set salida = current_timestamp
    where salida is null and datediff(current_timestamp, ingreso) > 14;
    insert into log_cierre_visitas_vencidas (visita_id, fecha_cierre)
    select ID, current_timestamp
    from Visita
    where salida is not null and datediff(current_timestamp, ingreso) > 14;
end$$
delimiter ;
-- ##################################################################################
-- 12. Evento para registrar áreas con más visitas
drop event if exists ReporteAreasMasVisitas;
drop table if exists reporte_areas_mas_visitas;
create table if not exists reporte_areas_mas_visitas (
    id int auto_increment primary key,
    area_id int,
    nombre_area varchar(50),
    total_visitas int,
    fecha timestamp default current_timestamp,
    foreign key (area_id) references Area(ID)
);
delimiter $$
create event ReporteAreasMasVisitas
on schedule at current_timestamp + interval 1 month
do
begin
    insert into reporte_areas_mas_visitas (area_id, nombre_area, total_visitas)
    select a.ID, a.nombre, count(v.ID)
    from Area a
    join Visita v on a.ID = v.area
    group by a.ID, a.nombre
    having count(v.ID) > 50;
end$$
delimiter ;

-- ##################################################################################
-- 13. Evento para alertar alojamientos con capacidad cero
drop event if exists AlertaCapacidadCero;
drop table if exists alerta_capacidad_cero;
create table if not exists alerta_capacidad_cero (
    ID int auto_increment primary key,
    alojamiento_id int,
    nombre_alojamiento varchar(50),
    fecha timestamp default current_timestamp,
    foreign key (alojamiento_id) references Alojamiento(ID)
);
delimiter $$
create event AlertaCapacidadCero
on schedule at current_timestamp + interval 1 month
do
begin
    insert into alerta_capacidad_cero (alojamiento_id, nombre_alojamiento)
    select ID, nombre
    from Alojamiento
    where capacidad = 0;
end$$
delimiter ;
-- ##################################################################################
-- 14. Evento para registrar duración promedio de visitas por área
drop event if exists ReporteDuracionVisitas;
drop table if exists reporte_duracion_visitas;
create table if not exists reporte_duracion_visitas (
    id int auto_increment primary key,
    area_id int,
    nombre_area varchar(50),
    duracion_promedio int,
    fecha timestamp default current_timestamp,
    foreign key (area_id) references Area(ID)
);
delimiter $$
create event ReporteDuracionVisitas
on schedule at current_timestamp + interval 1 month
do
begin
    insert into reporte_duracion_visitas (area_id, nombre_area, duracion_promedio)
    select a.ID, a.nombre, avg(datediff(v.salida, v.ingreso))
    from Area a
    join Visita v on a.ID = v.area
    where v.salida is not null
    group by a.ID, a.nombre;
end$$
delimiter ;
-- ##################################################################################
-- 15. Evento para alertar visitas duplicadas en un área
drop event if exists AlertaVisitasDuplicadas;
drop table if exists alerta_visitas_duplicadas;
create table if not exists alerta_visitas_duplicadas (
    ID int auto_increment primary key,
    area_id int,
    nombre_area varchar(50),
    total_duplicados int,
    fecha timestamp default current_timestamp,
    foreign key (area_id) references Area(ID)
);
delimiter $$
create event AlertaVisitasDuplicadas
on schedule at current_timestamp + interval 1 month
do
begin
    insert into alerta_visitas_duplicadas (area_id, nombre_area, total_duplicados)
    select a.ID, a.nombre, count(*) - count(distinct v.visitante)
    from Area a
    join Visita v on a.id = v.area
    where v.salida is null
    group by a.ID, a.nombre
    having count(*) - count(distinct v.visitante) > 0;
end$$
delimiter ;
-- ##################################################################################
-- 16. Evento para registrar alojamientos no utilizados
drop event if exists ReporteAlojamientosNoUsados;
drop table if exists reporte_alojamientos_no_usados;
create table if not exists reporte_alojamientos_no_usados (
    ID int auto_increment primary key,
    alojamiento_id int,
    nombre_alojamiento varchar(50),
    fecha timestamp default current_timestamp,
    foreign key (alojamiento_id) references Alojamiento(ID)
);
delimiter $$
create event ReporteAlojamientosNoUsados
on schedule at current_timestamp + interval 1 month
do
begin
    insert into reporte_alojamientos_no_usados (alojamiento_id, nombre_alojamiento)
    select a.ID, a.nombre
    from Alojamiento a
    left join Visitante v on a.ID = v.alojamiento
    group by a.ID, a.nombre
    having count(v.ID) = 0;
end$$
delimiter ;
-- ##################################################################################
-- 17. Evento para registrar alojamientos de tipo 'cabaña' con ocupación
drop event if exists ReporteCabinasOcupadas;
drop table if exists reporte_cabinas_ocupadas;
create table if not exists reporte_cabinas_ocupadas (
    ID int auto_increment primary key,
    alojamiento_id int,
    nombre_alojamiento varchar(50),
    total_ocupantes int,
    fecha timestamp default current_timestamp,
    foreign key (alojamiento_id) references Alojamiento(ID)
);
delimiter $$
create event ReporteCabinasOcupadas
on schedule at current_timestamp + interval 1 month
do
begin
    insert into reporte_cabinas_ocupadas (alojamiento_id, nombre_alojamiento, total_ocupantes)
    select a.ID, a.nombre, count(v.ID)
    from Alojamiento a
    join Visitante v on a.ID = v.alojamiento
    where a.categoria = 'cabaña'
    group by a.ID, a.nombre
    having count(v.ID) > 0;
end$$
delimiter ;
-- ##################################################################################
-- 18. Evento para alertar áreas sin visitas recientes
drop event if exists AlertaAreasSinVisitas;
drop table if exists alerta_areas_sin_visitas;
create table if not exists alerta_areas_sin_visitas (
    ID int auto_increment primary key,
    area_id int,
    nombre_area varchar(50),
    fecha timestamp default current_timestamp,
    foreign key (area_id) references Area(ID)
);
delimiter $$
create event AlertaAreasSinVisitas
on schedule at current_timestamp + interval 1 month
do
begin
    insert into alerta_areas_sin_visitas (area_id, nombre_area)
    select a.ID, a.nombre
    from Area a
    left join Visita v on a.ID = v.area
    where v.ID is null or v.ingreso < current_timestamp - interval 30 day;
end$$
delimiter ;
-- ##################################################################################
-- 19. Evento para registrar visitas cortas
drop event if exists ReporteVisitasCortas;
drop table if exists reporte_visitas_cortas;
create table if not exists reporte_visitas_cortas (
    ID int auto_increment primary key,
    visita_id int,
    area_id int,
    duracion_horas int,
    fecha timestamp default current_timestamp,
    foreign key (visita_id) references Visita(ID),
    foreign key (area_id) references Area(ID)
);
-- ejemplo de ejecución manual: alter event ReporteVisitasCortas enable;
delimiter $$
create event ReporteVisitasCortas
on schedule at current_timestamp + interval 1 month
do
begin
    insert into reporte_visitas_cortas (visita_id, area_id, duracion_horas)
    select v.ID, v.area, timestampdiff(hour, v.ingreso, v.salida)
    from Visita v
    where v.salida is not null and timestampdiff(hour, v.ingreso, v.salida) < 1;
end$$
delimiter ;
-- ##################################################################################
-- 20. Evento para registrar visitas largas de más de 10 horas
drop event if exists ReporteVisitasLargas;
drop table if exists reporte_visitas_largas;
create table if not exists reporte_visitas_largas (
    ID int auto_increment primary key,
    visita_id int,
    area_id int,
    duracion_horas int,
    fecha timestamp default current_timestamp,
    foreign key (visita_id) references Visita(ID),
    foreign key (area_id) references Area(ID)
);
-- ejemplo de ejecución manual: alter event ReporteVisitasLargas enable;
delimiter $$
create event ReporteVisitasLargas
on schedule at current_timestamp + interval 1 month
do
begin
    insert into reporte_visitas_largas (visita_id, area_id, duracion_horas)
    select v.ID, v.area, timestampdiff(hour, v.ingreso, v.salida)
    from Visita v
    where v.salida is not null and timestampdiff(hour, v.ingreso, v.salida) > 10;
end$$
delimiter ;

show events from gestion_parques_naturales;
