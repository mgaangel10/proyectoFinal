package com.salesianostriana.dam.Empleado.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.salesianostriana.dam.Empelado.model.Categoria;
import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empleado.service.CategoriaService;
import com.salesianostriana.dam.Empleado.service.ProductoService;

@Controller
public class CategoriaController {
	
	@Autowired
	private CategoriaService cat;
	
	@Autowired
	private ProductoService prod;
	
	/**
	 * Muestra la vista con la lista de todas las categorías.
	 * @param model Modelo que se utiliza para pasar datos para luego verlo en el html.
	 * @return La vista de lista de categorías.
	 */
	@GetMapping("/listC")
	public String cat(Model model) {
		model.addAttribute("categoria",cat.findAll());
		return "listaCategorias";
	}
	
	/**
	 * Muestra la vista para agregar una nueva categoría.
	 * @param model Modelo que se utiliza para luego verlo en el html.
	 * @return La vista de agregar categoría.
	 */
	@GetMapping("/nuevaC")
	public String nuevac(Model model) {
		model.addAttribute("categoria",new Categoria());
		return "addCategoria";
	}
	
	/**
	 * Procesa el formulario de agregar una nueva categoría.
	 * @param c La categoría que se agregará.
	 * @param model Modelo que se utiliza para luego verlo en el html.
	 * @return Redirige a la vista del administrador.
	 */
	@PostMapping("/nuevaC/submit")
	public String enviar(@ModelAttribute("categoria") Categoria c, Model model) {
		cat.save(c);
		return"redirect/administrador";
	}
	/**
	 * Muestra la vista para editar una categoría existente.
	 * @param id Identificador de la categoría que se editará.
	 * @param model Modelo que se utiliza para luego verlo en el html.
	 * @return La vista de agregar categoría.
	 */
	@GetMapping("/editarC/{id}")
	public String editarC(@PathVariable("id")Long id,Model model) {
		Optional<Categoria> categoria = cat.findById(id);
		
		if (categoria.isPresent()) {
			model.addAttribute("categoria",categoria.get());
			return"addCategoriaS";
		} else {
			return"redirect:/listC";
		}
	}
	/**
	 * Procesa el formulario de edición de una categoría.
	 * @param c La categoría que se editará.
	 * @return Redirige a la vista de lista de categorías.
	 */
	@PostMapping("/editarC/submit")
	public String procesarFormularioEdicion(@ModelAttribute("categoria") Categoria c) {
		cat.save(c);
		return "redirect:/listC";
	}
	/**
	 * Elimina una categoría.
	 * @param id Identificador de la categoría que se eliminará.
	 * @param model Modelo que se utiliza para luego verlo en el html.
	 * @return Redirige a la vista de lista de categorías.
	 */
	@GetMapping("/borrarC/{id}")
	public String borrarC(@PathVariable("id")Long id,Model model) {
		Optional<Categoria> categoria = cat.findById(id);
		if (categoria.isPresent()) {
			if (prod.numeroProductosCategoria(categoria)==0) {
				cat.deleteById(id);
			}
		} else {
			return "redirect:/listC?error=true";
		}
		return "redirect:/listC";
	}
	
}
