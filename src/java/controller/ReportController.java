/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.AccidentDAO;
import model.Accident;
import dao.EmergencyDAO;
import model.Emergency;
import model.AccidentTracking;
import dao.AccidentTrackingDAO;
/**
 *
 * @author plazma
 */
@WebServlet("/Users/reportAccident")
public class ReportController extends HttpServlet {

  protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
String latStr = req.getParameter("latitude");
double lat = 0; // default
if(latStr != null && !latStr.trim().isEmpty()) {
    try {
        lat = Double.parseDouble(latStr);
    } catch(NumberFormatException e) {
        lat = 0;
    }
}

String lngStr = req.getParameter("longitude");
double lng = 0; // default
if(lngStr != null && !lngStr.trim().isEmpty()) {
    try {
        lng = Double.parseDouble(lngStr);
    } catch(NumberFormatException e) {
        lng = 0;
    }
}

        String severity = req.getParameter("severity");
        if(severity == null || severity.trim().isEmpty()){
        severity = "Not Available";
        }
        
        String description = req.getParameter("description");        
        
        
        int userId = 1;

        Accident acc = new Accident();
        acc.setUserId(userId);
        acc.setLatitude(lat);
        acc.setLongitude(lng);
        acc.setSeverity(severity);
        acc.setStatus("Reported");
        acc.setDescription(description);

        
    AccidentDAO accDao = new AccidentDAO();
    int accidentId = accDao.saveAccident(acc);        



    // Add tracking for reporting
    AccidentTrackingDAO trackingDAO = new AccidentTrackingDAO();
    trackingDAO.addTracking(accidentId, null, userId, "USER", "Accident Reported");    
    
    
        // Example: create emergency requests for one police and one ambulance
        
        if (accidentId > 0 && "High".equals(severity)) {
        
        EmergencyDAO eDao = new EmergencyDAO();
        Emergency policeReq = new Emergency();
        policeReq.setAccidentId(accidentId);
        policeReq.setResponderType("POLICE");
        policeReq.setAssignedTo(2); // example police userId
        policeReq.setStatus("Pending");
        int policeRequestId = eDao.createRequest(policeReq);  // <-- get generated ID
        trackingDAO.addTracking(accidentId, policeRequestId, 2, "USER", "Emergency Request");

        Emergency ambReq = new Emergency();
        ambReq.setAccidentId(accidentId);
        ambReq.setResponderType("AMBULANCE");
        ambReq.setAssignedTo(3); // example ambulance userId
        ambReq.setStatus("Pending");
        int ambRequestId = eDao.createRequest(ambReq);  // <-- get generated ID
        trackingDAO.addTracking(accidentId, ambRequestId, 3, "USER", "Emergency Request");
        }
        res.sendRedirect("status.jsp");
    }

}
