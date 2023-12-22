/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package it.unica.skynetcinema.servlet;

import it.unica.skynetcinema.exceptions.InvalidParamException;
import it.unica.skynetcinema.model.UserFactory;
import it.unica.skynetcinema.utils.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Simon
 */
@WebServlet(name = "User", urlPatterns = {"/user"})
public class NewUser extends HttpServlet {

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
            throws ServletException, IOException{
        
        String message = "Utente correttamente creato";
        
        /* Retrieving user inputs */
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String city = request.getParameter("city");
        String photo = request.getParameter("photo");
        
        
        try{
            final int MAX_SIZE = 50;
            final int MAX_PHOTO_SIZE = 100;
            
            Utils.checkString("Username", username, MAX_SIZE);
            
            /* If the username is currently not used */
            if(!UserFactory.contains(username)){
                
                /* Validity checks on inputs */
                UserFactory.addUser(username, password, name, surname, email, city, photo);
                Utils.checkString("Password", password, MAX_SIZE);
                Utils.checkString("Name", name, MAX_SIZE);
                Utils.checkString("Surname", surname, MAX_SIZE);
                Utils.checkString("Email", email, MAX_SIZE);
                Utils.checkString("City", city, MAX_SIZE);
                Utils.checkString("Photo", photo, MAX_PHOTO_SIZE);
                request.setAttribute("msg", message);
                request.getRequestDispatcher("success.jsp").forward(request, response);
                
            } else
                throw new InvalidParamException("Username già esistente");
            
            
            
        } catch(InvalidParamException e){
           
           request.setAttribute("errormsg", e.getMessage());
           request.setAttribute("link", "registration.jsp");
           request.getRequestDispatcher("error.jsp").forward(request, response);
        }
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
