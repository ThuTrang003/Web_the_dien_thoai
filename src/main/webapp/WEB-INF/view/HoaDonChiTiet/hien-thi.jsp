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
        <form class="mt-2 mb-4">
            <c:if test="${message.length() > 0}">
                <div class="alert alert-success text-center mt-2 mb-3" role="alert">
                        ${message}
                </div>
            </c:if>
            <h2 class="text-center text-danger">Mã Hóa Đơn: ${hd_ct.hoaDon.ma}</h2>
            <div class="mt-3 mb-5">
                <h3 class="text-danger">Địa chỉ nhận hàng</h3>
                <h4><b>${hd_ct.hoaDon.tenNguoiNhan} (+84) ${hd_ct.hoaDon.khachHang.sdt}</b> ${hd_ct.hoaDon.khachHang.diaChi}</h4>
            </div>

            <div>
                <table class="table table-borderless">
                    <thead>
                    <tr>
                        <th>Thên thẻ</th>
                        <th>Nhà mạng</th>
                        <th>Số seri</th>
                        <th>Số thẻ</th>
                        <th>Đơn giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listHDCT}" var="hdct">
                        <tr>
                            <td>${hdct.chiTietTDT.theDienThoai.ten}</td>
                            <td>${hdct.chiTietTDT.theDienThoai.nhaMang.ten}</td>
                            <td>${hdct.chiTietTDT.soSeri}</td>
                            <td>${hdct.chiTietTDT.maThe}</td>
                            <td>${hdct.donGia}</td>
                            <td>${hdct.soLuong}</td>
                            <td>${hdct.donGia * hdct.soLuong}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div>
                <h4 class="text-success">Tổng tiền: ${tong}đ</h4>
            </div>

        </form>
    </div>


</div>

<!-- Footer -->


</body>
</html>