<%@ page import="com.sliit.model.Login" %>

<%--
  Created by IntelliJ IDEA.
  User: mwatt
  Date: 5/19/2021
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User profile</title>
    <link rel="stylesheet" href="template/css/userprofile.css">

</head>
<body>
    <center>
    <h1>User Profile</h1>
    </center>
    <hr>
            <form method="post" action="${pageContext.request.contextPath}/UpdateUserServlet">
                <h2>User Details</h2>
                <div>
                    <label for="name"><b>Name</b></label>
                    <input type="text" id="name" name="name" value="${userDetails.name}">

                    <label for="uname"><b>User Name</b></label>
                    <input type="text" id="username" name="username" value="${userDetails.username}" readonly>

                    <label for="email"><b>Email</b></label>
                    <input type="text" id="email" name="email" value=" ${userDetails.email}">

                    <label for="telephone"><b>Telephone</b></label>
                    <input type="text" id="telephone" name="telephone" value=" ${userDetails.telephone}">

                    <input type="submit" value="Update Profile">

                </div>
            </form>
             <form class="st" method="post" action="${pageContext.request.contextPath}/DeleteUserServlet">
                 <h2>Delete Account</h2>
                 <div class="ab">
                     <label for="uname"><b>User Name</b></label>
                     <input type="text" id="uname" name="username" value="${userDetails.username}">
                     <input type="submit" class="dt" value="Delete Account ">
                 </div>
             </form>

</body>
</html>
