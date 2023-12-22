/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.unica.skynetcinema.model;

import it.unica.skynetcinema.db.DatabaseManager;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Giacomo
 */
public class MovieFactory {
    private static MovieFactory instance;
    
    private MovieFactory(){}
    
    public static MovieFactory getInstance(){
        if (instance == null)
            instance = new MovieFactory();
        return instance;
    }
    
    /*
    * return a list of movie, used with avaiableMovies.jsp
    public List<Movie> getAllMovies(){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        List<Movie> movies = new ArrayList<>();
        
        try{
            conn = DatabaseManager.getInstance().getDbConnection();
            
            String query = "SELECT * FROM movie";
            stmt = conn.prepareStatement(query);
            set = stmt.executeQuery();
            
            while(set.next()){
                Movie movie = new Movie();
                
                movie.setIdMovie(set.getLong("idMovie"));
                movie.setTitle(set.getString("title"));
                movie.setDescription(set.getString("description"));
                movie.setPhoto(set.getString("photo"));
                movie.setReleaseDate(set.getDate("releaseDate"));
                movie.setRunningTime(set.getInt("runningTime"));
                movie.setPrice(set.getDouble("price"));
                movie.setScore(set.getDouble("score"));
                movie.setUser_id(set.getString("user_id"));
                
                movies.add(movie);
            }
            return movies;
            
        } catch(SQLException e){
            Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
        } finally{
            try { set.close(); } catch(Exception e) {}
            try { stmt.close(); } catch(Exception e) {}
            try { conn.close(); } catch(Exception e) {}
        }
        return null;
    }*/
    
    /*
    * return only one movie, used for ajax in avaiableMovies_ajax.jsp
    */
    public Movie getMovie(String offset){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        Movie movie = new Movie();
        
        try{
            conn = DatabaseManager.getInstance().getDbConnection();
            
            String query = "SELECT * FROM movie LIMIT 1 OFFSET ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(offset));
            set = stmt.executeQuery();
            
            while(set.next()){
                
                movie.setIdMovie(set.getLong("idMovie"));
                movie.setTitle(set.getString("title"));
                movie.setDescription(set.getString("description"));
                movie.setPhoto(set.getString("photo"));
                movie.setReleaseDate(set.getDate("releaseDate"));
                movie.setRunningTime(set.getInt("runningTime"));
                movie.setPrice(set.getDouble("price"));
                movie.setScore(set.getDouble("score"));
                movie.setUser_id(set.getString("user_id"));
            }
            return movie;
            
        } catch(SQLException e){
            Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
        } finally{
            try { set.close(); } catch(Exception e) {}
            try { stmt.close(); } catch(Exception e) {}
            try { conn.close(); } catch(Exception e) {}
        }
        return null;
    }
    
    
    public static void addMovie(String title, String description, String photo, Date releaseDate, int runningTime, 
            double price, double score, String account_id){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        try{
            conn = DatabaseManager.getInstance().getDbConnection();
            
            String query = "INSERT INTO Movie(idMovie, title, description, photo, releaseDate, runningTime, price, score, user_id) "
                    + "VALUES (default, ?, ?, ?, ?, ?, ?, ?, ?);";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, title);
            stmt.setString(2, description);
            stmt.setString(3, photo);
            stmt.setDate(4, releaseDate);
            stmt.setInt(5, runningTime);
            stmt.setDouble(6, price);
            stmt.setDouble(7, score);
            stmt.setString(8, account_id);
            
            set = stmt.executeQuery();
        } catch(SQLException e){
            Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
        } finally{
            try { set.close(); } catch(Exception e) {}
            try { stmt.close(); } catch(Exception e) {}
            try { conn.close(); } catch(Exception e) {}
        }
    }
}
