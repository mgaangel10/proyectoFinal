package com.salesianostriana.dam.Empleado.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Empleado;
import com.salesianostriana.dam.Empleado.repositorio.EmpleadoRepo;




@Service
public class EmpleadoService {
	private EmpleadoRepo emre;
	
	public EmpleadoService (EmpleadoRepo e) {
		this.emre=e;
	}
	
	public Empleado add(Empleado e) {
		return emre.save(e);
	}
	public Empleado edit(Empleado e) {
		return emre.save(e);
	}
	public void delete(Empleado e) {
		emre.delete(e);
	}
	public List<Empleado> findAll(){
		return emre.findAll();
	}
	public Empleado findById(long id) {
		return emre.findById(id).orElse(null);
	}
	public void delete(long id) { emre.deleteById(id); }
	
	

}
