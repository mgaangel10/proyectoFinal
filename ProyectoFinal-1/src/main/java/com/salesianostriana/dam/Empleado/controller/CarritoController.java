

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
	
	/**
	 * Muestra la vista del carrito de compras con los productos actuales.
	 * @param model Modelo que se utiliza para pasar datos para luego verlo en el html.
	 * @return La vista del carrito de compras.
	 */
		@GetMapping("/carrito")
	public String showCarr(Model model) {
		model.addAttribute("productos",c.getProductosCarr());
		return"carrito";
	}
		/**
	 * Agrega un producto al carrito de compras.
	 * @param id Identificador del producto que se agregará al carrito.
	 * @param model Modelo que se utiliza para pasar datos para luego verlo en el html.
	 * @return Redirige a la vista del carrito de compras.
	 */
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

	/**
	 * Elimina un producto del carrito de compras.
	 * @param id Identificador del producto que se eliminará del carrito.
	 * @return Redirige a la vista del carrito de compras.
	 */
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
	/**
	 * Procesa la compra de los productos que se encuentran en el carrito.
	 * @param cl Cliente que realiza la compra (obtenidolo automáticamente gracias a la anotación @AuthenticationPrincipal).
	 * @param v Venta que se creará a partir de los productos del carrito.
	 * @return Redirige a la vista de compra.
	 */
	@GetMapping("/check")
	private String saveCarr(@AuthenticationPrincipal Cliente cl,Venta v) {
		
		
		c.checkout(cl);
		return"redirect:/compra";
	}
	/**
	 * Añade el total del carrito de compras como atributo para el modelo.
	 * @return El total del carrito de compras.
	 */
	@ModelAttribute("total")
	public double total() {
		return c.carritoTotal();
	}
	/**
	 * Muestra la vista de ventas con todas las ventas realizadas.
	 * @param model Modelo que se utiliza para pasar datos para luego verlo en el html.
	 * @return La vista de ventas.
	 */
	@GetMapping("/ventas")
	public String mostrarVentas(Model model) {
		model.addAttribute("ventas",c.findAll());
		//model.addAttribute("totalVentas",venta.totalVentas());
		return "ventas";
	}
	/**
	 * Añade el total de ganancias
	 * @return El total de ganancias.
	 */
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



