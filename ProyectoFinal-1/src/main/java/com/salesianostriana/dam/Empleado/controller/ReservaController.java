package com.salesianostriana.dam.Empleado.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.salesianostriana.dam.Empelado.model.Cliente;
import com.salesianostriana.dam.Empelado.model.Reserva;
import com.salesianostriana.dam.Empleado.service.ReservaService;
import com.salesianostriana.dam.Empleado.service.ServicioService;
import com.salesianostriana.dam.Empleado.service.UsuarioService;

@Controller
public class ReservaController {
		@Autowired
	private ReservaService r;
		@Autowired
		private UsuarioService us;
		@Autowired
		private ServicioService s;
		
		
	@GetMapping("/addReserva")
	public String addReserva (Model model) {
		model.addAttribute("servicio",s.findAll());
		model.addAttribute("usuario",us.findAll());
		model.addAttribute("reserva",new Reserva());
		return"addReserva";
	}
	
	@PostMapping("/addReserva/submit")
	public String enviarResevar(@ModelAttribute("reserva")Reserva re,Cliente c) {
		
		r.save(re);
		r.addReserv(re);
		
		
		return"redirect:/vistaReserva";
	}
	@GetMapping("/vistaReserva")
	public String vistReserva (Model model) {
		
		model.addAttribute("reserva",r.findAll());
		return"vistaReserva";
	}
	@GetMapping("/reservas")
	public String mostrarReservas(Model model) {
		model.addAttribute("reservas",r.findAll());
		return "reservas";
	}
	
	
	
		
	

}
