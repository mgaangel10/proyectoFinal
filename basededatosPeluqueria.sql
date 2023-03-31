drop table if exists empleado cascade;
drop table if exists vende cascade;
drop table if exists vendible cascade;
drop table if exists lineaVenta cascade;
drop table if exists producto cascade;
drop table if exists servicio cascade;
drop table if exists categoria cascade;
drop table if exists venta cascade;
drop table if exists cliente cascade;
drop table if exists reserva cascade;

create table empleado(
	codEmpleado	smallserial not null,
	nombre	text not null,
	apellidos	text,
	correo	text not null,
	dni	varchar(11) not null,
	numTelefono	NUMERIC,
	fechaContratacion	date,
	salario	numeric ,
	puesto	text not null,
	notasAdicionales	text,
	esAdmi text not null,
	constraint pk_empleado primary key (codEmpleado),
	constraint ck_empelado check (salario > 0)
);

create table vende(
	codEmpleado	smallserial,
	codigo	smallserial,
	constraint pk_vende primary key (codEmpleado,codigo)
);

create table vendible(
	codigo	smallserial not null,
	precio numeric ,
	nombre	text not null,
	descripcion	text,
	numPuntos	numeric,
	descuentos	numeric ,
	codCategoria	smallserial not null,
	constraint pk_vendible primary key (codigo),
	constraint ck_empelado check (precio > 0)
);

create table servicio(
	codigo	smallserial not null,
	duracion	TIME not null,
	constraint pk_servicio primary key (codigo)
);

create table producto(
	codigo	smallserial not null,
	color	text ,
	constraint pk_producto primary key (codigo)
);

create table lineaVenta(
	codLinea	smallserial not null,
	codigo	smallserial not null,
	pvp	numeric not null,
	constraint pk_lineaVenta primary key (codLinea),
	constraint ck_empelado check (pvp > 0)
);

create table venta(
	codVenta	smallserial not null,
	codCliente smallserial,
	fecha date not null,
	constraint pk_venta primary key (codVenta)
);

create table cliente(
	dni	varchar(11) not null ,
	nombre text not null,
	apellidos	text,
	correo	text not null,
	codCliente	smallserial not null,
	genero	text,
	puntos numeric,
	constraint pk_cliente primary key (codCliente)
);

create table reserva(
	codReserva	smallserial not null,
	codCliente	smallserial,
	fecha	date,
	hora	TIME,
	constraint pk_reserva primary key (codReserva, codCliente)
);
create table categoria(
	codCategoria	smallserial not null,
	nombre text,
	constraint pK_categoria primary key (codCategoria)
);

alter table vende
add constraint fk_vende_codEmple foreign key (codEmpleado)
references empleado;

alter table vende
add constraint fk_vende_codigo foreign key (codigo)
references vendible;

alter table servicio
add constraint fk_servicio_codigo foreign key (codigo)
references vendible;

alter table producto
add constraint fk_producto_codigo foreign key (codigo)
REFERENCES vendible;

alter table lineaVenta
add constraint fk_lineVenta_codigo foreign key (codigo)
references vendible;

alter table venta
add constraint fk_venta_codCliente foreign key (codCliente)
references cliente;

alter table reserva
add constraint fk_reserva_codCliente FOREIGN key (codCliente)
references cliente;

alter table vendible
add constraint fk_vendible_codCategoria FOREIGN key (codCategoria)
references categoria ;


insert into categoria (nombre, codcategoria) values ('Cepastat', 1);
	insert into categoria (nombre, codcategoria) values ('oxygen', 2);
	insert into categoria (nombre, codcategoria) values ('ibuprofen', 3);
	insert into categoria (nombre, codcategoria) values ('VFEND', 4);
	insert into categoria (nombre, codcategoria) values ('DIABETIC DRY SKIN DEFENSE', 5);
	insert into categoria (nombre, codcategoria) values ('laura mercier tinted moisturizer Broad Spectrum SPF 20 Sunscreen Lightweight Flawless Coverage CAMEO', 6);
	insert into categoria (nombre, codcategoria) values ('QUADRAPAX', 7);
	insert into categoria (nombre, codcategoria) values ('Valsartan and Hydrochlorothiazide', 8);
	insert into categoria (nombre, codcategoria) values ('Duraflu', 9);
	insert into categoria (nombre, codcategoria) values ('Metoprolol Tartrate', 10);
	insert into categoria (nombre, codcategoria) values ('berkley and jensen nicotine', 11);
	insert into categoria (nombre, codcategoria) values ('Washington/Oregon Inland Weed Mixture', 12);
	insert into categoria (nombre, codcategoria) values ('MUSE', 13);
	insert into categoria (nombre, codcategoria) values ('ZOLPIDEM TARTRATE', 14);
	insert into categoria (nombre, codcategoria) values ('Bupivacaine Hydrochloride', 15);
	insert into categoria (nombre, codcategoria) values ('QUIXIN', 16);
	insert into categoria (nombre, codcategoria) values ('Pepto-Bismol', 17);
	insert into categoria (nombre, codcategoria) values ('Amlodipine Besylate', 18);
	insert into categoria (nombre, codcategoria) values ('Levothyroxine sodium', 19);
	insert into categoria (nombre, codcategoria) values ('Lidocoll', 20);
	insert into categoria (nombre, codcategoria) values ('Calcium Gluconate', 21);
	insert into categoria (nombre, codcategoria) values ('HEADACHE ANXIETY', 22);
	insert into categoria (nombre, codcategoria) values ('AMANTADINE HYDROCHLORIDE', 23);
	insert into categoria (nombre, codcategoria) values ('Aconitum Bryonia', 24);
	insert into categoria (nombre, codcategoria) values ('LAMIVUDINE', 25);
	insert into categoria (nombre, codcategoria) values ('Metformin Hydrochloride', 26);
	insert into categoria (nombre, codcategoria) values ('Levetiracetam', 27);
	insert into categoria (nombre, codcategoria) values ('Equaline aspirin', 28);
	insert into categoria (nombre, codcategoria) values ('Metoclopramide', 29);
	insert into categoria (nombre, codcategoria) values ('Rouge Dior 840 Crimson Serum', 30);
	insert into categoria (nombre, codcategoria) values ('Spongia Ovi', 31);
	insert into categoria (nombre, codcategoria) values ('Topiramate', 32);
	insert into categoria (nombre, codcategoria) values ('WHITE HICKORY POLLEN', 33);
	insert into categoria (nombre, codcategoria) values ('Benzonatate', 34);
	insert into categoria (nombre, codcategoria) values ('Donepezil Hydrochloride', 35);
	insert into categoria (nombre, codcategoria) values ('ASACOL', 36);
	insert into categoria (nombre, codcategoria) values ('Healing for Babies', 37);
	insert into categoria (nombre, codcategoria) values ('Carbocaine', 38);
	insert into categoria (nombre, codcategoria) values ('NIACIN', 39);
	insert into categoria (nombre, codcategoria) values ('Allergy Relief Non Drowsy', 40);
	insert into categoria (nombre, codcategoria) values ('LMX5', 41);
	insert into categoria (nombre, codcategoria) values ('LE TECHNIQ', 42);
	insert into categoria (nombre, codcategoria) values ('ACETAMINOPHEN AND DIPHENHYDRAMINE HYDROCHLORIDE', 43);
	insert into categoria (nombre, codcategoria) values ('Lisinopril', 44);
	insert into categoria (nombre, codcategoria) values ('Clomipramine Hydrochloride', 45);
	insert into categoria (nombre, codcategoria) values ('No7 Protect and Perfect Foundation Sunscreen Broad Spectrum SPF 15 Cool Ivory', 46);
	insert into categoria (nombre, codcategoria) values ('Beefwood/Australian Pine', 47);
	insert into categoria (nombre, codcategoria) values ('Alendronate Sodium', 48);
	insert into categoria (nombre, codcategoria) values ('ARTEMISIA VULGARIS POLLEN', 49);
	insert into categoria (nombre, codcategoria) values ('Every Day COCONUT Daily Face Broad Spectrum SPF 15', 50);
	insert into categoria (nombre, codcategoria) values ('Peptic Relief', 51);
	insert into categoria (nombre, codcategoria) values ('Stay Awake', 52);
	insert into categoria (nombre, codcategoria) values ('Guinea Pig Epithelium', 53);
	insert into categoria (nombre, codcategoria) values ('TRAMADOL HYDROCHLORIDE', 54);
	insert into categoria (nombre, codcategoria) values ('Sulfamethoxazole and Trimethoprim', 55);
	insert into categoria (nombre, codcategoria) values ('No7 Stay Perfect Foundation Sunscreen SPF 15 Almond', 56);
	insert into categoria (nombre, codcategoria) values ('Atenolol', 57);
	insert into categoria (nombre, codcategoria) values ('ASPIRIN', 58);
	insert into categoria (nombre, codcategoria) values ('HOUSE DUST', 59);
	insert into categoria (nombre, codcategoria) values ('Sulwhasoo Lumitouch Compact', 60);
	insert into categoria (nombre, codcategoria) values ('Skinovage Nanocell Age Protecting', 61);
	insert into categoria (nombre, codcategoria) values ('Piroxicam', 62);
	insert into categoria (nombre, codcategoria) values ('Lunesta', 63);
	insert into categoria (nombre, codcategoria) values ('Atenolol', 64);
	insert into categoria (nombre, codcategoria) values ('Acne', 65);
	insert into categoria (nombre, codcategoria) values ('Rite Aid Baby Sunscreen', 66);
	insert into categoria (nombre, codcategoria) values ('sunmark pain reliever pm', 67);
	insert into categoria (nombre, codcategoria) values ('White Birch', 68);
	insert into categoria (nombre, codcategoria) values ('In Control Nicotine', 69);
	insert into categoria (nombre, codcategoria) values ('LEVAQUIN', 70);
	insert into categoria (nombre, codcategoria) values ('methylphenidate hydrochloride CD', 71);
	insert into categoria (nombre, codcategoria) values ('ATORVASTATIN CALCIUM', 72);
	insert into categoria (nombre, codcategoria) values ('Mango Blossom', 73);
	insert into categoria (nombre, codcategoria) values ('Levothyroxine Sodium', 74);
	insert into categoria (nombre, codcategoria) values ('Rye', 75);
	insert into categoria (nombre, codcategoria) values ('Beyond Color', 76);
	insert into categoria (nombre, codcategoria) values ('Flagyl', 77);
	insert into categoria (nombre, codcategoria) values ('SENNA TIME', 78);
	insert into categoria (nombre, codcategoria) values ('Stay Awake', 79);
	insert into categoria (nombre, codcategoria) values ('Simvastatin', 80);
	insert into categoria (nombre, codcategoria) values ('ZOLPIDEM TARTRATE', 81);
	insert into categoria (nombre, codcategoria) values ('Pain Relief', 82);
	insert into categoria (nombre, codcategoria) values ('Healthy Accents Anti Itch', 83);
	insert into categoria (nombre, codcategoria) values ('Full Care BZK Towelette', 84);
	insert into categoria (nombre, codcategoria) values ('EPIVIR', 85);
	insert into categoria (nombre, codcategoria) values ('methylphenidate hydrochloride CD', 86);
	insert into categoria (nombre, codcategoria) values ('mark.', 87);
	insert into categoria (nombre, codcategoria) values ('CYMBALTA', 88);
	insert into categoria (nombre, codcategoria) values ('Secret Outlast Invisible', 89);
	insert into categoria (nombre, codcategoria) values ('Headaches', 90);
	insert into categoria (nombre, codcategoria) values ('Spiny Pigweed', 91);
	insert into categoria (nombre, codcategoria) values ('Famotidine', 92);
	insert into categoria (nombre, codcategoria) values ('RISPERDAL', 93);
	insert into categoria (nombre, codcategoria) values ('Dexamethasone', 94);
	insert into categoria (nombre, codcategoria) values ('ADVANCED TIME ZONE AGE REVERSING', 95);
	insert into categoria (nombre, codcategoria) values ('Herplex', 96);
	insert into categoria (nombre, codcategoria) values ('TIAZAC', 97);
	insert into categoria (nombre, codcategoria) values ('TRUFFLE EX SUN', 98);
	insert into categoria (nombre, codcategoria) values ('XtraCare Foam Antibacterial Hand Wash', 99);
	insert into categoria (nombre, codcategoria) values ('Hydrogen Peroxide', 100);
	

INSERT INTO empleado (codEmpleado, nombre, apellidos, correo, dni, numTelefono, fechaContratacion, salario, puesto, notasAdicionales, esAdmi) 
VALUES 
   (1, 'Juan', 'García', 'juan.garcia@example.com', '123456789A', 123456789, '2022-01-01', 30000, 'Gerente', 'Ninguna', 'No'),
   (2, 'Ana', 'López', 'ana.lopez@example.com', '234567890B', 234567890, '2022-02-01', 25000, 'Analista', 'Ninguna', 'No'),
   (3, 'Pedro', 'Fernández', 'pedro.fernandez@example.com', '345678901C', 345678901, '2022-03-01', 20000, 'Programador', 'Ninguna', 'No'),
   (4, 'María', 'Martínez', 'maria.martinez@example.com', '456789012D', 456789012, '2022-04-01', 15000, 'Secretaria', 'Ninguna', 'No'),
   (5, 'Pablo', 'Gómez', 'pablo.gomez@example.com', '567890123E', 567890123, '2022-05-01', 10000, 'Ayudante', 'Ninguna', 'No'),
   (6, 'Sofía', 'Rodríguez', 'sofia.rodriguez@example.com', '678901234F', 678901234, '2022-06-01', 35000, 'Gerente', 'Ninguna', 'No'),
   (7, 'Diego', 'Sánchez', 'diego.sanchez@example.com', '789012345G', 789012345, '2022-07-01', 40000, 'Gerente', 'Ninguna', 'No'),
   (8, 'Lucía', 'Hernández', 'lucia.hernandez@example.com', '890123456H', 890123456, '2022-08-01', 28000, 'Analista', 'Ninguna', 'No'),
   (9, 'Javier', 'González', 'javier.gonzalez@example.com', '901234567I', 901234567, '2022-09-01', 22000, 'Programador', 'Ninguna', 'No'),
   (10, 'Luisa', 'Díaz', 'luisa.diaz@example.com', '012345678J', 12345678, '2022-10-01', 18000, 'Secretaria', 'Ninguna', 'No'),
   (11, 'José', 'Ramírez', 'jose.ramirez@example.com', '234567891A', 234567891, '2022-11-01', 15000, 'Ayudante', 'Ninguna', 'No'),
   (12, 'Carmen', 'Fuentes', 'carmen.fuentes@example.com', '345678912B', 345678912, '2022-12-01', 25000, 'Analista', 'Ninguna', 'No'),
   (13, 'Jorge', 'Santos', 'jorge.santos@example.com', '456789123C', 456789123, '2023-01-01', 35000, 'Gerente', 'Ninguna', 'No'),
   (14, 'Laura', 'González', 'laura.gonzalez@example.com', '567891234D', 567891234, '2023-02-01', 45000, 'Gerente', 'Ninguna', 'No'),
   (15, 'Manuel', 'Muñoz', 'manuel.munoz@example.com', '678912345E', 678912345, '2023-03-01', 55000, 'Gerente', 'Ninguna', 'No'),
   (16, 'Alicia', 'Pérez', 'alicia.perez@example.com', '789123456F', 789123456, '2023-04-01', 25000, 'Analista', 'Ninguna', 'No'),
   (17, 'Francisco', 'Cortés', 'francisco.cortes@example.com', '901234567G', 901234567, '2023-05-01', 15000, 'Ayudante', 'Ninguna', 'No'),
   (18, 'Raquel', 'Carrasco', 'raquel.carrasco@example.com', '012345678H', 12345678, '2023-06-01', 30000, 'Programador', 'Ninguna', 'No'),
   (19, 'Miguel', 'Gallardo', 'miguel.gallardo@example.com', '123456789I', 23456789, '2023-07-01', 40000, 'Gerente', 'Ninguna', 'No'),
   (20, 'Isabel', 'Ortega', 'isabel.ortega@example.com', '234567890J', 34567890, '2023-08-01', 20000, 'Programador', 'Ninguna', 'No'),
   (21, 'Antonio', 'Benítez', 'antonio.benitez@example.com', '345678901K', 45678901, '2023-09-01', 15000, 'Ayudante', 'Ninguna', 'No'),
   (22, 'Sara', 'Cruz', 'sara.cruz@example.com', '456789012L', 56789012, '2023-10-01', 25000, 'Analista', 'Ninguna', 'No');
  
  insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (1, 81, 'docusate sodium and sennosides', 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', 49, 17, 1);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (2, 54, 'Acetaminophen', 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 88, 80, 2);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (3, 44, 'zolpidem tartrate', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 85, 15, 3);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (4, 73, 'Avobenzone, Homosalate, Octisalate, Octocrylene, Oxybenzone', 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 38, 51, 4);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (5, 70, 'triamcinolone acetonide', 'Duis mattis egestas metus.', 51, 26, 5);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (6, 37, 'quinapril hydrochloride and hydrochlorothiazide', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 84, 31, 6);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (7, 82, 'Acetaminophen, Aspirin, Caffeine', 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 27, 13, 7);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (8, 54, 'Sodium Fluoride', 'Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 34, 60, 8);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (9, 76, 'Acetazolamide', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 73, 73, 9);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (10, 78, 'Metoprolol tartrate', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 19, 95, 10);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (11, 91, 'Galantamine hydrobromide', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 18, 70, 11);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (12, 82, 'DOCUSATE SODIUM', 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 31, 90, 12);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (13, 4, 'Acetaminophen, Pheniramine Maleate, Phenylephrine HCl', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 44, 69, 13);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (14, 25, 'Triclosan', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 90, 36, 14);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (15, 42, 'Gemfibrozil', 'Nulla mollis molestie lorem.', 2, 14, 15);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (16, 3, 'Aluminum Chlorohydrate', 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 50, 77, 16);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (17, 8, 'amlodipine besylate and atorvastatin calcium', 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 7, 25, 17);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (18, 97, 'Metoprolol succinate', 'Maecenas pulvinar lobortis est.', 45, 32, 18);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (19, 17, 'California Mugwort', 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 90, 33, 19);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (20, 45, 'Titanium Dioxide, Zinc oxide', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 69, 40, 20);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (21, 20, 'Ketoconazole', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 46, 55, 21);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (22, 46, 'Acarbose', 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 7, 45, 22);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (23, 73, 'furosemide', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 96, 77, 23);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (24, 9, 'ATORVASTATIN CALCIUM', 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 12, 75, 24);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (25, 40, 'Pear', 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', 20, 92, 25);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (26, 16, 'Berberis vulgaris, Bladder, Thuja occidentalis, Bryonia, Hepar sulphuris calcareum,', 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 79, 56, 26);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (27, 100, 'Nimodipine', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 85, 89, 27);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (28, 23, 'titanium dioxide', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 78, 37, 28);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (29, 93, 'insulin aspart', 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 30, 37, 29);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (30, 16, 'VIOLA ODORATA', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 12, 78, 30);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (31, 54, 'Niacinamide', 'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 87, 70, 31);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (32, 71, 'MORPHINE SULFATE', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 76, 29, 32);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (33, 30, 'Salicylic Acid', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', 58, 16, 33);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (34, 11, 'Risperidone', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 8, 85, 34);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (35, 30, 'DOCUSATE SODIUM', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', 25, 93, 35);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (36, 23, 'Homosalate, Octisalate, Avobenzone, and Octocrylene', 'Morbi vel lectus in quam fringilla rhoncus.', 49, 19, 36);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (37, 78, 'SODIUM FLUORIDE', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 46, 74, 37);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (38, 93, 'TETRAHYDROZOLINE HYDROCHLORIDE AND ZINC SULFATE', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 35, 15, 38);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (39, 13, 'AVOBENZONE HOMOSALATE OCTISALATE OCTOCRYLENE OXYBENZONE', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', 8, 50, 39);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (40, 69, 'INTERLEUKIN-11', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', 23, 9, 40);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (41, 51, 'Octinoxate, Titanium Dioxide, and Zinc Oxide', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 23, 57, 41);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (42, 91, 'ZINC OXIDE', 'Quisque ut erat.', 49, 27, 42);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (43, 91, 'Ropinirole Hydrochloride', 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', 67, 1, 43);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (44, 17, 'Wheat Bunt', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue.', 98, 17, 44);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (45, 34, 'TOLNAFTATE', 'Morbi porttitor lorem id ligula.', 67, 23, 45);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (46, 39, 'Aconitum nap., Arg. nit., Aur.met., Baptisia, Bryonia, Chelidonium majus, Cimicifuga, Conium, Gelsemium, Ignatia, Kali carb., Lachesis, Lilium, Lycopodium, Nat. carb., Nat.mur., Phosphoricum ac., Phosphorus, Picricum ac., Plumb. met., Sepia, Staphysag., Stramonium, Thuja occ., Zinc. met., Chamomilla, Hypericum, Valeriana', 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 11, 19, 46);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (47, 29, 'Guaifenesin', 'Duis bibendum. Morbi non quam nec dui luctus rutrum.', 1, 58, 47);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (48, 45, 'adenosine', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.', 59, 3, 48);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (49, 14, 'OCTINOXATE, TITANIUM DIOXIDE', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.', 84, 91, 49);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (50, 46, 'BENZALKONIUM CHLORIDE', 'Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 60, 37, 50);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (51, 63, 'estradiol valerate and estradiol valerate/dienogest', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', 84, 99, 51);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (52, 91, 'Terazosin Hydrochloride', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui.', 52, 90, 52);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (53, 36, 'Diphenhydramine HCl', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 71, 37, 53);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (54, 75, 'Fluoride', 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 85, 19, 54);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (55, 56, 'Nateglinide', 'Donec posuere metus vitae ipsum. Aliquam non mauris.', 13, 39, 55);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (56, 28, 'Ibuprofen', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh.', 92, 80, 56);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (57, 94, 'Insulin lispro', 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.', 36, 18, 57);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (58, 41, 'Helminthosporium', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 79, 62, 58);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (59, 46, 'HYDROCODONE BITARTRATE AND ACETAMINOPHEN', 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 97, 41, 59);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (60, 48, 'Aspergillus fumigatus', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 75, 86, 60);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (61, 1, 'avobenzone, homosalate, octisalate, octocrylene', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', 82, 25, 61);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (62, 93, 'Fexofenadine HCl', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 6, 89, 62);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (63, 37, 'Triclosan', 'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.', 44, 24, 63);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (64, 5, 'Streptococcus Faecalis, Streptococcus Haemolyticus, Streptococcus Pneumoniae, Streptococcus Viridans', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', 52, 8, 64);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (65, 36, 'Acetaminophen, Caffeine and Pyrilamine maleate', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 66, 85, 65);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (66, 60, 'Neomycin sulfate, Polymyxin B Sulfate and Bacitracin Zinc', 'Suspendisse ornare consequat lectus.', 99, 16, 66);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (67, 32, 'VENLAFAXINE HYDROCHLORIDE', 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 67, 40, 67);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (68, 74, 'Ibuprofen', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis.', 71, 54, 68);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (69, 69, 'meclizine hydrochloride', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 31, 65, 69);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (70, 79, 'Octinoxate, Titanium Dioxide', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 51, 91, 70);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (71, 48, 'Carbetapentane Citrate, Phenylephrine Hydrochloride, Guaifenesin', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 13, 8, 71);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (72, 34, 'WITCH HAZEL', 'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', 91, 72, 72);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (73, 27, 'Rat Epithelium', 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 10, 29, 73);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (74, 57, 'Loratadine, Pseudoephedrine', 'Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 75, 69, 74);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (75, 50, 'Fexofenadine Hydrochloride', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 63, 37, 75);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (76, 12, 'clonazepam', 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 56, 84, 76);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (77, 26, 'Interferon gamma-1b', 'Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 62, 23, 77);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (78, 22, 'TITANIUM DIOXIDE', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 5, 36, 78);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (79, 77, 'Glipizide', 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 45, 6, 79);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (80, 93, 'Risperidone', 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.', 17, 38, 80);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (81, 6, 'Triclosan', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 31, 84, 81);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (82, 3, 'desipramine hydrochloride', 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.', 4, 64, 82);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (83, 10, 'hydrocortisone acetate pramoxine hcl', 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', 79, 7, 83);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (84, 30, 'Ibuprofen', 'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.', 80, 28, 84);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (85, 8, 'Benzoyl Peroxide', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.', 70, 97, 85);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (86, 88, 'Aluminum Chlorohydrate', 'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', 51, 3, 86);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (87, 15, 'CARBIDOPA and LEVODOPA', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 97, 47, 87);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (88, 98, 'quassia amara', 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 13, 82, 88);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (89, 63, 'Ceanothus americanus, Condurango, Echinacea angustifolia, Hydrastis canadensis, Ligusticum porteri, Lomatium, Nasturtium aquaticum, Tabebuia impetiginosa, Astragalus membranaceus,', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 9, 86, 89);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (90, 47, 'BENZALKONIUM CHLORIDE', 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.', 88, 40, 90);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (91, 14, 'Dimethicone, Camphor (synthetic), Menthol, and Phenol', 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 34, 6, 91);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (92, 33, 'zolpidem tartrate', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 29, 54, 92);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (93, 31, 'Nystatin', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.', 52, 46, 93);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (94, 39, 'CAMPHOR (SYNTHETIC), MENTHOL, METHYL SALICYLATE', 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', 78, 20, 94);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (95, 47, 'CHLOROXYLENOL, TRICLOSAN', 'Nullam varius. Nulla facilisi.', 61, 14, 95);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (96, 55, 'LIDOCAINE HYDROCHLORIDE,EPINEPHRINE BITARTRATE', 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 17, 14, 96);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (97, 2, 'darbepoetin alfa', 'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 85, 2, 97);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (98, 68, 'HETASTARCH', 'Pellentesque ultrices mattis odio.', 41, 35, 98);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (99, 82, 'piroxicam', 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 17, 26, 99);
insert into vendible (codigo, precio, nombre, descripcion, numPuntos, descuentos, codCategoria) values (100, 32, 'icam', 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputuisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 7, 29, 89);
	
insert into producto (codigo, color) values (1, 'Crimson');
insert into producto (codigo, color) values (2, 'Crimson');
insert into producto (codigo, color) values (3, 'Maroon');
insert into producto (codigo, color) values (4, 'Puce');
insert into producto (codigo, color) values (5, 'Violet');
insert into producto (codigo, color) values (6, 'Red');
insert into producto (codigo, color) values (7, 'Teal');
insert into producto (codigo, color) values (8, 'Yellow');
insert into producto (codigo, color) values (9, 'Maroon');
insert into producto (codigo, color) values (10, 'Red');
insert into producto (codigo, color) values (11, 'Yellow');
insert into producto (codigo, color) values (12, 'Indigo');
insert into producto (codigo, color) values (13, 'Red');
insert into producto (codigo, color) values (14, 'Red');
insert into producto (codigo, color) values (15, 'Mauv');
insert into producto (codigo, color) values (16, 'Indigo');
insert into producto (codigo, color) values (17, 'Khaki');
insert into producto (codigo, color) values (18, 'Goldenrod');
insert into producto (codigo, color) values (19, 'Goldenrod');
insert into producto (codigo, color) values (20, 'Blue');
insert into producto (codigo, color) values (21, 'Violet');
insert into producto (codigo, color) values (22, 'Orange');
insert into producto (codigo, color) values (23, 'Green');
insert into producto (codigo, color) values (24, 'Pink');
insert into producto (codigo, color) values (25, 'Purple');
insert into producto (codigo, color) values (26, 'Pink');
insert into producto (codigo, color) values (27, 'Maroon');
insert into producto (codigo, color) values (28, 'Mauv');
insert into producto (codigo, color) values (29, 'Maroon');
insert into producto (codigo, color) values (30, 'Goldenrod');
insert into producto (codigo, color) values (31, 'Turquoise');
insert into producto (codigo, color) values (32, 'Khaki');
insert into producto (codigo, color) values (33, 'Fuscia');
insert into producto (codigo, color) values (34, 'Blue');
insert into producto (codigo, color) values (35, 'Khaki');
insert into producto (codigo, color) values (36, 'Crimson');
insert into producto (codigo, color) values (37, 'Purple');
insert into producto (codigo, color) values (38, 'Green');
insert into producto (codigo, color) values (39, 'Violet');
insert into producto (codigo, color) values (40, 'Pink');
insert into producto (codigo, color) values (41, 'Crimson');
insert into producto (codigo, color) values (42, 'Red');
insert into producto (codigo, color) values (43, 'Indigo');
insert into producto (codigo, color) values (44, 'Blue');
insert into producto (codigo, color) values (45, 'Khaki');
insert into producto (codigo, color) values (46, 'Maroon');
insert into producto (codigo, color) values (47, 'Violet');
insert into producto (codigo, color) values (48, 'Purple');
insert into producto (codigo, color) values (49, 'Pink');
insert into producto (codigo, color) values (50, 'Crimson');
insert into producto (codigo, color) values (51, 'Goldenrod');
insert into producto (codigo, color) values (52, 'Purple');
insert into producto (codigo, color) values (53, 'Puce');
insert into producto (codigo, color) values (54, 'Red');
insert into producto (codigo, color) values (55, 'Red');
insert into producto (codigo, color) values (56, 'Aquamarine');
insert into producto (codigo, color) values (57, 'Green');
insert into producto (codigo, color) values (58, 'Aquamarine');
insert into producto (codigo, color) values (59, 'Blue');
insert into producto (codigo, color) values (60, 'Aquamarine');
insert into producto (codigo, color) values (61, 'Turquoise');
insert into producto (codigo, color) values (62, 'Turquoise');
insert into producto (codigo, color) values (63, 'Orange');
insert into producto (codigo, color) values (64, 'Indigo');
insert into producto (codigo, color) values (65, 'Blue');
insert into producto (codigo, color) values (66, 'Goldenrod');
insert into producto (codigo, color) values (67, 'Pink');
insert into producto (codigo, color) values (68, 'Turquoise');
insert into producto (codigo, color) values (69, 'Fuscia');
insert into producto (codigo, color) values (70, 'Goldenrod');
insert into producto (codigo, color) values (71, 'Khaki');
insert into producto (codigo, color) values (72, 'Violet');
insert into producto (codigo, color) values (73, 'Mauv');
insert into producto (codigo, color) values (74, 'Green');
insert into producto (codigo, color) values (75, 'Aquamarine');
insert into producto (codigo, color) values (76, 'Green');
insert into producto (codigo, color) values (77, 'Maroon');
insert into producto (codigo, color) values (78, 'Red');
insert into producto (codigo, color) values (79, 'Aquamarine');
insert into producto (codigo, color) values (80, 'Crimson');
insert into producto (codigo, color) values (81, 'Violet');
insert into producto (codigo, color) values (82, 'Violet');
insert into producto (codigo, color) values (83, 'Yellow');
insert into producto (codigo, color) values (84, 'Red');
insert into producto (codigo, color) values (85, 'Pink');
insert into producto (codigo, color) values (86, 'Mauv');
insert into producto (codigo, color) values (87, 'Red');
insert into producto (codigo, color) values (88, 'Pink');
insert into producto (codigo, color) values (89, 'Green');
insert into producto (codigo, color) values (90, 'Crimson');
insert into producto (codigo, color) values (91, 'Orange');
insert into producto (codigo, color) values (92, 'Yellow');
insert into producto (codigo, color) values (93, 'Puce');
insert into producto (codigo, color) values (94, 'Fuscia');
insert into producto (codigo, color) values (95, 'Red');
insert into producto (codigo, color) values (96, 'Khaki');
insert into producto (codigo, color) values (97, 'Puce');
insert into producto (codigo, color) values (98, 'Green');
insert into producto (codigo, color) values (99, 'Crimson');
insert into producto (codigo, color) values (100, 'Indigo');
	

  
  	
	insert into servicio (codigo, duracion) values (1, '6:09');
insert into servicio (codigo, duracion) values (2, '12:13');
insert into servicio (codigo, duracion) values (3, '14:36');
insert into servicio (codigo, duracion) values (4, '12:01');
insert into servicio (codigo, duracion) values (5, '20:06');
insert into servicio (codigo, duracion) values (6, '2:02');
insert into servicio (codigo, duracion) values (7, '9:14');
insert into servicio (codigo, duracion) values (8, '10:32');
insert into servicio (codigo, duracion) values (9, '14:00');
insert into servicio (codigo, duracion) values (10, '2:58');
insert into servicio (codigo, duracion) values (11, '7:22');
insert into servicio (codigo, duracion) values (12, '19:36');
insert into servicio (codigo, duracion) values (13, '15:53');
insert into servicio (codigo, duracion) values (14, '2:41');
insert into servicio (codigo, duracion) values (15, '15:07');
insert into servicio (codigo, duracion) values (16, '13:35');
insert into servicio (codigo, duracion) values (17, '14:27');
insert into servicio (codigo, duracion) values (18, '20:38');
insert into servicio (codigo, duracion) values (19, '1:44');
insert into servicio (codigo, duracion) values (20, '22:02');
insert into servicio (codigo, duracion) values (21, '4:50');
insert into servicio (codigo, duracion) values (22, '1:39');
insert into servicio (codigo, duracion) values (23, '5:06');
insert into servicio (codigo, duracion) values (24, '21:15');
insert into servicio (codigo, duracion) values (25, '21:47');
insert into servicio (codigo, duracion) values (26, '16:35');
insert into servicio (codigo, duracion) values (27, '5:24');
insert into servicio (codigo, duracion) values (28, '6:38');
insert into servicio (codigo, duracion) values (29, '11:03');
insert into servicio (codigo, duracion) values (30, '9:57');
insert into servicio (codigo, duracion) values (31, '23:28');
insert into servicio (codigo, duracion) values (32, '4:39');
insert into servicio (codigo, duracion) values (33, '12:02');
insert into servicio (codigo, duracion) values (34, '4:44');
insert into servicio (codigo, duracion) values (35, '20:46');
insert into servicio (codigo, duracion) values (36, '9:02');
insert into servicio (codigo, duracion) values (37, '9:19');
insert into servicio (codigo, duracion) values (38, '14:08');
insert into servicio (codigo, duracion) values (39, '10:58');
insert into servicio (codigo, duracion) values (40, '0:12');
insert into servicio (codigo, duracion) values (41, '8:30');
insert into servicio (codigo, duracion) values (42, '1:58');
insert into servicio (codigo, duracion) values (43, '17:50');
insert into servicio (codigo, duracion) values (44, '21:08');
insert into servicio (codigo, duracion) values (45, '8:14');
insert into servicio (codigo, duracion) values (46, '1:07');
insert into servicio (codigo, duracion) values (47, '13:25');
insert into servicio (codigo, duracion) values (48, '3:32');
insert into servicio (codigo, duracion) values (49, '2:45');
insert into servicio (codigo, duracion) values (50, '1:05');
insert into servicio (codigo, duracion) values (51, '10:00');
insert into servicio (codigo, duracion) values (52, '18:49');
insert into servicio (codigo, duracion) values (53, '15:47');
insert into servicio (codigo, duracion) values (54, '13:03');
insert into servicio (codigo, duracion) values (55, '7:44');
insert into servicio (codigo, duracion) values (56, '18:22');
insert into servicio (codigo, duracion) values (57, '9:08');
insert into servicio (codigo, duracion) values (58, '6:31');
insert into servicio (codigo, duracion) values (59, '13:56');
insert into servicio (codigo, duracion) values (60, '18:13');
insert into servicio (codigo, duracion) values (61, '8:03');
insert into servicio (codigo, duracion) values (62, '12:08');
insert into servicio (codigo, duracion) values (63, '5:30');
insert into servicio (codigo, duracion) values (64, '2:56');
insert into servicio (codigo, duracion) values (65, '1:41');
insert into servicio (codigo, duracion) values (66, '17:00');
insert into servicio (codigo, duracion) values (67, '13:33');
insert into servicio (codigo, duracion) values (68, '1:36');
insert into servicio (codigo, duracion) values (69, '15:23');
insert into servicio (codigo, duracion) values (70, '9:55');
insert into servicio (codigo, duracion) values (71, '23:41');
insert into servicio (codigo, duracion) values (72, '18:59');
insert into servicio (codigo, duracion) values (73, '16:28');
insert into servicio (codigo, duracion) values (74, '10:54');
insert into servicio (codigo, duracion) values (75, '19:04');
insert into servicio (codigo, duracion) values (76, '1:25');
insert into servicio (codigo, duracion) values (77, '15:52');
insert into servicio (codigo, duracion) values (78, '6:36');
insert into servicio (codigo, duracion) values (79, '17:58');
insert into servicio (codigo, duracion) values (80, '13:40');
insert into servicio (codigo, duracion) values (81, '13:27');
insert into servicio (codigo, duracion) values (82, '10:41');
insert into servicio (codigo, duracion) values (83, '10:27');
insert into servicio (codigo, duracion) values (84, '13:17');
insert into servicio (codigo, duracion) values (85, '4:08');
insert into servicio (codigo, duracion) values (86, '9:58');
insert into servicio (codigo, duracion) values (87, '16:55');
insert into servicio (codigo, duracion) values (88, '19:10');
insert into servicio (codigo, duracion) values (89, '13:43');
insert into servicio (codigo, duracion) values (90, '6:53');
insert into servicio (codigo, duracion) values (91, '17:10');
insert into servicio (codigo, duracion) values (92, '1:14');
insert into servicio (codigo, duracion) values (93, '12:17');
insert into servicio (codigo, duracion) values (94, '0:06');
insert into servicio (codigo, duracion) values (95, '13:57');
insert into servicio (codigo, duracion) values (96, '1:52');
insert into servicio (codigo, duracion) values (97, '15:22');
insert into servicio (codigo, duracion) values (98, '21:02');
insert into servicio (codigo, duracion) values (99, '22:37');
insert into servicio (codigo, duracion) values (100, '11:06');


	
	
insert into lineaVenta (codLinea, codigo, pvp) values (1, 1, 74);
insert into lineaVenta (codLinea, codigo, pvp) values (2, 2, 94);
insert into lineaVenta (codLinea, codigo, pvp) values (3, 3, 62);
insert into lineaVenta (codLinea, codigo, pvp) values (4, 4, 86);
insert into lineaVenta (codLinea, codigo, pvp) values (5, 5, 17);
insert into lineaVenta (codLinea, codigo, pvp) values (6, 6, 29);
insert into lineaVenta (codLinea, codigo, pvp) values (7, 7, 29);
insert into lineaVenta (codLinea, codigo, pvp) values (8, 8, 67);
insert into lineaVenta (codLinea, codigo, pvp) values (9, 9, 89);
insert into lineaVenta (codLinea, codigo, pvp) values (10, 10, 73);
insert into lineaVenta (codLinea, codigo, pvp) values (11, 11, 1);
insert into lineaVenta (codLinea, codigo, pvp) values (12, 12, 38);
insert into lineaVenta (codLinea, codigo, pvp) values (13, 13, 66);
insert into lineaVenta (codLinea, codigo, pvp) values (14, 14, 36);
insert into lineaVenta (codLinea, codigo, pvp) values (15, 15, 41);
insert into lineaVenta (codLinea, codigo, pvp) values (16, 16, 42);
insert into lineaVenta (codLinea, codigo, pvp) values (17, 17, 80);
insert into lineaVenta (codLinea, codigo, pvp) values (18, 18, 33);
insert into lineaVenta (codLinea, codigo, pvp) values (19, 19, 3);
insert into lineaVenta (codLinea, codigo, pvp) values (20, 20, 20);
insert into lineaVenta (codLinea, codigo, pvp) values (21, 21, 11);
insert into lineaVenta (codLinea, codigo, pvp) values (22, 22, 86);
insert into lineaVenta (codLinea, codigo, pvp) values (23, 23, 59);
insert into lineaVenta (codLinea, codigo, pvp) values (24, 24, 80);
insert into lineaVenta (codLinea, codigo, pvp) values (25, 25, 26);
insert into lineaVenta (codLinea, codigo, pvp) values (26, 26, 93);
insert into lineaVenta (codLinea, codigo, pvp) values (27, 27, 18);
insert into lineaVenta (codLinea, codigo, pvp) values (28, 28, 12);
insert into lineaVenta (codLinea, codigo, pvp) values (29, 29, 75);
insert into lineaVenta (codLinea, codigo, pvp) values (30, 30, 36);
insert into lineaVenta (codLinea, codigo, pvp) values (31, 31, 53);
insert into lineaVenta (codLinea, codigo, pvp) values (32, 32, 30);
insert into lineaVenta (codLinea, codigo, pvp) values (33, 33, 28);
insert into lineaVenta (codLinea, codigo, pvp) values (34, 34, 20);
insert into lineaVenta (codLinea, codigo, pvp) values (35, 35, 16);
insert into lineaVenta (codLinea, codigo, pvp) values (36, 36, 27);
insert into lineaVenta (codLinea, codigo, pvp) values (37, 37, 80);
insert into lineaVenta (codLinea, codigo, pvp) values (38, 38, 20);
insert into lineaVenta (codLinea, codigo, pvp) values (39, 39, 48);
insert into lineaVenta (codLinea, codigo, pvp) values (40, 40, 64);
insert into lineaVenta (codLinea, codigo, pvp) values (41, 41, 68);
insert into lineaVenta (codLinea, codigo, pvp) values (42, 42, 44);
insert into lineaVenta (codLinea, codigo, pvp) values (43, 43, 37);
insert into lineaVenta (codLinea, codigo, pvp) values (44, 44, 78);
insert into lineaVenta (codLinea, codigo, pvp) values (45, 45, 82);
insert into lineaVenta (codLinea, codigo, pvp) values (46, 46, 30);
insert into lineaVenta (codLinea, codigo, pvp) values (47, 47, 91);
insert into lineaVenta (codLinea, codigo, pvp) values (48, 48, 57);
insert into lineaVenta (codLinea, codigo, pvp) values (49, 49, 89);
insert into lineaVenta (codLinea, codigo, pvp) values (50, 50, 88);
insert into lineaVenta (codLinea, codigo, pvp) values (51, 51, 24);
insert into lineaVenta (codLinea, codigo, pvp) values (52, 52, 49);
insert into lineaVenta (codLinea, codigo, pvp) values (53, 53, 12);
insert into lineaVenta (codLinea, codigo, pvp) values (54, 54, 75);
insert into lineaVenta (codLinea, codigo, pvp) values (55, 55, 18);
insert into lineaVenta (codLinea, codigo, pvp) values (56, 56, 46);
insert into lineaVenta (codLinea, codigo, pvp) values (57, 57, 97);
insert into lineaVenta (codLinea, codigo, pvp) values (58, 58, 98);
insert into lineaVenta (codLinea, codigo, pvp) values (59, 59, 98);
insert into lineaVenta (codLinea, codigo, pvp) values (60, 60, 21);
insert into lineaVenta (codLinea, codigo, pvp) values (61, 61, 79);
insert into lineaVenta (codLinea, codigo, pvp) values (62, 62, 47);
insert into lineaVenta (codLinea, codigo, pvp) values (63, 63, 62);
insert into lineaVenta (codLinea, codigo, pvp) values (64, 64, 56);
insert into lineaVenta (codLinea, codigo, pvp) values (65, 65, 94);
insert into lineaVenta (codLinea, codigo, pvp) values (66, 66, 60);
insert into lineaVenta (codLinea, codigo, pvp) values (67, 67, 30);
insert into lineaVenta (codLinea, codigo, pvp) values (68, 68, 84);
insert into lineaVenta (codLinea, codigo, pvp) values (69, 69, 86);
insert into lineaVenta (codLinea, codigo, pvp) values (70, 70, 25);
insert into lineaVenta (codLinea, codigo, pvp) values (71, 71, 44);
insert into lineaVenta (codLinea, codigo, pvp) values (72, 72, 73);
insert into lineaVenta (codLinea, codigo, pvp) values (73, 73, 27);
insert into lineaVenta (codLinea, codigo, pvp) values (74, 74, 19);
insert into lineaVenta (codLinea, codigo, pvp) values (75, 75, 65);
insert into lineaVenta (codLinea, codigo, pvp) values (76, 76, 70);
insert into lineaVenta (codLinea, codigo, pvp) values (77, 77, 65);
insert into lineaVenta (codLinea, codigo, pvp) values (78, 78, 75);
insert into lineaVenta (codLinea, codigo, pvp) values (79, 79, 39);
insert into lineaVenta (codLinea, codigo, pvp) values (80, 80, 9);
insert into lineaVenta (codLinea, codigo, pvp) values (81, 81, 78);
insert into lineaVenta (codLinea, codigo, pvp) values (82, 82, 44);
insert into lineaVenta (codLinea, codigo, pvp) values (83, 83, 100);
insert into lineaVenta (codLinea, codigo, pvp) values (84, 84, 82);
insert into lineaVenta (codLinea, codigo, pvp) values (85, 85, 3);
insert into lineaVenta (codLinea, codigo, pvp) values (86, 86, 28);
insert into lineaVenta (codLinea, codigo, pvp) values (87, 87, 77);
insert into lineaVenta (codLinea, codigo, pvp) values (88, 88, 71);
insert into lineaVenta (codLinea, codigo, pvp) values (89, 89, 36);
insert into lineaVenta (codLinea, codigo, pvp) values (90, 90, 38);
insert into lineaVenta (codLinea, codigo, pvp) values (91, 91, 69);
insert into lineaVenta (codLinea, codigo, pvp) values (92, 92, 39);
insert into lineaVenta (codLinea, codigo, pvp) values (93, 93, 27);
insert into lineaVenta (codLinea, codigo, pvp) values (94, 94, 62);
insert into lineaVenta (codLinea, codigo, pvp) values (95, 95, 21);
insert into lineaVenta (codLinea, codigo, pvp) values (96, 96, 62);
insert into lineaVenta (codLinea, codigo, pvp) values (97, 97, 82);
insert into lineaVenta (codLinea, codigo, pvp) values (98, 98, 59);
insert into lineaVenta (codLinea, codigo, pvp) values (99, 99, 90);
insert into lineaVenta (codLinea, codigo, pvp) values (100, 100, 50);

INSERT INTO cliente (dni, nombre, apellidos, correo, codCliente, genero, puntos) 
VALUES 
   ('234567890D', 'María', 'González Pérez', 'mariagonzalez@gmail.com', 1, 'Femenino', 50),
   ('345678901E', 'Pedro', 'Hernández Gómez', 'pedrohernandez@gmail.com', 2, 'Masculino', 20),
   ('456789123F', 'Lucía', 'Fernández Sánchez', 'luciafernandez@gmail.com', 3, 'Femenino', 10),
   ('567891234G', 'Juan', 'García Romero', 'juangarcia@gmail.com',4, 'Masculino', 0),
   ('678912345H', 'Sara', 'Martínez López', 'saramartinez@gmail.com',5, 'Femenino', 30),
   ('789123456I', 'Manuel', 'Gutiérrez Ruiz', 'manuelgutierrez@gmail.com', 6, 'Masculino', 70),
   ('901234567J', 'Isabel', 'Pérez Rodríguez', 'isabelperez@gmail.com', 7, 'Femenino', 60),
   ('012345678K', 'David', 'Jiménez Castro', 'davidjimenez@gmail.com', 8, 'Masculino', 90),
   ('123456789L', 'Ana', 'Fuentes Navarro', 'anafuentes@gmail.com', 9, 'Femenino', 40),
   ('234567890M', 'Miguel', 'Díaz Molina', 'migueldiaz@gmail.com', 10, 'Masculino', 25),
     ('345678901N', 'Laura', 'Ramírez Cruz', 'lauraramirez@gmail.com', 11, 'Femenino', 15),
   ('456789123O', 'Roberto', 'Sánchez Morales', 'robertosanchez@gmail.com', 12, 'Masculino', 35),
   ('567891234P', 'Lucas', 'López Gómez', 'lucaslopez@gmail.com', 13, 'Masculino', 5),
   ('678912345Q', 'Ana', 'García Ruiz', 'anagarcia@gmail.com', 14, 'Femenino', 70),
   ('789123456R', 'Sergio', 'Martínez Pérez', 'sergiomartinez@gmail.com', 15, 'Masculino', 45),
   ('901234567S', 'Carla', 'González Fernández', 'carlagonzalez@gmail.com', 16, 'Femenino', 25),
   ('012345678T', 'Diego', 'Ruiz Martínez', 'diegoruiz@gmail.com', 17, 'Masculino', 60),
   ('123456789U', 'Cristina', 'Torres Sánchez', 'cristinatorres@gmail.com', 18, 'Femenino', 40),
   ('234567890V', 'Daniel', 'Hernández Gutiérrez', 'danielhernandez@gmail.com', 19, 'Masculino', 10),
   ('345678901W', 'Alicia', 'García Pérez', 'aliciagarcia@gmail.com', 20, 'Femenino', 30),
   ('456789123X', 'Javier', 'López García', 'javierlopez@gmail.com', 21, 'Masculino', 20),
   ('567891234Y', 'Elena', 'Martínez Pérez', 'elenamartinez@gmail.com', 22, 'Femenino', 80),
   ('678912345Z', 'Pablo', 'García Ruiz', 'pablogarcia@gmail.com', 23, 'Masculino', 55),
   ('789123456A', 'Sofía', 'Sánchez Martínez', 'sofiasanchez@gmail.com', 24, 'Femenino', 75),
   ('901234567B', 'Marcos', 'García Sánchez', 'marcosgarcia@gmail.com', 25, 'Masculino', 50),
   ('012345678C', 'Luisa', 'Martínez Gutiérrez', 'luisamartinez@gmail.com', 26, 'Femenino', 65),
   ('123456789D', 'Jorge', 'Ruiz García', 'jorgeruiz@gmail.com', 27, 'Masculino', 90),
   ('234567890E', 'Marina', 'Sánchez Torres', 'marinasanchez@gmail.com', 28, 'Femenino', 5),
   ('345678901F', 'Fernando', 'García Ruiz', 'fernandogarcia@gmail.com', 29, 'Masculino', 30),
    ('345678901N', 'Laura', 'Sánchez García', 'laurasanchez@gmail.com', 30, 'Femenino', 15),
   ('456789123O', 'Carlos', 'Gómez López', 'carlosgomez@gmail.com', 31, 'Masculino', 75),
   ('567891234P', 'Marina', 'Romero Sánchez', 'marinaromero@gmail.com', 32, 'Femenino', 65),
   ('678912345Q', 'Javier', 'Martínez Torres', 'javiermartinez@gmail.com', 33, 'Masculino', 85),
   ('789123456R', 'Sofía', 'Pérez García', 'sofiaperez@gmail.com', 34, 'Femenino', 55),
   ('901234567S', 'Antonio', 'Fernández Sánchez', 'antoniofernandez@gmail.com', 35, 'Masculino', 35),
   ('012345678T', 'Carmen', 'Jiménez González', 'carmenjimenez@gmail.com', 36, 'Femenino', 45),
   ('123456789U', 'Rubén', 'Gutiérrez Ruiz', 'rubengutierrez@gmail.com', 37, 'Masculino', 95),
   ('234567890V', 'Elena', 'Pérez Rodríguez', 'elenaperez@gmail.com', 38, 'Femenino', 25),
   ('345678901W', 'Francisco', 'Hernández Martín', 'franciscohernandez@gmail.com', 39, 'Masculino', 5),
   ('456789123X', 'Natalia', 'García Moreno', 'nataliagarcia@gmail.com', 40, 'Femenino', 70),
   ('567891234Y', 'Alejandro', 'Martín Ruiz', 'alejandromartin@gmail.com', 41, 'Masculino', 45),
   ('678912345Z', 'Luisa', 'García Pérez', 'luisagarcia@gmail.com', 42, 'Femenino', 80),
   ('789123456A', 'Pablo', 'Sánchez López', 'pablosanchez@gmail.com', 43, 'Masculino', 20),
   ('901234567B', 'Cristina', 'Gómez Ruiz', 'cristinagomez@gmail.com', 44, 'Femenino', 60),
   ('012345678C', 'Marcos', 'Pérez Gómez', 'marcosperez@gmail.com', 45, 'Masculino', 90),
   ('123456789D', 'Lucas', 'Jiménez Sánchez', 'lucasjimenez@gmail.com', 46, 'Masculino', 15),
   ('234567890E', 'María José', 'González Romero', 'mariajosegonzalez@gmail.com', 47, 'Femenino', 35),
   ('345678901F', 'Ignacio', 'Hernández Pérez', 'ignaciohernandez@gmail.com', 48, 'Masculino', 50),
   ('456789123G', 'Marta', 'Martín Pérez', 'martamartin@gmail.com', 49, 'Femenino', 80),
   ('567891234H', 'Juan', 'Gómez Sánchez', 'juangomez@gmail.com', 50, 'Masculino', 25),
   ('678912345I', 'Ana', 'Rodríguez Torres', 'anarodriguez@gmail.com', 51, 'Femenino', 70),
   ('789123456J', 'Pedro', 'Sánchez Ruiz', 'pedrosanchez@gmail.com', 52, 'Masculino', 10),
   ('901234567K', 'Sara', 'García Sánchez', 'saragarcia@gmail.com', 53, 'Femenino', 30),
   ('012345678L', 'David', 'Romero García', 'davidromero@gmail.com', 54, 'Masculino', 45),
   ('123456789M', 'Laura', 'Pérez González', 'lauraperez@gmail.com', 55, 'Femenino', 60),
   ('234567890N', 'Manuel', 'Jiménez Sánchez', 'manueljimenez@gmail.com', 56, 'Masculino', 85),
   ('345678901O', 'María', 'González López', 'mariagonzalez@gmail.com', 57, 'Femenino', 15),
   ('456789123P', 'Jorge', 'García Martín', 'jorgegarcia@gmail.com', 58, 'Masculino', 50),
    ('567890123Q', 'Elena', 'Fernández García', 'elenafdez@gmail.com', 59, 'Femenino', 90),
   ('678901234R', 'Javier', 'Martínez Ruiz', 'javiermartinez@gmail.com', 60, 'Masculino', 5),
   ('789012345S', 'Marina', 'Sánchez López', 'marinasanchez@gmail.com', 61, 'Femenino', 35),
   ('890123456T', 'Pablo', 'González Martín', 'pablogonzalez@gmail.com', 62, 'Masculino', 70),
   ('901234567U', 'Lucía', 'García Fernández', 'luciagarcia@gmail.com', 63, 'Femenino', 20),
   ('012345678V', 'Diego', 'Torres García', 'diegotorres@gmail.com', 64, 'Masculino', 40),
   ('123456789W', 'Carmen', 'Gómez Martínez', 'carmengomez@gmail.com', 65, 'Femenino', 55),
   ('234567890X', 'Daniel', 'Romero Sánchez', 'danielromero@gmail.com', 66, 'Masculino', 80),
   ('345678901Y', 'Isabel', 'Pérez Fernández', 'isabelperez@gmail.com', 67, 'Femenino', 15),
   ('456789012Z', 'Rubén', 'García López', 'rubengarcia@gmail.com', 68, 'Masculino', 50),
   ('567890123A', 'Cristina', 'Sánchez García', 'cristinasanchez@gmail.com', 69, 'Femenino', 25),
   ('678901234B', 'Jesús', 'González Torres', 'jesusgonzalez@gmail.com', 70, 'Masculino', 60),
   ('789012345C', 'Patricia', 'Fernández Sánchez', 'patriciafernandez@gmail.com', 71, 'Femenino', 80),
   ('890123456D', 'Marcos', 'Torres Sánchez', 'marcostorres@gmail.com', 72, 'Masculino', 10),
   ('901234567E', 'Nerea', 'Pérez García', 'nereaperez@gmail.com', 73, 'Femenino', 30),
   ('012345678F', 'Miguel', 'García Torres', 'miguelgarcia@gmail.com', 74, 'Masculino', 45),
   ('123456789G', 'Lucía', 'Sánchez Fernández', 'luciasanchez@gmail.com', 75, 'Femenino', 70),
   ('234567890H', 'Diego', 'González Torres', 'diegogonzalez@gmail.com', 76, 'Masculino', 85),
   ('345678901I', 'Sara', 'Fernández Sánchez', 'sarafernandez@gmail.com', 77, 'Femenino', 15),
   ('73820164L', 'Marta', 'Rodríguez', 'marta.rodriguez@gmail.com', 78, 'Femenino', 740),
('78593215H', 'Rafael', 'Gómez', 'rafael.gomez@hotmail.com', 79, 'Masculino', 380),
('78309128J', 'Carla', 'Navarro', 'carla.navarro@gmail.com', 80, 'Femenino', 930),
('78123490N', 'Jorge', 'Vega', 'jorge.vega@hotmail.com', 81, 'Masculino', 240),
('78930751F', 'Lucía', 'Fernández', 'lucia.fernandez@gmail.com', 82, 'Femenino', 610),
('78490273P', 'Diego', 'Santos', 'diego.santos@hotmail.com', 83, 'Masculino', 810),
('78036192R', 'Sara', 'Jiménez', 'sara.jimenez@gmail.com', 84, 'Femenino', 530),
('78849263S', 'Héctor', 'Ruiz', 'hector.ruiz@hotmail.com', 85, 'Masculino', 960),
('78919263L', 'Ana', 'González', 'ana.gonzalez@gmail.com', 86, 'Femenino', 270),
('78350294J', 'Mario', 'Castro', 'mario.castro@hotmail.com', 87, 'Masculino', 410),
('78670251M', 'Paula', 'Ortega', 'paula.ortega@gmail.com', 88, 'Femenino', 140),
('78030519Z', 'Pedro', 'Blanco', 'pedro.blanco@hotmail.com', 89, 'Masculino', 510),
('78946120W', 'Carmen', 'Flores', 'carmen.flores@gmail.com', 90, 'Femenino', 670),
('78120398S', 'Rubén', 'Morales', 'ruben.morales@hotmail.com', 91, 'Masculino', 780),
('78349102L', 'Inés', 'Márquez', 'ines.marquez@gmail.com', 92, 'Femenino', 220),
('78629371N', 'Pablo', 'Hernández', 'pablo.hernandez@hotmail.com', 93, 'Masculino', 310),
('78920461G', 'Elena', 'Gutiérrez', 'elena.gutierrez@gmail.com', 94, 'Femenino', 760),
('78035129Q', 'Adrián', 'Romero', 'adrian.romero@hotmail.com', 95, 'Masculino', 580),
('78850236K', 'Lorena', 'Cabrera', 'lorena.cabrera@gmail.com', 96, 'Femenino', 930),
('75892314X', 'Manuel', 'Rodríguez', 'manuel.rodriguez@example.com', 97, 'Masculino', 124),
('82531697D', 'María', 'García', 'maria.garcia@example.com', 98, 'Femenino', 89),
('12946137H', 'Sergio', 'Hernández', 'sergio.hernandez@example.com', 99, 'Masculino', 372),
('75129380T', 'Ana', 'Navarro', 'ana.navarro@example.com', 100, 'Femenino', 43);



insert into venta (codVenta, codCliente, fecha) values (1, 1, '4/1/2022');
insert into venta (codVenta, codCliente, fecha) values (2, 2, '5/11/2022');
insert into venta (codVenta, codCliente, fecha) values (3, 3, '12/10/2022');
insert into venta (codVenta, codCliente, fecha) values (4, 4, '9/4/2022');
insert into venta (codVenta, codCliente, fecha) values (5, 5, '5/1/2022');
insert into venta (codVenta, codCliente, fecha) values (6, 6, '2/2/2023');
insert into venta (codVenta, codCliente, fecha) values (7, 7, '11/2/2022');
insert into venta (codVenta, codCliente, fecha) values (8, 8, '6/8/2022');
insert into venta (codVenta, codCliente, fecha) values (9, 9, '12/1/2022');
insert into venta (codVenta, codCliente, fecha) values (10, 10, '7/7/2022');
insert into venta (codVenta, codCliente, fecha) values (11, 11, '7/6/2022');
insert into venta (codVenta, codCliente, fecha) values (12, 12, '7/3/2022');
insert into venta (codVenta, codCliente, fecha) values (13, 13, '2/7/2023');
insert into venta (codVenta, codCliente, fecha) values (14, 14, '10/4/2022');
insert into venta (codVenta, codCliente, fecha) values (15, 15, '8/6/2022');
insert into venta (codVenta, codCliente, fecha) values (16, 16, '2/3/2023');
insert into venta (codVenta, codCliente, fecha) values (17, 17, '10/2/2022');
insert into venta (codVenta, codCliente, fecha) values (18, 18, '4/7/2022');
insert into venta (codVenta, codCliente, fecha) values (19, 19, '1/4/2023');
insert into venta (codVenta, codCliente, fecha) values (20, 20, '6/9/2022');
insert into venta (codVenta, codCliente, fecha) values (21, 21, '5/1/2022');
insert into venta (codVenta, codCliente, fecha) values (22, 22, '6/1/2022');
insert into venta (codVenta, codCliente, fecha) values (23, 23, '8/8/2022');
insert into venta (codVenta, codCliente, fecha) values (24, 24, '10/4/2022');
insert into venta (codVenta, codCliente, fecha) values (25, 25, '6/5/2022');
insert into venta (codVenta, codCliente, fecha) values (26, 26, '1/8/2023');
insert into venta (codVenta, codCliente, fecha) values (27, 27, '5/12/2022');
insert into venta (codVenta, codCliente, fecha) values (28, 28, '8/1/2022');
insert into venta (codVenta, codCliente, fecha) values (29, 29, '12/10/2022');
insert into venta (codVenta, codCliente, fecha) values (30, 30, '6/2/2022');
insert into venta (codVenta, codCliente, fecha) values (31, 31, '3/2/2023');
insert into venta (codVenta, codCliente, fecha) values (32, 32, '5/9/2022');
insert into venta (codVenta, codCliente, fecha) values (33, 33, '1/11/2023');
insert into venta (codVenta, codCliente, fecha) values (34, 34, '8/8/2022');
insert into venta (codVenta, codCliente, fecha) values (35, 35, '8/3/2022');
insert into venta (codVenta, codCliente, fecha) values (36, 36, '7/1/2022');
insert into venta (codVenta, codCliente, fecha) values (37, 37, '11/3/2022');
insert into venta (codVenta, codCliente, fecha) values (38, 38, '7/8/2022');
insert into venta (codVenta, codCliente, fecha) values (39, 39, '12/4/2022');
insert into venta (codVenta, codCliente, fecha) values (40, 40, '8/9/2022');
insert into venta (codVenta, codCliente, fecha) values (41, 41, '7/6/2022');
insert into venta (codVenta, codCliente, fecha) values (42, 42, '12/6/2022');
insert into venta (codVenta, codCliente, fecha) values (43, 43, '10/1/2022');
insert into venta (codVenta, codCliente, fecha) values (44, 44, '10/5/2022');
insert into venta (codVenta, codCliente, fecha) values (45, 45, '6/10/2022');
insert into venta (codVenta, codCliente, fecha) values (46, 46, '5/8/2022');
insert into venta (codVenta, codCliente, fecha) values (47, 47, '4/7/2022');
insert into venta (codVenta, codCliente, fecha) values (48, 48, '3/3/2023');
insert into venta (codVenta, codCliente, fecha) values (49, 49, '10/9/2022');
insert into venta (codVenta, codCliente, fecha) values (50, 50, '5/10/2022');
insert into venta (codVenta, codCliente, fecha) values (51, 51, '6/6/2022');
insert into venta (codVenta, codCliente, fecha) values (52, 52, '10/1/2022');
insert into venta (codVenta, codCliente, fecha) values (53, 53, '8/2/2022');
insert into venta (codVenta, codCliente, fecha) values (54, 54, '7/2/2022');
insert into venta (codVenta, codCliente, fecha) values (55, 55, '9/6/2022');
insert into venta (codVenta, codCliente, fecha) values (56, 56, '3/2/2023');
insert into venta (codVenta, codCliente, fecha) values (57, 57, '1/2/2023');
insert into venta (codVenta, codCliente, fecha) values (58, 58, '10/4/2022');
insert into venta (codVenta, codCliente, fecha) values (59, 59, '5/7/2022');
insert into venta (codVenta, codCliente, fecha) values (60, 60, '11/8/2022');
insert into venta (codVenta, codCliente, fecha) values (61, 61, '9/1/2022');
insert into venta (codVenta, codCliente, fecha) values (62, 62, '6/2/2022');
insert into venta (codVenta, codCliente, fecha) values (63, 63, '9/4/2022');
insert into venta (codVenta, codCliente, fecha) values (64, 64, '9/2/2022');
insert into venta (codVenta, codCliente, fecha) values (65, 65, '2/9/2023');
insert into venta (codVenta, codCliente, fecha) values (66, 66, '10/2/2022');
insert into venta (codVenta, codCliente, fecha) values (67, 67, '1/9/2023');
insert into venta (codVenta, codCliente, fecha) values (68, 68, '12/2/2022');
insert into venta (codVenta, codCliente, fecha) values (69, 69, '10/3/2022');




insert into reserva (codReserva, codCliente, fecha, hora) values (1, 1, '10/8/2022', '19:06');
insert into reserva (codReserva, codCliente, fecha, hora) values (2, 2, '1/8/2023', '21:38');
insert into reserva (codReserva, codCliente, fecha, hora) values (3, 3, '9/3/2022', '19:33');
insert into reserva (codReserva, codCliente, fecha, hora) values (4, 4, '1/4/2023', '22:40');
insert into reserva (codReserva, codCliente, fecha, hora) values (5, 5, '6/1/2022', '17:17');
insert into reserva (codReserva, codCliente, fecha, hora) values (6, 6, '1/1/2023', '3:48');
insert into reserva (codReserva, codCliente, fecha, hora) values (7, 7, '8/12/2022', '1:52');
insert into reserva (codReserva, codCliente, fecha, hora) values (8, 8, '9/5/2022', '2:19');
insert into reserva (codReserva, codCliente, fecha, hora) values (9, 9, '11/9/2022', '0:40');
insert into reserva (codReserva, codCliente, fecha, hora) values (10, 10, '8/2/2022', '20:05');
insert into reserva (codReserva, codCliente, fecha, hora) values (11, 11, '1/1/2023', '7:38');
insert into reserva (codReserva, codCliente, fecha, hora) values (12, 12, '5/2/2022', '16:32');
insert into reserva (codReserva, codCliente, fecha, hora) values (13, 13, '12/5/2022', '14:41');
insert into reserva (codReserva, codCliente, fecha, hora) values (14, 14, '5/3/2022', '14:43');
insert into reserva (codReserva, codCliente, fecha, hora) values (15, 15, '3/2/2023', '11:48');
insert into reserva (codReserva, codCliente, fecha, hora) values (16, 16, '6/10/2022', '2:44');
insert into reserva (codReserva, codCliente, fecha, hora) values (17, 17, '6/5/2022', '21:02');
insert into reserva (codReserva, codCliente, fecha, hora) values (18, 18, '2/6/2023', '16:07');
insert into reserva (codReserva, codCliente, fecha, hora) values (19, 19, '12/1/2022', '6:09');
insert into reserva (codReserva, codCliente, fecha, hora) values (20, 20, '12/3/2022', '6:15');
insert into reserva (codReserva, codCliente, fecha, hora) values (21, 21, '10/7/2022', '0:19');
insert into reserva (codReserva, codCliente, fecha, hora) values (22, 22, '7/5/2022', '4:28');
insert into reserva (codReserva, codCliente, fecha, hora) values (23, 23, '7/4/2022', '15:05');
insert into reserva (codReserva, codCliente, fecha, hora) values (24, 24, '3/9/2023', '7:12');
insert into reserva (codReserva, codCliente, fecha, hora) values (25, 25, '4/6/2022', '17:25');
insert into reserva (codReserva, codCliente, fecha, hora) values (26, 26, '3/8/2023', '23:48');
insert into reserva (codReserva, codCliente, fecha, hora) values (27, 27, '6/9/2022', '12:36');
insert into reserva (codReserva, codCliente, fecha, hora) values (28, 28, '4/2/2022', '18:31');
insert into reserva (codReserva, codCliente, fecha, hora) values (29, 29, '7/5/2022', '13:09');
insert into reserva (codReserva, codCliente, fecha, hora) values (30, 30, '11/4/2022', '0:54');
insert into reserva (codReserva, codCliente, fecha, hora) values (31, 31, '1/6/2023', '7:36');
insert into reserva (codReserva, codCliente, fecha, hora) values (32, 32, '9/11/2022', '6:46');
insert into reserva (codReserva, codCliente, fecha, hora) values (33, 33, '7/5/2022', '22:38');
insert into reserva (codReserva, codCliente, fecha, hora) values (34, 34, '5/5/2022', '0:39');
insert into reserva (codReserva, codCliente, fecha, hora) values (35, 35, '4/2/2022', '12:21');
insert into reserva (codReserva, codCliente, fecha, hora) values (36, 36, '1/9/2023', '12:34');
insert into reserva (codReserva, codCliente, fecha, hora) values (37, 37, '2/3/2023', '15:26');
insert into reserva (codReserva, codCliente, fecha, hora) values (38, 38, '4/2/2022', '10:45');
insert into reserva (codReserva, codCliente, fecha, hora) values (39, 39, '11/1/2022', '19:28');
insert into reserva (codReserva, codCliente, fecha, hora) values (40, 40, '3/4/2023', '15:09');
insert into reserva (codReserva, codCliente, fecha, hora) values (41, 41, '1/1/2023', '2:47');
insert into reserva (codReserva, codCliente, fecha, hora) values (42, 42, '6/2/2022', '1:34');
insert into reserva (codReserva, codCliente, fecha, hora) values (43, 43, '3/7/2023', '8:27');
insert into reserva (codReserva, codCliente, fecha, hora) values (44, 44, '5/2/2022', '8:25');
insert into reserva (codReserva, codCliente, fecha, hora) values (45, 45, '4/8/2022', '15:53');
insert into reserva (codReserva, codCliente, fecha, hora) values (46, 46, '2/2/2023', '12:14');
insert into reserva (codReserva, codCliente, fecha, hora) values (47, 47, '5/7/2022', '13:34');
insert into reserva (codReserva, codCliente, fecha, hora) values (48, 48, '2/12/2023', '21:11');
insert into reserva (codReserva, codCliente, fecha, hora) values (49, 49, '11/3/2022', '0:18');
insert into reserva (codReserva, codCliente, fecha, hora) values (50, 50, '8/7/2022', '19:17');
insert into reserva (codReserva, codCliente, fecha, hora) values (51, 51, '7/2/2022', '15:58');
insert into reserva (codReserva, codCliente, fecha, hora) values (52, 52, '11/10/2022', '19:57');
insert into reserva (codReserva, codCliente, fecha, hora) values (53, 53, '7/2/2022', '0:28');
insert into reserva (codReserva, codCliente, fecha, hora) values (54, 54, '6/5/2022', '0:16');
insert into reserva (codReserva, codCliente, fecha, hora) values (55, 55, '5/2/2022', '9:46');
insert into reserva (codReserva, codCliente, fecha, hora) values (56, 56, '1/11/2023', '9:56');
insert into reserva (codReserva, codCliente, fecha, hora) values (57, 57, '11/9/2022', '2:22');
insert into reserva (codReserva, codCliente, fecha, hora) values (58, 58, '6/2/2022', '6:58');
insert into reserva (codReserva, codCliente, fecha, hora) values (59, 59, '10/3/2022', '1:06');
insert into reserva (codReserva, codCliente, fecha, hora) values (60, 60, '3/6/2023', '15:41');
insert into reserva (codReserva, codCliente, fecha, hora) values (61, 61, '6/1/2022', '8:36');
insert into reserva (codReserva, codCliente, fecha, hora) values (62, 62, '12/1/2022', '2:10');
insert into reserva (codReserva, codCliente, fecha, hora) values (63, 63, '1/1/2023', '15:05');
insert into reserva (codReserva, codCliente, fecha, hora) values (64, 64, '3/3/2023', '14:37');
insert into reserva (codReserva, codCliente, fecha, hora) values (65, 65, '3/7/2023', '4:52');
insert into reserva (codReserva, codCliente, fecha, hora) values (66, 66, '10/10/2022', '22:24');
insert into reserva (codReserva, codCliente, fecha, hora) values (67, 67, '8/7/2022', '3:36');
insert into reserva (codReserva, codCliente, fecha, hora) values (68, 68, '2/5/2023', '22:20');
insert into reserva (codReserva, codCliente, fecha, hora) values (69, 69, '3/5/2023', '7:58');
insert into reserva (codReserva, codCliente, fecha, hora) values (70, 70, '5/3/2022', '12:26');
insert into reserva (codReserva, codCliente, fecha, hora) values (71, 71, '1/9/2023', '10:06');
insert into reserva (codReserva, codCliente, fecha, hora) values (72, 72, '9/9/2022', '10:31');
insert into reserva (codReserva, codCliente, fecha, hora) values (73, 73, '10/6/2022', '0:13');
insert into reserva (codReserva, codCliente, fecha, hora) values (74, 74, '5/5/2022', '8:42');
insert into reserva (codReserva, codCliente, fecha, hora) values (75, 75, '7/3/2022', '15:51');
insert into reserva (codReserva, codCliente, fecha, hora) values (76, 76, '8/3/2022', '12:09');
insert into reserva (codReserva, codCliente, fecha, hora) values (77, 77, '3/7/2023', '23:24');
insert into reserva (codReserva, codCliente, fecha, hora) values (78, 78, '3/5/2023', '5:42');
insert into reserva (codReserva, codCliente, fecha, hora) values (79, 79, '4/7/2022', '21:46');
insert into reserva (codReserva, codCliente, fecha, hora) values (80, 80, '2/4/2023', '11:07');
insert into reserva (codReserva, codCliente, fecha, hora) values (81, 81, '3/3/2023', '6:39');
insert into reserva (codReserva, codCliente, fecha, hora) values (82, 82, '11/10/2022', '5:00');
insert into reserva (codReserva, codCliente, fecha, hora) values (83, 83, '1/3/2023', '11:08');
insert into reserva (codReserva, codCliente, fecha, hora) values (84, 84, '6/11/2022', '5:06');
insert into reserva (codReserva, codCliente, fecha, hora) values (85, 85, '2/1/2023', '9:06');
insert into reserva (codReserva, codCliente, fecha, hora) values (86, 86, '8/5/2022', '23:27');
insert into reserva (codReserva, codCliente, fecha, hora) values (87, 87, '5/4/2022', '12:16');
insert into reserva (codReserva, codCliente, fecha, hora) values (88, 88, '10/8/2022', '14:34');
insert into reserva (codReserva, codCliente, fecha, hora) values (89, 89, '7/2/2022', '0:52');
insert into reserva (codReserva, codCliente, fecha, hora) values (90, 90, '1/9/2023', '14:30');
insert into reserva (codReserva, codCliente, fecha, hora) values (91, 91, '5/6/2022', '14:32');
insert into reserva (codReserva, codCliente, fecha, hora) values (92, 92, '12/4/2022', '6:58');
insert into reserva (codReserva, codCliente, fecha, hora) values (93, 93, '2/10/2023', '9:05');
insert into reserva (codReserva, codCliente, fecha, hora) values (94, 94, '8/7/2022', '13:25');
insert into reserva (codReserva, codCliente, fecha, hora) values (95, 95, '9/2/2022', '19:29');
insert into reserva (codReserva, codCliente, fecha, hora) values (96, 96, '10/4/2022', '15:47');
insert into reserva (codReserva, codCliente, fecha, hora) values (97, 97, '6/4/2022', '12:04');
insert into reserva (codReserva, codCliente, fecha, hora) values (98, 98, '8/1/2022', '9:15');
insert into reserva (codReserva, codCliente, fecha, hora) values (99, 99, '2/12/2023', '17:45');
insert into reserva (codReserva, codCliente, fecha, hora) values (100, 100, '8/3/2022', '5:32');






