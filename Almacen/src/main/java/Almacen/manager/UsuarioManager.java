package main.java.Almacen.manager;

import main.java.Almacen.model.Area;
import main.java.Almacen.model.Rol;
import main.java.Almacen.model.Usuario;
import main.java.Almacen.persistence.AreaDB;
import main.java.Almacen.persistence.RolDB;
import main.java.Almacen.persistence.UsuarioDB;

public class UsuarioManager {
	
	public static void createUsuario(String username,String rol,String area,String nombre,String apellido,String email) {
		Usuario userNuevo = new Usuario();
		userNuevo.setApellido(apellido);
		userNuevo.setEmail(email);
		userNuevo.setNombre(nombre);
		userNuevo.setNombreUsuario(username);
		
		userNuevo.setRol(RolDB.getRolByNombre(rol));
		
		userNuevo.setArea(AreaDB.getAreaByNombre(area));
		userNuevo.setActivo(true);
		UsuarioDB.agregarUsuarioNuevo(userNuevo);
		
	}

	public static void eliminarUsuario(String id) {
		UsuarioDB.eliminarUsuarioById(toInt(id));
	}
	public static boolean validarCredenciales(String username,String pass) {
		return UsuarioDB.validar(username,pass);
	}
	
	
	
	
	
	private static int toInt(String id) {
		int ids= Integer.parseInt(id);
		return ids;
	}

	public static void editUsuario(int id, String rol, String area, String nombre, String apellido, String email) {
		Rol r=RolDB.getRolByNombre(rol);
		Area a= AreaDB.getAreaByNombre(area);
		UsuarioDB.editarUsuario(id, r, a, nombre, apellido, email);
		}
}
