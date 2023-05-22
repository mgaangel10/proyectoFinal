insert into empleado (id, nombre, apellidos, email) values (NEXTVAL('hibernate_sequence'),'Luis Miguel','López','luismi.lopez@triana.com');
insert into empleado (id, nombre, apellidos, email) values (NEXTVAL('hibernate_sequence'),'Ángel','Naranjo','angel.narajo@triana.com');

insert into categoria (id, nombre, imagen) values (1,'Champoos','https://www.periodistadigital.com/wp-content/uploads/2020/04/mejor-champu-sin-sulfatos.png');
insert into categoria (id, nombre, imagen) values (2,'Maquinilla','https://pelu10.com/4960-home_default/maquina-corte-inalambrica-cordless-uspro-li-edicion-limitada-sugar-skull-andis-73090.jpg');

insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'champu ',9,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'gomina',11,'gomina para no calvos',0,'verde',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'maquinilla r33',33,'champoo para calvos',0,'rojo',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'navaja l2',12,'gomina para no calvos',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'abrillantador',10,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'matizador',8,'gomina para no calvos',0,'verde',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'maquinilla yt5',70,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'razer 6r',25,'gomina para no calvos',0,'verde',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'gomina star',3,'champoo para calvos',0,'rojo',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'polvos moldeador',5,'gomina para no calvos',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'cera',5,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'champu anti-caspa',9,'gomina para no calvos',0,'verde',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'matizador para pelo blanco',8,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'navaja r2',8,'gomina para no calvos',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'maquinilla star',40,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'champu par pelo ondulado',15,'gomina para no calvos',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'tijeras',9,'champoo para calvos',0,'rojo',1);











insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'degradado',10,'corte para no calvos',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'rapado',11,'corte a rass',0,10);


