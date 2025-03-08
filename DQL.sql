use Gestion_Parques_Naturales;
SELECT * from Personal WHERE tipoCodigo = 001;
-- Estado actual de parques: cantidad por departamento y superficies declaradas.

-- 1 saber la cantidad de parques por departamento y ordenar de mayor a menor 
SELECT d.nombre as Departamento, Departamento_id, COUNT(parque_id) as "cantidad de parques"
from Departamento_Parque dp
join Departamento d on d.ID = dp.Departamento_id 
group by Departamento_id, d.nombre
order by  COUNT(parque_id) desc; 

-- 2. listado de mayor a menor de los parques con mayor superficie declarada. 
SELECT p.nombre, sum(a.extencion_hectareas) as superficie  
FROM Parque p
join Area a on a.parque_id = p.ID
group by p.nombre, p.nombre
order by superficie desc;

-- Inventarios de especies por áreas y tipos.
-- 3.  Cantidad de especies por área protegida de mayor a menor
select a.nombre as area, count(e.ID) as cantidad_especies
from Especie e
join Area a on e.Area_id = a.ID
group by a.ID, a.nombre
order by cantidad_especies desc;


-- 4  Listado de especies por tipo dentro de cada área
select a.nombre as area, e.tipo as "tipo especie", count(e.ID) as Cantidad
from especie e
join Area a on e.Area_id = a.ID
group by a.nombre, a.ID, e.tipo;

-- 5 Areas con mayor cantidad de individuos registrados
select a.nombre as Area, sum(e.numero_inventario) as Cantidad_Especies
from especie e
join Area a on e.Area_id = a.ID
group by a.nombre, a.ID
order by Cantidad_Especies desc;

-- 6. cantidad de especies en la base de datos
select e.tipo as "Tipo especie", count(e.ID) as cantidad_especies
from Especie e
group by e.tipo
order by cantidad_especies desc;

-- Actividades del personal según tipo, áreas asignadas y sueldos.
-- 7. Cantidad de personal asignado a cada área y su codigo identificador
select p.tipoPersonal as tipo_personal, count(p.ID) as cantidad, p.tipoCodigo as codigo
from Personal p
group by p.tipoPersonal, p.tipoCodigo
order by cantidad desc;

-- 8. Sueldo promedio por tipo de personal y ordenar de mayor menor
select p.tipoPersonal as "tipo personal", round(avg(p.sueldo), 2) as sueldo_promedio
from Personal p
group by p.tipoPersonal
order by sueldo_promedio desc;

-- 9.  Áreas con mayor gasto en sueldos del personal
select a.nombre as area, sum(p.sueldo) as gasto_total_sueldos
from Personal p
join Area a on p.Area_id = a.ID
group by a.ID, a.nombre
order by gasto_total_sueldos desc limit 1;

-- 10.  Áreas con menor gasto en sueldos del personal
select a.nombre as area, sum(p.sueldo) as gasto_total_sueldos
from Personal p
join Area a on p.Area_id = a.ID
group by a.ID, a.nombre
order by gasto_total_sueldos asc limit 1;

-- 11. Encontrar los parques con la mayor cantidad de áreas con más de 5000 hectáreas.
SELECT p.nombre AS parque, COUNT(a.ID) AS cantidad_areas
FROM Parque p
JOIN Area a ON p.ID = a.parque_id
WHERE a.extencion_hectareas > 5000
GROUP BY p.ID, p.nombre
ORDER BY cantidad_areas DESC;


-- Estadísticas de proyectos de investigación: costos, especies involucradas y equipos.

-- 12. cantidad de proyectos por investigador 
SELECT p.nombre AS investigador, COUNT(ip.proyecto) AS cantidad_proyectos
FROM Personal p
JOIN Investigador_Proyecto ip ON p.ID = ip.investigador
GROUP BY p.ID, p.nombre
ORDER BY cantidad_proyectos DESC;

-- 13. cantidad de especies involucradas por área
SELECT a.nombre AS area, COUNT(e.ID) AS cantidad_especies
FROM Especie e
JOIN Area a ON e.Area_id = a.ID
GROUP BY a.ID, a.nombre
ORDER BY cantidad_especies DESC;

-- 14 investigacion con mayor costo 
select i.nombre, i.presupuesto
from proyectoinvestigacion i
order by i.presupuesto desc limit 1;

-- 15. consulta investigacion media del presupuesto total
select  round(avg(i.presupuesto), 2) as "media de presupuesto"
from proyectoinvestigacion i;






