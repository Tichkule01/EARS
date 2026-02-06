package controller;

import model.User;
import service.AuthService;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/includes/apiAuth")
public class ApiController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        resp.setContentType("application/json");

        try {
            // Read request body
            StringBuilder sb = new StringBuilder();
            BufferedReader br = req.getReader();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            String body = sb.toString();

            // Extract values
            String email = body.replaceAll(
                ".*\"email\"\\s*:\\s*\"([^\"]+)\".*", "$1");
            String password = body.replaceAll(
                ".*\"password\"\\s*:\\s*\"([^\"]+)\".*", "$1");

            if (email.isEmpty() || password.isEmpty()) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().write(
                    "{\"status\":\"error\",\"message\":\"Missing credentials\"}"
                );
                return;
            }

            // Authenticate
            User user = AuthService.login(email, password);

            if (user == null) {
                resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                resp.getWriter().write(
                    "{\"status\":\"error\",\"message\":\"Invalid email or password\"}"
                );
                return;
            }

            // Create session
            HttpSession session = req.getSession(true);
            session.setAttribute("user", user);

            // Success response
            resp.getWriter().write(
                "{\"status\":\"success\"}"
            );

        } catch (Exception e) {
            e.printStackTrace(); // server log

            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write(
                "{\"status\":\"error\",\"message\":\"Server error\"}"
            );
        }
    }
}
