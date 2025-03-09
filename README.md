# Los-Ambientales
## Descripción del Proyecto:
Popuesta inicial de Base de datos la cual permite gestionar de manera eficiente todas las operaciones relacionadas con los parques naturales bajo la supervisión del Ministerio del Medio Ambiente. El sistema abarca la administración de departamentos, parques, áreas, especies, personal, proyectos de investigación, visitantes y alojamientos, en funcion de la iformacion proporcionada. La base de datos cuenta con scripts separados para asegurar  integridad de los datos y un mejor order al momento de ejecutarla. 

## Requisitos del Sistema: 
Ejecutarse en DBeaver 25.0.0 MySQL versión
## Instalación y Configuración:
1. Desde la terminal o el DBeaver comezar ejecutando el archivo DDL que se encarga de dar estructura a la base de datos 
  Desde la terminal: mysql -u tu_usuario -p < DDL.sql
2. Ejecutar el archivo DML el cual contien los registros contenido de las tablas
   Desde la terminal: mysql -u tu_usuario -p < DML.sql
3. Para ejecutar consultas SQL, puedes hacerlo directamente en DBeaver o desde la terminal, por ejemplo:
       select * from parque;
4. Para ejecutar procedimientos almacenados, usa:
      call ObtenerEspeciesPorParque('Amazonas');
5. Para ejecutar funciones almacenadas, usa:
6.Para habilitar y verificar eventos programados:
7. Para verificar triggers en la base de datos:
### Estructura de la Base de Datos:
**Consultas**: Se ejecutan para cosultar datos de las tablas y fltrar los datos.
ejemplo: Consultar la cantidad de personal con cargo_id = 001 (Personal de Gestión)
select * 
from Personal p 
where cargo_id = 001;

**Procedimientos almacenados**: Ejecutan tareas complejas en la base de datos de forma eficiente y reutilizable.
Ejemplo: Registrar un parque una vez creado el procedimiento 1, se podran registrar parque mediante:  
-- prueba de funcionamiento
-- CALL RegistrarParque("Parque laguna lunar", "2025-02-13", 3);
**Funciones**: Devuelven un valor específico a partir de cálculos o consultas.
Ejemplo: Conocer la superficie total de un parque específico, en este caso solo debe ingresar el ID del parque.
-- prueba de funcionamiento
-- select SuperficieTotalParque(1);
**Triggers**: Se activan automáticamente ante cambios en las tablas para garantizar integridad y seguridad.
Ejemplo: Registrar cambio salarial de personal el cual se ejecuta automaticamente 

**Eventos**: Programan tareas automáticas en momentos específicos, como limpieza de datos.
Ejemplo: Generar reporte semanal de visitantes por parque el cual se genera automatica pasados los 7 dias de su ejecucion. 

**Roles** creados en la base de datos permiten una gestión eficiente y segura del sistema, asegurando que cada usuario tenga acceso solo a la información y funcionalidades necesarias para sus tareas.
**Administrador**: Tiene acceso total al sistema, permitiendo gestionar todos los datos y configuraciones sin restricciones.
Ejemplo: 

**Gestor de Parques**: Encargado de administrar la información sobre parques, áreas y especies, asegurando la actualización y mantenimiento de estos registros.

**Investigador**: Accede a los datos de especies y proyectos, lo que facilita el análisis e investigación sin modificar la información.

**Auditor**: Solo puede consultar reportes financieros, lo que permite una revisión transparente de los recursos sin riesgo de modificaciones accidentales.

**Encargado de Visitantes**: Administra la información de visitantes y alojamientos, asegurando una gestión eficiente de la experiencia de los visitantes en los parques.

### Licencia y Contacto: 
jennifer Paola Arciniegas Arciniegas 
Contacto: jenniferpaola.arciniegas@gmail.com


