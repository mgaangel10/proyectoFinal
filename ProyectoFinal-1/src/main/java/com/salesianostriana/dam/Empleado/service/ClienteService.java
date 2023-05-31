package com.salesianostriana.dam.Empleado.service;

import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Cliente;
import com.salesianostriana.dam.Empleado.repositorio.ClienteRepo;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

@Service
public class ClienteService extends BaseServiceImpl<Cliente,Long,ClienteRepo>{

}
