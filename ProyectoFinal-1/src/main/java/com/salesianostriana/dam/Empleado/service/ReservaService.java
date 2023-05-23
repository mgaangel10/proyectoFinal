package com.salesianostriana.dam.Empleado.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Producto;
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
	private ReservaRepo r;
	
	public void addReserv(Reserva res) {
		res.getServicio().setPrecio(res.getTotal());
		res.getServicio().getNombre();
	}
	
	
	
	
	
	
}
