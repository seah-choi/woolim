<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-05-26
  Time: 오전 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                    <a href="./shop.html">Shop</a>
                    <span>Check Out</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Shopping Cart Section Begin -->
<section class="checkout-section spad">
    <div class="container">
        <form action="#" class="checkout-form">
            <div class="row">
                <jsp:include page="/WEB-INF/views/common/mypageSide.jsp"/>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="place-order">
                        <div class="order-total">
                            <hr>
                            <h4 class="d-flex justify-content-center">수강중인 강좌</h4>
                            <table class="table mt-5">
                                <thead class="table-secondary">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">강좌명</th>
                                    <th scope="col">가격</th>
                                    <th scope="col">수강가능 기간</th>
                                    <th scope="col"></th>
                                    <th scope="col"></th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${detailList}" var="dto">
                                        <c:if test="${dto.order_status == '구매 완료'}">
                                        <tr>
                                            <td style="width:25%; "><img src="/resources/img/lecture/${dto.lecture_image}"></td>
                                            <td>${dto.lecture_title}</td>
                                            <td>${dto.price}</td>
                                            <td>${dto.lecture_start_date} ~ ${dto.lecture_end_date}</td>
                                            <td><button class="btn btn-primary" type="button" onclick="refund(${dto.order_detail_idx},${dto.price},${dto.lecture_idx})">수강 취소</button></td>
                                        </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>
</section>
<!-- Shopping Cart Section End -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
<script>
    function refund(order_detail_idx,price,lecture_idx){
        let today = new Date();
        let rand = Math.floor(Math.random()*(1000000-0)+1);
        let hours = today.getHours(); // 시
        let minutes = today.getMinutes();  // 분
        let seconds = today.getSeconds();  // 초
        let milliseconds = today.getMilliseconds();
        let now = hours+minutes+seconds+milliseconds;
            $.ajax({
                url: "/mypage/refund.dox?",
                dataType: "json",
                type: "POST",
                data: {
                    order_detail_idx:order_detail_idx,
                    price:price,
                    lecture_idx:lecture_idx,
                    cart_status:"환불",
                    payment_num:now+"-"+rand
                },
                success: function (data) {
                    if (data.result == "success") {
                        alert(data.msg);
                        location.href = "/mypage/lecture";
                    } else if (data.result == "false") {
                        alert(data.msg);
                    } else {
                        alert(data.msg);
                    }
                },
                fail: function (data) {

                }

            });

    }
</script>
</body>
</html>
