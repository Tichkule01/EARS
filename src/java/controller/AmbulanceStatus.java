/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AccidentDAO;
import dao.AccidentTrackingDAO;
import dao.EmergencyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author plazma
 */
@WebServlet("/Ambulance/updateStatus")
public class AmbulanceStatus extends HttpServlet {

        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       int id = Integer.parseInt(req.getParameter("id"));
        String status = req.getParameter("status");

        
int emerid = 0;        
String eidStr = req.getParameter("eid");
if (eidStr != null && !eidStr.trim().isEmpty()) {
    try {
        emerid = Integer.parseInt(eidStr);
    } catch (Exception e) {
        emerid = 0;
    }        
        
}
AccidentDAO accidentDAO = new AccidentDAO();
EmergencyDAO emergencyDAO = new EmergencyDAO();
AccidentTrackingDAO trackingDAO = new AccidentTrackingDAO();
// 1️⃣ Always update accident status
accidentDAO.updateStatus(id, status);

// 2️⃣ Check if this is an emergency accident
if (emerid > 0) {
    // Update emergency request
    emergencyDAO.updateRequestStatus(emerid, status);

    // Add tracking with emergency reference
    trackingDAO.addTracking(id, emerid, null, "AMBULANCE", status);
} else {
    // Normal accident → just add tracking
    trackingDAO.addTracking(id, null, null, "AMBULANCE", status);
}


resp.sendRedirect("index.jsp");
    }
}
