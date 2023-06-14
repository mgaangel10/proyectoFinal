package com.salesianostriana.dam.Empleado.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.salesianostriana.dam.Empelado.model.Venta;

public interface VentaRepo extends JpaRepository<Venta, Long> {

/*	@Query("SELECT SUM(v.precio) FROM Venta v WHERE MONTH(v.fecha) = MONTH(NOW)) AND YEAR(v.fecha) = YEAR(NOW))")
	public double totalVentas();
*/
}
