package com.salesianostriana.dam.Empleado.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.salesianostriana.dam.Empelado.model.Empleado;
import com.salesianostriana.dam.Empleado.service.EmailSender;
import com.salesianostriana.dam.Empleado.service.EmpleadoService;
import com.salesianostriana.dam.formbeans.SearchBean;
@Controller
@RestController

public class EmpleadoController {
	
	@Autowired
	private EmpleadoService emse;
	@Autowired
	HttpSession session;
	@Autowired
	private EmailSender emailSender;
	
	public EmpleadoController (EmpleadoService ser) {
		this.emse=ser;
	}
	@GetMapping({"/","/todo"})
	public String index(Model model) {
		model.addAttribute("lista",emse.findAll());
		return "index";
	}
	@GetMapping("/mostrarFormulario")
	public String Mostrar(Model model) {
		model.addAttribute("lista",emse.findAll());
		model.addAttribute("searchForm",new SearchBean());
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
	
	
	@PostMapping("/buscarApe")
	public String buscarPorApellidos(@RequestParam("ape")String apellido,Long id) {
		List<Empleado> result = emse.buscarPorApellido(apellido);
		
		result.forEach(System.out::println);
		return "vistaFormularioTerminado";
	}
	@PostMapping("/subscribirse")
	public ModelAndView enviarEmail(@RequestParam("destinatario") String destinatario,
            @RequestParam("asunto") String asunto,
            @RequestParam("mensaje") String mensaje) {
Empleado e = new Empleado();
e.setEmail(destinatario);
asunto="hola";
mensaje="gracias";
emailSender.sendEmail(destinatario, asunto, mensaje);

ModelAndView mav = new ModelAndView("email-enviado");
mav.addObject("destinatario", destinatario);
mav.addObject("asunto", asunto);
mav.addObject("mensaje", mensaje);
return mav;
	}
	
	
	

	
	
	
	}
