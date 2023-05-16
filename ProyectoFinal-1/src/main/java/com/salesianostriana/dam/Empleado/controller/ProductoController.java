package com.salesianostriana.dam.Empleado.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salesianostriana.dam.Empelado.model.Empleado;
import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empleado.service.ProductoService;

@Controller

public class ProductoController {
	@Autowired
	private ProductoService prod;
	
	@GetMapping("/addProd")
	public String mostrarFormulario(Model model) {
		model.addAttribute("producto",new Producto());
		return "addProductos";
	}
	
	@PostMapping("/nuevoProducto")
	public String procesarFormulario(@ModelAttribute("producto") Producto p) {
		prod.save(p);
		return "redirect:/administrador";
	}
	@GetMapping("/editarP/{id}")
	public String mostrarFormularioEdicion(@PathVariable("id") long id, Model model) {
		Optional<Producto> aEditar = prod.findById(id);
				if (aEditar.isPresent()) {
			model.addAttribute("producto", aEditar.get());
			return "addProductos";
		} else {
			return "redirect:/listaProductos";
		}
	}
	@PostMapping("/editarP/submit")
	public String procesarFormularioEdicion(@ModelAttribute("Producto") Producto p) {
		prod.edit(p);
		return "redirect:/listaprod";
	}
	
	@GetMapping("/listaprod")
	public String MostrarProducto(Model model) {
		model.addAttribute("lista",prod.findAll());
		return "listaprod";	
	}
	@GetMapping("/borrarP/{id}")
	public String borrar(@PathVariable("id") long id) {
		prod.deleteById(id);
		return "redirect:/listaProductos";
	}
	
	
	
	
	
	
}

