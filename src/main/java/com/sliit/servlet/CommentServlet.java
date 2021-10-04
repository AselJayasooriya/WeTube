package com.sliit.servlet;

import com.sliit.util.CommentDB;
import com.sliit.util.userDB;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "CommentServlet", value = "/CommentServlet")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String username = request.getParameter("username");
        String videoid = request.getParameter("id");
        String comment = request.getParameter("comment");

        //get current date
        Date date = new Date();
        SimpleDateFormat myFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String comentedDate = myFormat.format(date);

        CommentDB.VideoComment(username,videoid,comment,comentedDate);
        response.sendRedirect("./player.jsp?id="+videoid+"#viewComment");

    }
}
