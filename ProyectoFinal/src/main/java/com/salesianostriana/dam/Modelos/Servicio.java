package com.salesianostriana.dam.Modelos;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Servicio {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long codServicio;
	private String nombre;
	private double precio;
	private String descripcion;
	private boolean descuentos;
	private int duracion;

}
