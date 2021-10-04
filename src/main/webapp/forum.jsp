<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Question Forum</title>

    <link rel="stylesheet" href="template/css/all.min.css"/>
    <link rel="stylesheet" href="template/css/mdb.min.css"/>
    <link rel="stylesheet" href="template/css/style.css">
</head>
<body>
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
<br><br><br>

<div class="card">
    <div class="card-header text-center">
        <p class="fs-1">Community Forum</p>
        <p class="fs-4">The place where all your questions get answered.</p>
        <p class="fs-6 fst-italic">(Press on the question you desire to receive the answer)</p>
    </div>

    <div class="card-body">
        <a href="inquiry.jsp" class="btn bg-primary text-light w-25"> Enter another inquiry </a>
        <br><br>
        <c:forEach var="tempForum" items="${FORUM_LIST}">
        <div class="accordion" id="accordionExample">
            <div class="accordion-item alert-info">
                <h2 class="accordion-header" id="heading${tempForum.inquiryId}">
                    <button class="accordion-button collapsed"
                            type="button"
                            data-mdb-toggle="collapse"
                            data-mdb-target="#collapse${tempForum.inquiryId}"
                            aria-expanded="false"
                            aria-controls="collapse${tempForum.inquiryId}">

                        <p>${tempForum.inquiryId} - ${tempForum.iUserName} <br><br>
                               <strong> ${tempForum.inquiry} </strong></p>
                    </button>
                </h2>
                <div id="collapse${tempForum.inquiryId}"
                        class="accordion-collapse collapse"
                        aria-labelledby="heading${tempForum.inquiryId}"
                        data-mdb-parent="#accordionExample">

                    <div class="accordion-body alert-primary">
                        <strong>${tempForum.iReply}</strong>
                    </div>
                </div>
            </div>
        </div><br>
        </c:forEach>
    </div>
</div>

<script src="template/js/mdb.min.js"></script>
</body>
</html>
