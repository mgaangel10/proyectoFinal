

package com.salesianostriana.dam.Empleado.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.salesianostriana.dam.Empelado.model.Cliente;
import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empelado.model.Venta;
import com.salesianostriana.dam.Empleado.service.CarritoService;
import com.salesianostriana.dam.Empleado.service.ProductoService;
import com.salesianostriana.dam.Empleado.service.VentaService;

@Controller
public class CarritoController {
	@Autowired
	private ProductoService p;
	@Autowired
	private CarritoService c;
	@Autowired
	private VentaService venta;
	
	
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
		if (elimar.isPresent()) {
			c.eliminarPro(elimar.get());
			return"redirect:/carrito";
		} else {
			
			return"productos";

		}
	}
	
	@GetMapping("/check")
	private String saveCarr(@AuthenticationPrincipal Cliente cl,Venta v) {
		
		
		c.checkout(cl);
		return"redirect:/compra";
	}
	
	@ModelAttribute("total")
	public double total() {
		return c.totalCarrito();
	}
	@GetMapping("/ventas")
	public String mostrarVentas(Model model) {
		model.addAttribute("ventas",c.findAll());
		//model.addAttribute("totalVentas",venta.totalVentas());
		return "ventas";
	}
	@ModelAttribute("totalVentas")
	private double totalVentas() {
		List <Venta> ventas = c.findAll();
		double totalGanancia = 0;
		for(Venta venta:ventas) {
			totalGanancia += venta.getTotal();
		}
		return totalGanancia;
	}

	
	
	
	
}



