USE Gestion_Parques_Naturales;

-- 1. actualizar inventario al registrar cambios en áreas
delimiter $$
drop trigger if exists actualizar_inventario_area;
drop table if exists historial_inventario_areas;
create table if not exists historial_inventario_areas (
    ID int auto_increment primary key,
    area_id int,
    usuario varchar(100),
    accion varchar(50),
    detalle text,
    fecha timestamp default current_timestamp
);

create trigger actualizar_inventario_area
after update on Area
for each row
begin
    if new.inventario != old.inventario then
        insert into historial_inventario_areas (area_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('inventario actualizado en área ', new.nombre, ' de ', old.inventario, ' a ', new.inventario));
    end if;
end$$
delimiter ;

-- 2. registrar cambio salarial de personal
delimiter $$
drop trigger if exists registrar_cambio_salarial;
drop table if exists historial_cambios_salariales;
create table if not exists historial_cambios_salariales (
    ID int auto_increment primary key,
    empleado_id int,
    usuario varchar(100),
    accion varchar(50),
    detalle text,
    fecha timestamp default current_timestamp
);

create trigger registrar_cambio_salarial
after update on Empleado
for each row
begin
    if new.salario != old.salario then
        insert into historial_cambios_salariales (empleado_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('salario cambiado de ', old.salario, ' a ', new.salario));
    end if;
end$$
delimiter ;

-- 3. registrar inserción de nuevo inventario en áreas
delimiter $$
drop trigger if exists registrar_nuevo_inventario;
create trigger registrar_nuevo_inventario
after insert on Area
for each row
begin
    insert into historial_inventario_areas (area_id, usuario, accion, detalle)
    values (new.ID, user(), 'insert', concat('nuevo inventario agregado en área ', new.nombre, ': ', new.inventario));
end$$
delimiter ;

-- 4. registrar eliminación de inventario en áreas
delimiter $$
drop trigger if exists registrar_eliminacion_inventario;
create trigger registrar_eliminacion_inventario
after delete on Area
for each row
begin
    insert into historial_inventario_areas (area_id, usuario, accion, detalle)
    values (old.ID, user(), 'delete', concat('inventario eliminado en área ', old.nombre, ': ', old.inventario));
end$$
delimiter ;

-- 5. evitar inventario negativo en áreas
delimiter $$
drop trigger if exists validar_inventario_area;
create trigger validar_inventario_area
before update on Area
for each row
begin
    if new.inventario < 0 then
        signal sqlstate '45000' set message_text = 'ERROR: el inventario no puede ser negativo';
    end if;
end$$
delimiter ;

-- 6. evitar salario negativo en empleados
delimiter $$
drop trigger if exists validar_salario_empleado;
create trigger validar_salario_empleado
before update on Empleado
for each row
begin
    if new.salario < 0 then
        signal sqlstate '45000' set message_text = 'ERROR: el salario no puede ser negativo';
    end if;
end$$
delimiter ;

-- 7. registrar promoción de empleado
delimiter $$
drop trigger if exists registrar_promocion_empleado;
create trigger registrar_promocion_empleado
after update on Empleado
for each row
begin
    if new.puesto != old.puesto then
        insert into historial_cambios_salariales (empleado_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('promoción de ', old.puesto, ' a ', new.puesto));
    end if;
end$$
delimiter ;

-- 8. registrar contratación de nuevo empleado
delimiter $$
drop trigger if exists registrar_nuevo_empleado;
create trigger registrar_nuevo_empleado
after insert on Empleado
for each row
begin
    insert into historial_cambios_salariales (empleado_id, usuario, accion, detalle)
    values (new.ID, user(), 'insert', concat('nuevo empleado contratado: ', new.nombre, ' en puesto ', new.puesto));
end$$
delimiter ;

-- 9. registrar despido de empleado
delimiter $$
drop trigger if exists registrar_despido_empleado;
create trigger registrar_despido_empleado
after delete on Empleado
for each row
begin
    insert into historial_cambios_salariales (empleado_id, usuario, accion, detalle)
    values (old.ID, user(), 'delete', concat('empleado despedido: ', old.nombre, ' del puesto ', old.puesto));
end$$
delimiter ;

-- 10. validar aumento de salario máximo del 20%
delimiter $$
drop trigger if exists validar_aumento_salarial;
create trigger validar_aumento_salarial
before update on Empleado
for each row
begin
    if new.salario > old.salario * 1.2 then
        signal sqlstate '45000' set message_text = 'ERROR: aumento salarial superior al 20% no permitido';
    end if;
end$$
delimiter ;

-- 11. Registrar cambio de supervisor de un empleado
delimiter $$
drop trigger if exists registrar_cambio_supervisor;
create trigger registrar_cambio_supervisor
after update on Empleado
for each row
begin
    if new.supervisor_id != old.supervisor_id then
        insert into historial_cambios_salariales (empleado_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('cambio de supervisor de empleado ID ', new.ID, ' de ', old.supervisor_id, ' a ', new.supervisor_id));
    end if;
end$$
delimiter ;

-- 12. Registrar reasignación de un empleado a otra área
delimiter $$
drop trigger if exists registrar_reasignacion_area;
create trigger registrar_reasignacion_area
after update on Empleado
for each row
begin
    if new.area_id != old.area_id then
        insert into historial_cambios_salariales (empleado_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('empleado ID ', new.ID, ' reasignado de área ', old.area_id, ' a ', new.area_id));
    end if;
end$$
delimiter ;

-- 13. Registrar actualización de contacto de un empleado
delimiter $$
drop trigger if exists registrar_actualizacion_contacto;
create trigger registrar_actualizacion_contacto
after update on Empleado
for each row
begin
    if new.contacto != old.contacto then
        insert into historial_cambios_salariales (empleado_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('actualización de contacto para empleado ID ', new.ID, ': ', old.contacto, ' -> ', new.contacto));
    end if;
end$$
delimiter ;

-- 14. Registrar actualización de nivel de acceso de un empleado
delimiter $$
drop trigger if exists registrar_actualizacion_acceso;
create trigger registrar_actualizacion_acceso
after update on Empleado
for each row
begin
    if new.nivel_acceso != old.nivel_acceso then
        insert into historial_cambios_salariales (empleado_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('cambio de nivel de acceso de empleado ID ', new.ID, ' de ', old.nivel_acceso, ' a ', new.nivel_acceso));
    end if;
end$$
delimiter ;

-- 15. Registrar actualización de estado civil de un empleado
delimiter $$
drop trigger if exists registrar_actualizacion_estado_civil;
create trigger registrar_actualizacion_estado_civil
after update on Empleado
for each row
begin
    if new.estado_civil != old.estado_civil then
        insert into historial_cambios_salariales (empleado_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('actualización de estado civil de empleado ID ', new.ID, ' de ', old.estado_civil, ' a ', new.estado_civil));
    end if;
end$$
delimiter ;

-- 16. Registrar cambios en la categoría de un área
delimiter $$
drop trigger if exists registrar_cambio_categoria_area;
create trigger registrar_cambio_categoria_area
after update on Area
for each row
begin
    if new.categoria != old.categoria then
        insert into historial_inventario_areas (area_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('cambio de categoría en área ', new.nombre, ' de ', old.categoria, ' a ', new.categoria));
    end if;
end$$
delimiter ;

-- 17. Registrar reducción de personal en un área
delimiter $$
drop trigger if exists registrar_reduccion_personal;
create trigger registrar_reduccion_personal
after update on Area
for each row
begin
    if new.numero_empleados < old.numero_empleados then
        insert into historial_inventario_areas (area_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('reducción de personal en área ', new.nombre, ' de ', old.numero_empleados, ' a ', new.numero_empleados));
    end if;
end$$
delimiter ;

-- 18. Registrar aumento de personal en un área
delimiter $$
drop trigger if exists registrar_aumento_personal;
create trigger registrar_aumento_personal
after update on Area
for each row
begin
    if new.numero_empleados > old.numero_empleados then
        insert into historial_inventario_areas (area_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('aumento de personal en área ', new.nombre, ' de ', old.numero_empleados, ' a ', new.numero_empleados));
    end if;
end$$
delimiter ;

-- 19. Registrar cambios en la descripción de un área
delimiter $$
drop trigger if exists registrar_cambio_descripcion_area;
create trigger registrar_cambio_descripcion_area
after update on Area
for each row
begin
    if new.descripcion != old.descripcion then
        insert into historial_inventario_areas (area_id, usuario, accion, detalle)
        values (new.ID, user(), 'update', concat('cambio de descripción en área ', new.nombre, ': ', new.descripcion));
    end if;
end$$
delimiter ;

-- 20. Evitar que un área tenga menos de un empleado asignado
delimiter $$
drop trigger if exists validar_minimo_empleados_area;
create trigger validar_minimo_empleados_area
before update on Area
for each row
begin
    if new.numero_empleados < 1 then
        signal sqlstate '45000' set message_text = 'ERROR: Un área debe tener al menos un empleado asignado';
    end if;
end$$
delimiter ;
