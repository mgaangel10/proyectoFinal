package com.salesianostriana.dam.Empleado.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Categoria;
import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empleado.repositorio.ProductoRepo;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

@Service

public class ProductoService extends BaseServiceImpl<Producto,Long,ProductoRepo>{
	private ProductoRepo prod;
	
	public int numeroProductosCategoria(Categoria categoria) {
		return prod.findNumProductosByCategoria(categoria);
	}

	public int numeroProductosCategoria(Optional<Categoria> categoria) {
		// TODO Auto-generated method stub
		return 0;
	}
}
