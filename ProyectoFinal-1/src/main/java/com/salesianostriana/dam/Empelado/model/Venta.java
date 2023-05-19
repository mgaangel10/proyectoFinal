package com.salesianostriana.dam.Empelado.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Venta {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private LocalDate fecha;
	
	@ToString.Exclude
	@EqualsAndHashCode.Exclude
	@Builder.Default
	@OneToMany(
			mappedBy="ven",
			fetch=FetchType.EAGER,
			cascade=CascadeType.ALL,
			orphanRemoval=true
			)
	private List<LineaDeVenta>lv=new ArrayList<>();
	
	public List<LineaDeVenta> getLineaDeVenta(){
		return Collections.unmodifiableList(lv);
	}
	
	
	
	public void addLv(LineaDeVenta lv) {
	lv.getLineaPk().setLineDeVentaId(id);
	lv.setVen(this);
	this.getLineaDeVenta().add(lv);
	}
	
	public void eliminarLv(LineaDeVenta l) {
		this.lv.remove(l);
		l.setVen(null);
	}
	public void eliminarLinea(Long id) {
		Optional<LineaDeVenta> l = lv.stream()
				.filter(lineaventa -> lineaventa.getId() == this.id && lineaventa.getId() == id)
				.findFirst();
		if (l.isPresent()) {
			eliminarLv(l.get());
		}
	}
	
	
	
	
}
