<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>



<html lang="en">


<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Tipos</title>

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link
	href="../vendor/Datatables/DataTables-1.10.18/css/dataTables.bootstrap4.css"
	rel="stylesheet">
<link href="../vendor/iconfont/material-icons.css" rel="stylesheet">


</head>


<body>


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
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown2"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Artículos </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
							<a class="dropdown-item" href="../BuscarArticulo">Buscar
								artículo</a>
							<c:if
								test="${usuarioActual.getRol().getNombreRol()=='SuperAdmin'||usuarioActual.getRol().getNombreRol()=='Administrador'}">

								<a class="dropdown-item" href="../NuevoArticulo">Nuevo
									artículo</a>

								<a class="dropdown-item" href="../ListaArticulos">Lista de
									artículos</a>
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
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown3"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Técnica </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown3">
							<a class="dropdown-item" href="../ListaEquipos">Lista de
								equipos</a>
							<c:if
								test="${usuarioActual.getRol().getNombreRol()=='SuperAdmin'||usuarioActual.getRol().getNombreRol()=='Administrador Técnica'}">
								<a class="dropdown-item " href="../ListaRegistros">Lista de
									registros</a>
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
									<a class="dropdown-item" href="../ListaAreas">Lista de
										áreas</a>
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
		<div class="col-lg-12 text-center">
			<h1 class="mt-5">Lista de tipos.</h1>


			<hr class="my-4">

			<div>&nbsp;</div>
			<table class="table table-striped table-bordered" id="myTable">
				<thead>
					<tr>
						<th>Nombre</th>
					</tr>
				</thead>
				<tbody id="tablaAreas">

					<c:forEach items="${listaTipos}" var="tipo">
						<tr>
							<td><c:out value="${tipo.getNombre()}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


	<script src="../vendor/Datatables/datatables.js"></script>



	<script>
		$(document).ready(function() {

			$('#myTable').DataTable({
				"responsive" : "true"} ]
			});
		});
	</script>
</body>
</html>
