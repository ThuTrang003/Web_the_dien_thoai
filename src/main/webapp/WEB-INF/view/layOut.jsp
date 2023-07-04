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
        <nav class="navbar navbar-expand-lg mt-5 mb-5">
            <div class="container-fluid">
                <a class="navbar-brand home" href="#" style="font-family: Times New Roman;
                                font-size: 45px;
                                color: #024137;">
                    <b><i>innisfree</i></b></a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="">
                    <ul class="navbar-nav me-auto ms-3 mb-2 mb-lg-0">
                        <li class="nav-item">
                            <div class="input-group">
                                <input type="text" size="35" class="form-control"
                                       placeholder="Phiên bản giới hạn mùa lễ hội" aria-label="Sizing example input"
                                       aria-describedby="inputGroup-sizing-default">
                                <span class="btn input-group-text bg-light" id="inputGroup-sizing-default">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                                </svg>
                                            </span>
                            </div>
                        </li>
                    </ul>

                    <form class="d-flex" role="search">
                        <ul class="nav user-menu">
                            <li class="nav-item dropdown has-arrow">
                                <a href="" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                                    <span>
                                        Xin chào: ${kh.ten}
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                          <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                          <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                        </svg>
                                    </span>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="/admin/hoa-don/list">Đơn mua</a>
                                    <a class="dropdown-item" href="/logout">Logout</a>
                                </div>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </nav>
    </div>

    <div class="row">
        <nav class="navbar navbar-expand-lg mb-4">
            <div class="container-fluid">
                <h5><a class="navbar-brand me-5" href="/admin/the-dien-thoai/list">Trang chủ</a>
                </h5>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item  mt-1">
                            <h5>
                                <div class="dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Thống kê
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="/admin/thong-ke/ban-chay/ngay">Mặt hàng bán chạy</a></li>
                                        <li><a class="dropdown-item" href="/admin/thong-ke/ton-kho/ngay">Mặt hàng tồn kho</a></li>
                                    </ul>
                                </div>
                            </h5>
                        </li>
                        <li class="nav-item mt-1 ms-1">
                            <h5>
                                <a class="nav-link" href="/admin/khuyen-mai/list">Khuyến mại</a>
                            </h5>
                        </li>
                    </ul>

                    <form class="d-flex" role="search">
                        <a class="btn btn-outline-success" href="/admin/gio-hang/list">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                 class="bi bi-cart" viewBox="0 0 16 16">
                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                            </svg>

                        </a>
                    </form>
                </div>
            </div>
        </nav>
    </div>


    <div class="row">
        <jsp:include page="${view}"/>
    </div>

</div>

<!-- Footer -->
<div class="" style="background: #024137;">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="row text-light mb-4 mt-4">
                    <h1><i>innisfree</i></h1>
                </div>
            </div>
        </div>
        <div class="row">

            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 text-light">
                            <li class="nav-item">
                                <a class="nav-link text-light" href="#">Chính sách giao hàng và thanh toán |</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-light" href="#">Chính sách bảo mật thông tin khách hàng |</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link text-light" href="#">
                                    Chính sách mua hàng |
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-light">Chính sách trả hàng</a>
                            </li>
                        </ul>

                    </div>
                </div>
            </nav>
        </div>
        <div class="pb-2 mt-4 text-light">
            <p>Thời gian làm việc: Thứ 2 ~ Thứ 6 9:00 ~ 17:00 (Trừ Thứ 7, Chủ Nhạt và ngày lễ)</p>
            <p>Tư vấn và chăm sóc khách hàng: 028 3627 9777 (Ext: 125)</p>
            <p>Email: cs_vn@innisfree.com</p>
        </div>

        <div class="pb-4 mt-4 text-light">
            <p>CÔNG TY TNHH AMOREPACIFIC VIỆT NAM</p>
            <p>Giấy CNĐKDN: 0309984165 - Ngầy cấp: 05/05/2010, được sửa đổi lần thứ 21, ngày 04/04/2022</p>
            <p>Cơ quan cấp: Phòng Đăng kí kinh doan - Sở Kế hoạch và Đầu tư TP.HCM</p>
            <p>Địa chỉ đăng kí kinh doanh: Lầu 4A, Tòa nhà Vincom, 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1, Tp. Hồ Chí
                Minh, Việt Nam.</p>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>