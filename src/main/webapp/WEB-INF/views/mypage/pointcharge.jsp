<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
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
                <div class="col-lg-12">
                    <div class="place-order">
                        <div class="order-total">
                            <h4>포인트 충전하기</h4>
                            <div class="order-btn">
                                <button type="button" class="site-btn place-btn" onclick="requestPay()">충전하기</button>
                            </div>
                            <table class="table mt-5">
                                <thead>
                                <tr class="table-secondary">
                                    <th scope="col">구분</th>
                                    <th scope="col">내용</th>
                                    <th scope="col">금액</th>
                                    <th scope="col">날짜</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${paymentDTO}" var="list">
                                    <tr>
                                        <th scope="row">${list.payment_type}</th>
                                        <td id="title">${list.payment_title}</td>
                                        <td>${list.price}</td>
                                        <td>${list.payment_reg_date}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <nav class="blog-pagination justify-content-center d-flex mt-5">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a href="#" class="page-link" aria-label="Previous">&lt;</a>
                                    </li>
                                    <li class="page-item active">
                                        <a href="#" class="page-link">1</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link">2</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link">3</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link">4</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link">5</a>
                                    </li>
                                    <li class="page-item">
                                        <a href="#" class="page-link" aria-label="Next">&gt;</a>
                                    </li>
                                </ul>
                            </nav>
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
    var IMP = window.IMP;
    IMP.init("imp78587533");
    var list;

    $.ajax({
        url:"/mypage/viewMember.dox",
        dataType:"json",
        type : "POST",
        data : {
            "member_id":"${sessionScope['member_id']}"
        },
        success : function(data) {
            list = data.dto;
            console.log(list);
        }
    });

    function requestPay() {
        // // let targetVal = parseInt(uncomma(target.value));
        // let targetVal = target.value;
        let today = new Date();
        let rand = Math.floor(Math.random()*(1000000-0)+1);
        let hours = today.getHours(); // 시
        let minutes = today.getMinutes();  // 분
        let seconds = today.getSeconds();  // 초
        let milliseconds = today.getMilliseconds();
        let now = hours+minutes+seconds+milliseconds;
        IMP.request_pay({
            pg: 'html5_inicis',
            pay_method: 'card',
            merchant_uid: now+"-"+rand,
            name: '포인트',
            amount: 100,
            buyer_email: list.member_email + list.member_email_addr,
            buyer_name: list.member_name,
            buyer_tel: list.member_phone,
        }, function (rsp) { // callback
            if(rsp.success){
                console.log(rsp.amount);
                $.ajax({
                    url:"/mypage/point.dox",
                    dataType:"json",
                    type : "POST",
                    data : {
                        "payment_num":rsp.merchant_uid
                        ,"member_id":"${sessionScope['member_id']}"
                        ,"price":rsp.paid_amount
                        ,"method":rsp.pay_method
                        ,"company":rsp.pg_provider
                    },
                    success : function(data) {
                        alert("포인트 충전 성공");
                        location.href="/mypage/point";
                    }
                });
                console.log(rsp);
            }else {
                console.log(rsp);
            }
            //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
        });
    }
</script>
</body>
</html>
