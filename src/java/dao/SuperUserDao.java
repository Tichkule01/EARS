/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author plazma
 */
import utils.AESUtil;

public class SuperUserDao {
    private static final String USERNAME = "Himanshu";

    private static final String PASSWORD_ENC = "6udLFYhu4xAuxJ0ZFN514g=="; 

    public boolean validate(String username, String password) {
        String encryptedPassword = AESUtil.encrypt(password); 
        return USERNAME.equals(username) && PASSWORD_ENC.equals(encryptedPassword);
    }    
}
