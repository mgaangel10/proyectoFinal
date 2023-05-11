package com.salesianostriana.dam.Empleado.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.salesianostriana.dam.Empelado.model.Empleado;
import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empleado.service.ProductoService;

@Controller
public class ProductoController {
	private ProductoService prod;
	
	@GetMapping("/addProd")
	public String mostrarFormulario(Model model) {
		model.addAttribute("producto",new Producto());
		return "addProductos";
	}
	
	@PostMapping("/nuevoProducto")
	public String procesarFormulario(@ModelAttribute("producto") Producto p) {
		prod.add(p);
		return "redirect:/listaProductos";
	}
	@GetMapping("/editarP/{id}")
	public String mostrarFormularioEdicion(@PathVariable("id") long id, Model model) {
		
		//Buscamos al alumno por id y recordemos que el método findById del servicio, 
		//devuelve el objeto buscado o null si no se encuentra.
		 
		
		Producto aEditar = prod.findById(id);
		
		if (aEditar != null) {
			model.addAttribute("producto", aEditar);
			return "addProducto";
		} else {
			// No existe ningún alumno con el Id proporcionado.
			// Redirigimos hacia el listado.
			return "redirect:/listaProductos";
		}
		
	
}
	
	@GetMapping("/listaProductos")
	public String MostrarProducto(Model model) {
		model.addAttribute("lista",prod.findAll());
		return "listaProductos";
	}
	
	@PostMapping("/editarP/submit")
	public String procesarFormularioEdicion(@ModelAttribute("producto") Producto p) {
		prod.edit(p);
		return "redirect:/listaProductos";//Volvemos a redirigir la listado a través del controller 
		//para pintar la lista actualizada con la modificación hecha
	}
	
	@GetMapping("/borrarP/{id}")
	public String borrar(@PathVariable("id") long id) {
		prod.delete(id);
		return "redirect:/listaProductos";
	}
	
	
	
	
}

