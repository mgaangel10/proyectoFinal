package com.salesianostriana.dam.Empleado.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.salesianostriana.dam.Empelado.model.Servicio;
import com.salesianostriana.dam.Empleado.service.ServicioService;
import com.salesianostriana.dam.formbeans.SearchBean;

@Controller
public class ServicioController {
	@Autowired
	private ServicioService serv;
	
	/**
	 * Método para mostrar el formulario de creación de un nuevo servicio
	 * 
	 * @param model Objeto Model de Spring que se utiliza para pasar datos a la vista
	 * @return La vista "addServicios"
	 */
	@GetMapping("/addServ")
	public String mostrarFormulario(Model model) {
		model.addAttribute("servicio",new Servicio());
		return "addServicios";
	
	}
	/**
	 * Método para procesar el formulario de creación de un nuevo servicio
	 * 
	 * @param s Objeto Servicio que contiene los datos del formulario
	 * @return La viista redirigida"/adminisrador"
	 */
	@PostMapping("/nuevoServicio")
	public String procesarFormulario(@ModelAttribute("servicio") Servicio s) {
		serv.save(s);
		return "redirect:/administrador";
	}
	/**
	 * Método para mostrar el formulario de edición de un servicio
	 * 
	 * @param id Identificador del servicio que se quiere editar
	 * @param model Objeto Model de Spring que se utiliza para pasar datos a la vista
	 * @return La vsita "addServcios" o redirige "/listaServicios"
	 */
	@GetMapping("/editarS/{id}")
	public String mostrarFormularioEdicion(@PathVariable("id") long id, Model model) {
		Optional<Servicio> aEditar = serv.findById(id);
				if (aEditar.isPresent()) {
			model.addAttribute("servicio", aEditar.get());
			return "addServicios";
		} else {
			return "redirect:/listaServicios";
		}
	}
	/**
	 * Método para procesar el formulario de edición de un servicio
	 * 
	 * @param s Objeto Servicio que contiene los datos del formulario
	 * @return La vista redirigida "/listaServicios"
	 */
	@PostMapping("/editarS/submit")
	public String procesarFormularioEdicion(@ModelAttribute("servicio") Servicio s) {
		serv.edit(s);
		return "redirect:/listaServicios";
	}
	/**
	 * Método para mostrar la lista de servicios
	 * 
	 * @param model Objeto Model de Spring que se utiliza para pasar datos a la vista
	 * @return La vista "listaServicios"
	 */
	@GetMapping("/listaServicios")
	public String MostrarProducto(Model model) {
		model.addAttribute("lista",serv.findAll());
		return "listaServicios";	
	}
	/**
	 * Método para eliminar un servicio
	 * 
	 * @param id identificador del servicio que se quiere eliminar
	 * @return La vista redirigida "/listaServicios"
	 */
	@GetMapping("/borrarS/{id}")
	public String borrar(@PathVariable("id") long id) {
		serv.deleteById(id);
		return "redirect:/listaServicios";
	}
	/**
	 * Método para mostrar la lista de servicios
	 * 
	 * @param model Objeto Model de Spring que se utiliza para poder verla luego en el html
	 * @return La vista "servicios"
	 */
	@GetMapping("/verS")
	public String showServcios(Model model) {
		model.addAttribute("lista",serv.findAll());
		model.addAttribute("searchForm",new SearchBean());
		return "servicios";
	}
	/**
	 * Método para procesar la búsqueda de servicios por nombre
	 * 
	 * @param search Objeto SearchBean que contiene el criterio de búsqueda
	 * @param model Objeto Model de Spring que se utiliza para luego verla en el html
	 * @return La vista "servicios"
	 */
	@PostMapping("/searchS/submit")
	public String enviarBusqueda(@ModelAttribute("searchForm") SearchBean search,Model model) {
		model.addAttribute("lista",serv.searchByNombre(search.getSearch()));
		return "servicios";
	}

}
