<%@ page import="com.sliit.model.Video" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="com.sliit.model.Login" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<%
    String comment_id = request.getParameter("commentid");
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
<html lang="en">
<head>
    <title>Video Player</title>

    <link rel="stylesheet" href="template/css/all.min.css"/>
    <link rel="stylesheet" href="template/css/mdb.min.css"/>
    <link rel="stylesheet" href="template/css/style.css">
</head>
<body>
<jsp:include page="/GetVideoServlet" />

<%
    Video video = (Video) request.getAttribute("video");
    String videoName = Paths.get(video.getLink().toString()).getFileName().toString();

%>
<nav class="navbar navbar-light bg-white shadow-0 fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="template/images/logo.png" alt="" width="48" height="48" class="d-inline-block align-text-top">
            WeTube
        </a>

        <form class="d-inline-flex col-6">
            <input class="form-control round-10 me-2 shadow-3" type="search" placeholder="Search..."
                   aria-label="Search">
            <button class="btn round-10 btn-light" type="submit"><i class="fa fa-search" aria-hidden="true"></i>
            </button>
        </form>
        <%
            if(session.getAttribute("userDetails") != null) {
                Login user = (Login) session.getAttribute("userDetails");
        %>
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
    </div>
</nav>
<div class="d-flex col-10 offset-2 mt-100">
    <video width="900px" height="506px" controlsList="nodownload" controls>
        <source src="./videos/<%=videoName%>" type="video/mp4">
    </video>
</div>
<br>
<div class="col-9 offset-2 pe-5 text-wrap">
    <h5><%=video.getTitle()%>
    </h5>
    <p>Uploaded : <%=video.getUploaded_date()%>
    </p>

    <div>
        <hr>
        <p><%=video.getDescription()%></p>
        <hr>
    </div>
    <button class="btn btn-success round-10 me-3" type="button" id="like" data-bs-toggle="button"><i
            class="far fa-thumbs-up pe-1"></i>Like
    </button>
    <button class="btn btn-warning round-10 me-3" type="button" id="unlike" data-bs-toggle="button"><i
            class="far fa-thumbs-down pe-1"></i>Unlike
    </button>
    <button class="btn btn-danger round-10 me-3" type="button" id="report"><i class="fas fa-flag pe-1"></i>Report
    </button>

    <%--   this must be visible only if uploader views the video--%>

    <%
        if(session.getAttribute("userDetails") != null) {
            Login user = (Login) session.getAttribute("userDetails");
            if (user.getUsername().equals(video.getUploader())) {
    %>
    <%--    edit button--%>
    <form method="POST" action="${pageContext.request.contextPath}/GetVideoServlet?edit=<%=video.getVideoID()%>" class="d-inline-flex">
        <input type="hidden" id="videoID" name="videoID" value="<%=video.getVideoID()%>">
        <button class="btn btn-outline-secondary round-10 me-3" type="submit"><i class="far fa-edit pe-1"></i>Edit Video</button>
    </form>

    <%--    delete button--%>
    <button type="button" class="btn btn-outline-danger round-10 me-3"  data-mdb-toggle="modal" data-mdb-target="#confirmBox">
        Delete Video
    </button>
    <%--    delete button confirmation modal--%>
    <div class="modal fade" aria-label="confirmBox" id="confirmBox" tabindex="-1" aria-labelledby="confirmBoxAria">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmBoxAria">Delete video?</h5>
                    <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    This cannot be undone. Are you sure you want to do this?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-dark" data-mdb-dismiss="modal">Cancel</button>
                    <form method="POST" action="${pageContext.request.contextPath}/DeleteVideoServlet">
                        <input type="hidden" id="id" name="id" value="<%=video.getVideoID()%>">
                        <button type="submit" class="btn btn-danger danger-color">Delete</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <% }
    }
    %>
    <%--    uploader video management ends here--%>

    <hr>
    <h6><%=video.getUploader()%>
    </h6>
    <button class="btn btn-outline-primary round-10 me-3" type="button" id="subscribe"><i
            class="fas fa-plus-circle pe-1"></i>Subscribe
    </button>
</div>
<hr class="offset-2">
<br>
<br>

<!--Post Comment-->
<div class="col-9 offset-2 pe-5">
    <form method="POST" action="${pageContext.request.contextPath}/CommentServlet">

        <input type="hidden" name="id" value="<%=video.getVideoID()%>">

        Name<br>
        <input class="form-control" type="text" name="username" <%
            if (session.getAttribute("userDetails") != null) {
                Login user = (Login) session.getAttribute("userDetails");
        %> value="<%=user.getUsername()%>" <% } %> PLACEHOLDER="Please enter your name..." required><br>


        Comment<br>
        <input class="form-control" type="text" id="comment" name="comment" PLACEHOLDER="Please enter your comment..." required><br>

        <input class="btn btn-outline-primary round-10 me-3" type="submit" value="submit">

        <hr id="viewComment">

        </table>



    </form>
</div>


<!--Read Comments-->

<%
    try{
        conn = DriverManager.getConnection(conURL+db, userid, pw);
        stmt = conn.createStatement();


        String sql = "SELECT * FROM comment order by date desc";
        rs = stmt.executeQuery(sql);

        while(rs.next()){

%>

<div class="col-9 offset-2 pe-5" id="viewComment">
    <p><%=rs.getString("username")%></p>
    <p hidden><%=rs.getString("commentid")%></p>
    <div class="video-description my-n5 pb-0">
        <p><%=rs.getString("comment")%></p>
    </div>
    <a class="btn btn-outline-secondary round-10 me-3 mt-n5" href="updateComment.jsp?comment_id=<%=rs.getString("commentid")%>">Update</a>
    <form method="post" action="DeleteCommentServlet">

        <input type="hidden" name="comment_id" value="<%=rs.getString("commentid")%>" >

        <input  type="hidden" name="video_id" value="<%=rs.getString("video-id")%>">
        <input type="submit" class="btn btn-outline-danger" value="Delete" >
    </form>
</div>
<hr class="col-9 offset-2">
<%
        }

        conn.close();

    } catch (Exception e) {

        e.printStackTrace();

    }
%>
<br><br>
<script src="template/js/mdb.min.js"></script>
</body>
</html>