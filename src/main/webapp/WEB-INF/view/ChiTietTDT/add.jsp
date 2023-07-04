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

    <div class="row mt-3 mb-5">
        <h1 class="text-center mb-5 mt-2">Quản lý thẻ điện thoại</h1>
        <form class="col-md-8 offset-2" action="${action}" method="post" name="chiTietTDT">
            <div class="mb-3 row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Mã thẻ điện thoại</label>
                        <input type="text" class="form-control" name="ma" required value="${chiTietTDT.ma}">
                        <span class="text-danger" id="errma"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số thẻ</label>
                        <input type="number" class="form-control" name="maThe" required value="${chiTietTDT.maThe}">
                        <span class="text-danger" id="errmaThe"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Số seri</label>
                        <input type="number" class="form-control" name="soSeri"  required value="${chiTietTDT.soSeri}">
                        <span class="text-danger" id="errsoSeri"></span>
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Thẻ điện thoại</label>
                        <select class="form-select" name="theDienThoai" >
                            <c:forEach items="${listTDT}" var="tdt">
                                <option value="${tdt.id}" ${chiTietTDT.theDienThoai.id == tdt.id ? "selected" : ""} >${tdt.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Đơn giá</label>
                        <input type="text" class="form-control" name="giaBan" required value="${chiTietTDT.giaBan}">
                        <span class="text-danger" id="errgiaBan"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Mô tả</label>
                        <input type="text" class="form-control" name="moTa" required value="${chiTietTDT.moTa}">
                        <span class="text-danger" id="errmoTa"></span>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <button class="btn btn-success" type="submit" onclick="if (!confirm('${message}')){return false;} validate()" >Save</button>
            </div>
        </form>
    </div>
</div>
<script>
    function validate() {
        var ma = document.chiTietTDT.ma.value.trim();
        var maThe = document.chiTietTDT.maThe.value.trim();
        var soSeri = document.chiTietTDT.soSeri.value.trim();
        var donGia = document.chiTietTDT.giaBan.value.trim();
        var moTa = document.chiTietTDT.moTa.value.trim();
        if (ma == ""){
            document.getElementById("errma").innerHTML = "Mã thẻ điện thoại không được trống";
        } else {
            document.getElementById("errma").innerHTML = "";
        }
        if (maThe == ""){
            var so = /^\d{10,20}$/;
            if (so.test(maThe) == false) {
                document.getElementById("errmaThe").innerHTML = "Số thẻ là chuỗi số từ 10 đến 20 chữ số";
            }
            document.getElementById("errmaThe").innerHTML = "Số thẻ không được trống";
        } else {
            document.getElementById("errmaThe").innerHTML = "";
        }
        if (soSeri == ""){
            document.getElementById("errsoSeri").innerHTML = "Số Seri không được trống";
        } else {
            var so = /^\d{10,15}$/;
            if (so.test(soSeri) == false) {
                document.getElementById("errsoSeri").innerHTML = "Số Seri là chuỗi số từ 10 đến 15 chữ số";
            }
            document.getElementById("errsoSeri").innerHTML = "";
        }
        if (donGia == ""){
            document.getElementById("errgiaBan").innerHTML = "Đơn giá không được trống";
        } else {
            var so = /^[1-9]+[0-9]*$/;
            if (so.test(donGia) == false) {
                document.getElementById("errgiaBan").innerHTML = "Đơn giá phải là số";
            }
            var leng = /^\d{1,20}$/;
            if (leng.test(donGia) == false) {
                document.getElementById("errgiaBan").innerHTML = "Đơn giá đã quá giới hạn tiền tệ";
            }
            document.getElementById("errgiaBan").innerHTML = "";
        }
        if (moTa == "") {
            document.getElementById("errmoTa").innerHTML = "Mô tả không được để trống";
        } else {
            document.getElementById("errmoTa").innerHTML = "";
        }
    }
</script>

</body>
</html>