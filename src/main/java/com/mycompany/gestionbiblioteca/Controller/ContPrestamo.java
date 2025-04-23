/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestionbiblioteca.Controller;

import com.mycompany.gestionbiblioteca.Entity.Libro;
import com.mycompany.gestionbiblioteca.Entity.Prestamo;
import com.mycompany.gestionbiblioteca.Entity.Usuario;
import com.mycompany.gestionbiblioteca.JPAController.PrestamoJpaController;
import com.mycompany.gestionbiblioteca.JPAController.exceptions.NonexistentEntityException;
import java.util.Date;
import java.util.List;

/**
 *
 * @author hansd
 */
public class ContPrestamo {
    
    PrestamoJpaController prestamoJpa = new PrestamoJpaController();
    ContLibro libroController = new ContLibro();
    
    public void crearPrestamo(Prestamo prestamo) {
        try {
            // Actualizar la disponibilidad del libro
            Libro libro = prestamo.getLibro();
            libro.setDisponibilidad(false);
            libroController.actualizarLibro(libro);
            
            // Crear el préstamo
            prestamoJpa.create(prestamo);
        } catch (Exception ex) {
            System.out.println("Error al crear el préstamo: " + ex.getMessage());
        }
    }
    
    public void actualizarPrestamo(Prestamo prestamo) {
        try {
            prestamoJpa.edit(prestamo);
        } catch (Exception ex) {
            System.out.println("Error al actualizar el préstamo: " + ex.getMessage());
        }
    }
    
    public void eliminarPrestamo(Long id) {
        try {
            prestamoJpa.destroy(id);
        } catch (NonexistentEntityException ex) {
            System.out.println("Error al eliminar el préstamo: " + ex.getMessage());
        }
    }
    
    public Prestamo buscarPrestamo(Long id) {
        return prestamoJpa.findPrestamo(id);
    }
    
    public List<Prestamo> listarPrestamos() {
        return prestamoJpa.findPrestamoEntities();
    }
    
    public void devolverLibro(Long prestamoId) {
        try {
            Prestamo prestamo = prestamoJpa.findPrestamo(prestamoId);
            if (prestamo != null) {
                // Actualizar estado del préstamo
                prestamo.setEstado("Devuelto");
                prestamo.setFechaDevolucion(new Date());
                prestamoJpa.edit(prestamo);
                
                // Actualizar disponibilidad del libro
                Libro libro = prestamo.getLibro();
                libro.setDisponibilidad(true);
                libroController.actualizarLibro(libro);
            }
        } catch (Exception ex) {
            System.out.println("Error al devolver el libro: " + ex.getMessage());
        }
    }
    
    public List<Prestamo> buscarPrestamosPorUsuario(Usuario usuario) {
        List<Prestamo> prestamos = prestamoJpa.findPrestamoEntities();
        return prestamos.stream()
                .filter(p -> p.getUsuario().getId().equals(usuario.getId()))
                .toList();
    }
    
    public List<Prestamo> buscarPrestamosPendientes() {
        List<Prestamo> prestamos = prestamoJpa.findPrestamoEntities();
        return prestamos.stream()
                .filter(p -> "Prestado".equals(p.getEstado()))
                .toList();
    }
    
    public List<Prestamo> buscarPrestamosVencidos() {
        Date hoy = new Date();
        List<Prestamo> prestamos = prestamoJpa.findPrestamoEntities();
        return prestamos.stream()
                .filter(p -> "Prestado".equals(p.getEstado()) && p.getFechaDevolucion().before(hoy))
                .toList();
    }
}
