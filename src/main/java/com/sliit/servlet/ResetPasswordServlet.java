package com.sliit.servlet;

import com.sliit.util.userDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="ResetPasswordServlet", value = "/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isTrue;

        isTrue = userDB.resetPassword(username,password);

        if(isTrue == true){
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        }else {
            RequestDispatcher dis = request.getRequestDispatcher("userprofile.jsp");
            dis.forward(request, response);
        }

    }

}
