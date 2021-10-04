<%@ page import="com.sliit.model.Video" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Upload Status Page</title>

    <link rel="stylesheet" href="template/css/all.min.css"/>
    <link rel="stylesheet" href="template/css/mdb.min.css"/>
    <link rel="stylesheet" href="template/css/style.css">


</head>
<body class="bg-primary bg-gradient overflow-hidden login-body">
<%
    Video video = (Video)request.getSession().getAttribute("video");
%>
<div class="row v-center">
    <div class="container col-3 w-25 card round-10 shadow-2-strong">
        <div class="alert alert-success m-3 text-center" role="alert">
            <i class="far fa-grin-alt fa-5x"></i><br><h4>HURRAY...<br>VIDEO UPLOADED SUCCESSFULLY</h4>
        </div>
        <div>
        <form method="post" action="${pageContext.request.contextPath}/GetVideoServlet">
            <div class="row clearfix">

                    <input type="hidden" id="videoID" name="videoID" value="<%=video.getVideoID()%>"/>
            </div>
            <div class="row clearfix">
                <div class="col-12 px-5 mb-4">
                    <button type="submit" class="btn btn-primary btn-block">Play Video</button>
                </div>
            </div>
        </form>
        </div>
    </div>
</div>
<script src="template/js/mdb.min.js"></script>
</body>
</html>
