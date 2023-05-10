package com.salesianostriana.dam.Servicios;

import java.util.List;

import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Modelos.Producto;
import com.salesianostriana.dam.Repositorios.ProductoRepo;

@Service
public class ProductoService {
	private ProductoRepo productoR;
	
	public ProductoService (ProductoRepo productoRep) {
		this.productoR=productoRep;
	}
	
	public Producto add(Producto p) {
		return productoR.save(p);
	}
	public Producto edit(Producto p) {
		return productoR.save(p);
	}
	
	public List<Producto> findAll(){
		return productoR.findAll();
	}
	public Producto findById(Long id) {
		return productoR.findById(id).orElse(null);
	}
	public Producto delete(Producto producto) {
		Producto result = findById(producto.getCodProducto());
		productoR.delete(result);
		return result;
	}

}
