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
<%--    <div class="row">--%>
<%--        <nav class="navbar navbar-expand-lg mt-5 mb-5">--%>
<%--            <div class="container-fluid">--%>
<%--                <a class="navbar-brand home" href="#" style="font-family: Times New Roman;--%>
<%--                                font-size: 45px;--%>
<%--                                color: #024137;">--%>
<%--                    <b><i>innisfree</i></b></a>--%>

<%--                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"--%>
<%--                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--%>
<%--                        aria-expanded="false" aria-label="Toggle navigation">--%>
<%--                    <span class="navbar-toggler-icon"></span>--%>
<%--                </button>--%>
<%--                <div class="collapse navbar-collapse" id="">--%>
<%--                    <ul class="navbar-nav me-auto ms-3 mb-2 mb-lg-0">--%>
<%--                        <li class="nav-item">--%>
<%--                            <div class="input-group">--%>
<%--                                <input type="text" size="35" class="form-control"--%>
<%--                                       placeholder="Phiên bản giới hạn mùa lễ hội" aria-label="Sizing example input"--%>
<%--                                       aria-describedby="inputGroup-sizing-default">--%>
<%--                                <span class="btn input-group-text bg-light" id="inputGroup-sizing-default">--%>
<%--                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"--%>
<%--                                                     fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">--%>
<%--                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>--%>
<%--                                                </svg>--%>
<%--                                            </span>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>

<%--                    <form class="d-flex" role="search">--%>
<%--                        &lt;%&ndash;                        <label class="me-5 mt-2"><a href="/Trangdttph27721_ASM_war_exploded/login" class="nav-link"><b>Đăng&ndash;%&gt;--%>
<%--                        &lt;%&ndash;                            nhập</b></a></label>&ndash;%&gt;--%>
<%--                        <label class="me-5 mt-2"><a href=""--%>
<%--                                                    class="nav-link"><b>Đăng ký</b></a></label>--%>
<%--                        &lt;%&ndash;                        <label class="me-5 mt-2"><b>Xin chào: Đỗ Trang</b></label>&ndash;%&gt;--%>

<%--                        <!-- Example single danger button -->--%>

<%--                        <ul class="nav user-menu">--%>
<%--                            <li class="nav-item dropdown has-arrow">--%>
<%--                                <a href="" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">--%>
<%--                                    <span>--%>
<%--                                        Xin chào:--%>
<%--                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">--%>
<%--                                          <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>--%>
<%--                                          <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>--%>
<%--                                        </svg>--%>
<%--                                    </span>--%>
<%--                                </a>--%>
<%--                                <div class="dropdown-menu">--%>
<%--                                    <a class="dropdown-item" href="">Đơn mua</a>--%>
<%--                                    <a class="dropdown-item" href="">Logout</a>--%>
<%--                                </div>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </nav>--%>
<%--    </div>--%>

<%--    <div class="row">--%>
<%--        <nav class="navbar navbar-expand-lg mb-4">--%>
<%--            <div class="container-fluid">--%>
<%--                <h5><a class="navbar-brand me-5" href="">Trang chủ</a>--%>
<%--                </h5>--%>
<%--                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"--%>
<%--                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"--%>
<%--                        aria-expanded="false" aria-label="Toggle navigation">--%>
<%--                    <span class="navbar-toggler-icon"></span>--%>
<%--                </button>--%>
<%--                <div class="collapse navbar-collapse">--%>
<%--                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">--%>
<%--                        <li class="nav-item  mt-1">--%>
<%--                            <h5><a class="nav-link" href="">Sản phẩm</a></h5>--%>
<%--                        </li>--%>
<%--                    </ul>--%>

<%--                    <form class="d-flex" role="search">--%>
<%--                        <a class="btn btn-outline-success" href="">--%>
<%--                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"--%>
<%--                                 class="bi bi-cart" viewBox="0 0 16 16">--%>
<%--                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>--%>
<%--                            </svg>--%>

<%--                        </a>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </nav>--%>
<%--    </div>--%>

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
                <h1 class="text-center mb-5 mt-2">Danh sách Thẻ điện thoại</h1>
                <div class="">
                    <button class="btn btn-success">
                        <a class="nav-link text-white" href="/admin/the-dien-thoai/view-add">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
                            </svg> Add
                        </a>
                    </button>
                </div>

                <c:if test="${tdtPage.isEmpty()}">
                    <h3>Không có bản ghi nào!</h3>
                </c:if>
                <c:if test="${not tdtPage.isEmpty()}">
                    <table class="table" >
                        <thead>
                        <tr>
                            <th>STT </th>
                            <th>Mã thẻ </th>
                            <th>Tên nhà mạng </th>
                            <th>Tên thẻ</th>
                            <th>Số lượng tồn</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${tdtPage.getContent()}" var="tdt" varStatus="theCount">
                            <tr>
                                <td>${theCount.index + 1}</td>
                                <td>${tdt.ma}</td>
                                <td>${tdt.nhaMang.ten}</td>
                                <td>${tdt.ten}</td>
                                <td>${tdt.soLuongTon}</td>
                                <td>
                                    <a class="btn btn-success" href="/admin/the-dien-thoai-chi-tiet/list/${tdt.id}">Detail</a>
                                    <a class="btn btn-primary" href="/admin/the-dien-thoai/view-update/${tdt.id}">Update</a>
                                    <a class="btn btn-danger" href="/admin/the-dien-thoai/delete/${tdt.id}"
                                        onclick="if (!confirm('Bạn có chắc muốn xóa bản ghi này không')){return false;}">
                                        Delete
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
                        <li class="page-item ${tdtPage.getNumber() + 1 > 1 ? '' : 'disabled'}">
                            <a class="page-link" href="?page=${tdtPage.getNumber()}">Previous</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link">
                                ${tdtPage.getNumber() + 1} / ${tdtPage.getTotalPages()}
                            </a>
                        </li>
                        <li class="page-item ${tdtPage.getNumber() + 1 lt tdtPage.getTotalPages() ? '' : 'disabled'}">
                            <a class="page-link" href="?page=${tdtPage.getNumber() + 2}">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

<%--        <div class="col-md-3">--%>
<%--            <form action="">--%>
<%--                <h2 class="text-center mt-3 mb-4">Bộ lọc</h2>--%>
<%--                <div class="mb-3">--%>
<%--                    <label class="form-label">Tên thẻ điện thoại</label>--%>
<%--                    <div class="input-group">--%>
<%--                        <select class="form-select" name="tenTheDT" >--%>
<%--                            <option value="">Tất cả</option>--%>
<%--&lt;%&ndash;                            <c:forEach items="${listTDT}" var="tdt">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <option value="${tdt.id}" >${tdt.ten}</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </c:forEach>&ndash;%&gt;--%>
<%--                        </select>--%>
<%--                        <button class="btn btn-primary">--%>
<%--                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-funnel" viewBox="0 0 16 16">--%>
<%--                                <path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2zm1 .5v1.308l4.372 4.858A.5.5 0 0 1 7 8.5v5.306l2-.666V8.5a.5.5 0 0 1 .128-.334L13.5 3.308V2h-11z"/>--%>
<%--                            </svg>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>

<%--            <form action="">--%>
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


</body>
</html>