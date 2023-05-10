package com.salesianostriana.dam.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.salesianostriana.dam.Modelos.Servicio;
import com.salesianostriana.dam.Servicios.ServicioService;

@Controller
@RequestMapping("/admi/servicios")
public class ServicioController {
	@Autowired
	private ServicioService servicios;
	
	public String ListarServicios(Model model) {
		model.addAttribute("servicios");
		return "admin/list-servicios";
	}
	@PostMapping("/nuevo/servicios/submit")
	public String submitNuevoServicios(Servicio servicio) {

		servicios.add(servicio);
		return "redirect:/admin/servicios/";

	}
	@GetMapping("/editar/{id}")
	public String editarProducto(@PathVariable("id") Long id, Model model) {

		Servicio servicio = servicios.findById(id);

		if (servicio != null) {
			model.addAttribute("producto", servicio);
			return "admin/form-servicios";
		} else {
			return "redirect:/admin/servicios/";
		}

	}
	@GetMapping("/borrar/{id}")
	public String borrarServicio(@PathVariable("id") Long id, Model model) {

		Servicio servicio = servicios.findById(id);

		if (servicio != null) {
			servicios.delete(servicio);
		}

		return "redirect:/admin/servicio/";

	}

}
