package com.salesianostriana.dam.Empelado.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Entity
@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class Servicio {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private String nombre;
	private double precio;
	private String descripcion;
	private double descuento;
	private double duracion;
	
	@ToString.Exclude
	@EqualsAndHashCode.Exclude
	@Builder.Default
	@OneToMany(
			mappedBy="servicio", fetch= FetchType.EAGER,
			cascade=CascadeType.ALL,
			orphanRemoval=true
			)
	
	private List<Reserva> re = new ArrayList<>();
	

	/**
	 * Añade una reserva a la lista de reservas del servicio
	 * 
	 * @param r Objeto Reserva que se quiere añadir a la lista
	 */
	public void add(Servicio s) {
		s.add(s);
		
	}

	/**
	 * Elimina una reserva de la lista de reservas del servicio
	 * 
	 * @param r Objeto Reserva que se quiere eliminar de la lista
	 */	public void remove(Servicio s) {
		s.remove(s);
		
	}
	


}
