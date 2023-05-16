insert into empleado (id, nombre, apellidos, email) values (NEXTVAL('hibernate_sequence'),'Luis Miguel','López','luismi.lopez@triana.com');
insert into empleado (id, nombre, apellidos, email) values (NEXTVAL('hibernate_sequence'),'Ángel','Naranjo','angel.narajo@triana.com');

insert into categoria (id, nombre, imagen) values (1,'Champoos','https://www.periodistadigital.com/wp-content/uploads/2020/04/mejor-champu-sin-sulfatos.png');
insert into categoria (id, nombre, imagen) values (2,'Maquinilla','https://pelu10.com/4960-home_default/maquina-corte-inalambrica-cordless-uspro-li-edicion-limitada-sugar-skull-andis-73090.jpg');
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'champoo',10,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'gomina',10,'gomina para no calvos',0,'verde',2);

insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'degradado',10,'corte para no calvos',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'rapado',11,'corte a rass',0,10);

