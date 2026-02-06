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
public class Accident {
  private int accidentId, userId;
  private double latitude, longitude;
  private String severity, status, description;
  
  
  
    public int getAccidentId() { return accidentId; }
    public void setAccidentId(int accidentId) { this.accidentId = accidentId;}
  
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId;}

    public double getLatitude() { return latitude; }
    public void setLatitude(double latitude) { this.latitude = latitude;}

    public double getLongitude() { return longitude; }
    public void setLongitude(double longitude) { this.longitude = longitude;}

    public String getSeverity() { return severity; }
    public void setSeverity(String severity) { this.severity = severity;}

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status;}    
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description;}        
    
}
