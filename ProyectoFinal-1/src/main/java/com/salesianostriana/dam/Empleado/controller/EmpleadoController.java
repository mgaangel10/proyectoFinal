package com.salesianostriana.dam.Empleado.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.salesianostriana.dam.Empelado.model.Empleado;
import com.salesianostriana.dam.Empleado.service.EmpleadoService;
import com.salesianostriana.dam.formbeans.SearchBean;
@Controller

public class EmpleadoController {
	
	@Autowired
	private EmpleadoService emse;
	@Autowired
	HttpSession session;
	 @Autowired
	 private PasswordEncoder pass;
	
	public EmpleadoController (EmpleadoService ser) {
		this.emse=ser;
	}
	/**
	 * Muestra la página de inicio con la lista de todos los empleados.
	 * @param model Modelo que se utiliza para luego verlo en el html
	 * @return La vista de inicio.
	 */
	@GetMapping({"/","/todo"})
	public String index(Model model) {
		model.addAttribute("lista",emse.findAll());
		return "index";
	}
	/**
	 * Muestra la vista de búsqueda de empleados.
	 * @param model Modelo que se utiliza para luego verlo en el html
	 * @return La vista de búsqueda de empleados.
	 */
	@GetMapping("/mostrarFormulario")
	public String Mostrar(Model model) {
		model.addAttribute("lista",emse.findAll());
		model.addAttribute("searchForm",new SearchBean());
		return "vistaFormularioTerminado";
	}
	/**
	 * Muestra la vista de creación de un nuevo empleado.
	 * @param model Modelo que se utiliza para luego verlo en el html
	 * @return La vista de creación de empleado.
	 */
	@GetMapping("/nuevo")
	public String mostrarFormulario(Model model) {
		model.addAttribute("empleado",new Empleado());
		return "vistaFormulario";
	}
	/**
	 * Procesa el formulario de creación de un nuevo empleado.
	 * @param e el empleado que se creará.
	 * @return Redirige a la vista del administrador.
	 */
	@PostMapping("/nuevo/submit")
	public String procesarFormulario(@ModelAttribute("empleado") Empleado e) {
		
		e.setPassword(pass.encode(e.getPassword()));
		emse.add(e);
		
		return "redirect:/administrador";
	}
	/**
	 * Muestra la vista de edición de un empleado existente.
	 * @param id identificador del empleado que se editará.
	 * @param model Modelo que se utiliza para pasar luego verlo en el html.
	 * @return La vista de edición de empleado.
	 */
	@GetMapping("/editar/{id}")
	public String mostrarFormularioEdicion(@PathVariable("id") long id, Model model) {
		
		
		 
		
		Empleado aEditar = emse.findById(id);
		
		if (aEditar != null) {
			model.addAttribute("empleado", aEditar);
			return "vistaFormulario";
		} else {
			
			return "redirect:/mostrarFormulario";
		}
		
		
		
		
	}
	@GetMapping("/administrador")
	public String administrador() {
		return "administrador";
	}
	/**
	 * Procesa el formulario de edición de un empleado.
	 * @param a el empleado que se editará.
	 * @return Redirige a la vista de búsqueda de empleados.
	 */
	@PostMapping("/editar/submit")
		public String procesarFormularioEdicion(@ModelAttribute("empleado") Empleado a) {
			emse.edit(a);
			return "redirect:/mostrarFormulario";//Volvemos a redirigir la listado a través del controller 
			//para pintar la lista actualizada con la modificación hecha
		}
	
	/**
	 * Elimina un empleado.
	 * @param id identificador del empleado que se eliminará.
	 * @return Redirige a la vista de búsqueda de empleados.
	 */
	@GetMapping("/borrar/{id}")
	public String borrar(@PathVariable("id") long id) {
		emse.delete(id);
		return "redirect:/mostrarFormulario";
	}
	
	
	/**
	 * Procesa el formulario de búsqueda de empleados.
	 * @param search el término de búsqueda introducido por el usuario.
	 * @param model Modelo que se utiliza para pasar luego verlo en el html
	 * @return La vista de búsqueda de empleados con los resultados de la búsqueda.
	 */
	@PostMapping("/searchE/submit")
	public String enviarBusqueda(@ModelAttribute("searchForm") SearchBean search,Model model) {
		model.addAttribute("lista",emse.searchByNombre(search.getSearch()));
		return "vistaFormularioTerminado";
	}
	
	
	
	

	
	
	
	}
