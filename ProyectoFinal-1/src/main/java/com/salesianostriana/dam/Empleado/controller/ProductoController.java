package com.salesianostriana.dam.Empleado.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empleado.service.CategoriaService;
import com.salesianostriana.dam.Empleado.service.ProductoService;
import com.salesianostriana.dam.formbeans.SearchBean;

@Controller

public class ProductoController {
	@Autowired
	HttpSession session;
	@Autowired
	private ProductoService prod;
	
	@Autowired
	private CategoriaService catService;
	
	@GetMapping("/addProd")
	public String mostrarFormulario(Model model) {
		model.addAttribute("producto",new Producto());
		model.addAttribute("categoria", catService.findAll());
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
			model.addAttribute("categoria", catService.findAll());
			return "addProductos";
		} else {
			return "redirect:/listaprod";
		}
	}
	@PostMapping("/editarP/submit")
	public String procesarFormularioEdicion(@ModelAttribute("producto") Producto p) {
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
		return "redirect:/listaprod";
	}
	@GetMapping("/verP")
	public String verP(Model model) {
		model.addAttribute("lista",prod.findAll());
		model.addAttribute("searchForm",new SearchBean());
		return "productos";	
		
	}
	@GetMapping("/ordenarByNombre")
	public String ordenarNombre(@RequestParam("nombre")String nombre,Model model) {
		List<Producto> p = prod.ordenarNombre();
		model.addAttribute("producto",p);
		return "productos";
	}
	
	
	@PostMapping("/search/submit")
	public String enviarBusqueda(@ModelAttribute("searchForm") SearchBean search,Model model) {
		model.addAttribute("producto",prod.searchByNombre(search.getSearch()));
		return "productos";
	}
	
	@GetMapping("/ordenarPrecioBarato")
	public String ordenarPorPrecioMasBajo(Model model) {
	    List<Producto> productos = prod.buscarProductosPorPrecioMasBarato();
	    model.addAttribute("producto", productos);
	    return "productos";
	}
	
	
	
	
	
	
	
	
}

