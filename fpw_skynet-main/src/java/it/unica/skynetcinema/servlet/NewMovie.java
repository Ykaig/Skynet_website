/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package it.unica.skynetcinema.servlet;

import it.unica.skynetcinema.exceptions.InvalidParamException;
import it.unica.skynetcinema.model.MovieFactory;
import it.unica.skynetcinema.model.UserFactory;
import it.unica.skynetcinema.utils.Utils;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Giacomo
 */
@WebServlet(name = "NewMovie", urlPatterns = {"/newMovie"})
@MultipartConfig
public class NewMovie extends HttpServlet {

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
        
        String msg = "Film correttamente inserito";
        
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String releaseDate = request.getParameter("releaseDate");
        String runningTime = request.getParameter("runningTime");
        String price = request.getParameter("price");
        String score = request.getParameter("score");
        String user_id = request.getParameter("user_id");
        
        Part photoFile = request.getPart("photo");
        String photoPath = "img/posters/" + photoFile.getSubmittedFileName();
        String fileSystemPath = "/home/fpw/NetBeansProjects/fpw_skynet-main/web/";
        
        
        try{
            final int MAX_SIZE = 50;
            final int MAX_PHOTO_SIZE = 100;
            final int MAX_DESCRIPTION_SIZE = 500;
            final int MAX_RUNNING_TIME_LENGTH = 500;
            final double MAX_PRICE = 50.0;
            final double MAX_SCORE = 5.0;
            
            /* If exists a user with this username */
            if(UserFactory.contains(user_id)){
                
                Utils.checkString("Title", title, MAX_SIZE);
                Utils.checkString("Description", description, MAX_DESCRIPTION_SIZE);
                Utils.checkString("Photo", photoPath, MAX_PHOTO_SIZE);
                Utils.checkInteger("RunningTime", runningTime, MAX_RUNNING_TIME_LENGTH);
                Utils.checkDouble("Price", price, MAX_PRICE);
                Utils.checkDouble("Score", score, MAX_SCORE);

                
                /* Uploading img into the file system */
                try(InputStream fileContent = photoFile.getInputStream()){
                    File toSave = new File(fileSystemPath + photoPath);
                    Files.copy(fileContent, toSave.toPath(), StandardCopyOption.REPLACE_EXISTING);
                }catch(IOException e){
                    throw new InvalidParamException("Wrong path on the project for the uploaded file");
                }
                
                /* Uploading the movie into the db */
                MovieFactory.addMovie(title, description, photoPath, Date.valueOf(releaseDate), Integer.valueOf(runningTime), Double.valueOf(price), Double.valueOf(score), user_id);
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("success.jsp").forward(request, response);
                
            } else 
                throw new InvalidParamException("User not found!");
 
        } catch(InvalidParamException e){
           request.setAttribute("errormsg", e.getMessage());
           request.setAttribute("link", "addMovie.jsp");
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
