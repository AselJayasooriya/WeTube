<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="THE_INQUIRY" scope="request" type="com.sliit.model.Inquiry"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Update Reply</title>

    <link rel="stylesheet" href="template/css/all.min.css"/>
    <link rel="stylesheet" href="template/css/mdb.min.css"/>
    <link rel="stylesheet" href="template/css/style.css">
</head>
<body class="bg-primary">

<%--session secured--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if (session.getAttribute("username")==null){
        response.sendRedirect("adminLogin.jsp");
    }

%>


<center>
    <div style="margin-top: 115px">
        <div class="card text-center" style="width: 50%;" >

            <div class="card-header"> <div class="fs-3">Update Reply</div> </div>

            <div class="card-body">
            <form action="InquiryControllerServlet" method="GET">

        <%--        hidden inputs that are there but not necessary to display --%>
                <input type="hidden" name="command" value="UPDATE" />

                <input type="hidden" name="inquiryId" value="${THE_INQUIRY.inquiryId}" />

                <input type="hidden" name="email" value="${THE_INQUIRY.iUserEmail}" />

        <%--        readonly input fields for the admin to see the necessary details of the r=inquiry to reply--%>
                <div class="form-outline">
                    <input class="form-control" id="name" type="text" name="name" value="${THE_INQUIRY.iUserName}"
                           aria-label="readonly input example"
                           readonly/>
                    <label class="form-label" for="name">Inquirer Name</label>
                </div>
                <br>

                <div class="form-outline">
                    <textarea class="form-control" id="inquiry" name="inquiry" rows="4" readonly>${THE_INQUIRY.inquiry}</textarea>
                    <label class="form-label" for="inquiry">Inquiry</label>
                </div>
                <br>

        <%--        reply input field--%>
                <div class="form-outline">
                    <textarea class="form-control" id="reply" name="reply" rows="4">${THE_INQUIRY.iReply}</textarea>
                    <label class="form-label" for="reply">Inquiry</label>
                </div>
                <br>

        <%--        submit button--%>
                <label></label>
                <input type="submit" value="Send" class="btn btn-primary w-50" />
            </form>
            </div>

            <div class="card-footer">
            <c:url var="adminLink" value="InquiryControllerServlet">
                <c:param name="command" value="LIST" />
            </c:url>
            <p>
                <a href="${adminLink}">Back to admin page</a>
            </p>
            </div>
        </div>
    </div>
</center>
<script src="template/js/mdb.min.js"></script>

</body>
</html>
