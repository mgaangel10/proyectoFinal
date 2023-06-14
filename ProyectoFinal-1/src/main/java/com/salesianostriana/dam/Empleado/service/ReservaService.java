package com.salesianostriana.dam.Empleado.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Cliente;
import com.salesianostriana.dam.Empelado.model.Reserva;
import com.salesianostriana.dam.Empleado.repositorio.ReservaRepo;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

@Service

public class ReservaService extends BaseServiceImpl<Reserva,Long,ReservaRepo>{

	
	@Autowired
	private ReservaRepo r;
	
	public void addReserv(Reserva res) {
		res.getServicio().setPrecio(res.getTotal());
		res.getServicio().getNombre();
		res.setTotal(res.getServicio().getPrecio());
		save(res);
	}
	/*public void saveReserva(Cliente c) {
		Reserva re = new Reserva();
		re.setCliente(c);
		re.getCliente().getNombre();
		re.getCliente().getApellidos();
		re.getCliente().getCorreo();
		save(re);
	}*/
	
	
	
	
	
	
	
}
