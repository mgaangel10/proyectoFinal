package com.salesianostriana.dam.Empelado.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Venta {
	@Id
	@GeneratedValue
	private Long id;
	@DateTimeFormat(pattern="yyyy-MM-dd")	
	private LocalDate fecha;
	private double total;
	private String nombre;
	private int cantidad;

	
	@ManyToOne
	@JoinColumn(name="usuarioId")
	private Cliente cliente;
	
	
	
	@ToString.Exclude
	@EqualsAndHashCode.Exclude
	@Builder.Default
	@OneToMany(
			mappedBy="venta", fetch= FetchType.EAGER,
			cascade=CascadeType.ALL,
			orphanRemoval=true
			)
	private List<LineaDeVenta> lv = new ArrayList<>();
	
	/**
	 * Devuelve las lineas de venta que componen la venta
	 * 
	 * @return Lista de lineas de venta
	 */
	public List<LineaDeVenta> getLienaDeVenta(){
	return Collections.unmodifiableList(lv);
	}
	
	/**
	 * Genera un nuevo id para la linea de venta
	 * 
	 * @return Nuevo id para la linea de venta
	 */
	public Long generatedId() {
		if (this.lv.size()>0) {
			return this.lv.stream()
					.map(LineaDeVenta::getLinea)
					.map(LineaDeVentaPk::getLineaDeVentaId)
					.max(Comparator.naturalOrder())
					.orElse(01l)+1l;
		} else {
			return 1L;
		}
	}
	/**
	 * Agrega una linea de venta a la lista de lineas de venta
	 * 
	 * @param lin Linea de venta que se quiere agregar
	 */
	public void addLv(LineaDeVenta lin) {
		lin.getLinea().setLineaDeVentaId(generatedId());
		lin.setVenta(this);
		setCantidad(lin.getCantidad());
		this.lv.add(lin);
	}
	/**
	 * Elimina una linea de venta de la lista de lineas de venta
	 * 
	 * @param lin Linea de venta que se quiere eliminar
	 */
	public void eliminarLv(LineaDeVenta lin) {
		this.lv.remove(lin);
		lin.setVenta(null);
	}
	/**
	 * Calcula el precio total de la venta
	 * 
	 * @return Precio total de la venta
	 */
	public double getPrecioTotal() {
	    double precioTotal = 0;
	    Producto p = new Producto ();
	    for (LineaDeVenta linea : lv) {
	      precioTotal += linea.getCantidad() * p.getPrecio();
	    }
	    return precioTotal;
	  }


	
		
	

	
	
}
