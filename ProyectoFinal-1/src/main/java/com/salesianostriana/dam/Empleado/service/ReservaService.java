package com.salesianostriana.dam.Empleado.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Cliente;
import com.salesianostriana.dam.Empelado.model.Reserva;
import com.salesianostriana.dam.Empleado.repositorio.ReservaRepo;
import com.salesianostriana.dam.Empleado.repositorio.ServicioRepo;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

@Service

public class ReservaService extends BaseServiceImpl<Reserva,Long,ReservaRepo>{

	
	@Autowired
    private ServicioRepo repository;
	@Autowired
    private ReservaRepo reservaRepo;
	
	/**
	 * Calcula el total de la reserva
	 * 
	 * @param res Reserva de la que se quiere calcular el total
	 * @return Total de la reserva
	 */
	public double totalreserva(Reserva res) {
		double total=0.0;
		total+=res.getTotal();
		return total;
	}
	
	/**
	 * Agrega una reserva para un cliente
	 * 
	 * @param c Cliente que realiza la reserva
	 * @param res Reserva que se quiere agregar
	 */
	public void addReserv(Cliente c,Reserva res) {
		
		 res.setCliente(c);
	    res.setTotal(totalreserva(res));
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
