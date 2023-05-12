package com.salesianostriana.dam.Empleado.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.salesianostriana.dam.Empelado.model.Producto;

public interface ProductoRepo extends JpaRepository<Producto,Long>{
	
	

}
