<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Artículos</title>

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link
	href="../vendor/Datatables/DataTables-1.10.18/css/dataTables.bootstrap4.css"
	rel="stylesheet">
<link href="../vendor/iconfont/material-icons.css" rel="stylesheet">


<style>
.color-box {
	width: 20px;
	height: 10px;
	display: inline-block;
}
</style>
</head>


<body onload="setColor();">


	<!-- Bootstrap core JavaScript -->
	<script src="../vendor/jquery/jquery.slim.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<a class="navbar-brand" href="javascript:history.back()"> <i
			class="material-icons" style="font-size: 36px">arrow_back </i></a>
		<div class="container">
			<a class="navbar-brand" href="../Index">Inicio</a>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown2"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Artículos </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
								<a class="dropdown-item" href="../BuscarArticulo">Buscar artículo</a>
						<c:if
						test="${usuarioActual.getRol().getNombreRol()=='SuperAdmin'||usuarioActual.getRol().getNombreRol()=='Administrador'}">
						
							<a class="dropdown-item" href="../NuevoArticulo">Nuevo
								artículo</a>  
								
								<a class="dropdown-item active" href="../ListaArticulos">Lista
								de artículos</a>
								</c:if>
								
						</div></li>
					<c:if
						test="${usuarioActual.getRol().getNombreRol()=='SuperAdmin'||usuarioActual.getRol().getNombreRol()=='Administrador'}">

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">Proveedores </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="../ProveedorNuevo">Nuevo
									proveedor</a> <a class="dropdown-item" href="../ListaProveedores">Listar
									por artículos</a> <a class="dropdown-item "
									href="../BuscarProveedor">Proveedor específico</a>
							</div></li>
					</c:if>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown1"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Pedidos </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown1">
							<a class="dropdown-item" href="../GenerarPedido">Nuevo pedido</a>
							<a class="dropdown-item" href="../ListaPedidos">Lista de
								pedidos</a>
						</div></li>
<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown3"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Técnica </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown3">
							<a class="dropdown-item" href="../ListaEquipos">Lista
								de equipos</a>
							<c:if
								test="${usuarioActual.getRol().getNombreRol()=='SuperAdmin'||usuarioActual.getRol().getNombreRol()=='Administrador Técnica'}">
								 <a class="dropdown-item " href="../ListaRegistros">Lista
								de registros</a>
								<a class="dropdown-item " href="../NuevoEquipo">Nuevo equipo</a>
								<a class="dropdown-item" href="../Tipo">Nuevo tipo</a>
								<a class="dropdown-item " href="../Lugar">Nuevo lugar</a>
							</c:if>

						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown2"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"><i class="material-icons">perm_identity</i>
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown2">
							<c:if
								test="${usuarioActual.getRol().getNombreRol()=='SuperAdmin'||usuarioActual.getRol().getNombreRol()=='Administrador'}">
								<a class="dropdown-item " href="../ListaUsuarios">Lista de
									usuarios</a>
								<c:if
									test="${usuarioActual.getRol().getNombreRol()=='SuperAdmin'}">
									<a class="dropdown-item" href="../UsuarioNuevo">Nuevo
										usuario</a>
									<a class="dropdown-item" href="../AreaNueva">Nueva Área</a>
									<a class="dropdown-item" href="../ListaAreas">Lista de áreas</a>
								</c:if>
							</c:if>
							<a class="dropdown-item" href="../CerrarSesion">Cerrar sesión</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Content   -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h1 class="mt-5">Lista de artículos.</h1>
				<hr class="h4">
				<table class="table table-striped " id="tablaArticulos">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Categoría</th>
							<th>Subcategoría</th>
							<th>Stock</th>
							<th>Estado</th>
							<th>Acción</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listaArticulos}" var="articulo">
							<tr>
								<td><span> <a
										href="../Articulo?articuloID=${articulo.articuloId }"><c:out
												value="${articulo.getNombre()}" /></a>
								</span></td>
								<td><c:out
										value="${articulo.getSubcategoria().getCategoria().getNombre()}" /></td>
								<td><c:out
										value="${articulo.getSubcategoria().getSubNombre()}" /></td>
								<td><c:out value="${articulo.getStock()}" /></td>
								<td>
									<div class="color-box"
										id="${articulo.getEstadoarticulo().getNombreEstado() }"></div>
								</td>
								<td><a
									href="../EditarArticulo?nombreEditado=${articulo.getNombre()}"
									title="Editar"><i class="material-icons"
										style="font-size: 18px">edit</i></a> <a
									href="../GenerarPedido?articuloAgregar=${articulo.getNombre()}"
									title="Añadir a pedido"> <i class="material-icons"style="font-size: 18px">add_shopping_cart</i>
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<script src="../vendor/Datatables/datatables.js"></script>



	<script>
		$(document).ready(function() {

			$('#tablaArticulos').DataTable({
				"columnDefs" : [ {
					"orderable" : false,
					"targets" : [ 4, 5 ]
				} ]
			});
		});
	</script>
	<script>
		function setColor() {
			var x = document.getElementsByClassName("color-box");
			for (var i = 0; i < x.length; i++) {
				if (x[i].id == "En Stock") {
					x[i].style.backgroundColor = "#43eb34";
				} else if (x[i].id == "Sin Stock") {
					x[i].style.backgroundColor = "#eb4034";
				}
			}
		}
	</script>
</body>
</html>
