package com.salesianostriana.dam.Empelado.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity @Data @NoArgsConstructor @AllArgsConstructor
public class Categoria {
	
	@Id
	@GeneratedValue
	private Long id;
	
	private String nombre;
	
	private String imagen;

	public Categoria(String nombre, String imagen) {
		this.nombre = nombre;
		
	}
	

}