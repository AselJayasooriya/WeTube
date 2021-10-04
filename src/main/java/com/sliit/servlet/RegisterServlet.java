package com.sliit.servlet;

import com.sliit.model.Login;
import com.sliit.util.userDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String telephone = request.getParameter("telephone");
        String password = request.getParameter("password");

        boolean isTrue;

        isTrue = userDB.registerUser(name, username, email, telephone, password);
        Login userDetails = userDB.getUser(username);
        request.getSession().setAttribute("userDetails", userDetails);

        if (isTrue == true){
            response.sendRedirect("./index.jsp#home");
        }else {
            RequestDispatcher reg1 = request.getRequestDispatcher("login.jsp");
            reg1.forward(request, response);
        }

    }


}


