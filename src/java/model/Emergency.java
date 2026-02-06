/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author plazma
 */
public class Emergency {
  private int requestId, accidentId, assignedTo;
  private String responderType, status;
  private Timestamp responseTime;
  
    public int getReuestId() { return requestId; }
    public void setRequestId(int requestId) { this.requestId = requestId;}

    public int getAccidentId() { return accidentId; }
    public void setAccidentId(int accidentId) { this.accidentId = accidentId;}

    public int getAssignedTo() { return assignedTo; }
    public void setAssignedTo(int assignedTo) { this.assignedTo = assignedTo;}    
    
    public String getResponderType() { return responderType; }
    public void setResponderType(String responderType) { this.responderType = responderType;}    

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status;}        
    
    public Timestamp getResponseTime() { return responseTime; }
    public void setResponseTime(Timestamp responseTime) { this.responseTime = responseTime;}        
  
}
