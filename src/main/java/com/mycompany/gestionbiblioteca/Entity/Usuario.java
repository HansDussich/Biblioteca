
package com.mycompany.gestionbiblioteca.Entity;

import java.io.Serializable;
import java.util.List;
import jakarta.persistence.*;



@Entity
@Table(name = "usuarios")
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_usuario")    
    private Long id;

        private String nombre;
    private String apellido;
    
    private String email;
    private String contrasena;
        private String rol;

        
         @OneToMany(cascade = CascadeType.ALL, mappedBy = "usuario")
    private List<Prestamo> ListaPrestamos;

    public Usuario() {
    }

    public Usuario(Long id, String nombre, String apellido, String email, String contrasena, String rol) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.contrasena = contrasena;
        this.rol = rol;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public List getListaPrestamos() {
        return ListaPrestamos;
    }

    public void setListaPrestamos(List ListaPrestamos) {
        this.ListaPrestamos = ListaPrestamos;
    }

         
}
