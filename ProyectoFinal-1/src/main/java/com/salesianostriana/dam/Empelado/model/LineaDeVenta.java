package com.salesianostriana.dam.Empelado.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LineaDeVenta {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private double total;
	
	@ManyToOne
	private Venta ventas;
	
	@OneToMany(mappedBy="venta", cascade=CascadeType.ALL, orphanRemoval=true, fetch=FetchType.EAGER)
	
	
	public void LienaDeVenta(double total,Venta venta) {
		this.total=total;
		this.ventas=venta;
	}
	
}
