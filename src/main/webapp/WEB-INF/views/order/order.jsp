<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-05-22
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | 강좌 구매</title>

    <!-- Google Font -->
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
</head>
<body>
<div id="preloder">
    <div class="loader"></div>
</div>
<!-- Header Section Begin -->
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Header End -->

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="/"><i class="fa fa-home"></i> Home</a>
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
            <div class="row product-tab">
                <div class="col-lg-6">
                    <div class="checkout-content">
                        <a href="/mypage/pointcharge" class="content-btn">포인트 충전하기</a>
                    </div>
                    <h4>강좌 정보</h4>
                    <div class="row">
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <c:forEach items="${dtoList}" var="list">
                                <div class="tab-pane fade-in" id="tab-${list.lecture_idx}" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row place-order">
                                            <div class="col-lg-8">
                                                <img src="/resources/img/lecture/${list.lecture_image}" alt="">
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="order-total">
                                                    <div class="tab-item">
                                                        <ul class="order-table">
                                                            <li>상세 정보</li>
                                                            <li class="fw-normal">강좌 이름 <span>${list.lecture_title}</span></li>
                                                            <li class="fw-normal">강사 <span>${list.member_name}</span></li>
                                                            <li class="fw-normal">원가 <span>${list.lecture_price}</span></li>
                                                            <li class="total-price">할인가 <span>${list.lecture_sale_price}</span></li>
                                                            <li class="fw-normal">강의 시작일 <span>${list.lecture_start_date}</span></li>
                                                            <li class="fw-normal">강의 종료일 <span>${list.lecture_end_date}</span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="mt-5">
                                                    <h5>강의 소개</h5>
                                                    <p>${list.lecture_study} </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="checkout-content">
                        <a href="#" class="content-btn"> 수강 취소하기</a>
                    </div>
                    <div class="place-order" style="position:sticky; bottom:200px; top:250px">
                        <h4>구매 리스트</h4>
                        <div class="order-total">
                            <div class="tab-item">
                                <ul class="order-table nav" style="display:block;" role="tablist">
                                    <li>강좌 <span>가격</span></li>
                                    <c:forEach items="${dtoList}" var="list">
                                        <li class="fw-normal"><a class data-toggle="tab" href="#tab-${list.lecture_idx}" role="tab">${list.lecture_title}</a> <span>${list.lecture_sale_price}</span></li>
                                    </c:forEach>
                                    <li class="total-price">전체 가격 <span>${total_price}</span></li>
                                </ul>
                            </div>

                            <ul class="order-table">
                                <li><span>포인트</span></li>
                                <li class="fw-normal">보유 포인트 <span>${memberDTO.member_point}</span></li>
                                <li class="total-price">구매 후 포인트 <span>${memberDTO.member_point-total_price}</span></li>
                            </ul>
<%--                            <div class="payment-check">--%>
<%--                                <div class="pc-item">--%>
<%--                                    <label for="pc-check">--%>
<%--                                        Cheque Payment--%>
<%--                                        <input type="checkbox" id="pc-check">--%>
<%--                                        <span class="checkmark"></span>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                                <div class="pc-item">--%>
<%--                                    <label for="pc-paypal">--%>
<%--                                        Paypal--%>
<%--                                        <input type="checkbox" id="pc-paypal">--%>
<%--                                        <span class="checkmark"></span>--%>
<%--                                    </label>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <div class="order-btn">
                                <button type="button" class="site-btn place-btn" onclick="purchase()">수강 신청하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- Shopping Cart Section End -->


<!-- Footer Section Begin -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<!-- Footer Section End -->
<script>
    function purchase() {
        var lecture_idx = [];
        <c:forEach items="${dtoList}" var="list">
            lecture_idx.push(${list.lecture_idx});
        </c:forEach>
        $.ajax({
            url:"/order/payment.dox?",
            dataType:"json",
            type : "POST",
            data : {
                "member_id":"${sessionScope['member_id']}",
                "price":"${total_price}",
                "lecture_idx": JSON.stringify(lecture_idx),
                "cart_idx": JSON.stringify(${Cart_idx})
            },
            success : function(data) {
                if(data.result == "success"){
                    alert("결제에 성공하였습니다.");
                    location.replace("/mypage/paymentList");
                }else{
                    alert(data.msg);
                }
            },
            fail : function (data){
                alert("결제에 실패했습니다.");
            }, error: function(xhr, status, error) {
                alert(xhr);
                alert(status);
                alert("에러가 발생했습니다. 오류: " + error);
            }

        });
    }
</script>
<!-- Js Plugins -->
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
</body>
</html>
