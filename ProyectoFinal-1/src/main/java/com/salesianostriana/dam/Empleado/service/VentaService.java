package com.salesianostriana.dam.Empleado.service;

import com.salesianostriana.dam.Empelado.model.Venta;
import com.salesianostriana.dam.Empleado.repositorio.VentaRepo;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

public class VentaService extends BaseServiceImpl<Venta,Long,VentaRepo>{
	@Override
	public Venta save(Venta v) {
		return super.save(v);
	}

}
