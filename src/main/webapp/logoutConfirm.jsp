<!DOCTYPE html>
<html lang="en">
<head>
    <title>Logout</title>

    <link rel="stylesheet" href="template/css/all.min.css"/>
    <link rel="stylesheet" href="template/css/mdb.min.css"/>
    <link rel="stylesheet" href="template/css/style.css">


</head>
<body class="bg-primary bg-gradient overflow-hidden login-body">

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if (session.getAttribute("username")==null){
        response.sendRedirect("adminLogin.jsp");
    }

%>

<div class="row v-center card-height-300" style="margin-top: 14%">
    <div class="container col-3 w-25 card round-10 shadow-2-strong">
        <div class="tab-content">
                <br>
                <div class="mb-3">
                    <i class="far fa-check-circle fa-7x d-flex justify-content-center"></i>
                    <br>
                    <h6 class="d-flex justify-content-center">Are you sure you want to logout</h6>
                    <br>
                    <form action="adminLogoutServlet">
                        <div align="center">
                            <input type="submit" value="OK" class="btn btn-primary w-25">

                            <a href="InquiryControllerServlet"><input type="button" value="Cancel" class="btn btn-light w-25"></a>
                        </div>
                    </form>
<%--                    <a href="adminLogin.jsp"> <button type="submit" class="btn btn-primary d-block mb-4 w-50 mx-auto">Confirm</button></a>--%>
                </div>
        </div>
    </div>
</div>
<script src="template/js/mdb.min.js"></script>
</body>
</html>