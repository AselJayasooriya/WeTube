package com.sliit.servlet;
import com.sliit.model.Login;
import com.sliit.util.userDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet ("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean isTrue;

        isTrue = userDB.Validate(username, password);
        // List<login> userDetails = userDB.Validate(username, password);
        if (isTrue){
            Login userDetails = userDB.getUser(username);
            HttpSession session= request.getSession();
            session.setAttribute("userDetails", userDetails);

            response.sendRedirect("./index.jsp#home");

        }else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Your username or password is incorrect');");
            out.println("location='Login.jsp'");
            out.println("</script>");
        }

    }

}
