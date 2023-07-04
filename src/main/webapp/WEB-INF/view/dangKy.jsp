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
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">

            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-3 p-sm-4">
                    <h4 class="card-title text-center mb-3 fw-light fs-5">Đăng ký</h4>
                    <form method="POST" action="/dang-ky" name="khachHang">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingTen" name="ten" required>
                            <label for="floatingTen">Tên <span class="text-danger">*</span></label>
                        </div>
                        <span class="text-danger" id="errten"></span>
                        <div class="form-floating mb-3">
                            <input type="date" class="form-control" id="floatingNgaySinh" name="ngaySinh" required>
                            <label for="floatingNgaySinh">Ngày sinh <span class="text-danger">*</span></label>
                        </div>
                        <span class="text-danger" id="errNS"></span>
                        <div class="form-floating mb-3">
                            <input type="tel" class="form-control" id="floatingSDT" name="sdt" required>
                            <label for="floatingSDT">SĐT <span class="text-danger">*</span></label>
                        </div>
                        <span class="text-danger" id="errsdt"></span>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingDiaChi" name="diaChi" required>
                            <label for="floatingSDT">Địa chỉ <span class="text-danger">*</span></label>
                        </div>
                        <span class="text-danger" id="errdiaChi"></span>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingThanhPho" name="thanhPho" required>
                            <label for="floatingThanhPho">Thành phố <span class="text-danger">*</span></label>
                        </div>
                        <span class="text-danger" id="errthanhPho"></span>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="floatingmatKhau" name="matKhau" required>
                            <label for="floatingmatKhau">Mật khẩu <span class="text-danger">*</span></label>
                        </div>
                        <span class="text-danger" id="errpass"></span>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingpass" name="email" required>
                            <label for="floatingpass">Email <span class="text-danger">*</span></label>
                        </div>
                        <span class="text-danger" id="erremail"></span>

                        <div class="d-grid">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit" onclick="validate()">Đăng ký</button>
                        </div>
                        <hr class="my-4">

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
        var ten = document.khachHang.ten.value;
        var ns = document.khachHang.ngaySinh.value;
        var sdt = document.khachHang.sdt.value;
        var diaCHi = document.khachHang.diaChi.value;
        var thanhPho = document.khachHang.thanhPho.value;
        var pass = document.khachHang.matKhau.value;
        var email = document.khachHang.email.value;

        if (ten == "") {
            document.getElementById("errten").innerHTML = "Tên không được để trống";
        } else {
            document.getElementById("errten").innerHTML = "";
        }
        if (tenDem == "") {
            document.getElementById("errtenDem").innerHTML = "Tên đệm không được để trống";
        } else {
            document.getElementById("errtenDem").innerHTML = "";
        }
        if (ho == "") {
            document.getElementById("errho").innerHTML = "Họ không được để trống";
        } else {
            document.getElementById("errho").innerHTML = "";
        }
        if (ns == "") {
            document.getElementById("errNS").innerHTML = "Ngày sinh không được để trống";
        } else {
            document.getElementById("errNS").innerHTML = "";
        }
        if (sdt == "") {
            document.getElementById("errsdt").innerHTML = "Số điện thoại không được để trống";
        } else {
            var testSDT = /^0[1-9][0-9]{8}$/;
            if (testSDT.test(sdt) == false) {
                document.getElementById("errsdt").innerHTML = "Số điện thoại phải là 10 số và bắt đầu bằng số 0";
            }
            document.getElementById("errsdt").innerHTML = "";
        }
        if (diaCHi == "") {
            document.getElementById("errdiaChi").innerHTML = "Địa chỉ không được để trống";
        } else {
            document.getElementById("errdiaChi").innerHTML = "";
        }
        if (pass == "") {
            document.getElementById("errpass").innerHTML = "Mật khẩu không được để trống";
        } else {
            document.getElementById("errpass").innerHTML = "";
        }
        if (thanhPho == "") {
            document.getElementById("errthanhPho").innerHTML = "Thành phố không được để trống";
        } else {
            document.getElementById("errthanhPho").innerHTML = "";
        }
        if (email == "") {
            document.getElementById("erremail").innerHTML = "Email không được để trống";
        } else {
            var testEmail = /^[A-Za-z0-9]+(.)[A-Za-z0-9]+@[A-Za-z0-9]+$/;
            if (testEmail.test(email) == false) {
                document.getElementById("erremail").innerHTML = "Email của bạn không hợp lệ";
            }
            document.getElementById("erremail").innerHTML = "";
        }
    }
</script>

</body>
</html>