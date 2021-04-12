drop table empleados 
drop table ventas 
drop table fechas 

CREATE TABLE public.empleados (
	id int4 NULL,
	nombre varchar(50) NULL,
	apellido varchar(50) NULL,
	correo varchar(50) NULL,
	genero varchar(50) NULL,
	celular varchar(50) NULL,
	pais varchar(50) NULL
);

create table public.ventas(id_empleado int4 ,venta numeric(12,4),fecha_id numeric(12));

create table public.fechas( 
	fecha_id numeric(12),	
	dia varchar(30),
	mes varchar(12),
	ano varchar(12),
	fecha date
);
