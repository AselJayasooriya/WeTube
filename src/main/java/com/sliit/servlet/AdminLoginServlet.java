package com.sliit.servlet;

import com.sliit.model.Admin;
import com.sliit.util.AdminDBUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminLoginServlet", value = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("adminUname");
        String password = request.getParameter("adminPassword");

        Admin admn = new Admin();
        admn.setUsername(username);
        admn.setPassword(password);

        AdminDBUtil loginAd = new AdminDBUtil();
        if(loginAd.validate(admn)){
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("InquiryControllerServlet");
        }
        else {
            response.sendRedirect("loginFail.jsp");
        }
    }
}
