package com.salesianostriana.dam.Empleado.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.salesianostriana.dam.Empelado.model.Cliente;
import com.salesianostriana.dam.Empelado.model.Servicio;
import com.salesianostriana.dam.Empleado.repositorio.ClienteRepo;

@Controller
public class ClienteController {
	@Autowired
	private ClienteRepo cli;
	
	@GetMapping("/addCliente")
	public String nuevoClient(Model model) {
		model.addAttribute("cliente",new Cliente());
		return"addCliente";
	}
	
	@PostMapping("/nuevoCliente")
	public String procesarFormulario(@ModelAttribute("cliente") Cliente c) {
		cli.save(c);
		return "redirect:/administrador";
	}
	
}
