/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package it.unica.skynetcinema.utils;

import it.unica.skynetcinema.exceptions.*;

/**
 *
 * @author Simon
 */
public class Utils {

    static final int ZERO = 0;
    static final double ZERO_DECIMAL = 0.0;
    
    public static void checkNull(String nome, String param) throws InvalidParamException {
        if(param == null || param.length() == ZERO) {
            throw new InvalidParamException("Il parametro \"" + nome + "\" non è stato inserito.");
        }
    }
    
    public static void checkString(String nome, String param, int maxSize) throws InvalidParamException {
        checkNull(nome,param);
        if(param.length() == ZERO || param.length() > maxSize) {
        //if(param.length() > maxSize) {
            throw new InvalidParamException("Il campo \"" + nome + 
                    "\" non rispetta il numero di caratteri compreso fra \"1\" e " + maxSize);
        }
    }
    
    public static void checkDouble(String nome, String param, double maxSize) throws InvalidParamException {
        checkNull(nome,param);
        
        try{
            double val = Double.valueOf(param);
            
            if(val < ZERO_DECIMAL || val > maxSize)
            throw new InvalidParamException("Il campo \"" + nome + 
                    "\" non rispetta il range compreso fra \"0\" e " + maxSize);
        } catch(NumberFormatException e){
            throw new InvalidParamException("Il campo \"" + nome + 
                    "\" deve contenere un valore decimale");
        }   
    }
    
    
    public static void checkInteger(String nome, String param, int maxSize) throws InvalidParamException {
        checkNull(nome,param);
        
        try{
            int val = Integer.valueOf(param);
            
            if(val < ZERO || val > maxSize)
            throw new InvalidParamException("Il campo \"" + nome + 
                    "\" non rispetta il range compreso fra 0 e " + maxSize);
        } catch(NumberFormatException e){
            throw new InvalidParamException("Il campo \"" + nome + 
                    "\" deve contenere un numero intero");
        }   
    }
}
