package com.salesianostriana.dam.Empelado.model;

import javax.persistence.Embeddable;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Embeddable
 class LineaDeVentaPk {
	private final static Long serialVersionUID = 1L;
	
	private Long lineaDeVentaId;
	private Long ventaId;
}
