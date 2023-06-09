package com.salesianostriana.dam.Empelado.model;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
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
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class LineaDeVenta {
	
	@EmbeddedId
	 @Builder.Default
	 private LineaDeVentaPk linea= new LineaDeVentaPk();
	 private double total;
	 private int cantidad;
	 
	 @ManyToOne
	 @JoinColumn(foreignKey= @ForeignKey(name="fkLineaDeVentaP"))
	 private Producto prod;
	 
	
	 
	 @ManyToOne
	 @MapsId("ventaId")
	 @JoinColumn(name="ventaId")
	 private Venta venta;
	
	 
	 
}
