package com.salesianostriana.dam.Empleado.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

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
	
	public void addProdCarrito(Optional<Producto> optional) {
		if (optional.isPresent()) {
			Producto p=optional.get();
			if (prod.containsKey(p)) {
				prod.replace(p, prod.get(p)+1);
			}
;		} else {
			prod.put((Producto) p, 1);
		}
	}
	
	public void eliminarDelCarrito(Optional<Producto> optional) {
	    if (optional.isPresent()) {
	        Producto producto = optional.get();
	        if (prod.containsKey(producto)) {
	            if (prod.get(producto) > 1) {
	                prod.replace(producto, prod.get(producto) - 1);
	            } else {
	                prod.remove(producto);
	            }
	        }
	    }
	}
	
	public Map<Producto,Integer> productosEnElCarrito(){
		return Collections.unmodifiableMap(prod);
	}
	
	
	
}
