insert into usuario (admin, password, username, apellidos, email, nombre, num_telefono, dtype, id) values (true, '{bcrypt}$2a$10$EJyBnD7gGY5IM2mUDb91M.eBgqK1txOlGdUA0wnoZwo/rVFiffcSm', 'jose12', 'perez', 'jose@gmail.com', 'Jose Miguel', 7736257, 'A', 1);
insert into usuario (admin, password, username, apellidos, email, nombre, num_telefono, dtype, id) values (true, '{bcrypt}$2a$10$EJyBnD7gGY5IM2mUDb91M.eBgqK1txOlGdUA0wnoZwo/rVFiffcSm', 'pepe3', 'gomez', 'pepe@gmail.com', 'pepe', 77656547, 'A', 2);
insert into usuario (admin, password, username, apellidos, email, nombre, num_telefono, dtype, id) values (true, '{bcrypt}$2a$10$EJyBnD7gGY5IM2mUDb91M.eBgqK1txOlGdUA0wnoZwo/rVFiffcSm', 'juan30', 'alvarez', 'juan@gmail.com', 'Juan', 7756557, 'A', 3);
insert into usuario (admin, password, username, apellidos, email, nombre, num_telefono, dtype, id) values (true, '{bcrypt}$2a$10$EJyBnD7gGY5IM2mUDb91M.eBgqK1txOlGdUA0wnoZwo/rVFiffcSm', 'raul2', 'fernandez', 'raul@gmail.com', 'Raul', 7743257, 'A', 4);
insert into usuario (admin, password, username, apellidos, email, nombre, num_telefono, dtype, id) values (true, '{bcrypt}$2a$10$EJyBnD7gGY5IM2mUDb91M.eBgqK1txOlGdUA0wnoZwo/rVFiffcSm', 'javier45', 'martinez', 'javier@gmail.com', 'Javier', 77546257, 'A', 5);




insert into categoria (id, nombre, imagen) values (1,'Champus','https://www.periodistadigital.com/wp-content/uploads/2020/04/mejor-champu-sin-sulfatos.png');
insert into categoria (id, nombre, imagen) values (2,'Maquinilla','https://pelu10.com/4960-home_default/maquina-corte-inalambrica-cordless-uspro-li-edicion-limitada-sugar-skull-andis-73090.jpg');
insert into categoria (id, nombre, imagen) values (3,'tijeras','https://pelu10.com/4960-home_default/maquina-corte-inalambrica-cordless-uspro-li-edicion-limitada-sugar-skull-andis-73090.jpg');
insert into categoria (id, nombre, imagen) values (4,'navajas','https://pelu10.com/4960-home_default/maquina-corte-inalambrica-cordless-uspro-li-edicion-limitada-sugar-skull-andis-73090.jpg');

insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'champu ',9,'Sin descripcion',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'gomina',11,'Sin descripcion',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'maquinilla r33',33,'Sin descripcion',0,'rojo',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'navaja l2',12,'Sin descripcion',0,'verde',4);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'abrillantador',10,'Sin descripcion',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'matizador',8,'Sin descripcion',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'maquinilla yt5',70,'Sin descripcion',0,'rojo',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'razer 6r',25,'',0,'verde',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'gomina star',3,'Sin descripcion',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'polvos moldeador',5,'Sin descripcion',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'cera',5,'Sin descripcion',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'champu anti-caspa',9,'Sin descripcion',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'matizador para pelo blanco',8,'Sin descripcion',0,'rojo',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'navaja r2',8,'Sin descripcion',0,'verde',4);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'maquinilla star',40,'Sin descripcion',0,'rojo',2);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'champu par pelo ondulado',15,'Sin descripcion',0,'verde',1);
insert into producto (id, nombre, precio, descripcion,descuento,color,categoria_id) values (NEXTVAL('hibernate_sequence'),'tijeras',9,'Sin descripcion',0,'rojo',3);

insert into usuario (admin, password, username, apellidos, correo, nombre, dtype, id) values (false,'{bcrypt}$2a$10$daw3CqsK.t/Iqo2CrIsmuuG9R9.7XTVb8mnWkJ7VZLCbYnFi6TiE6' , 'mgaangel10','perez', 'angel@gmail.com', 'angel', 'C', 18);



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
