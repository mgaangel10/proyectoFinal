package com.salesianostriana.dam.Empelado.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor

public class Producto {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long codProducto;
	private String nombre;
	private double precio;
	private String descripcion;
	private double descuento;
	private String color;
	
	
	

}
