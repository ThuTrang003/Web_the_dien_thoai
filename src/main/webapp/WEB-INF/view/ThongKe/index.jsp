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
        <div class="row">
            <div class="col-md-8">
                <div class="me-2 ms-1">
                    <h4>Thống kê theo khoảng thời gian</h4>
                    <form action="/admin/thong-ke/ban-chay/ngay" name="ngay">
                        <div class="row">
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">Từ ngày</label>
                                    <input type="date" class="form-control" name="start" required>
                                    <span class="text-danger" id="errPass"></span>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">Đến ngày</label>
                                    <input type="date" class="form-control" name="end" required>
                                    <span class="text-danger" id="errUser"></span>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3 offset-6">
                            <button class="btn btn-success" type="submit">Thống kê</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                <div class="me-2 ms-1">
                    <form action="/admin/thong-ke/ban-chay/thang">
                        <div class="mb-3">
                            <label class="form-label">Theo tháng</label>
                            <select class="form-select" name="month">
                                <c:forEach  var = "i" begin = "1" end = "12">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <button class="btn btn-success" type="submit">Thống kê</button>
                        </div>
                    </form>
                </div>
            </div>
<%--            <div class="col-md-4">--%>
<%--                <div class="me-2 ms-1">--%>
<%--                    <form action="/admin/thong-ke-ban-chay/nam">--%>
<%--                        <div class="mb-3">--%>
<%--                            <label class="form-label">Theo năm</label>--%>
<%--                            <input type="text" class="form-control" name="year" >--%>
<%--                        </div>--%>
<%--                        <div class="mb-3">--%>
<%--                            <button class="btn btn-success" type="submit">Thống kê</button>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
        <c:if test="${listThongKe.isEmpty()}">
            <h3>Không có bản ghi nào!</h3>
        </c:if>
        <c:if test="${not listThongKe.isEmpty()}">
            <table class="table" >
                <thead>
                <tr>
                    <th>STT </th>
                    <th>Tên thẻ </th>
                    <th>Nhà mạng</th>
                    <th>Số lượng</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listThongKe}" var="tk" varStatus="theCount">
                    <tr>
                        <td>${theCount.index + 1}</td>
                        <td>${tk.ten}</td>
                        <td>${tk.nhaMang}</td>
                        <td>${tk.tongSL}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

</div>
<script>
    function validate() {
        var start = document.ngay.start.value;
        var end = document.ngay.end.value;
        if (start == ""){
            document.getElementById("errPass").innerHTML = "Ngày bắt đầu không được trống";
        } else {
            document.getElementById("errPass").innerHTML = "";
        }
        if (end == "") {
            document.getElementById("errUser").innerHTML = "Ngày kết thúc không được để trống";
        } else {
            document.getElementById("errUser").innerHTML = "";
        }
    }
</script>
</body>
</html>