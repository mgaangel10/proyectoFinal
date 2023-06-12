package com.salesianostriana.dam.Empelado.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@DiscriminatorValue("C")
@SuperBuilder
public class Cliente extends Usuario{
	private static final long serialVersionUID = 1L;
	
	private String nombre;
	private String apellidos;
	private String correo;
	
	

	public Cliente(Long id,String username,String password,boolean admin) {
		super(id,username,password,admin);
		}


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
