package com.salesianostriana.dam.Repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import com.salesianostriana.dam.Modelos.Producto;

public interface ProductoRepo extends JpaRepository<Producto,Long>{

}
