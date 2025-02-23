package main.java.Almacen.model;
// Generated 5/12/2019 02:23:59 PM by Hibernate Tools 5.0.6.Final

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Pedidoxarticulos generated by hbm2java
 */
@Entity
@Table(name = "pedidoxarticulos", catalog = "almacen")
public class Pedidoxarticulos implements java.io.Serializable {

	private Integer pxaId;
	private Articulo articulo;
	private Pedido pedido;
	private int cantidad;

	public Pedidoxarticulos() {
	}

	public Pedidoxarticulos(Articulo articulo, Pedido pedido, int cantidad) {
		this.articulo = articulo;
		this.pedido = pedido;
		this.cantidad = cantidad;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "PxaID", unique = true, nullable = false)
	public Integer getPxaId() {
		return this.pxaId;
	}

	public void setPxaId(Integer pxaId) {
		this.pxaId = pxaId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ArticuloID", nullable = false)
	public Articulo getArticulo() {
		return this.articulo;
	}

	public void setArticulo(Articulo articulo) {
		this.articulo = articulo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PedidoID", nullable = false)
	public Pedido getPedido() {
		return this.pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	@Column(name = "Cantidad", nullable = false)
	public int getCantidad() {
		return this.cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

}
