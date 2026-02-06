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
public class AccidentTracking {
     private int trackingId;
    private int accidentId;
    private Integer requestId;      // can be null
    private Integer responderId;    // user_id of responder (can be null)
    private String responderType;   // "Police" / "Ambulance"
    private String action;          // "Reported", "Dispatched", "Arrived", "Completed"
    private Timestamp actionTime;

    // Getters and Setters
    public int getTrackingId() { return trackingId; }
    public void setTrackingId(int trackingId) { this.trackingId = trackingId; }

    public int getAccidentId() { return accidentId; }
    public void setAccidentId(int accidentId) { this.accidentId = accidentId; }

    public Integer getRequestId() { return requestId; }
    public void setRequestId(Integer requestId) { this.requestId = requestId; }

    public Integer getResponderId() { return responderId; }
    public void setResponderId(Integer responderId) { this.responderId = responderId; }

    public String getResponderType() { return responderType; }
    public void setResponderType(String responderType) { this.responderType = responderType; }

    public String getAction() { return action; }
    public void setAction(String action) { this.action = action; }

    public Timestamp getActionTime() { return actionTime; }
    public void setActionTime(Timestamp actionTime) { this.actionTime = actionTime; }
}
