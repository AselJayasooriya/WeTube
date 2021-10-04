<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Us</title>

    <script type="text/javascript" src="template/js/AJSFile.js"></script>
    <link rel="stylesheet" href="template/css/all.min.css"/>
    <link rel="stylesheet" href="template/css/mdb.min.css"/>
    <link rel="stylesheet" href="template/css/style.css">
</head>
<body class="alert-primary">

<div class="row clearfix">
    <nav class="navbar navbar-light bg-white shadow-0 fixed-top">
        <div class="col-2 flex-row">
            <a class="navbar-brand" href="index.jsp">
                <img src="template/images/logo.png" alt="" width="48" height="48" class="d-inline-block align-text-top">
                WeTube
            </a>
        </div>
    </nav>
</div>

<div style="margin-top: 135px">
    <div align="center">
        <div style="width: 98%">
            <div class="card-group">

<%--                contact information--%>
                <div class="card alert-info">
                    <div style="width: 300px">
                        <img src="./template/images/contact.png" class="card-img-top">
                    </div>
                    <div class="card-body">

                        <p align="left">
                            <strong>Reach us at:</strong><br><br>

                            Google LLC, D/B/A WeTube<br>
                            San Bruno, CA 94066<br>
                            USA<br>
                            Fax: +1 650-253-0001

                        </p>

                    </div>

                    <div class="card-footer" align="center">
                        <a href="#"><i class="fab fa-facebook-square hover-zoom" style="margin-right: 50px"></i></a>
                        <a href="#"><i class="fab fa-instagram-square" style="margin-right: 50px"></i></a>
                        <a href="#"><i class="fab fa-twitter-square" style="margin-right: 50px"></i></a>
                        <a href="#"><i class="fas fa-envelope-square"></i></a>
                    </div>

                </div>

<%--                contact us form--%>
                <div class="card  text-center" style="width: 85%">
                    <div class="card-header"> <div class="fs-3">Contact Us</div> </div>

                    <div class="card-body">
                        <form action="InquiryControllerServlet" method="get">

                            <input type="hidden" name="command" value="ADD">

                            <div class="form-outline">
                                <input type="text" id="iName" name="iName" class="form-control" required/>
                                <label class="form-label" for="iName">Enter your name </label>
                            </div>
                            <br>
                            <div class="form-outline">
                                <input type="text" id="iEmail" name="iEmail" class="form-control" pattern="[a-zA-Z0-9.+-_&%]+@[a-z0-9]+\.[a-z]{2,3}" required/>
                                <label class="form-label" for="iEmail">Enter your email</label>
                            </div>
                            <div id="iEmail1" class="form-text" style="text-align: left" >
                                We'll never share your email with anyone else.
                            </div>
                            <br>
                            <div class="form-outline">
                                <textarea class="form-control" id="iMessage" name="iMessage" rows="4" required></textarea>
                                <label class="form-label" for="iMessage">Please enter your inquiry</label>
                            </div>
                            <br>
                            <div>
                                <label class="form-check-label" for="iCheck">I'm not a robot</label>
                                <input class="form-check-input" type="checkbox" value="" id="iCheck" name="iCheck" onclick="enableInquirySend()" required/>
                            </div>
                            <br>

                                <input type="submit" id="iBtn" name="iBtn" value="Send" class="btn btn-primary w-50" onclick="if (!(confirm('Do you want to send this inquiry to the forum?'))) return false" disabled>
                                <input type="reset" id="iReset" name="iReset" class="btn btn-light w-25" data-mdb-ripple-color="dark">

                        </form>
                    </div>

                    <c:url var="forumLink" value="InquiryControllerServlet">
                        <c:param name="command" value="FORUM" />
                    </c:url>
                    <div class="alert-danger">
                        <div class="card-footer text-center fs-6">
                            If you have more inquiries for us, please check our Community Forum from <a href="${forumLink}" ><strong>here</strong></a>.
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="template/js/mdb.min.js"></script>
</body>
</html>
