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
                                <a class="site-btn place-btn" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">충전하기</a>
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
                                <c:if test="${paymentDTO.size()==0}">
                                    <tr>
                                        <td colspan="4"><p class="d-flex justify-content-center">기록이 없습니다.</p></td>
                                    </tr>
                                </c:if>
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
                                    <li class="page-item <c:if test="${responseDTO.prev_page_plag == 'false'}"> disabled</c:if>" >
                                        <a href="/mypage/pointcharge?page=${responseDTO.page_block_start - responseDTO.page_block_size}${responseDTO.linkParams}"
                                           class="page-link" aria-label="Previous">&laquo;
                                        </a>
                                    </li>
                                    <c:forEach begin="${responseDTO.page_block_start}"
                                               end="${responseDTO.page_block_end}"
                                               var="page_num">
                                        <li class="page-item <c:if test="${responseDTO.page == page_num}">active</c:if>">
                                            <a href="/mypage/pointcharge?page=${page_num}${responseDTO.linkParams}" class="page-link">${page_num}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item <c:if test="${responseDTO.next_page_plag == 'false'}"> disabled</c:if>" >
                                        <a href="/mypage/pointcharge?page=${responseDTO.page_block_start + responseDTO.page_block_size}${responseDTO.linkParams}" class="page-link" aria-label="Previous">
                                            &raquo;
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasExampleLabel">충전 하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div>
                    충전하실 금액을 선택해 주세요.
                </div>
                <div class="fw-brand-check">
                    <div class="bc-item">
                        <label for="bc-calvin">
                            1,000원
                            <input type="radio" id="bc-calvin" class="subjectbtn" value="1000" name="pay">
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div class="bc-item">
                        <label for="bc-diesel">
                            3,000원
                            <input type="radio" id="bc-diesel" class="subjectbtn" value="3000" name="pay">
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div class="bc-item">
                        <label for="bc-polo">
                            5,000원
                            <input type="radio" id="bc-polo" class="subjectbtn" value="5000" name="pay">
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div class="bc-item">
                        <label for="bc-tommy">
                            10,000원
                            <input type="radio" id="bc-tommy" class="subjectbtn" value="10000" name="pay">
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div class="bc-item">
                        <label for="bc-tommy2">
                            30,000원
                            <input type="radio" id="bc-tommy2" class="subjectbtn" value="30000" name="pay">
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div class="bc-item">
                        <label for="bc-tommy1">
                            50,000원
                            <input type="radio" id="bc-tommy1" class="subjectbtn" value="50000" name="pay">
                            <span class="checkmark"></span>
                        </label>
                    </div>
                    <div>
                        <button class="btn btn-primary" onclick="requestPay()">충전하기</button>
                    </div>
                </div>
            </div>
        </div>
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

        var radios = document.getElementsByName('pay');

        // 선택된 라디오 버튼의 값을 저장할 변수
        var selectedValue = '';

        // 모든 라디오 버튼에 대해 반복
        for (var i = 0; i < radios.length; i++) {
            // 라디오 버튼이 선택되었는지 확인
            if (radios[i].checked) {
                // 선택된 라디오 버튼의 값을 변수에 할당
                selectedValue = radios[i].value;
                break; // 선택된 값이 있으면 반복 중지
            }
        }

        // 선택된 값이 존재하는지 확인 후 출력
        if (selectedValue !== '') {
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
                amount: selectedValue,
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
                            ,"payment_type":"충전"
                            ,"payment_title":"포인트 충전"
                        },
                        success : function(data) {
                            alert("포인트 충전 성공");
                            location.replace("/mypage/pointcharge");
                        }
                    });
                    console.log(rsp);
                }else {
                    console.log(rsp);
                }
                //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
            });
        } else {
            alert('충전할 금액을 선택해주세요.');
        }
    }
</script>
</body>
</html>
