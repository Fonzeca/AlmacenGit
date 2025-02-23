package main.java.Almacen.model;
// Generated 5/12/2019 02:23:59 PM by Hibernate Tools 5.0.6.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Registro generated by hbm2java
 */
@Entity
@Table(name = "registro", catalog = "almacen")
public class Registro implements java.io.Serializable {

	private Integer registroId;
	private Equipo equipo;
	private Usuario usuario;
	private Date fecha;
	private Boolean entrada;

	public Registro() {
	}

	public Registro(Equipo equipo, Usuario usuario, Date fecha, Boolean entrada) {
		this.equipo = equipo;
		this.usuario = usuario;
		this.fecha = fecha;
		this.entrada = entrada;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "registroId", unique = true, nullable = false)
	public Integer getRegistroId() {
		return this.registroId;
	}

	public void setRegistroId(Integer registroId) {
		this.registroId = registroId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "equipo")
	public Equipo getEquipo() {
		return this.equipo;
	}

	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usuario")
	public Usuario getUsuario() {
		return this.usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "fecha", length = 10)
	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	@Column(name = "entrada")
	public Boolean getEntrada() {
		return this.entrada;
	}

	public void setEntrada(Boolean entrada) {
		this.entrada = entrada;
	}

}
