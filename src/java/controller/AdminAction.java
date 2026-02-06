/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AdminDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Admin/Action/adminAction")
public class AdminAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        int userId = Integer.parseInt(req.getParameter("userId"));

        try {
            if ("update".equals(action)) {
                String fullName = req.getParameter("fullName");
                String email = req.getParameter("email");
                String role = req.getParameter("role");
                AdminDAO.updateUser(userId, fullName, email, role);
                req.getSession().setAttribute("message", "User " + userId + " updated successfully!");
            } else if ("unblock".equals(action)) {
                AdminDAO.resetFail(userId);
                req.getSession().setAttribute("message", "User " + userId + " unblocked successfully!");
            } else if ("delete".equals(action)) {
                AdminDAO.deleteUser(userId);
                req.getSession().setAttribute("message", "User " + userId + " deleted successfully!");
            }
        } catch (Exception e) {
            req.getSession().setAttribute("message", "Error: " + e.getMessage());
            e.printStackTrace();
        }

        // Redirect back to admin page
        resp.sendRedirect("index.jsp");
    }
}