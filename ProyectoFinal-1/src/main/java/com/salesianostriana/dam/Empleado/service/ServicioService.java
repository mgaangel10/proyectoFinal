package com.salesianostriana.dam.Empleado.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Producto;
import com.salesianostriana.dam.Empelado.model.Servicio;
import com.salesianostriana.dam.Empleado.repositorio.ServicioRepo;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

@Service
public class ServicioService extends BaseServiceImpl<Servicio,Long,ServicioRepo>{
	@Autowired
	private ServicioRepo serv;
	
	public List<Servicio> searchByNombre(String nombre){
		return serv.findByNombreContainingIgnoreCase(nombre);
	}

}
