package com.salesianostriana.dam.Empelado.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

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
	@MapsId("LineaVentaId")
	@JoinColumn(name="LineaVentaId")
	private Venta ven;
	@ManyToOne
	@MapsId("ProdId")
	@JoinColumn(name="ProdId")
	private Producto prod;
	
	
	
	
	
	
	
	
}
