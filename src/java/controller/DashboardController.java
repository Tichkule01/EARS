package controller;

import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            // Not logged in → redirect to login page
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        // Role-based redirect
        switch (user.getRole()) {
            case "USER":
                resp.sendRedirect(req.getContextPath() + "/Users/");
                break;
            case "POLICE":
                resp.sendRedirect(req.getContextPath() + "/Police/");
                break;
            case "AMBULANCE":
                resp.sendRedirect(req.getContextPath() + "/Ambulance/");
                break;
            default:
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid role");
                break;
        }
    }
}
