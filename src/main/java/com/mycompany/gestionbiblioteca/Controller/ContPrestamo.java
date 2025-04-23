/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.gestionbiblioteca.Controller;

import com.mycompany.gestionbiblioteca.Entity.Libro;
import com.mycompany.gestionbiblioteca.Entity.Prestamo;
import com.mycompany.gestionbiblioteca.Entity.Usuario;
import com.mycompany.gestionbiblioteca.JPAController.LibroJpaController;
import com.mycompany.gestionbiblioteca.JPAController.PrestamoJpaController;
import com.mycompany.gestionbiblioteca.JPAController.exceptions.NonexistentEntityException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
    
/**
 *
 * @author hansd
 */
public class ContPrestamo {
    
    private PrestamoJpaController prestamoJpa = new PrestamoJpaController();
    private LibroJpaController libroJpa = new LibroJpaController();

    public void solicitarPrestamo(Usuario usuario, Libro libro) {
        if (libro.isDisponibilidad()) {
            try {
                Prestamo p = new Prestamo();
                p.setUsuario(usuario);
                p.setLibro(libro);
                Date hoy = new Date();
                p.setFechaPrestamo(hoy);
                
                Calendar cal = Calendar.getInstance();
                cal.setTime(hoy);
                cal.add(Calendar.DAY_OF_YEAR, 14);
                p.setFechaDevolucion(cal.getTime());
                
                libro.setDisponibilidad(false);
                libroJpa.edit(libro);
                prestamoJpa.create(p);
            } catch (NonexistentEntityException ex) {
                Logger.getLogger(ContPrestamo.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(ContPrestamo.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void devolverPrestamo(Long idPrestamo) {
        try {
            Prestamo p = prestamoJpa.findPrestamo(idPrestamo);
            p.setFechaDevolucion(new Date());
            Libro libro = p.getLibro();
            libro.setDisponibilidad(true);
            libroJpa.edit(libro);
            prestamoJpa.edit(p);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ContPrestamo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ContPrestamo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Prestamo> listarPrestamos() {
        return prestamoJpa.findPrestamoEntities();
    }
}
