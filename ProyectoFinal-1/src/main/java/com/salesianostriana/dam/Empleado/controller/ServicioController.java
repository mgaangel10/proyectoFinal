package com.salesianostriana.dam.Empleado.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empelado.model.Servicio;
import com.salesianostriana.dam.Empleado.service.ServicioService;

@Controller
public class ServicioController {
	@Autowired
	private ServicioService serv;
	
	@GetMapping("/addServ")
	public String mostrarFormulario(Model model) {
		model.addAttribute("servicio",new Servicio());
		return "addServicios";
	}
	
	@PostMapping("/nuevoServicio")
	public String procesarFormulario(@ModelAttribute("servicio") Servicio s) {
		serv.save(s);
		return "redirect:/administrador";
	}
	@GetMapping("/editarS/{id}")
	public String mostrarFormularioEdicion(@PathVariable("id") long id, Model model) {
		Optional<Servicio> aEditar = serv.findById(id);
				if (aEditar != null) {
			model.addAttribute("servicio", aEditar);
			return "addServicios";
		} else {
			return "redirect:/listaServicios";
		}
	}
	@PostMapping("/editarS/submit")
	public String procesarFormularioEdicion(@ModelAttribute("servicio") Servicio s) {
		serv.edit(s);
		return "redirect:/listaServicios";
	}
	
	@GetMapping("/listaServicios")
	public String MostrarProducto(Model model) {
		model.addAttribute("lista",serv.findAll());
		return "listaServicios";	
	}

}
