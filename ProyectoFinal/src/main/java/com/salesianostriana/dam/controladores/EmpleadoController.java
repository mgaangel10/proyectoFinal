package com.salesianostriana.dam.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.salesianostriana.dam.Modelos.Empleado;

import com.salesianostriana.dam.Servicios.EmpleadoService;

@Controller

public class EmpleadoController {
	
	@Autowired
	private EmpleadoService empleados;
	
	@GetMapping("/admiOno")
	public String admi(Model model) {
		return "adminOno";
	}
	
	@GetMapping("/nuevo/empleado")
	public String nuevaEmpleado(Model model) {
		
		model.addAttribute("empleado", new Empleado());
		//En el formulario de un nuevo producto, 
		//debemos elegir con un select una categoría de la lista de categorías que hay, 
		//por lo que debemos pasar al modelo dicha lista de categorías.
		//En este caso le hemos llamado categorias y la sacamos con findAll de CategoriaService
		
		
		return "vistaFormulario";
	}
	@PostMapping("/nuevo/empleado/submit")
	public String submitNuevoEmpleado(Empleado empleado) {

		empleados.add(empleado);
		return "redirect:administrador";

	}
	
	
}