/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestionbiblioteca.Controller;

import com.mycompany.gestionbiblioteca.Entity.Libro;
import com.mycompany.gestionbiblioteca.JPAController.LibroJpaController;
import com.mycompany.gestionbiblioteca.JPAController.exceptions.IllegalOrphanException;
import com.mycompany.gestionbiblioteca.JPAController.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hansd
 */
public class ContLibro {
    
    LibroJpaController libroJpa = new LibroJpaController();
    
     public void crearLibro(Libro libro) {
        try {
            libroJpa.create(libro);
        } catch (Exception ex) {
            System.out.println("Error al crear el libro: " + ex.getMessage());
        }
    }
    
    public void actualizarLibro(Libro libro) {
        try {
            libroJpa.edit(libro);
        } catch (Exception ex) {
            System.out.println("Error al actualizar el libro: " + ex.getMessage());
        }
    }
    
    public void eliminarLibro(Long id) {

        try {
            libroJpa.destroy(id);
        } catch (IllegalOrphanException ex) {
            Logger.getLogger(ContLibro.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ContLibro.class.getName()).log(Level.SEVERE, null, ex);
        }
 
    }
    
    public Libro buscarLibro(Long id) {
        return libroJpa.findLibro(id);
    }
    
    public List<Libro> listarLibros() {
        return libroJpa.findLibroEntities();
    }
    
    public List<Libro> buscarPorTitulo(String titulo) {
        List<Libro> todosLibros = libroJpa.findLibroEntities();
        return todosLibros.stream()
                .filter(l -> l.getTitulo().toLowerCase().contains(titulo.toLowerCase()))
                .toList();
    }
    
    public List<Libro> buscarPorAutor(String autor) {
        List<Libro> todosLibros = libroJpa.findLibroEntities();
        return todosLibros.stream()
                .filter(l -> l.getAutor().toLowerCase().contains(autor.toLowerCase()))
                .toList();
    }
    
    public List<Libro> buscarPorGenero(String genero) {
        List<Libro> todosLibros = libroJpa.findLibroEntities();
        return todosLibros.stream()
                .filter(l -> l.getGenero().toLowerCase().contains(genero.toLowerCase()))
                .toList();
    }
    
    public List<Libro> buscarLibrosDisponibles() {
        List<Libro> todosLibros = libroJpa.findLibroEntities();
        return todosLibros.stream()
                .filter(Libro::isDisponibilidad)
                .toList();
    }
}
