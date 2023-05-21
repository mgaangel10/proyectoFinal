package com.salesianostriana.dam.Empleado.controller;

import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.salesianostriana.dam.Empelado.model.Reserva;
import com.salesianostriana.dam.Empelado.model.Servicio;
import com.salesianostriana.dam.Empelado.model.Usuario;
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
		public String nuevaReser(Model model) {
			model.addAttribute("usuario",us.findAll());
			model.addAttribute("reserva",new Reserva());
			model.addAttribute("Servcio",s.findAll());
			return"addReserva";
		}
		@PostMapping("reserva/submit")
		public String submitReserva(@ModelAttribute("reserva") Servicio s) {
			r.addReserva(s);
			return"redirect:/vistaReserva";
		}
		
		@GetMapping("/borrarReserva")
		public String borrarReserva(@PathVariable("id") Long id) {
			Optional<Servicio> eliminar = s.findById(id);
			if (eliminar!=null) {
				r.elminarReserva(eliminar.get());
				return"redirect:/vistaReserva";
			} else {
				return"servcios";
			}
		}
		
		@GetMapping("/checkout")
		private String saveRe(@AuthenticationPrincipal Usuario u) {
			r.checkout(u);
			return"redirect:/compraSe";
		}
		
		public double total() {
			Map<Servicio,Reserva> reser=r.getReserva();
			double total = 0.0;
			if (reser!=null) {
				for(Servicio s:reser.keySet()) {
					total+=s.getPrecio();
				}
				return total;
			} else {
				return 0.0;
			}
		}
	
		
	

}
