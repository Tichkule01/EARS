/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import dao.SuperUserDao;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import java.io.IOException;


/**
 *
 * @author plazma
 */


@WebServlet("/Admin/logon")
public class SAdm extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        SuperUserDao dao = new SuperUserDao();
        if(dao.validate(username, password)){
            request.getSession().setAttribute("user", username);
            response.sendRedirect("Action");
        } else {
            request.getSession().setAttribute("loginError", "Invalid username or password!");
            response.sendRedirect("./");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}