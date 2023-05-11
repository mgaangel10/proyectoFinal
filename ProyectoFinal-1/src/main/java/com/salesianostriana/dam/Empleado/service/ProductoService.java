package com.salesianostriana.dam.Empleado.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empleado.repositorio.ProductoRepo;

@Service
public class ProductoService {
	private ProductoRepo prod;
	
	public ProductoService (ProductoRepo p) {
		this.prod=p;
	}
	
	public Producto add(Producto p) {
		return prod.save(p);
	}
	
	public Producto edit(Producto p) {
		return prod.save(p);
	}
	public void delete(Producto p) {
		prod.delete(p);
	}
	public List<Producto> findAll(){
		return prod.findAll();
	}
	public Producto findById(long codProducto) {
		return prod.findById(codProducto).orElse(null);
	}
	
	public void delete(long codProducto) { prod.deleteById(codProducto); }
}
