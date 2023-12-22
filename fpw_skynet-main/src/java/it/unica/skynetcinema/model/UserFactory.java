/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.unica.skynetcinema.model;

import it.unica.skynetcinema.db.DatabaseManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Giacomo
 */
public class UserFactory {
    private static UserFactory instance;
    
    private UserFactory(){}
    
    public static UserFactory getInstance(){
        if (instance == null)
            instance = new UserFactory();
        return instance;
    }
    
    public User getUserByUsernamePassword(String username, String password){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        try{
            conn = DatabaseManager.getInstance().getDbConnection();
            
            String query = "SELECT * FROM account WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            set = stmt.executeQuery();
            
            if(set.next()){
                User user = new User();
                
                user.setUsername(set.getString("username"));
                user.setPassword(set.getString("password"));
                user.setName(set.getString("name"));
                user.setSurname(set.getString("surname"));
                user.setCity(set.getString("city"));
                user.setEmail(set.getString("email"));
                user.setPhoto(set.getString("photo"));
                
                return user;   
            } else
                return null;
        } catch(SQLException e){
            Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
        } finally{
            try { set.close(); } catch(Exception e) {}
            try { stmt.close(); } catch(Exception e) {}
            try { conn.close(); } catch(Exception e) {}
        }
        
        return null;
    }

    public static boolean contains(String username){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        try{
            conn = DatabaseManager.getInstance().getDbConnection();
            
            String query = "SELECT * FROM account WHERE username = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            set = stmt.executeQuery();
            
            return set.next(); //true if there's already a user with the same username
        } 
        catch(SQLException e){
            Logger.getLogger(UserFactory.class.getName()).log(Level.SEVERE, null, e);
        } 
        finally{
            try { set.close(); } catch(Exception e) {}
            try { stmt.close(); } catch(Exception e) {}
            try { conn.close(); } catch(Exception e) {}
        }
        
        return true;
    }
    
    public static void addUser(String username, String password, String name, String surname, String email,
        String city, String photo){
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet set = null;
        
        try{
            conn = DatabaseManager.getInstance().getDbConnection();
            
            String query = "INSERT INTO Account(username, password, name, surname, email, city, photo) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?);";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, name);
            stmt.setString(4, surname);
            stmt.setString(5, email);
            stmt.setString(6, city);
            stmt.setString(7, photo);
            
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
