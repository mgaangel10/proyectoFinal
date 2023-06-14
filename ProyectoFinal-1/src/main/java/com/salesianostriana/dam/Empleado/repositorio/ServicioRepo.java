package com.salesianostriana.dam.Empleado.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empelado.model.Servicio;

public interface ServicioRepo extends JpaRepository<Servicio,Long>{
	
	
	public List<Servicio> findByNombreContainingIgnoreCase(String name);
}
