/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestionbiblioteca.Controller;

import com.mycompany.gestionbiblioteca.Entity.Usuario;
import com.mycompany.gestionbiblioteca.JPAController.UsuarioJpaController;
import com.mycompany.gestionbiblioteca.JPAController.exceptions.NonexistentEntityException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hansd
 */
public class ContUsuario {
    
    UsuarioJpaController jpa = new UsuarioJpaController();
    
public void crearUsuario(Usuario usu) {
        jpa.create(usu);
    }

    public List<Usuario> traerUsuarios() {
        List<Usuario> usuarios = jpa.findUsuarioEntities(); 
        return usuarios;
    }


    public Usuario traerUsuario(Long id_editar) {
        return jpa.findUsuario(id_editar);
    }

    public void editarUsuario(Usuario usu) {
        try {
            jpa.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ContUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean comprobarAcceso(String email, String contrasena) {
        List<Usuario> listaUsuario = new ArrayList<>();

        listaUsuario = jpa.findUsuarioEntities();
        for (Usuario usu : listaUsuario) {
            if (usu.getEmail().equals(email)) {
                if (usu.getContrasena().equals(contrasena)) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean existeUsuario(String nombreUsu) {
        List<Usuario> listaUsuario = new ArrayList<>();

        listaUsuario = jpa.findUsuarioEntities();
        for (Usuario usu : listaUsuario) {
            if (usu.getEmail().equals(nombreUsu)) {

                return true;
            }
        }
        return false;
    }

    public void eliminarUsuario(Long id) {
        try {
            jpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ContUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     public Usuario buscarUsuarioPorId(Long id){
        return jpa.findUsuario(id);
    }
     
          public Usuario buscarUsuarioPorEmail(String email){
        return jpa.findUsuarioByEmail(email);
    }
          
          public void actualizarPerfil(Usuario usuario) {
    try {
        jpa.edit(usuario);  // Actualiza la entidad en la base de datos
    } catch (Exception ex) {
        Logger.getLogger(ContUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
}

          public void cambiarContrasena(Long idUsuario, String nuevaContrasena) {
    try {
        Usuario usuario = jpa.findUsuario(idUsuario);
        if (usuario != null) {
            usuario.setContrasena(nuevaContrasena);  // Cambia la contraseña
            jpa.edit(usuario);  // Guarda los cambios en la base de datos
        }
    } catch (Exception ex) {
        Logger.getLogger(ContUsuario.class.getName()).log(Level.SEVERE, null, ex);
    }
}
          
          public boolean verificarContrasenaActual(Long idUsuario, String contrasenaActual) {
    Usuario usuario = jpa.findUsuario(idUsuario);
    if (usuario != null && usuario.getContrasena().equals(contrasenaActual)) {
        return true;
    }
    return false;
}

}
