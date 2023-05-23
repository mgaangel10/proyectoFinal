package com.salesianostriana.dam.Empleado.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Categoria;
import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empleado.repositorio.ProductoRepo;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

@Service

public class ProductoService extends BaseServiceImpl<Producto,Long,ProductoRepo>{
	@Autowired
	private ProductoRepo prod;
	
	public int numeroProductosCategoria(Categoria categoria) {
		return prod.findNumProductosByCategoria(categoria);
	}

	public int numeroProductosCategoria(Optional<Categoria> categoria) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<Producto> searchByNombre(String nombre){
		return prod.findByNombreContainingIgnoreCase(nombre);
	}
	public List<Producto> ordenarNombre(){
		return prod.findAll(Sort.by(Sort.Direction.ASC,"nombre"));
	}
	public List<Producto> buscarProductosPorPrecioMasBarato() {
        Sort sort = Sort.by(Direction.ASC, "precio");
        
        return prod.findAll(sort);
        
	}
	public List<Producto>findAllBySorted(Direction d,String orderBy){
		Sort sort = Sort.by(d,orderBy);
		return this.repository.findAll(sort);
	}
}
