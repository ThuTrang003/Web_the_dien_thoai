<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="container">

    <div class="row">
        <div class="">
            <div class="row mt-3 mb-5">
                <h1 class="text-center mb-5 mt-2">Tạo khuyến mãi</h1>
                <div class="row">
                        <form action="/admin/khuyen-mai/add" method="post" name="km">
                            <div class="row">
                                <div class="col-6">
                                    <div class="ms-1 me-2">
                                        <div class="mb-3">
                                            <label class="form-label">Tên chiếm dịch khuyến mại <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" name="ten" required>
                                            <span class="text-danger" id="errten"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Ngày bắt đầu khuyến mại <span class="text-danger">*</span></label>
                                            <input type="date" class="form-control" name="ngayBatDau" required>
                                            <span class="text-danger" id="errngayBD"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="ms-1 me-2">
                                        <div class="mb-3">
                                            <label class="form-label">Mức khuyến mại (%) <span class="text-danger">*</span></label>
                                            <input type="number" class="form-control" name="tiemGiam" required>
                                            <span class="text-danger" id="errtienGiam"></span>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Ngày hết hạn khuyến mại <span class="text-danger">*</span></label>
                                            <input type="date" class="form-control" name="ngayKetThuc" required>
                                            <span class="text-danger" id="errngayKT"></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-success" type="submit" onclick="validate()">Thêm</button>
                            </div>
                        </form>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    function validate() {
        var mucGiam = document.km.tiemGiam.value;
        var ten = document.km.ten.value;
        var ngayBD = document.km.ngayBatDau.value;
        var ngayKT = document.km.ngayKetThuc.value;
        if (mucGiam == ""){
            document.getElementById("errtienGiam").innerHTML = "Giá trị khuyến mãi không được để trống";
        } else {
            document.getElementById("errtienGiam").innerHTML = "";
        }
        if (ten == "") {
            document.getElementById("errten").innerHTML = "Tên khuyến mãi không được để trống";
        } else {
            document.getElementById("errten").innerHTML = "";
        }
        if (ngayBD == "") {
            document.getElementById("errngayBD").innerHTML = "Ngày bắt đầu khuyến mại không được để trống";
        } else {
            document.getElementById("errngayBD").innerHTML = "";
        }
        if (ngayKT == "") {
            document.getElementById("errngayKT").innerHTML = "Ngày kết thúc khuyến mại không được để trống";
        } else {
            document.getElementById("errngayKT").innerHTML = "";
        }
    }
</script>

</body>
</html>