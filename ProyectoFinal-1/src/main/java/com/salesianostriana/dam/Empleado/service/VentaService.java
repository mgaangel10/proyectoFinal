package com.salesianostriana.dam.Empleado.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Venta;
import com.salesianostriana.dam.Empleado.repositorio.VentaRepo;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

@Service
public class VentaService extends BaseServiceImpl<Venta,Long,VentaRepo>{
	@Autowired
	private VentaRepo v;
	
	@Override
	public Venta save(Venta v) {
		return super.save(v);
	}
	
	/*public double totalVentas() {
		return v.totalVentas();
	}*/

}
