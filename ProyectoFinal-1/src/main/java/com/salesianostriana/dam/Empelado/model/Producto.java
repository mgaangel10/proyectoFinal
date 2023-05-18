package com.salesianostriana.dam.Empelado.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Producto {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String nombre;
	
	private double precio;
	private String descripcion;
	private double descuento;
	private String color;
	private int cantidad;
	@OneToMany(
			mappedBy="producto",
			fetch=FetchType.EAGER,
			cascade=CascadeType.ALL,
			orphanRemoval=true
			)

	@ManyToOne
	private Categoria categoria;
	
	
	
	public Producto(String nombre, String descripcion, double precio, double descuento,String color,int cantidad , Categoria categoria) {
		this.nombre = nombre;
		this.precio = precio;
		this.descripcion = descripcion;
		this.descuento = descuento;
		this.color=color;
		this.cantidad=cantidad;
		this.categoria = categoria;
	}
	
	

}
