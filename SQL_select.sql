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


-- 16. Consultar cargos existentes
select nombre, ID as identificador
from Cargo;

-- 17. Consultar el ultimo registro hecho en la tabla especie
select * 
from Especie 
order by ID desc 
limit 1;

-- 18. Consulta cantidad de especies vegetales en la tabla especie
select sum(numero_inventario) as "Cantidad vegtales"
from Especie 
where tipo= "Vegetal";

-- 19. Sumatoria de la canidad de especies que existen por Area
select a.nombre as Area, sum(numero_inventario) as "Cantidad de Especies" 
from Especie e
join Area a on a.ID = e.Area_id
group by a.nombre, e.Area_id;


-- 20. area con mayor cantidad de inventario 
select a.nombre as Area, sum(numero_inventario) as "Cantidad de Especies" 
from Especie e
join Area a on a.ID = e.Area_id
group by a.nombre, e.Area_id
order by sum(numero_inventario) desc
limit 1 ;

-- 21 calcular la media de los sueldos por cargo
select c.nombre, avg(p.sueldo) as media
from Personal p
join Cargo c on c.ID = p.cargo_id
group by c.nombre, p.cargo_id;

-- 22. calcular de los cargos quien gana menos
select c.nombre, avg(p.sueldo) as media
from Personal p
join Cargo c on c.ID = p.cargo_id
group by c.nombre, p.cargo_id
order by media asc 
limit 1;

-- 23. calcular de los cargos quien gana mas
select  avg(p.sueldo) as media, c.nombre, c.ID
from Personal p
join Cargo c on c.ID = p.cargo_id
group by c.nombre, p.cargo_id
order by media desc 
limit 1;

-- 24 calcular la cantidad de personal segun su cargo
select c.nombre as cargo, count(p.id) as cantidad_personal
from personal p
join cargo c on c.id = p.cargo_id
group by c.nombre;

-- 25. consultar las categorias de alojamiento
select categoria, count(*) as cantidad from Alojamiento group by categoria;


-- 26 Obtener los alojamientos de un parque específico por una plabra clave en su nombre
select * from Alojamiento where parque = (select ID from Parque where nombre like '%Tayrona%');

-- 27. Obtener la cantidad total de alojamientos en cada parque
select p.nombre, count(a.id) as total_alojamientos 
from parque p 
left join alojamiento a on p.id = a.parque 
group by p.nombre;

-- 28. Investigaciones realizadas a minerales
select pi.nombre as "Investigacion", e.nombre_cientifico as Mineral
from Proyectoinvestigacion pi
join Especies_investigadas ei on pi.ID = ei.investigacion
join Especie e on ei.especie = e.ID
where e.tipo = 'Mineral';


-- 29. Investigaciones realizadas a plantas osea vegetal 
select pi.nombre  as "Investigacion" , e.nombre_cientifico as Planta
from Proyectoinvestigacion pi
join Especies_investigadas ei on pi.ID = ei.investigacion
join Especie e on ei.especie = e.ID
where e.tipo = 'Vegetal';

-- 30 cantidad de especies por area 
select a.nombre, count(e.ID) as total_especies
from Area a
left join especie e on a.ID = e.area_id
group by a.nombre;

-- 31 Lista de parques con sus respectivas áreas 
select p.nombre as parque, a.nombre as area, a.extencion_hectareas 
from Parque p
join Area a on p.ID = a.parque_id;

-- 32 Listar los vehículos asignados a vigilantes
select p.nombre, p.apellido1, v.marca, v.tipo
from personal p
join vigilante_vehiculo vv on p.id = vv.vigilante_id
join vehiculo v on vv.vehiculo_id = v.id;

-- 33  Cantidad de vehículos por tipo
select v.tipo, count(v.id) as cantidad
from vehiculo v
group by v.tipo;
-- 34 Listar los vigilantes que tienen vehículos asignados
select distinct p.nombre, p.apellido1
from personal p
join vigilante_vehiculo vv on p.id = vv.vigilante_id;

-- 35.   Listar los empleados que ganan más de un salario específico
select nombre, apellido1, apellido2, sueldo
from Personal
where sueldo > 2000
order by sueldo desc;

-- 36. total de empleados
select count(*) as total_empleados
from personal;

-- 37. Ver los vehículos que no están asignados a ningún vigilante
select v.ID, v.marca, v.tipo
from Vehiculo v
left join vigilante_vehiculo vv on v.id = vv.vehiculo_id
where vv.vigilante_id is null;

-- 38 Obtener la cantidad de vigilantes que tienen un vehículo asignado
select count(distinct vigilante_id) as total_vigilantes_con_vehiculo
from vigilante_vehiculo;





