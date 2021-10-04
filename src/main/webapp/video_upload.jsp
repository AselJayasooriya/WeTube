<%@ page import="com.sliit.model.Login" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Video Upload Page</title>

    <link rel="stylesheet" href="template/css/all.min.css"/>
    <link rel="stylesheet" href="template/css/mdb.min.css"/>
    <link rel="stylesheet" href="template/css/style.css">


</head>

<body class="bg-primary overflow-hidden login-body">
<div class="row v-center card-height-550">
    <div class="container col-4 card round-10 shadow-2">
                <button class="btn btn-primary mt-2 py-3 disabled">Add video details</button>
                <form method="post" action="${pageContext.request.contextPath}/AddVideoServlet" enctype="multipart/form-data">
                    <h6 class="d-flex justify-content-center my-3"> ENTER YOUR VIDEO DETAILS AND SELECT THE FILE</h6>
                    <%
                        if(session.getAttribute("userDetails") != null) {
                            Login user = (Login) session.getAttribute("userDetails");
                    %>
                    <input type="hidden" id="username" name="username" value="<%=user.getUsername()%>"/>
                    <% } %>
                    <!-- Title input -->
                    <div class="form-outline w-75 mx-auto mb-4">
                        <input type="text" id="title" name="title" class="form-control" maxlength="100" required/>
                        <label class="form-label" for="title">Title</label>
                    </div>

                    <!-- Description input -->
                    <div class="form-outline w-75 mx-auto mb-4">
                        <textarea id="description" name="description" placeholder="Enter video description..." class="form-control" maxlength="1000" required></textarea>
                        <label class="form-label" for="description">Description</label>
                    </div>

                    <!-- Category input -->
                    <div class="form-outline w-75 mx-auto mb-4">

                        <select id="category" name="category" class="form-select" required>
                            <option value="" disabled selected>Category</option>
                            <option value="music">Music</option>
                            <option value="sports">Sports</option>
                            <option value="gaming">Gaming</option>
                            <option value="technology">Technology</option>
                            <option value="education">Education</option>
                            <option value="news">News</option>
                        </select>

                    </div>


                    <div class="form-file-button w-75 mx-auto mb-4">
                        <label class="form-file-label" for="category">Choose Thumbnail</label>
                        <input type="file" id="thumbnail" name="thumbnail" class="form-control form-control-lg" accept="image/*" required/>
                    </div>
                    <div class="form-file-button w-75 mx-auto mb-4">
                        <label class="form-file-label" for="video">Choose Video</label>
                        <input type="file" id="video" name="video" class="form-control form-control-lg" accept=".mp4,.webm,ogg" required/>
                    </div>


                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-block my-4 w-50 mx-auto">UPLOAD</button>
                </form>
    </div>
</div>

<script src="template/js/mdb.min.js"></script>
</body>
</html>