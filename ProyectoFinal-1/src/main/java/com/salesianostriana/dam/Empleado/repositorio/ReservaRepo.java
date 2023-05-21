package com.salesianostriana.dam.Empleado.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesianostriana.dam.Empelado.model.Reserva;
import com.salesianostriana.dam.Empelado.model.Servicio;

public interface ReservaRepo extends JpaRepository<Reserva,Long>{

	

}
