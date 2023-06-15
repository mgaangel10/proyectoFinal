package com.salesianostriana.dam.Empleado.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort.Direction;
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
	
	/**
	 * Muestra el formulario para agregar un nuevo producto.
	 * @param model el Modelo de Spring para luego verlo en el html
	 * @return la vista "addProductos" 
	 */
	@GetMapping("/addProd")
	public String mostrarFormulario(Model model) {
		model.addAttribute("producto",new Producto());
		model.addAttribute("categoria", catService.findAll());
		return "addProductos";
	}
	/**
	 * Procesa los datos del formulario de agregar producto y guarda el producto en la base de datos.
	 * @param p el objeto Producto enviado desde el formulario
	 * @return la vista "administrador" redirigida
	 */
	@PostMapping("/nuevoProducto")
	public String procesarFormulario(@ModelAttribute("producto") Producto p) {
		prod.save(p);
		return "redirect:/administrador";
	}
	/**
	 * Muestra el formulario para editar un producto existente.
	 * @param id del producto a editar
	 * @param model el Modelo de Spring para luego verlo en el html
	 * @return la vista "addProductos" con el modelo necesario
	 */
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
	
	/**
	 * Procesa los datos del formulario de edición de producto y actualiza el producto en la base de datos.
	 * @param p el objeto Producto enviado desde el formulario
	 * @return la vista "listaprod" redirigida
	 */
	@PostMapping("/editarP/submit")
	public String procesarFormularioEdicion(@ModelAttribute("producto") Producto p) {
		prod.edit(p);
		return "redirect:/listaprod";
	}
	
	/**
	 * Muestra una lista de todos los productos.
	 * @param model el Modelo para luego verlo en el html
	 * @return la vista "listaprod" 
	 */
	@GetMapping("/listaprod")
	public String MostrarProducto(Model model) {
		model.addAttribute("lista",prod.findAll());
		
		return "listaprod";	
	}
	
	/**
	 * Borra un producto de la base de datos.
	 * @param id del producto a borrar
	 * @return la vista "listaprod" redirigida
	 */
	@GetMapping("/borrarP/{id}")
	public String borrar(@PathVariable("id") long id) {
		prod.deleteById(id);
		return "redirect:/listaprod";
	}
	
	/**
	 * Muestra una lista de todos los productos y un formulario de búsqueda.
	 * @param model el Modelo para luego verlo en el html
	 * @return la vista "productos" 
	 */
	@GetMapping("/verP")
	public String verP(Model model) {
		model.addAttribute("lista",prod.findAll());
		model.addAttribute("searchForm",new SearchBean());
		return "productos";	
		
	}
	/**
	 * Ordena la lista de productos por nombre de forma ascendente.
	 * @param nombre un parámetro no utilizado para cumplir con la convención de nomenclatura REST
	 * @param model el modelo para luego verlo en el html
	 * @return la vista "productos" 
	 */
	@GetMapping("/ordenarByNombre")
	public String ordenarNombre(@RequestParam("nombre")String nombre,Model model) {
		List<Producto> p = prod.ordenarNombre();
		model.addAttribute("lista",p);
		return "productos";
	}
	
	
	@PostMapping("/search/submit")
	public String enviarBusqueda(@ModelAttribute("searchForm") SearchBean search,Model model) {
		model.addAttribute("lista",prod.searchByNombre(search.getSearch()));
		return "productos";
	}
	
	@GetMapping("/ordenarPrecioBarato")
	public String ordenarPorPrecioMasBajo(Model model) {
	    List<Producto> productos = prod.buscarProductosPorPrecioMasBarato();
	    model.addAttribute("lista", productos);
	    return "productos";
	}
	
	@GetMapping("/orderBy/{orderBy}")
	public String Orden(@PathVariable String orderBy,Model model) {
		List<Producto> pr;
		switch(orderBy) {
		
		case "nombreAscend":
			pr = prod.findAllBySorted(Direction.ASC, "nombre");
			break;
			default:
				pr=prod.findAll();
		}
		model.addAttribute("lista",pr);
		return"productos";
	}
	
	
	
	
	
	
	
	
	
}

