package controller;

import java.io.IOException;
import service.AuthService;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (name == null || email == null || password == null ||
            name.isEmpty() || email.isEmpty() || password.isEmpty()) {

            resp.sendRedirect("register.jsp?error=missing");
            return;
        }

        try {
            User u = new User();
            u.setFullName(name);
            u.setEmail(email);
            u.setPasswordHash(password);
            u.setRole("USER");

            boolean ok = AuthService.register(u);

            if (ok)
                resp.sendRedirect("login.jsp?registered=1");
            else
                resp.sendRedirect("register.jsp?error=email_exists");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
