/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package it.unica.skynetcinema.servlet;

import it.unica.skynetcinema.model.User;
import it.unica.skynetcinema.model.UserFactory;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unica.skynetcinema.utils.Utils;
import it.unica.skynetcinema.exceptions.InvalidParamException;

/**
 *
 * @author Simon
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

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
        HttpSession session = request.getSession();
        
        String usr = request.getParameter("username");
        String psw = request.getParameter("password");
        
        
        try {
            Utils.checkNull("Username",usr);
            Utils.checkNull("Password", psw);
            
            User user = UserFactory.getInstance().getUserByUsernamePassword(usr, psw);
            
            if(user != null){ //Checks credentials validity
                session.setAttribute("user", user.getUsername());
                session.setAttribute("name", user.getName());
                session.setAttribute("surname", user.getSurname());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("city", user.getCity());
                session.setAttribute("photo", user.getPhoto());
                response.sendRedirect("personalArea.jsp");
            } else{
                throw new InvalidParamException("Wrong username or password");
            }
        } catch(InvalidParamException e){
           session.invalidate();
           request.setAttribute("errormsg", e.getMessage());
           request.setAttribute("link", "login.jsp");
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
