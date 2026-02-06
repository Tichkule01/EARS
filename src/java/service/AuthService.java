/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;


import model.User;
import utils.PasswordUtil;
import dao.AuthDAO;


public class AuthService {

    private static final int MAX_FAILED_ATTEMPTS = 5;

    // Register new user
    public static boolean register(User u) throws Exception {
        if (AuthDAO.getByEmail(u.getEmail()) != null)
            return false;

        u.setPasswordHash(PasswordUtil.hash(u.getPasswordHash()));
        AuthDAO.save(u);
        return true;
    }

    // Login user
    public static User login(String email, String password) throws Exception {
        User u = AuthDAO.getByEmail(email);
        if (u == null) return null;

        if ("BLOCKED".equals(u.getStatus())) {
            return null;  // blocked
        }

        if (PasswordUtil.hash(password).equals(u.getPasswordHash())) {
            AuthDAO.resetFail(u.getUserId());
            return u;
        } else {
            AuthDAO.incrementFail(u.getUserId());

            u = AuthDAO.getByEmail(email); // reload updated failed attempts
            if (shouldLock(u.getFailedAttempts())) {
                AuthDAO.lock(u.getUserId());
            }

            return null;
        }
    }

    // Check if account should be blocked
    public static boolean shouldLock(int attempts) {
        return attempts >= MAX_FAILED_ATTEMPTS;
    }
}