<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="UTF-8">

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/iconfont/material-icons.css" rel="stylesheet">
<title>Editar Usuario</title>

<style>
.form-signin .btn {
	font-size: 80%;
	border-radius: 5rem;
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	transition: all 0.2s;
}
</style>
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
								<a class="dropdown-item" href="../BuscarArticulo">Buscar artículo</a>
						<c:if
						test="${usuarioActual.getRol().getNombreRol()=='SuperAdmin'||usuarioActual.getRol().getNombreRol()=='Administrador'}">
						
							<a class="dropdown-item" href="../NuevoArticulo">Nuevo
								artículo</a>  
								
								<a class="dropdown-item" href="../ListaArticulos">Lista
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
					<li class="nav-item dropdown active"><a
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
		<div class="card card-signin my-5">
			<div class="card-body">
				<form class="form-signin" method="post" action="../EditarUsuario">
					<h3 class="text-center">Datos del usuario a editar</h3>
					<hr class="m-4">
					<c:set var="usuario" value="${usuarioEditar}"></c:set>
					<input type="hidden" value="${usuario.getUsuarioId() }"
						id="idUEditar" name="idUEditar">
					<div class="row">
						<div class="column">
							<div class="form-label-group>">
								<input type="text" name="inputUsername" class="form-control"
									placeholder="Nombre de Usuario" required
									value="${usuario.getNombreUsuario() }"readonly>
							</div>
							<div class="form-label-group>">
								<input type="text" name="inputNombre" class="form-control"
									placeholder="Nombre" required value="${usuario.getNombre() }" >
							</div>
							<div class="form-label-group>">
								<input type="text" name="inputMail" class="form-control"
									placeholder="eMail" required value="${usuario.getEmail() }">
							</div>

						</div>
						<div class="column">
							<div class="form-label-group>">
								<select name="inputRol"
									style="border-radius: 5px; font-size: 16px; padding: 5px; min-width: 50%"
									required>
									<c:forEach items="${roles}" var="rol">
										<c:choose>
											<c:when
												test="${rol.getNombreRol()==usuario.getRol().getNombreRol() }">
												<option selected>${rol.getNombreRol() }</option>
											</c:when>
											<c:otherwise>
												<option>${rol.getNombreRol() }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>

							<div class="form-label-group>">
								<input type="text" name="inputApellido" class="form-control"
									placeholder="Apellido" required
									value="${usuario.getApellido()}">
							</div>
							<div class=" form-label-group>" id="area">
								<select name="inputArea"
									style="border-radius: 5px; font-size: 16px; padding: 5px; min-width: 50%"
									required>
									<c:forEach items="${areas}" var="area">
										<c:choose>
											<c:when
												test="${area.getNombreArea()==usuario.getArea().getNombreArea()}">
												<option selected>${area.getNombreArea() }</option>
											</c:when>
											<c:otherwise>
												<option>${area.getNombreArea()}</option>
											</c:otherwise>
										</c:choose>

									</c:forEach>
								</select>

							</div>
						</div>
					</div>
					<hr>
					<button class="btn btn-lg btn-primary btn-block text-uppercase"
						id="aceptarbutton"
						style="max-width: 50%; margin: auto; background-color: #f37321; cursor: pointer;">
						Aceptar</button>
				</form>
			</div>
		</div>

	</div>

</body>
</html>