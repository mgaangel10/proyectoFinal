insert into empleado (id, nombre, apellidos, email) values (NEXTVAL('hibernate_sequence'),'Luis Miguel','López','luismi.lopez@triana.com');
insert into empleado (id, nombre, apellidos, email) values (NEXTVAL('hibernate_sequence'),'Ángel','Naranjo','angel.narajo@triana.com');

insert into producto (id, nombre, precio, descripcion,descuento,color) values (NEXTVAL('hibernate_sequence'),'champoo',10,'champoo para calvos',0,'rojo');
insert into producto (id, nombre, precio, descripcion,descuento,color) values (NEXTVAL('hibernate_sequence'),'gomina',10,'gomina para no calvos',0,'verde');

insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'degradado',10,'corte para no calvos',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'rapado',11,'corte a rass',0,10);
