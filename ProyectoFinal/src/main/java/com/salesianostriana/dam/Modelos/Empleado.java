package com.salesianostriana.dam.Modelos;

import java.time.LocalTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Data
public class Empleado {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String nombre;
	private String apellidos;
	private String email;
	private int numTelefono;
	private String dni;
	private String puesto;
	private double salario;
	private LocalTime fecha;
	

}
