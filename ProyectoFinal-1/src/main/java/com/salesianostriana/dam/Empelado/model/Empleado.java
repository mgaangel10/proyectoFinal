package com.salesianostriana.dam.Empelado.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
@Entity
@Data
@SuperBuilder
@DiscriminatorValue("A")
@NoArgsConstructor

public class Empleado extends Usuario{
	private static final long serialVersionUID = 1L;
	private String nombre;
	private String apellidos;
	private String email;
	private String numTelefono;
	

}
