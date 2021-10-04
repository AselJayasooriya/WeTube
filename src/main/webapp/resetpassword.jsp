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
    <title>Reset Password</title>
    <link rel="stylesheet" href="template/css/userprofile.css">

</head>
<body>
<center>
    <h1>User Profile</h1>
</center>

            <form method="post" action="${pageContext.request.contextPath}/ResetPasswordServlet">
                <h2>Reset Password</h2>
                <div class="rs">
                    <label for="username"><b>User Name</b></label>
                    <input type="text" id="username" name="username" >

                    <label for="password"><b>Password</b></label>
                    <input type="text" id="password" name="password" >

                    <input class="rr" type="submit" value="Reset">

                </div>

            </form>


</body>
</html>
