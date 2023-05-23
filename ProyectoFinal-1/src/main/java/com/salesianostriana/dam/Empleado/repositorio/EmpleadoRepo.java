package com.salesianostriana.dam.Empleado.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.salesianostriana.dam.Empelado.model.Empleado;
import com.salesianostriana.dam.Empelado.model.Producto;

public interface EmpleadoRepo extends JpaRepository<Empleado, Long>{
	
	@Query("""
			select e
			from Empleado e
			where e.apellidos = ?1
			or e.nombre = ?2
			""")
	List<Empleado> buscarTodo(String apellidos,String nombre);
	
	public List<Empleado> findByNombreContainingIgnoreCase(String name);

}
