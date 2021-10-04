<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 5/22/2021
  Time: 7:23 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import ="java.sql.Connection"%>
<%@page import ="java.sql.ResultSet"%>

<%
  String comment_id = request.getParameter("comment_id");

  String drivr  = "com.mysql.cj.jdbc.Driver";
  String db = "oop";
  String userid = "root";
  String pw = "";
  String conURL = "jdbc:mysql://localhost:3306/";

  try{
    Class.forName(drivr);
  } catch (ClassNotFoundException e) {
    e.printStackTrace();
  }

  Statement stmt = null;
  Connection conn = null;
  ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>


</head>
<body>


<%
  try{
    conn = DriverManager.getConnection(conURL+db, userid, pw);
    stmt = conn.createStatement();



    String sql = "SELECT * FROM comment  WHERE commentid= ?" ;

    PreparedStatement pst=conn.prepareStatement(sql);


    pst.setString(1,comment_id);
    ResultSet resultSet = pst.executeQuery();


//    rs = stmt.executeQuery(sql);


if(resultSet.next()){



%>

<form method="post" action="CommentUpdateServlet">




  <input  type="hidden" name="comment_id" value="<%=resultSet.getString("commentid")%>">

  <input  type="hidden" name="video_id" value="<%=resultSet.getString("video-id")%>">

  <% System.out.println(resultSet.getString("video-id")); %>

  <input type="text" name="commentx" value="<%=resultSet.getString("comment")%>">


  <input type ="submit" class="btn btn-dark" value="Update">

</form>

<%
}

    conn.close();

  } catch (Exception e) {

    e.printStackTrace();

  }
%>




</body>
</html>
