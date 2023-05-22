insert into empleado (id, nombre, apellidos, email) values (NEXTVAL('hibernate_sequence'),'Luis Miguel','López','luismi.lopez@triana.com');
insert into empleado (id, nombre, apellidos, email) values (NEXTVAL('hibernate_sequence'),'Ángel','Naranjo','angel.narajo@triana.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Juan', 'Pérez García', 'juan.perez@email.com');
INSERT INTO empleado(id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'María', 'González López', 'maria.gonzalez@email.com');
INSERT INTO empleado(id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Pedro', 'Rodríguez Martínez', 'pedro.rodriguez@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Laura', 'Fernández Gómez', 'laura.fernandez@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Jorge', 'Sánchez Pérez', 'jorge.sanchez@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Ana', 'Martínez Ruiz', 'ana.martinez@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Carlos', 'García Hernández', 'carlos.garcia@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Sofía', 'Torres García', 'sofia.torres@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Miguel', 'López García', 'miguel.lopez@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Lucía', 'González Pérez', 'lucia.gonzalez@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Antonio', 'Sánchez García', 'antonio.sanchez@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Isabel', 'Hernández López', 'isabel.hernandez@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'David', 'Fernández Pérez', 'david.fernandez@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'Cristina', 'Martínez García', 'cristina.martinez@email.com');
INSERT INTO empleado (id, nombre, apellidos, email)VALUES (NEXTVAL('hibernate_sequence'),'José', 'García Pérez', 'jose.garcia@email.com');

insert into categoria (id, nombre, imagen) values (1,'Champus','https://www.periodistadigital.com/wp-content/uploads/2020/04/mejor-champu-sin-sulfatos.png');
insert into categoria (id, nombre, imagen) values (2,'Maquinilla','https://pelu10.com/4960-home_default/maquina-corte-inalambrica-cordless-uspro-li-edicion-limitada-sugar-skull-andis-73090.jpg');
insert into categoria (id, nombre, imagen) values (3,'tijeras','https://pelu10.com/4960-home_default/maquina-corte-inalambrica-cordless-uspro-li-edicion-limitada-sugar-skull-andis-73090.jpg');
insert into categoria (id, nombre, imagen) values (4,'navajas','https://pelu10.com/4960-home_default/maquina-corte-inalambrica-cordless-uspro-li-edicion-limitada-sugar-skull-andis-73090.jpg');

insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'champu ',9,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'gomina',11,'gomina para no calvos',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'maquinilla r33',33,'champoo para calvos',0,'rojo',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'navaja l2',12,'gomina para no calvos',0,'verde',4);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'abrillantador',10,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'matizador',8,'gomina para no calvos',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'maquinilla yt5',70,'champoo para calvos',0,'rojo',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'razer 6r',25,'gomina para no calvos',0,'verde',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'gomina star',3,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'polvos moldeador',5,'gomina para no calvos',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'cera',5,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'champu anti-caspa',9,'gomina para no calvos',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'matizador para pelo blanco',8,'champoo para calvos',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'navaja r2',8,'gomina para no calvos',0,'verde',4);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'maquinilla star',40,'champoo para calvos',0,'rojo',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'champu par pelo ondulado',15,'gomina para no calvos',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'tijeras',9,'champoo para calvos',0,'rojo',3);






insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'degradado',10,'Es un corte de pelo donde el cabello se corta gradualmente más corto hacia abajo, creando un efecto de cono. ',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'rapado',11,'Es un corte de pelo en la que el pelo quedaria a rass de la cabeza.Te ahorrarias muchoo tiempo al peinarte',0,10);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'degradado mas corte de barba',10,': Es un corte de pelo donde el cabello secorta de manera desigual en los lados, creando un efecto asimétrico.',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'corte jubilado',10,' Es un corte de pelo muy corto, donde el cabello se corta en capas cortas y desordenadas alrededor de la cabeza. ',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'corte mas tinte',10,' Es similar al corte de pelo Bob, pero el cabello se deja un poco más largo, generalmente hasta los hombros. ',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'lavado de pelo',10,'Es un corte de pelo donde se crean capas largas en todo el cabello para darle movimiento y textura.',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'corte de pelo mas lavado',10,' Es un corte de pelo donde el cabello se deja a la altura de los hombros.',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'tinte de pelo',10,'Es un corte de pelo donde el cabello se corta en una línea recta alrededor de la cabeza, generalmente a la altura de la mandíbula.',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'Permanente',10,' Es un corte de pelo donde el cabello se corta en forma de V en la parte posterior o en las puntas.',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'corte de pelo militar',11,' Es un corte de pelo muy corto, donde se utiliza una maquinilla para rapar el cabello. Es un estilo práctico y de fácil mantenimiento.',0,10);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'crop',10,' Es un corte de pelo corto donde se crean capas para darle textura y movimiento al cabello.',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'corte de pelo pompadour',10,'Es un corte de pelo donde el cabello se peina hacia atrás para crear una especie de "copete".',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'fade ',10,' Es un corte de pelo donde el cabello de los lados y la nuca se corta gradualmente más corto hacia arriba, creando un efecto degradado. ',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'Corte de pelo undercut',10,' Es un corte de pelo corto donde se crean capas para darle textura y movimiento al cabello. ',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'corte de pelo texturizado',10,' Es un corte de pelo donde el cabello se corta en una forma redonda, como si se hubiera utilizado un tazón como molde.',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'corte de epelo mullet',10,'Es un corte de pelo corto donde el flequillo se deja más largo y se peina hacia un lado. Es un estilo elegante y sofisticado.',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'degradado mas corte de barba',10,': Es un corte de pelo donde el cabello secorta de manera desigual en los lados, creando un efecto asimétrico.',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'corte jubilado',10,' Es un corte de pelo muy corto, donde el cabello se corta en capas cortas y desordenadas alrededor de la cabeza.',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'corte mas tinte',10,' Es similar al corte de pelo Bob, pero el cabello se deja un poco más largo, generalmente hasta los hombros. ',0,30);
insert into servicio (id, nombre, precio, descripcion,descuento,duracion) values (NEXTVAL('hibernate_sequence'),'lavado de pelo',10,'Es un corte de pelo donde se crean capas largas en todo el cabello para darle movimiento y textura.',0,30);

