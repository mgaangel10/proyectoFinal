package com.salesianostriana.dam.Empleado.repositorio;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesianostriana.dam.Empelado.model.Usuario;

public interface UsuarioRepositorio 
	extends JpaRepository<Usuario, Long>{
	
	Optional<Usuario> findFirstByUsername(String username);

}
