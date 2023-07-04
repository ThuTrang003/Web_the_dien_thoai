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
    <c:if test="${message.length() > 0}">
        <div class="alert alert-success text-center mt-3 mb-3" role="alert">
            ${message}
        </div>
    </c:if>
    <c:if test="${messageDelete.length() > 0}">
        <div class="alert alert-danger text-center mt-3 mb-3" role="alert">
            ${messageDelete}
        </div>
    </c:if>
    <div class="row">
        <div class="col-md-10 offset-1">
            <div class="row mt-3 mb-5">
                <h1 class="text-center mb-5 mt-2">Danh sách Thẻ điện thoại ${ten_the}</h1>
                <div class="">
                    <button class="btn btn-success">
                        <a class="nav-link text-white" href="/admin/the-dien-thoai-chi-tiet/view-add">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
                            </svg> Add
                        </a>
                    </button>
                </div>
                <c:if test="${tietTDTPage.isEmpty()}">
                    <h3>Không có bản ghi nào!</h3>
                </c:if>
                <c:if test="${not tietTDTPage.isEmpty()}">
                    <table class="table" >
                        <thead>
                        <tr>
                            <th>STT </th>
                            <th>Mã thẻ</th>
                            <th>Tên thẻ </th>
                            <th>Số thẻ </th>
                            <th>Số seri</th>
<%--                            <th>Trạng thái</th>--%>
                            <th>Giá bán</th>
                            <th>Giá giảm</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${tietTDTPage.getContent()}" var="ctsp" varStatus="theCount">
                            <tr>
                                <td>${theCount.index + 1}</td>
                                <td>${ctsp.ma}</td>
                                <td>${ctsp.theDienThoai.ten}</td>
                                <td>${ctsp.maThe}</td>
                                <td>${ctsp.soSeri}</td>
<%--                                <td>${ctsp.trangThai == 1 ? "Chưa sử dụng" : "Đã sử dụng"}</td>--%>
                                <td>${ctsp.giaBan}</td>
                                <td>${ctsp.giaSauGiam == null ? "__" : ctsp.giaSauGiam}</td>
                                <td>
                                    <a class="btn btn-primary" href="/admin/the-dien-thoai-chi-tiet/view-update/${ctsp.id}">Update</a>
                                    <a class="btn btn-danger" href="/admin/the-dien-thoai-chi-tiet/delete/${ctsp.id}"
                                       onclick="if (!confirm('Bạn có chắc muốn xóa bản ghi này không')){return false;}">
                                        Delete
                                    </a>
                                    <a class="btn btn-success" href="/admin/the-dien-thoai-chi-tiet/detail/${ctsp.id}">
                                        Detail
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>

            </div>

            <div class="row ">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${tietTDTPage.getNumber() + 1 > 1 ? '' : 'disabled'}">
                            <a class="page-link" href="?page=${tietTDTPage.getNumber()}&tenTheDT=${param.tenTheDT}&begin=${param.begin}&end=${param.end}">Previous</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">
                                ${tietTDTPage.getNumber() + 1} / ${tietTDTPage.getTotalPages()}
                            </a>
                        </li>
                        <li class="page-item ${tietTDTPage.getNumber() + 1 lt tietTDTPage.getTotalPages() ? '' : 'disabled'}">
                            <a class="page-link" href="?page=${tietTDTPage.getNumber() + 2}&tenTheDT=${param.tenTheDT}&begin=${param.begin}&end=${param.end}">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

<%--        <div class="col-md-3">--%>
<%--            <form action="/admin/the-dien-thoai-chi-tiet/list">--%>
<%--                <h2 class="text-center mt-3 mb-4">Bộ lọc</h2>--%>
<%--                <div class="mb-3">--%>
<%--                    <label class="form-label">Tên thẻ điện thoại</label>--%>
<%--                    <div class="input-group">--%>
<%--                        <select class="form-select" name="tenTheDT" >--%>
<%--                            <option value="">Tất cả</option>--%>
<%--                            <c:forEach items="${listTDT}" var="tdt">--%>
<%--                                <option value="${tdt.id}" >${tdt.ten}</option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                        <button class="btn btn-primary">--%>
<%--                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">--%>
<%--                                <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z"/>--%>
<%--                            </svg>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>

<%--            <form action="/admin/the-dien-thoai-chi-tiet/search">--%>
<%--                <div class="mb-3">--%>
<%--                    <label class="form-label">Khoảng giá</label>--%>
<%--                    <div class="input-group">--%>
<%--                        <label class="form-label">Từ: </label>--%>
<%--                        <input class="form-control" type="number" value="0" name="begin">--%>
<%--                        <label class="form-label"> đ - Đến: </label>--%>
<%--                        <input class="form-control" type="number" value="0" name="end">--%>
<%--                        <label class="form-label"> đ</label>--%>
<%--                        <button class="btn btn-primary">--%>
<%--                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">--%>
<%--                                <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z"/>--%>
<%--                            </svg>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
    </div>


</div>


<!-- Footer -->
<%--<div class="" style="background: #024137;">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-8">--%>
<%--                <div class="row text-light mb-4 mt-4">--%>
<%--                    <h1><i>innisfree</i></h1>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="row">--%>

<%--            <nav class="navbar navbar-expand-lg">--%>
<%--                <div class="container-fluid">--%>
<%--                    <div class="collapse navbar-collapse" id="navbarSupportedContent">--%>
<%--                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 text-light">--%>
<%--                            <li class="nav-item">--%>
<%--                                <a class="nav-link text-light" href="#">Chính sách giao hàng và thanh toán |</a>--%>
<%--                            </li>--%>
<%--                            <li class="nav-item">--%>
<%--                                <a class="nav-link text-light" href="#">Chính sách bảo mật thông tin khách hàng |</a>--%>
<%--                            </li>--%>
<%--                            <li class="nav-item dropdown">--%>
<%--                                <a class="nav-link text-light" href="#">--%>
<%--                                    Chính sách mua hàng |--%>
<%--                                </a>--%>
<%--                            </li>--%>
<%--                            <li class="nav-item">--%>
<%--                                <a class="nav-link text-light">Chính sách trả hàng</a>--%>
<%--                            </li>--%>
<%--                        </ul>--%>

<%--                    </div>--%>
<%--                </div>--%>
<%--            </nav>--%>
<%--        </div>--%>
<%--        <div class="pb-2 mt-4 text-light">--%>
<%--            <p>Thời gian làm việc: Thứ 2 ~ Thứ 6 9:00 ~ 17:00 (Trừ Thứ 7, Chủ Nhạt và ngày lễ)</p>--%>
<%--            <p>Tư vấn và chăm sóc khách hàng: 028 3627 9777 (Ext: 125)</p>--%>
<%--            <p>Email: cs_vn@innisfree.com</p>--%>
<%--        </div>--%>

<%--        <div class="pb-4 mt-4 text-light">--%>
<%--            <p>CÔNG TY TNHH AMOREPACIFIC VIỆT NAM</p>--%>
<%--            <p>Giấy CNĐKDN: 0309984165 - Ngầy cấp: 05/05/2010, được sửa đổi lần thứ 21, ngày 04/04/2022</p>--%>
<%--            <p>Cơ quan cấp: Phòng Đăng kí kinh doan - Sở Kế hoạch và Đầu tư TP.HCM</p>--%>
<%--            <p>Địa chỉ đăng kí kinh doanh: Lầu 4A, Tòa nhà Vincom, 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1, Tp. Hồ Chí--%>
<%--                Minh, Việt Nam.</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

</body>
</html>