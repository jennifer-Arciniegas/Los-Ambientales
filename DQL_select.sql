USE Gestion_Parques_Naturales;


-- query 1: cantidad de personal con cargo_id = 001 (Personal de Gestión)
select * 
from Personal p 
where cargo_id = 001;

-- estado actual de parques: cantidad por departamento y superficies declaradas.

-- 1. saber la cantidad de parques por departamento y ordenar de mayor a menor 
select d.nombre as departamento, dp.departamento_id, count(dp.parque_id) as "cantidad de parques"
from Departamento_Parque  dp
join Departamento  d on d.id = dp.departamento_id 
group by dp.departamento_id, d.nombre
order by count(dp.parque_id) desc; 

-- 2. listado de mayor a menor de los parques con mayor superficie declarada. 
select p.nombre, sum(a.extencion_hectareas) as superficie  
from  Parque p 
join Area a on a.parque_id = p.id
group by p.nombre
order by superficie desc;

-- inventarios de especies por áreas y tipos.
-- 3. cantidad de especies por área protegida de mayor a menor
select a.nombre as area, count(e.id) as cantidad_especies
from Especie e 
join Area a  on e.area_id = a.id
group by a.id, a.nombre
order by cantidad_especies desc;

-- 4. listado de especies por tipo dentro de cada área
select a.nombre as area, e.tipo as "tipo especie", count(e.id) as cantidad
from Especie e 
join Area a on e.area_id = a.id
group by a.nombre, a.id, e.tipo;

-- 5. areas con mayor cantidad de individuos registrados
select a.nombre as area, sum(e.numero_inventario) as cantidad_especies
from Especie e 
join Area a  on e.area_id = a.id
group by a.nombre, a.id
order by cantidad_especies desc;

-- 6. cantidad de especies en la base de datos
select e.tipo as "tipo especie", count(e.id) as cantidad_especies
from Especie e 
group by e.tipo
order by cantidad_especies desc;

-- actividades del personal según tipo, áreas asignadas y sueldos.
-- 7. cantidad de personal asignado a cada área y su codigo identificador
select c.nombre as tipo_personal, count(p.id) as cantidad, p.cargo_id as codigo
from Personal p 
join Cargo c  on p.cargo_id = c.id
group by c.nombre, p.cargo_id
order by cantidad desc;

-- 8. sueldo promedio por tipo de personal y ordenar de mayor a menor
select c.nombre as "tipo personal", round(avg(p.sueldo), 2) as sueldo_promedio
from Personal p 
join Cargo c  on p.cargo_id = c.id
group by c.nombre
order by sueldo_promedio desc;

-- 9. áreas con mayor gasto en sueldos del personal
select a.nombre as area, sum(p.sueldo) as gasto_total_sueldos
from Personal p 
join Area a on p.area_id = a.id
group by a.id, a.nombre
order by gasto_total_sueldos desc 
limit 1;

-- 10. áreas con menor gasto en sueldos del personal
select a.nombre as area, sum(p.sueldo) as gasto_total_sueldos
from Personal p 
join Area a  on p.area_id = a.id
group by a.id, a.nombre
order by gasto_total_sueldos asc 
limit 1;

-- 11. encontrar los parques con la mayor cantidad de áreas con más de 5000 hectáreas.
select p.nombre as parque, count(a.id) as cantidad_areas
from Parque p 
join Area a on p.id = a.parque_id
where a.extencion_hectareas > 5000
group by p.id, p.nombre
order by cantidad_areas desc;

-- estadísticas de proyectos de investigación: costos, especies involucradas y equipos.

-- 12. cantidad de proyectos por investigador 
select p.nombre as investigador, count(ip.proyecto) as cantidad_proyectos
from Personal p 
join Investigador_Proyecto ip  on p.id = ip.investigador
group by p.id, p.nombre
order by cantidad_proyectos desc;

-- 13. cantidad de especies involucradas por área
select a.nombre as area, count(e.id) as cantidad_especies
from Especie e 
join Area a on e.area_id = a.id
group by a.id, a.nombre
order by cantidad_especies desc;

-- 14. investigación con mayor costo 
select i.nombre, i.presupuesto
from ProyectoInvestigacion i
order by i.presupuesto desc 
limit 1;

-- 15. consulta investigación media del presupuesto total
select round(avg(i.presupuesto), 2) as "media de presupuesto"
from ProyectoInvestigacion i;


