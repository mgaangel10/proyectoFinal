package com.salesianostriana.dam.Empelado.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
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
	private List<Reserva> reserva = new ArrayList<>();
	
	public Cliente (Long id,String username,String password,boolean admin, String nombre,String apellidos,String correo,List<Reserva> reservas) {
		super(id,username,password,false);
		this.nombre=nombre;
		this.apellidos=apellidos;
		this.correo=correo;
		this.reserva=reservas;
	}

	

}
