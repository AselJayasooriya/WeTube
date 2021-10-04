<%--<%@ page import="java.util.*, com.sliit.model.*, com.sliit.util.*, com.sliit.servlet.*" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Administrator Account</title>

    <script type="text/javascript" src="template/js/AJSFile.js"></script>
    <link rel="stylesheet" href="template/css/all.min.css"/>
    <link rel="stylesheet" href="template/css/mdb.min.css"/>
    <link rel="stylesheet" href="template/css/style.css">
</head>
<%--<%--%>
<%--    List<Inquiry> theInquiries = (List<Inquiry>) request.getAttribute("INQUIRY_LIST");--%>
<%--%>--%>
<body>
<%--session secured--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if (session.getAttribute("username")==null){
        response.sendRedirect("adminLogin.jsp");
    }

%>

<%--header--%>
<div class="row clearfix">
    <nav class="navbar navbar-light bg-white shadow-0 fixed-top">
        <div class="col-2 flex-row">
            <a class="navbar-brand" href="index.jsp">
                <img src="template/images/logo.png" alt="" width="48" height="48" class="d-inline-block align-text-top">
                WeTube
            </a>
        </div>
        <div class="d-flex flex-row-reverse me-4">
            <a href="logoutConfirm.jsp"> <button type="submit" class="btn btn-primary round-10">Logout</button></a>
        </div>
    </nav>
</div>
<br><br><br>

<%--heading--%>

<div style="text-align: center">
    <h1>Welcome Admin</h1>
    <h5><strong>- ${username} -</strong></h5>
    <h5>This is the backstage, this is where all the magic takes place !</h5>
</div>
<br><br>

<%--admin knowledge developement--%>
<div class="card border border-dark alert-info" style="margin-bottom: 50px">
    <div class="card-header fs-4">
        Administrator Knowledge-Hub
    </div>
    <div class="card-body  text-center">
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <div class="card">
                <a href="https://www.marketingcharts.com/" class="hover-zoom">
                    <img src="./template/images/adminK1.png" class="card-img-top " alt="www.marketingcharts.com" height="300"/>
                </a>
                <div class="card-body">
                    <p class="card-text">
                        Market Research.
                        Please click on the image and visit the site.
                    </p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Last updated 20-05-2021 12:33:12</small>
                </div>
            </div>
            <div class="card">
                <a href="https://www.marketingcharts.com/" class="hover-zoom">
                    <img src="./template/images/admink2.png" class="card-img-top" alt="www.marketingcharts.com" height="300"/>
                </a>
                <div class="card-body">
                    <p class="card-text">
                        Brand awareness and research.
                    </p>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Last updated 12-05-2021 19:55:21</small>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card border">
    <div class="card-header fs-4">
        User Inquiry Management Portal
    </div>
    <div class="card-body  text-center">
        <table class="table table-hover">
            <thead class="table-primary">
                <tr>
                    <th scope="col">Inquiry ID</th>
                    <th scope="col">Inquirer Name</th>
                    <th scope="col">Inquirer Email</th>
                    <th scope="col">Inquiry</th>
                    <th scope="col">Reply</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <c:forEach var="tempInquiry" items="${INQUIRY_LIST}">

<%--                settin up the links--%>
                <c:url var="tempLink" value="InquiryControllerServlet">
                    <c:param name="command" value="LOAD" />
                    <c:param name="inquiryId" value="${tempInquiry.inquiryId}" />
                </c:url>

<%--                setting up the delete link--%>
                <c:url var="deleteLink" value="InquiryControllerServlet">
                    <c:param name="command" value="DELETE" />
                    <c:param name="inquiryId" value="${tempInquiry.inquiryId}" />
                </c:url>
                <tbody>
                    <tr>
                        <td scope="row"> ${tempInquiry.inquiryId} </td>
                        <td> ${tempInquiry.iUserName} </td>
                        <td> ${tempInquiry.iUserEmail} </td>
                        <td> ${tempInquiry.inquiry} </td>
                        <td> ${tempInquiry.iReply} </td>
                        <td>
                            <a href="${tempLink}" class="btn btn-primary btn-sm px-3"><i class="fas fa-reply"></i></a>
                            |
                            <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this inquiry?'))) return false" class="btn btn-danger btn-sm px-3"><i class="fas fa-trash-alt"></i></a>
                        </td>
                    </tr>
                </tbody>

            </c:forEach>
        </table>

        <div align="center">
            <div class="alert alert-danger alert w-50">
                <i class="fas fa-exclamation-circle" style="margin-right: 20px"></i> <p class="d-inline">Please make sure that the inquiries violate community guidelines before deleting them.</p>
            </div>
        </div>

    </div>
</div>
    <script src="template/js/mdb.min.js"></script>
</body>
</html>
