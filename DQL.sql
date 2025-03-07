use Gestion_Parques_Naturales;
SELECT * from Personal WHERE tipoCodigo = 001;
-- Estado actual de parques: cantidad por departamento y superficies declaradas.

-- 1 saber la cantidad de parques por departamento. 
SELECT d.nombre, Departamento_id, COUNT(parque_id) as "cantidad de parques"from Departamento_Parque dp
join Departamento d on d.ID = dp.Departamento_id 
group by Departamento_id; 

-- 2. listado de mayor a menor de los parques con mayor superficie declarada. 
SELECT p.nombre, sum(a.extencion_hectareas) as superficie  FROM Parque p
join Area a on a.parque_id = p.ID
group by p.nombre 
order by superficie desc;

-- Inventarios de especies por áreas y tipos.
-- 3. listado de especies de animales que hay en cada area y a que parque pertence 

