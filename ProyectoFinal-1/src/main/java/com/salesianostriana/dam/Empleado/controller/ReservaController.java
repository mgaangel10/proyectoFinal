package com.salesianostriana.dam.Empleado.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.salesianostriana.dam.Empelado.model.Cliente;
import com.salesianostriana.dam.Empelado.model.Reserva;
import com.salesianostriana.dam.Empelado.model.Venta;
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
		
		/**
		 * Método para mostrar el formulario para crear una nueva reserva
		 * 
		 * @param model Objeto Model de Spring que se utiliza para verla en el html
		 * @return La vista "addReserva"
		 */
	@GetMapping("/addReserva")
	public String addReserva (Model model) {
		model.addAttribute("servicio",s.findAll());
		model.addAttribute("reserva",new Reserva());
		return"addReserva";
	}
	/**
	 * Método para procesar el formulario de creación de una nueva reserva
	 * 
	 * @param c Objeto Cliente que representa al usuario que está autentificado
	 * @param re Objeto Reserva que contiene los datos del formulario
	 * @return La vista a la que se quiere redirigir después de procesar el formulario
	 */
	@PostMapping("/addReserva/submit")
	public String enviarResevar(@ModelAttribute("reserva") @AuthenticationPrincipal  Cliente c, Reserva re) {
	    
	    re.setTotal(re.getServicio().getPrecio());
	    re.setCliente(c);
	    r.addReserv(c,re);
	    
	    return "redirect:/vistaReserva";
	}
	
	/**
	 * Método para mostrar la lista de reservas
	 * 
	 * @param model Objeto Model de Spring que se utiliza para luego verla en el html
	 * @return La vista "vistaReserva"
	 */
	@GetMapping("/vistaReserva")
	public String vistReserva (Model model) {
		
		model.addAttribute("reserva",r.findAll());
		return"vistaReserva";
	}
	
	/**
	 * Método para mostrar la lista de reservas
	 * 
	 * @param model Objeto Model de Spring que se utiliza para luego verla en el html
	 * @return La vista ·reservas"
	 */
	@GetMapping("/reservas")
	public String mostrarReservas(Model model) {
		model.addAttribute("reservas",r.findAll());
		return "reservas";
	}
	/**
	 * Método para calcular el total de ganancias obtenidas por todas las reservas
	 * 
	 * @return Devuelve el total de ganancias obtenidas por todas las reservas
	 */
	@ModelAttribute("totalReserva")
	public double totalReserva() {
		List <Reserva> reservas = r.findAll();
		double totalGanancia = 0;
		for(Reserva reserva:reservas) {
			
			totalGanancia += reserva.getTotal();
		}
		return totalGanancia;
	}
	
	@ModelAttribute("totalR")
	public double total(Reserva re) {
		return r.totalreserva(re);
	}
	
	
		
	

}
