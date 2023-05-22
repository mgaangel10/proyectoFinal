package com.salesianostriana.dam.Empelado.model;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Reserva {
	@Id
	@GeneratedValue
	private Long id;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")	
	private LocalDate fecha;
	private LocalTime hora;
	private double total;
	
	@ManyToOne
	//@MapsId("usuarioId")
	@JoinColumn(name="usuarioId")
	private Usuario usuario;
	
	
	@ManyToOne
	//@MapsId("servicioId")
	@JoinColumn(name="servicioId")
	private Servicio servicio;
	
	
	
	
	
	
	
	
	
	

}
