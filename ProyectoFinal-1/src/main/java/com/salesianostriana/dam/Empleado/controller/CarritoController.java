package com.salesianostriana.dam.Empleado.controller;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empelado.model.Usuario;
import com.salesianostriana.dam.Empleado.service.CarritoService;
import com.salesianostriana.dam.Empleado.service.ProductoService;

@Controller
public class CarritoController {
	@Autowired
	private ProductoService p;
	@Autowired
	private CarritoService c;
	
	@GetMapping("/carrito")
	public String showCarr(Model model) {
		model.addAttribute("productos",c.getProductosCarr());
		return"carrito";
	}
	@GetMapping("/prodACarr/{id}")
	public String prodACarr(@PathVariable("id") Long id,Model model) {
		Optional<Producto> addP = p.findById(id);
		if (addP!=null) {
			c.addProd(addP.orElse(null));
			return"redirect:/carrito";
		} else {
			return"productos";
		}
	}

	
	@GetMapping("/borrarProd/{id}")
	public String elimar(@PathVariable("id") Long id) {
		Optional <Producto> elimar= p.findById(id);
		if (elimar!=null) {
			c.eliminarPro(elimar.get());
			return"redirect:/carrito";
		} else {
			return"productos";

		}
	}
	
	@GetMapping("/check")
	private String saveCarr(@AuthenticationPrincipal Usuario u) {
		c.checkout(u);
		return"redirect:/compra";
	}
	
	@ModelAttribute("total")
	public double total() {
		Map<Producto,Integer> carrito=c.getProductosCarr();
		double total=0.0;
		if (carrito!=null) {
			for(Producto p:carrito.keySet()) {
				total+=p.getPrecio()*carrito.get(p);
			}
			return total;
		} else {
			return 0.0;

		}
	}
	
	
	
	
}



