package com.salesianostriana.dam.Empleado.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empleado.repositorio.ProductoRepo;

@Service
@Scope (value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CarritoService {
	private ProductoRepo p;
	
	private Map<Producto,Integer> prod= new HashMap <Producto,Integer>();
	
	public CarritoService (ProductoRepo pr) {
		this.p=pr;
	}
	
	
	
}
