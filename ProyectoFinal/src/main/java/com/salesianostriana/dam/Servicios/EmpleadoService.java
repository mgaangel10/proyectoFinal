package com.salesianostriana.dam.Servicios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Modelos.Empleado;
import com.salesianostriana.dam.Modelos.Producto;
import com.salesianostriana.dam.Repositorios.EmpleadoRepo;

@Service
public class EmpleadoService {
	@Autowired
	private EmpleadoRepo empleadoR;
	
	public EmpleadoService (EmpleadoRepo empleadoRepo) {
		this.empleadoR=empleadoRepo;
	}
	
	public Empleado add (Empleado e) {
		return empleadoR.save(e);
	}
	
	public Empleado edit(Empleado e) {
		return empleadoR.save(e);
	}
	public Empleado findById(Long id) {
	return 	empleadoR.findById(id).orElse(null);
	}
	public Empleado delete(Empleado empleado) {
		Empleado result = findById(empleado.getId());
		empleadoR.delete(result);
		return result;
	}

}
