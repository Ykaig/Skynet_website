/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.unica.skynetcinema.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Giacomo
 */
public class DatabaseManager {
    
    private static DatabaseManager instance;
    
    private DatabaseManager(){
        try{
            Class.forName("org.postgresql.Driver");
        } catch(ClassNotFoundException e){
            Logger.getLogger((DatabaseManager.class.getName())).log(Level.SEVERE, null, e);
        }
    }
    
    public static DatabaseManager getInstance(){
        if(instance == null)
            instance = new DatabaseManager();
        return instance;
    }
    
    public Connection getDbConnection(){
        
        String db = "jdbc:postgresql://localhost:5432/skynet";
        String user = "postgres";
        String pass = "fondamenti";
        
        try{
            Connection conn = DriverManager.getConnection(db, user, pass);
            return conn;
        } catch(SQLException e){
            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, e);
        }
        
        return null;
        
    }
    
    
    
    
    
    
}
