<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Login</title>

    <link rel="stylesheet" href="template/css/all.min.css"/>
    <link rel="stylesheet" href="template/css/mdb.min.css"/>
    <link rel="stylesheet" href="template/css/style.css">


</head>
<body class="bg-primary bg-gradient overflow-hidden login-body">
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


<div class="row v-center card-height-500" style="margin-top: 150px">
    <div class="container col-3 w-25 card round-10 shadow-2-strong">
        <!-- Pills content -->
        <div class="tab-content">
            <div
                    class="tab-pane fade show active"
                    id="pills-login"
                    role="tabpanel"
                    aria-labelledby="tab-login">
                <br>
                <div class="mb-3">
                    <i class="fas fa-user-cog fa-7x d-flex justify-content-center"></i>
                    <br><br>
                    <h4 class="d-flex justify-content-center">Welcome Admin</h4>
                </div>


                <form action="${pageContext.request.contextPath}/AdminLoginServlet" method="post" class="py-3">
                    <!-- Username input -->
                    <div class="form-outline my-4 w-75 mx-auto">
                        <input type="text" id="adminUname" name="adminUname" class="form-control"/>
                        <label class="form-label" for="adminUname">Admin username</label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mt-3 mb-5 w-75 mx-auto">
                        <input type="password" id="adminPassword" name="adminPassword" class="form-control"/>
                        <label class="form-label" for="adminPassword">Admin password</label>
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary d-block mb-4 w-50 mx-auto">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>
    <script src="template/js/mdb.min.js"></script>
</body>
</html>