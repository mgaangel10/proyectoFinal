package com.salesianostriana.dam.Empelado.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper=false)
public class Cliente extends Usuario{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Long id;
	private String nombre;
	private String apellidos;
	private String correo;

	@ToString.Exclude
	@EqualsAndHashCode.Exclude
	@OneToMany(
			mappedBy="cliente", fetch= FetchType.EAGER
						)
	private Set<Venta> venta = new HashSet<>();
	
	
	@ToString.Exclude
	@EqualsAndHashCode.Exclude
	
	@OneToMany(
			mappedBy="cliente", fetch= FetchType.EAGER
			
			)
	private Set<Reserva> reserva = new HashSet<>();
	
	

	

}
