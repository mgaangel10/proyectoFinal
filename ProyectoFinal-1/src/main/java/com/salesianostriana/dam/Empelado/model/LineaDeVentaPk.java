package com.salesianostriana.dam.Empelado.model;

import java.io.Serializable;

import javax.persistence.Embeddable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Embeddable
 class LineaDeVentaPk implements Serializable{
	private final static Long serialVersionUID = 1L;
	
	private Long lineaDeVentaId;
	private Long ventaId;
}
