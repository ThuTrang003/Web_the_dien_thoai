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
                <h1 class="text-center mb-5 mt-2">Giỏ hàng</h1>
                <c:if test="${messageDelete.length() > 0}">
                    <div class="alert alert-danger text-center mt-3 mb-3" role="alert">
                            ${messageDelete}
                    </div>
                </c:if>
                <c:if test="${message.length() > 0}">
                    <div class="alert alert-success text-center mt-3 mb-3" role="alert">
                            ${message}
                    </div>
                </c:if>
                <c:if test="${gioHangCTPage.isEmpty()}">
                    <h3>Không có bản ghi nào!</h3>
                </c:if>
                <c:if test="${not gioHangCTPage.isEmpty()}">
                    <table class="table" >
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên thẻ</th>
                            <th>Số seri</th>
                            <th>Mô tả</th>
                            <th>Đơn giá</th>
                            <th>Số tiền</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${gioHangCTPage.getContent()}" var="ghct" varStatus="theCount">
                            <tr>
                                <td>${theCount.index + 1}</td>
                                <td>${ghct.chiTietTDT.theDienThoai.ten}</td>
                                <td>${ghct.chiTietTDT.soSeri}</td>
                                <td>${ghct.chiTietTDT.moTa}</td>
                                <td>${ghct.donGia}</td>
                                <td>${ghct.donGiaKhiGiam}</td>
                                <td>
                                    <a class="btn btn-danger" href="/admin/gio-hang/delete/${ghct.id}"
                                       onclick="if (!confirm('Bạn có chắc muốn xóa bản ghi này không')){return false;}">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <div class="col-2 offset-9">
                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Mua hàng</button>
                </div>
            </div>

            <div class="row ">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${gioHangCTPage.getNumber() + 1 > 1 ? '' : 'disabled'}">
                            <a class="page-link" href="?page=${gioHangCTPage.getNumber()}">Previous</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">
                                ${gioHangCTPage.getNumber() + 1} / ${gioHangCTPage.getTotalPages()}
                            </a>
                        </li>
                        <li class="page-item ${gioHangCTPage.getNumber() + 1 lt gioHangCTPage.getTotalPages() ? '' : 'disabled'}">
                            <a class="page-link" href="?page=${gioHangCTPage.getNumber() + 2}">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>

            <!-- Modal thông tin đơn hàng-->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Thông tin đơn hàng</h1>

                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form name="donHang" method="post" action="/admin/hoa-don-chi-tiet/add">

                            <div class="modal-body">
                                <div class="form-floating mb-3">
                                    <input type="text"  class="form-control" id="name" name="ten" value="${kh.ten}" readonly>
                                    <label for="name">Tên tài khoản </label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="diaChi" name="diaChi" value="${kh.diaChi}, ${kh.thanhPho}"  required>
                                    <label for="diaChi">Địa chỉ <span class="text-danger">*</span></label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="tel"  class="form-control" id="sdt" name="sdt" value="${kh.sdt}"  required>
                                    <label for="sdt">Số điện thoại <span class="text-danger">*</span></label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text"  class="form-control" id="nguoiNhan" name="tenNguoiNhan" value="${kh.ten}" onkeyup="validate()" required>
                                    <label for="nguoiNhan">Tên người nhận <span class="text-danger">*</span></label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="text"  class="form-control" name="" value="${tong}" readonly>
                                    <label>Thành tiền</label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Đặt hàng</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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