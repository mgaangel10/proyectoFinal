package com.salesianostriana.dam;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.salesianostriana.dam.Empelado.model.Cliente;
import com.salesianostriana.dam.Empelado.model.Empleado;
import com.salesianostriana.dam.Empelado.model.Usuario;
import com.salesianostriana.dam.Empleado.repositorio.ClienteRepo;
import com.salesianostriana.dam.Empleado.repositorio.UsuarioRepositorio;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class InitData {
	
	private final ClienteRepo cli;
	private final UsuarioRepositorio repo;
	private final PasswordEncoder passwordEncoder;
	
	@PostConstruct
	public void init() {
		
		
		//Usuario cliente = new Cliente();
		Usuario cliente = Cliente.builder()
				.admin(false)
				.username("user")
				.password(passwordEncoder.encode("1234"))
				.build();
		
				
		Usuario newCliente = new Cliente();
		Usuario newAdmin= new Empleado();
		
		Usuario admin = Empleado.builder()
				.admin(true)
				.username("admin")
				.password(passwordEncoder.encode("admin"))
				.build();
		
		/*Usuario usuario = Usuario.builder()
				.admin(false)
				.username("user")
				//.password("1234")
				.password(passwordEncoder.encode("1234"))
				.build();*/
				
		
				
	
				
		/*Usuario admin = Usuario.builder()
				.admin(true)
				.username("admin")
				.password(passwordEncoder.encode("admin"))
				.build();*/
		
		repo.saveAll(List.of(cliente,newCliente, admin,newAdmin));
		
	}
}


