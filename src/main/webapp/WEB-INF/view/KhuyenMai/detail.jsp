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
                <h1 class="text-center mb-5 mt-2">Thông tin Thẻ điện thoại khuyến mại</h1>

                <c:if test="${listKMCT.isEmpty()}">
                    <h3>Không có bản ghi nào!</h3>
                </c:if>
                <c:if test="${not listKMCT.isEmpty()}">
                    <table class="table" >
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Mã KM</th>
                            <th>Tên KM</th>
                            <th>Tên thẻ</th>
                            <th>Mã thẻ</th>
                            <th>Số Seri thẻ</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listKMCT}" var="km" varStatus="theCount">
                                <tr>
                                    <td>${theCount.index + 1}</td>
                                    <td>${km.khuyenMai.ma}</td>
                                    <td>${km.khuyenMai.ten}</td>
                                    <td>${km.chiTietTDT.theDienThoai.ten}</td>
                                    <td>${km.chiTietTDT.maThe}</td>
                                    <td>${km.chiTietTDT.soSeri}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </div>
        </div>
    </div>


</div>

<!-- Footer -->


</body>
</html>