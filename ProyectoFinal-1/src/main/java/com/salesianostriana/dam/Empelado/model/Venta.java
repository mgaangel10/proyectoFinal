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
	
	public List<LineaDeVenta> getLienaDeVenta(){
	return Collections.unmodifiableList(lv);
	}
	
	
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
	
	public void addLv(LineaDeVenta lin) {
		lin.getLinea().setLineaDeVentaId(generatedId());
		lin.setVenta(this);
		this.lv.add(lin);
	}
	
	public void eliminarLv(LineaDeVenta lin) {
		this.lv.remove(lin);
		lin.setVenta(null);
	}
	public double getPrecioTotal() {
	    double precioTotal = 0;
	    Producto p = new Producto ();
	    for (LineaDeVenta linea : lv) {
	      precioTotal += linea.getCantidad() * p.getPrecio();
	    }
	    return precioTotal;
	  }


	
		
	

	
	
}
