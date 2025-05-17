/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackage;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author new
 */
public class encrypt {
    
    public static String passwordHash(String password){
        try{
           MessageDigest md = MessageDigest.getInstance("SHA1"); 
           md.update(password.getBytes());
           byte[] rbt = md.digest();
           StringBuilder sb = new StringBuilder();
           for(byte b: rbt){
             sb.append(String.format("%02x", b));
           }
           return sb.toString();
        }
        catch(NoSuchAlgorithmException e){
            throw new RuntimeException(e);
        }
    }
    
}
