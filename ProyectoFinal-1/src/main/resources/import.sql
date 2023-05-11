insert into empleado (id, nombre, apellidos, email) values (NEXTVAL('hibernate_sequence'),'Luis Miguel','López','luismi.lopez@triana.com');
insert into empleado (id, nombre, apellidos, email) values (NEXTVAL('hibernate_sequence'),'Ángel','Naranjo','angel.narajo@triana.com');

insert into producto(id,nombre, precio, descripcion, descuento, color) values  (NEXTVAL('hibernate_sequence'),'degradado',9,'corte degradado',0,'rojo');

insert into servicio(id,nombre, precio, descripcion, descuento, duracion) values  (NEXTVAL('hibernate_sequence'),'degradado',9,'corte degradado',0,30);