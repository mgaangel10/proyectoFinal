package com.salesianostriana.dam.Empleado.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.salesianostriana.dam.Empelado.model.Empleado;
import com.salesianostriana.dam.Empleado.service.EmpleadoService;
@Controller
public class EmpleadoController {
	
	
	private EmpleadoService emse;
	
	public EmpleadoController (EmpleadoService ser) {
		this.emse=ser;
	}
	@GetMapping({"/","/todo"})
	public String index(Model model) {
		return "index";
	}
	@GetMapping("/mostrarFormulario")
	public String Mostrar(Model model) {
		model.addAttribute("lista",emse.findAll());
		return "vistaFormularioTerminado";
	}
	@GetMapping("/nuevo")
	public String mostrarFormulario(Model model) {
		model.addAttribute("empleado",new Empleado());
		return "vistaFormulario";
	}
	@PostMapping("/nuevo/submit")
	public String procesarFormulario(@ModelAttribute("empleado") Empleado e) {
		emse.add(e);
		return "redirect:/administrador";
	}
	@GetMapping("/editar/{id}")
	public String mostrarFormularioEdicion(@PathVariable("id") long id, Model model) {
		
		//Buscamos al alumno por id y recordemos que el método findById del servicio, 
		//devuelve el objeto buscado o null si no se encuentra.
		 
		
		Empleado aEditar = emse.findById(id);
		
		if (aEditar != null) {
			model.addAttribute("empleado", aEditar);
			return "vistaFormulario";
		} else {
			// No existe ningún alumno con el Id proporcionado.
			// Redirigimos hacia el listado.
			return "redirect:/mostrarFormulario";
		}
		
		
		
		
	}
	@GetMapping("/administrador")
	public String administrador() {
		return "administrador";
	}
	
	@PostMapping("/editar/submit")
		public String procesarFormularioEdicion(@ModelAttribute("empleado") Empleado a) {
			emse.edit(a);
			return "redirect:/mostrarFormulario";//Volvemos a redirigir la listado a través del controller 
			//para pintar la lista actualizada con la modificación hecha
		}
	@GetMapping("/borrar/{id}")
	public String borrar(@PathVariable("id") long id) {
		emse.delete(id);
		return "redirect:/mostrarFormulario";
	}
	
	
	
	
	

	
	
	
	}
