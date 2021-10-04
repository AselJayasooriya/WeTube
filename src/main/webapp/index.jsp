<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.sliit.model.Video" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="com.sliit.model.Login" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home Page</title>

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
        <div class="col-7">
            <form method="get" action="./index.jsp">
                <div class="col-9 d-inline-block">
                    <input class="form-control round-10 shadow-3" type="search" name="search" placeholder="Search..."
                           aria-label="Search"></div>
                <div class="d-inline-block h-100">
                    <button class="btn round-10 align-self-center" type="submit"><i class="fa fa-search"
                                                                                    aria-hidden="true"></i>
                    </button>
                </div>
            </form>
        </div>
        <%
            if (session.getAttribute("userDetails") != null) {
                Login user = (Login) session.getAttribute("userDetails");
        %>
        <div class="d-flex flex-row-reverse">
            <form action="video_upload.jsp">
                <button type="submit" class="btn btn-outline-secondary round-10">Upload<i class="fas fa-video ps-1"></i>
                </button>
            </form>
        </div>
        <div class="d-flex flex-row-reverse me-4">
            <div class="dropdown">
                <button
                        class="btn btn-primary dropdown-toggle"
                        type="button"
                        id="dropdownMenuButton"
                        data-mdb-toggle="dropdown"
                        aria-expanded="false"
                >
                    Account
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li><a class="dropdown-item" href="userprofile.jsp">View account</a></li>
                    <li><a class="dropdown-item" href="#">Sign out</a></li>
                </ul>
            </div>
        </div>
        <% } else { %>
        <div class="d-flex flex-row-reverse me-4">
            <form action="Login.jsp">
                <button type="submit" class="btn btn-primary round-10">Sign In</button>
            </form>
        </div>
        <% } %>
    </nav>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-2  position-fixed mt-100 nav nav-pills flex-column flex-wrap vh-100 overflow-auto text-black pt-0"
             role="tablist">
            <a href="#home" role="tab" class="nav-link nav-link-round-10 m-1 active" aria-controls="home"
               data-mdb-toggle="pill"
               aria-selected="true"><i class="fas fa-home px-2"></i> Home</a>
            <a href="#explore" role="tab" class="nav-link nav-link-round-10 m-1" aria-controls="explore"
               data-mdb-toggle="pill"
               aria-selected="false"><i class="fas fa-compass px-2"></i> Explore</a>
            <a href="inquiry.jsp" role="tab" class="nav-link nav-link-round-10 m-1"><i class="fas fa-compass px-2"></i>
                Contact Us</a>
            <%
                if (session.getAttribute("userDetails") != null) {
            %>
            <c:url var="forumLink" value="InquiryControllerServlet">
                <c:param name="command" value="FORUM" />
            </c:url>
            <a href="${forumLink}" role="tab" class="nav-link nav-link-round-10 m-1"><i class="fas fa-compass px-2"></i>
                Forum</a>
            <% } %>
        </div>

        <div class="tab-content">
            <div class="tab-pane fade show active" role="tabpanel" id="home" aria-labelledby="home">
                <! -- Video Container -->
                <div class="col-10 offset-2 pe-4 mt-100">
                    <div class="row clearfix">
                        <! -- video cards -->
                        <jsp:include page="/GetHomepageVideoServlet"/>
                        <%
                            ArrayList<Video> videoList = (ArrayList<Video>) request.getAttribute("video");

                            for (Video video : videoList) {
                                String imageName = Paths.get(video.getThumbnail()).getFileName().toString();
                        %>


                        <div class="col-lg-3">
                            <div class="card d-inline-block w-100 mb-4 round-10 shadow-3 overflow-hidden">
                                <a class="text-black" href="./player.jsp?id=<%=video.getVideoID()%>">
                                    <img src="./thumbnails/<%=imageName%>"
                                         class="card-img-top w-100 object-fit-cover"
                                         alt="...">
                                    <div class="card-title p-1">
                                        <h5 class="card-title"><%=video.getTitle()%>
                                        </h5>

                                        <h6 class="card-subtitle text-black-50 mb-0"><%=video.getUploader()%>
                                        </h6>
                                        <%--                                    <p class="card-text text-black-50">10 views</p>--%>
                                    </div>
                                </a>

                            </div>
                        </div>

                        <% }
                            if (videoList.isEmpty()) { %>
                        <div class="col-11 text-center"><i class="far fa-frown fa-7x"></i><br/><br/>
                            <p class="h2">Sorry! No results found</p></div>
                        <% } %>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" role="tabpanel" id="explore" aria-labelledby="explore">
                <div class="col-10 offset-2 pe-4 mt-100">
                    <div class="row clearfix">
                        <div class="col-lg-4">
                            <a href="./index.jsp?search=sports" class="text-decoration-none">
                                <div class="card card-gradient-1 text-black mb-4 round-10 p-4 text-center">
                                    <i class="fas fa-futbol fa-3x d-flex justify-content-center p-2"></i>
                                    Sport
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-4">
                            <a href="./index.jsp?search=music" class="text-decoration-none">
                                <div class="card card-gradient-2 text-black mb-4 round-10 p-4 text-center">
                                    <i class="fas fa-music fa-3x d-flex justify-content-center p-2"></i>Music
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-4">
                            <a href="./index.jsp?search=gaming" class="text-decoration-none">
                                <div class="card card-gradient-3 text-black mb-4 round-10 p-4 text-center">
                                    <i class="fas fa-gamepad fa-3x d-flex justify-content-center p-2"></i>Gaming
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-4">
                            <a href="./index.jsp?search=news" class="text-decoration-none">
                                <div class="card card-gradient-4 text-black mb-4 round-10 p-4 text-center">
                                    <i class="fas fa-desktop fa-3x d-flex justify-content-center p-2"></i>Technology
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-4">
                            <a href="./index.jsp?search=education" class="text-decoration-none">
                                <div class="card card-gradient-5 text-black mb-4 round-10 p-4 text-center">
                                    <i class="fas fa-book-reader fa-3x d-flex justify-content-center p-2"></i>Education
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-4">
                            <a href="./index.jsp?search=news" class="text-decoration-none">
                                <div class="card bg-gradient-custom-1 text-black mb-4 round-10 p-4 text-center">
                                    <i class="far fa-newspaper fa-3x d-flex justify-content-center p-2"></i>News
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-2 fixed-bottom mb-5 pe-5 p-1 text-wrap">
            <small>
                <a class="text-muted p-1" href="#">About </a>
                <a class="text-muted p-1" href="#"> Copyright </a>
                <a class="text-muted p-1" href="#"> Terms </a>
                <a class="text-muted p-1" href="#"> Privacy </a>
                <a class="text-muted p-1" href="#"> Policy & Safety </a><br/>
                <a class="text-muted p-1" href="adminLogin.jsp">Admin login</a>
            </small>
        </div>

    </div>
</div>


<script src="template/js/mdb.min.js"></script>
</body>
</html>
