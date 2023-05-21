package com.salesianostriana.dam.Empleado.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Reserva;
import com.salesianostriana.dam.Empelado.model.Servicio;
import com.salesianostriana.dam.Empelado.model.Usuario;
import com.salesianostriana.dam.Empleado.repositorio.ReservaRepo;
import com.salesianostriana.dam.Empleado.repositorio.ServicioRepo;
import com.salesianostriana.dam.Empleado.repositorio.UsuarioRepositorio;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

@Service

public class ReservaService extends BaseServiceImpl<Reserva,Long,ReservaRepo>{

	@Autowired
	private UsuarioRepositorio u;
	@Autowired
	private ServicioRepo s;
	@Autowired
	private ReservaRepo r;
	
	private Map<Servicio,Reserva> reserva = new HashMap<>();
	
	public Map<Servicio,Reserva> getReserva(){
		return Collections.unmodifiableMap(reserva);
	}
	public void addReserva(Servicio s) {
		Usuario u = new Usuario();
			Reserva r = new Reserva ();
		if (reserva.containsKey(s)) {
			
			reserva.replace(s, r);
		} else {
			reserva.put(s, r);
		}
	}
	public void elminarReserva(Servicio s) {
		s.remove(s);
		
		
		
	}
	
	public void checkout(Usuario u) {
		Reserva re= new Reserva ();
		Servicio s = new Servicio ();
		Optional<Servicio> optional = java.util.Optional.empty();
		if (optional.isPresent()) {
			for(Map.Entry<Servicio, Reserva> en : reserva.entrySet()) {
				
				re.setServ(en.getKey());
				
				re.setTotal(s.getPrecio());
				re.setFecha(LocalDate.now());
				re.setHora(LocalTime.now());
			}
		}
		
		reserva.clear();
	}
	
	

	
	
	
	
	
	
	
	
	
	
}
