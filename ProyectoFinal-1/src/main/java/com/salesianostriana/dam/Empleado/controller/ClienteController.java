package com.salesianostriana.dam.Empleado.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.salesianostriana.dam.Empelado.model.Cliente;
import com.salesianostriana.dam.Empleado.service.ClienteService;

@Controller
public class ClienteController {
	 @Autowired
	 private ClienteService c;
	 @Autowired
	 private PasswordEncoder pass;
	 
	 /**
		 * Muestra la vista de registro de un nuevo cliente.
		 * @param model Modelo que se utiliza para pasar luego verlo en el html
		 * @return La vista de registro de cliente.
		 */
	 @GetMapping("/registro")
	 public String addCliente(Model model) {
		 model.addAttribute("cliente",new Cliente());
		 return "registro";
	 }
	 
	 /**
		 * Procesa el formulario de registro de un nuevo cliente.
		 * @param cliente El cliente que se registrará.
		 * @return Redirige a la vista de inicio de sesión.
		 */
	 @PostMapping("/addC/submit")
	 public String agregarC(@ModelAttribute("cliente")Cliente cliente) {
		
		 cliente.setPassword(pass.encode(cliente.getPassword()));
		 c.save(cliente);
		 return"redirect:/login";
	 }
	
}
