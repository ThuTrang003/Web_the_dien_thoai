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
        <h1 class="text-center mb-5 mt-2">Quản lý thẻ điện thoại</h1>
        <form class="col-md-6 offset-3" action="${action}" method="post" name="tdt">
            <div class="mb-3 row">
                    <div class="mb-3">
                        <label class="form-label">Mã thẻ điện thoại <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="ma" required value="${tdt.ma}">
                        <span class="text-danger" id="errma"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tên thẻ <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="ten" required value="${tdt.ten}">
                        <span class="text-danger" id="errten"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Nhà mạng <span class="text-danger">*</span></label>
                        <select class="form-select" name="nhaMang" >
                            <c:forEach items="${listNM}" var="nm">
                                <option value="${nm.id}" ${tdt.nhaMang.id == nm.id ? "selected" : ""}>${nm.ten}</option>
                            </c:forEach>
                        </select>
                    </div>
<%--                    <div class="mb-3">--%>
<%--                        <label class="form-label">Số lượng tồn</label>--%>
<%--                        <input type="number" class="form-control" name="soLuongTon"  required value="${tdt.soLuongTon}">--%>
<%--                    </div>--%>
            </div>

            <div class="mb-3">
                <button class="btn btn-success" type="submit" onclick="if (!confirm('${message}')){return false;} validate()" >Save</button>
            </div>
        </form>
    </div>
</div>

<script>
    function validate() {
        var ma = document.tdt.ma.value;
        var ten = document.tdt.ten.value;
        if (ma == ""){
            document.getElementById("errma").innerHTML = "Mã không được trống";
        } else {
            document.getElementById("errma").innerHTML = "";
        }
        if (ten == "") {
            document.getElementById("errten").innerHTML = "Tên thẻ không được để trống";
        } else {
            document.getElementById("errten").innerHTML = "";
        }
    }
</script>

</body>
</html>