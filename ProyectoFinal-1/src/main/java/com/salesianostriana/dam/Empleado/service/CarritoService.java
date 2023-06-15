package com.salesianostriana.dam.Empleado.service;

import java.time.LocalDate;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import com.salesianostriana.dam.Empelado.model.Cliente;
import com.salesianostriana.dam.Empelado.model.LineaDeVenta;
import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empelado.model.Venta;
import com.salesianostriana.dam.Empleado.repositorio.ProductoRepo;
import com.salesianostriana.dam.Empleado.repositorio.VentaRepo;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

@Service
@Scope(value=WebApplicationContext.SCOPE_APPLICATION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class CarritoService extends BaseServiceImpl<Venta,Long,VentaRepo >{
	
	@Autowired
	private VentaRepo v;
	@Autowired
	private ProductoRepo p;
	@Autowired
	private ProductoService ps;
	
	private VentaService ventaService;
	
	private Producto producto;
	
	private Map<Producto,Integer> prod = new HashMap<>();

	
	public void addProd(Producto p) {
		if (prod.containsKey(p)) {
			prod.replace(p, prod.get(p)+1);
		} else {
			prod.put(p, 1);
		}
	
	}
	
	public void eliminarPro(Producto p) {
		if (prod.containsKey(p)) {
			if (prod.get(p)>1) {
				prod.replace(p, prod.get(p)-1);  
			}
		} else if(prod.get(p)==1){
			prod.remove(p);
		}
		
	}
	
	public Map<Producto,Integer> getProductosCarr(){
		return Collections.unmodifiableMap(prod);
	}
	public double totalCarrito() {
		Map<Producto, Integer> carrito = getProductosCarr();
		double total = 0.0;
		if (carrito != null) {
			for (Producto p : carrito.keySet()) {
				total += (p.getPrecio() - (p.getPrecio() * p.getDescuento() / 100)) * carrito.get(p);
			}
			return total;
		}
		return 0.0;
	}
	
	
	
	
	public void checkout(Cliente c) {
		
		LineaDeVenta lv = new LineaDeVenta();
		Venta ve = new Venta();
		double precio=0.0;
	
			for(Producto p:prod.keySet()) {
				int valor = prod.get(p);
				ve.addLv(LineaDeVenta.builder()
						.prod(p)
						.cantidad(valor)
						.total(p.getPrecio()*valor)
						.build());
						
						
				
			
			/*for (Map.Entry<Producto,Integer> en : prod.entrySet()) {
				ve.addLv(LineaDeVenta.builder()
						.p(producto))*/
				
				/*lv.setP(en.getKey());
				lv.setCantidad(en.getValue());
				lv.setTotal((lv.getP().getPrecio()*en.getValue()));
				lv.getVenta().setFecha(LocalDate.now());*/
				
			}
		
		ve.setCliente(c);
		ve.setTotal(totalCarrito());
		
		
		
		ve.setFecha(LocalDate.now());
		
		save(ve);
		 
		
		prod.clear();
	}
	
	

}
