<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<div class="container">
    <c:if test="${err.length() > 0}">
        <div class="alert alert-danger text-center" role="alert">
                ${err}
        </div>
    </c:if>
    <c:if test="${message.length() > 0}">
        <div class="alert alert-success text-center" role="alert">
                ${message}
        </div>
    </c:if>
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">
                    <h3 class="card-title text-center mb-5 fw-light fs-5">Sign In</h3>
                    <form name="login" method="POST" action="/login">
                        <div class="form-floating mb-3">
                            <input type="text" value="${email}" class="form-control" id="floatingInput" name="email" onkeyup="validate()" required>
                            <label for="floatingInput">Email <span class="text-danger">*</span></label>
                        </div>
                        <span class="text-danger" id="errUser"></span>

                        <div class="form-floating mb-3">
                            <input type="password" value="${matKhau}" class="form-control" id="floatingPassword" name="matKhau" onkeyup="validate()" required>
                            <label for="floatingPassword">Password <span class="text-danger">*</span></label>
                        </div>
                        <span class="text-danger" id="errPass"></span>

                        <div class="form-check mb-3">
                            <input class="form-check-input" name="remember" type="checkbox" value="" id="rememberPasswordCheck" >
                            <label class="form-check-label" for="rememberPasswordCheck">
                                Remember password
                            </label>
                        </div>
                        <div class="d-grid">
                                <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit" onclick="validate()">
                                    Sign in
                                </button>
                        </div>
                        <hr class="my-4">

                        <div class="text-center">
                            <a href="/dang-ky"><b>Sign up</b></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script>
    function validate() {
        var matKhau = document.login.matKhau.value;
        var email = document.login.email.value;
        if (matKhau == ""){
            document.getElementById("errPass").innerHTML = "Mật khẩu không được trống";
        } else {
            document.getElementById("errPass").innerHTML = "";
        }
        if (email == "") {
            document.getElementById("errUser").innerHTML = "Email không được để trống";
        } else {
            var testEmail = /^[A-Za-z0-9]+(.)[A-Za-z0-9]+@[A-Za-z0-9]+$/;
            if (testEmail.test(email) == false) {
                document.getElementById("errUser").innerHTML = "Email của bạn không hợp lệ";
            }
            document.getElementById("errUser").innerHTML = "";
        }
    }
</script>
</body>
</html>