package com.salesianostriana.dam.Empleado.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.salesianostriana.dam.Empelado.model.Categoria;
import com.salesianostriana.dam.Empelado.model.Producto;

@Repository
public interface ProductoRepo extends JpaRepository<Producto,Long>{
	
	@Query("select p.id from Producto p")
	public List<Long> obtenerIds();
	
	@Query("select p from Producto p where p.categoria.id = ?1")
	public List<Producto> findByCategoriaId(Long categoriaId);
	
	@Query("select count(p) from Producto p where p.categoria = ?1")
	public int findNumProductosByCategoria(Categoria categoria);
	
	@Query("SELECT p FROM Producto p ORDER BY p.precio ASC")
    List<Producto> buscarProductosPorPrecioMasBarato();
	
	public List<Producto> findByNombreContainingIgnoreCase(String name);
}
