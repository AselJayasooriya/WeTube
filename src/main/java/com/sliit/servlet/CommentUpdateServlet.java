package com.sliit.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;


@WebServlet(name = "CommentUpdateServlet", value = "/CommentUpdateServlet")
public class CommentUpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




        String drivr = "com.mysql.jdbc.Driver";
        String conURL ="jdbc:mysql://localhost:3306/oop";
        String userid = "root";
        String pw = "";

        String videoid=request.getParameter("video_id");
        System.out.println(videoid);
        String comment_id = request.getParameter("comment_id");
        String comment = request.getParameter("commentx");





        if(comment_id != null) {

            Connection conn = null;
//    PreparedStatement ps = null;


            try {

                Class.forName(drivr);
                conn = DriverManager.getConnection(conURL, userid, pw);



                String sql = "UPDATE comment SET `comment`=? WHERE `commentid` =?";

                PreparedStatement ps = conn.prepareStatement(sql);


                ps.setString(2, comment_id);
                ps.setString(1,comment);



                ps.executeUpdate();

                response.sendRedirect("./player.jsp?id="+videoid+"#viewComment");



            } catch (SQLException | ClassNotFoundException s) {

                request.setAttribute("error", s);

            }

        }
    }
}
