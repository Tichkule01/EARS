/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author plazma
 */

    public class User {
    private int userId;
    private String fullName;
    private String email;
    private String passwordHash;
    private String role;
    private String status;
    private int failedAttempts;
    private String createdAt;
    private String lastFailedAt;

    // getters and setters
    
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId;}
    
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public int getFailedAttempts() { return failedAttempts; }
    public void setFailedAttempts(int failedAttempts) { this.failedAttempts = failedAttempts; }   
    
    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public String getLastFailedAt() { return lastFailedAt; }
    public void setLastFailedAt(String lastFailedAt) { this.lastFailedAt = lastFailedAt; }
    
}

