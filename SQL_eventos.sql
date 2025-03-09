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
-- 2. Generar reporte semanal de cuantas habitaciones se reservaron en el parque


