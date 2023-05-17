package com.salesianostriana.dam.Empelado.model;

import java.time.LocalDate;
import java.time.LocalTime;
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
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Reserva {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private LocalDate fecha;
	private LocalTime hora;
	
	@ManyToOne
	private Usuario usuario;
	
	@OneToMany(mappedBy="usuarios", cascade=CascadeType.ALL, orphanRemoval=true, fetch=FetchType.EAGER)
	
	
	public void Reserva(LocalDate fecha,LocalTime hora,Usuario c) {
		this.fecha=fecha;
		this.hora=hora;
		this.usuario=c;
	}
	
}