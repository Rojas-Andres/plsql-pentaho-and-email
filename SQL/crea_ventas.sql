CREATE OR REPLACE FUNCTION public.crea_ventas()
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare
   
cursor_datos cursor is
select id from empleados;

id integer;
generar_valores integer;
venta numeric;
id_fecha integer;

begin
	
	id = 0;
	
	for registro in cursor_datos loop
		id = id+1;
		
		-- Este select me indica cuantos insert voy a hacer en ventas
		SELECT round(random()*10) into generar_valores;
			
		for i in 1..generar_valores loop
			-- Generamos un numero aleatorio para la venta
			SELECT random()*1000 into venta ;
		
			--Generamos una fecha aleatoria
			select fecha_id into id_fecha 
			from fechas  order by random() limit 1 ;

			raise notice 'id % , i % , venta % , id_fecha%',registro.id,generar_valores,venta,id_fecha;
			
			insert into ventas(id_empleado,venta ,fecha_id )
			values (registro.id,venta,id_fecha );
		
		end loop;
			
		
		raise notice 'id %',id;
	
	end loop;
 return true;

END;
$function$
;
