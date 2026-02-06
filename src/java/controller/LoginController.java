/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import java.io.IOException;
import service.AuthService;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/EarsLogin")
public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (email == null || password == null ||
            email.isEmpty() || password.isEmpty()) {

            resp.sendRedirect("index.jsp?error=missing");
            return;
        }

        try {
            User u = AuthService.login(email, password);

            if (u != null) {
                req.getSession().invalidate();
                HttpSession session = req.getSession(true);
                session.setAttribute("userId", u.getUserId());
                session.setAttribute("role", u.getRole());

                 switch(u.getRole()) {
                    case "USER":
                    resp.sendRedirect("Users/index.jsp");
                    break;
                case "POLICE":
                    resp.sendRedirect("Police");
                    break;
                case "AMBULANCE":
                    resp.sendRedirect("Ambulance");
                    break;
                default:
                    resp.sendRedirect("index.jsp?error=role");
                    }
            } else {
                resp.sendRedirect("index.jsp?error=invalid");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
