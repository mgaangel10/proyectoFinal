package com.salesianostriana.dam.Empleado.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MainController {
	
	@GetMapping("/viewProductos")
	public String viewP() {
		return "vistaProductos";
	}
	@GetMapping("/viewServicios")
	public String viewS() {
		return "vistaServicios";
	}
	@GetMapping("/login")
	public String index() {
		return "logueo";
	}
	@GetMapping("/")
	public String indexx() {
		return "index";
	}
	
}
