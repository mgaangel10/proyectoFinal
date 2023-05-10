package com.salesianostriana.dam.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salesianostriana.dam.Modelos.Producto;
import com.salesianostriana.dam.Servicios.ProductoService;


@Controller

public class ProductoController {
	

	private ProductoService productos;
	
	@GetMapping("/admiOno")
	public String admi() {
		return "admi";
	}
	
	@GetMapping("/lista/productos")
	public String ListaProductos(Model model) {
		model.addAttribute("productos",productos.findAll());
		return "listaProductos";
	}
	@GetMapping("/nuevo/pruducto")
	public String nuevoProducto(Model model) {
		
		model.addAttribute("producto", new Producto());
		//En el formulario de un nuevo producto, 
		//debemos elegir con un select una categoría de la lista de categorías que hay, 
		//por lo que debemos pasar al modelo dicha lista de categorías.
		//En este caso le hemos llamado categorias y la sacamos con findAll de CategoriaService
		
		
		return "addProductos";
	}
	@PostMapping("/nuevo/producto/submit")
	public String submitNuevoProducto(Producto producto, Model model) {

		productos.add(producto);
		return "";

	}
	@GetMapping("/editar/{id}")
	public String editarProducto(@PathVariable("id") Long id, Model model) {

		Producto producto = productos.findById(id);

		if (producto != null) {
			model.addAttribute("producto", producto);
			return "admin/form-producto";
		} else {
			return "redirect:/admin/producto/";
		}

	}
	@GetMapping("/borrar/{id}")
	public String borrarProducto(@PathVariable("id") Long id, Model model) {

		Producto producto = productos.findById(id);

		if (producto != null) {
			productos.delete(producto);
		}

		return "redirect:/admin/producto/";

	}

}
