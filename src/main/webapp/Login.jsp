<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login Page</title>

    <script src="https://kit.fontawesome.com/0b0a6a0f7b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="template/css/mdb.min.css"/>
    <link rel="stylesheet" href="template/css/style.css">


</head>
<body class="bg-primary bg-gradient overflow-hidden login-body">
<div class="row v-center card-height-550">
    <div class="container col-3 w-25 card round-10 shadow-2-strong">
        <ul class="nav nav-pills nav-justified mb-3" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link round-10 active" id="tab-login" data-mdb-toggle="pill" href="#pills-login"
                   role="tab" aria-controls="pills-login" aria-selected="true">Login</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link round-10" id="tab-register" data-mdb-toggle="pill" href="#pills-register"
                   role="tab" aria-controls="pills-register" aria-selected="false">Register</a>
            </li>
        </ul>
	
        <!-- Pills content -->
        <div class="tab-content">
            <div
                    class="tab-pane fade show active"
                    id="pills-login"
                    role="tabpanel"
                    aria-labelledby="tab-login">
                    <br>
                <div class="mb-3">
                    <i class="fas fa-user-circle fa-7x d-flex justify-content-center"></i>
                    <br>
                    <h4 class="d-flex justify-content-center">Welcome Back!</h4>
                </div>


                <form class="py-3" method="post" action="${pageContext.request.contextPath}/loginServlet">

                    <!-- Username input -->
                    <div class="form-outline my-4 w-75 mx-auto">
                        <input type="text" name="username" id="loginName" class="form-control" required/>
                        <label class="form-label" for="loginName">Username</label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mt-3 mb-5 w-75 mx-auto">
                        <input type="password" name="password" id="loginPassword" class="form-control" required/>
                        <label class="form-label" for="loginPassword">Password</label>
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary d-block mb-4 w-50 mx-auto">Sign in</button>
                </form>
            </div>

            <div class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
                <form method="post" action="${pageContext.request.contextPath}/RegisterServlet" onsubmit="checkPassword()">
                    <h6 class="d-flex justify-content-center my-3"> Unlock all the features in WeTube...</h6>
                    <!-- Name input -->
                    <div class="form-outline w-75 mx-auto mb-4">
                        <input type="text" name="name" id="registerName" class="form-control" required/>
                        <label class="form-label" for="registerName">Name</label>
                    </div>

                    <!-- Username input -->
                    <div class="form-outline w-75 mx-auto mb-4">
                        <input type="text" name="username" id="registerUsername" class="form-control" required/>
                        <label class="form-label" for="registerUsername">Username</label>
                    </div>

                    <!-- Email input -->
                    <div class="form-outline w-75 mx-auto mb-4">
                        <input type="email" name="email" id="registerEmail" class="form-control" required/>
                        <label class="form-label" for="registerEmail">Email</label>
                    </div>

                    <!-- Phone input -->
                    <div class="form-outline w-75 mx-auto mb-4">
                        <input type="tel" name="telephone" id="registerTel" class="form-control"required/>
                        <label class="form-label" for="registerTel">Contact Number</label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline w-75 mx-auto mb-4">
                        <input type="password" name="password" id="registerPassword" class="form-control" required/>
                        <label class="form-label" for="registerPassword">Password</label>
                    </div>

                    <!-- Repeat Password input -->
                    <div class="form-outline w-75 mx-auto mb-4">
                        <input type="password" name="repassword" id="registerRepeatPassword" class="form-control" required/>
                        <label class="form-label" for="registerRepeatPassword">Repeat password</label>
                    </div>


                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-block my-4 w-75 mx-5">Sign up</button>
                </form>
            </div>
        </div>
    </div>
    <script src="template/js/mdb.min.js"></script>
</body>
</html>