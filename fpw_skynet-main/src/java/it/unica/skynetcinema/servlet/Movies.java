/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package it.unica.skynetcinema.servlet;

import it.unica.skynetcinema.model.Movie;
import it.unica.skynetcinema.model.MovieFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Giacomo
 */
@WebServlet(name = "Movies", urlPatterns = {"/movies"})
public class Movies extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        /* ajax */
        String command = request.getParameter("offsetId");
        if(command != null){
            Movie movie = MovieFactory.getInstance().getMovie(command);
            request.setAttribute("movie",movie);
            response.setContentType("application/json");
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
            request.getRequestDispatcher("movieJSON.jsp").forward(request, response);
        } else{
            Movie movie = MovieFactory.getInstance().getMovie("0");
            request.setAttribute("movie", movie);
            request.getRequestDispatcher("availableMovies_ajax.jsp").forward(request, response);
        }
        
        /* non ajax
        List<Movie> movies = MovieFactory.getInstance().getAllMovies(); 
        
        /*
        Movie m1 = new Movie();
        m1.setTitle("ciao");
        m1.setPhoto("img/posters/placeholder.jpg");
        movies.add(m1);
        */

        /*
        request.setAttribute("moviesList", movies);
        request.getRequestDispatcher("availableMovies.jsp").forward(request, response);
        */
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
