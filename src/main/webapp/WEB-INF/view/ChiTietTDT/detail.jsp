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
<%--        <h1 class="text-center mb-5 mt-2">Thông tin thẻ</h1>--%>
        <div class="col-md-6 offset-3">
            <form method="post" action="/admin/gio-hang/add/${ctTheDT.id}">
                <div class="row card" style="">
                    <div class="card-body">
                        <h3 class="card-title mb-2">${ctTheDT.theDienThoai.ten}</h3>
                        <p class="card-text">Nhà mạng: ${ctTheDT.theDienThoai.nhaMang.ten}</p>
                        <p class="card-text">Mệnh giá: ${ctTheDT.giaBan} đ</p>
                        <p class="card-text">Số seri: <b>${ctTheDT.soSeri}</b> </p>
                        <p class="card-text">Mô tả: ${ctTheDT.moTa}</p>
                        <c:if test="${not giaSauGiam.isEmpty() }">
                            <h4 class="card-text">Giá giảm còn : <span class="text-danger">${giaSauGiam} đ</span></h4>
                        </c:if>
                        <input type="hidden" name="donGiaKhiGiam" value="${giaSauGiam.isEmpty() ? ctTheDT.giaBan : giaSauGiam}">
                        <button class="btn btn-outline-success mt-5 mb-2" type="submit">Thêm vào giỏ hàng</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>



</body>
</html>