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
                <h1 class="text-center mb-5 mt-2">Thông tin chương trình khuyến mại</h1>
                <div class="">
                    <button class="btn btn-success">
                        <a class="nav-link text-white" href="/admin/khuyen-mai/view-add">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
                            </svg> Add
                        </a>
                    </button>
                </div>

                <c:if test="${listKM.isEmpty()}">
                    <h3>Không có bản ghi nào!</h3>
                </c:if>
                <c:if test="${not listKM.isEmpty()}">
                    <table class="table" >
                        <thead>
                        <tr>
                            <th>STT </th>
                            <th>Mã KM</th>
                            <th>Tên KM</th>
                            <th>Ngày bắt đầu</th>
                            <th>Ngày kết thúc</th>
                            <th>Mức giảm (%)</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listKM}" var="km" varStatus="theCount">
                            <tr>
                                <td>${theCount.index + 1}</td>
                                <td>${km.ma}</td>
                                <td>${km.ten}</td>
                                <td>${km.ngayBatDau}</td>
                                <td>${km.ngayKetThuc}</td>
                                <td>${km.tiemGiam}</td>
                                <td>
                                    <a class="btn btn-success" href="/admin/khuyen-mai/detail/${km.id}">Detail</a>
<%--                                    <a class="btn btn-primary" href="/admin/the-dien-thoai/view-update/${km.id}">Update</a>--%>
                                </td>
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