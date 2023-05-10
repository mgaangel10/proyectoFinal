package com.salesianostriana.dam.Servicios;

import java.util.List;

import org.springframework.stereotype.Controller;

import com.salesianostriana.dam.Modelos.Producto;
import com.salesianostriana.dam.Modelos.Servicio;
import com.salesianostriana.dam.Repositorios.ServicioRepo;

@Controller
public class ServicioService {
	private ServicioRepo servicioR;
	
	public ServicioService (ServicioRepo servicio) {
		this.servicioR=servicio;
	}
	
	public Servicio add(Servicio s) {
		return servicioR.save(s);
	}
	public Servicio edit(Servicio s) {
		return servicioR.save(s);
	}
	public List<Servicio> findAll(){
		return servicioR.findAll();
	}
	public Servicio findById(Long codServicio) {
		return servicioR.findById(codServicio).orElse(null);
	}
	public Servicio delete(Servicio servicio) {
		Servicio result = findById(servicio.getCodServicio());
		servicioR.delete(result);
		return result;
	}

}
