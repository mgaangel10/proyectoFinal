package com.salesianostriana.dam.Empleado.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empleado.service.CarritoService;
import com.salesianostriana.dam.Empleado.service.ProductoService;

@Controller
public class CarritoController {
	@Autowired
	private CarritoService c;
	@Autowired
	private ProductoService p;
	@Autowired
	public CarritoController(CarritoService car,ProductoService pr) {
		this.c=car;
		this.p=pr;
	}
	@GetMapping("/carrito")
	public String verCarrito(Model model) {
		if (model.addAttribute("productos",c.productosEnElCarrito())==null) {
			return"productos";
		}
		return"carrito";
	}
	@GetMapping("/productoCarr/{id}")
	public String productoCarrito(@PathVariable("id")Long id,Model model) {
		c.addProdCarrito(p.findById(id));
		return"redirect:/carrito";
	}
	@GetMapping("/borrarProd/{id}")
	public String borrarPorductoCarrito(@PathVariable("id")Long id) {
		c.eliminarDelCarrito(p.findById(id));
		return"redirect:/carrito";
	}
	@ModelAttribute("total")
	public double total() {
		Map<Producto,Integer> carrito=c.productosEnElCarrito();
		double total=0.0;
		if (carrito!=null) {
			for(Producto p: carrito.keySet()) {
				total+=p.getPrecio()*carrito.get(p);
			}
			return total;
		} 
		return 0.0;
	}
}
