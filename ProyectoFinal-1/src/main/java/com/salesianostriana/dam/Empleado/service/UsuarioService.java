package com.salesianostriana.dam.Empleado.service;

import org.springframework.stereotype.Service;

import com.salesianostriana.dam.Empelado.model.Usuario;
import com.salesianostriana.dam.Empleado.repositorio.UsuarioRepositorio;
import com.salesianostriana.dam.Empleado.service.base.BaseServiceImpl;

@Service
public class UsuarioService extends BaseServiceImpl<Usuario,Long,UsuarioRepositorio>{

}
