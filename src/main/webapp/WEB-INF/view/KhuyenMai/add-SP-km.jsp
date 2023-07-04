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
        <div class="col-md-10 offset-1">
            <div class="row mt-3 mb-5">
                <h1 class="text-center mb-5 mt-2">Danh sách Thẻ điện thoại tồn kho</h1>
                <form id="productForm" method="post" action="/admin/khuyen-mai-ct/add-sp-km/${id_km}">
                    <input type="hidden" name="selectedProducts" id="selectedProducts" value="${selectedProducts}">
                    <c:if test="${listCT.isEmpty()}">
                        <h3>Không có bản ghi nào!</h3>
                    </c:if>
                    <c:if test="${not listCT.isEmpty()}">
                        <table class="table" >
                            <thead class="table-info">
                            <tr>
                                <th>#</th>
                                <th>ID</th>
                                <th>Mã thẻ</th>
                                <th>Tên thẻ</th>
                                <th>Số seri</th>
                                <th>Giá bán</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listCT}" var="ctsp" varStatus="theCount">
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td class="id">${ctsp.id}</td>
                                    <td class="ma">${ctsp.ma}</td>
                                    <td class="ten">${ctsp.theDienThoai.ten}</td>
                                    <td class="soSeri">${ctsp.soSeri}</td>
                                    <td class="giaBan">${ctsp.giaBan}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <div class="mb-3">
                        <button class="btn btn-success" type="button" onclick="addProducts()">Thêm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
<script>
    function addProducts() {
        // Lấy tất cả các checkbox đã được chọn
        var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');

        // Tạo một mảng để lưu trữ các sản phẩm đã chọn
        var selectedProducts = [];

        // Duyệt qua các checkbox và lấy thông tin sản phẩm đã chọn
        checkboxes.forEach(function(checkbox) {
            var row = checkbox.closest('tr'); // Tìm đến thẻ tr cha của checkbox
            // var product = {
            //     id: row.querySelector('.id').textContent
            // };
            var product = row.querySelector('.id').textContent;
            selectedProducts.push(product);
        });

        // Đẩy thông tin sản phẩm đã chọn vào input ẩn trong form để gửi đi
        var selectedProductsInput = document.getElementById('selectedProducts');
        selectedProductsInput.value = JSON.stringify(selectedProducts);

        // Submit form
        document.getElementById('productForm').submit();
    }

</script>

</body>
</html>