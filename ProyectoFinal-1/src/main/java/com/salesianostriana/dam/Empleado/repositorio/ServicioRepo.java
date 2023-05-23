package com.salesianostriana.dam.Empleado.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.salesianostriana.dam.Empelado.model.Servicio;

@Repository
public interface ServicioRepo extends JpaRepository<Servicio,Long>{
	
	public List<Servicio> findByNombreContainingIgnoreCase(String name);

}
