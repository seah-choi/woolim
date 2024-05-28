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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <style>
        .btn-primary {
            width: 90px;
            height: 50px;
            background-color: #68afcb;
            border-color: #68afcb;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #8bc8e0;
            border-color: #8bc8e0;
        }
        .page-item.active .page-link {
            background-color: #68afcb !important;
            color: #fff !important;
            border-color: #68afcb !important;
        }

        a.page-link {
            color: #68afcb;
        }
        li.page-item {
            color: #68afcb;
        }
        .ordersbtn {
            width: 110px !important;
        }
    </style>
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
                <jsp:include page="/WEB-INF/views/common/mypageSide.jsp"/>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="place-order">
                        <div class="order-total">
                            <form action="/mypage/pointcharge">
                                <div class="d-flex justify-content-end">
                                    <input type="date" style="width: 20%" name="search_date1" class="form-control me-3">
                                    <span class="me-3">~</span>
                                    <input type="date" style="width: 20%" name="search_date2" class="me-3 form-control">
                                    <button type="submit" class="btn btn-primary" >검색</button>
                                </div>
                            </form>
                            <hr>
                            <h4 class="d-flex justify-content-center">결제 내역</h4>
                            <div class="accordion" id="accordionPanelsStayOpenExample">
                                <c:forEach items="${responseDTO.dtolist}" var="list" varStatus="status">
                                <div class="accordion-item">
                                    <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne${status.index}" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                                            결제 번호 : ${list.order_num}
                                            &nbsp;&nbsp;결제 날짜:${list.order_date}
                                        </button>
                                    </h2>
                                    <div id="panelsStayOpen-collapseOne${status.index}" class="accordion-collapse collapse">
                                        <div class="accordion-body">
                                            <div class="d-flex justify-content-end">
                                                총 결제 금액:<fmt:formatNumber value="${list.order_total}" pattern="#,###"/>원
                                            </div>
                                            <table class="table mt-5">
                                                <thead class="table-secondary">
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">강좌명</th>
                                                        <th scope="col">가격</th>
                                                        <th scope="col">수강가능 기간</th>
                                                        <th></th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${detailList[status.index]}" var="dto">
                                                        <tr>
                                                            <td style="width:25%; "><img src="/resources/img/lecture/${dto.lecture_image}"></td>
                                                            <td>${dto.lecture_title}</td>
                                                            <td><fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</td>
                                                            <td>${dto.lecture_start_date} ~ ${dto.lecture_end_date}</td>
                                                            <c:if test="${dto.order_status == '구매 완료' }">
                                                                <td colspan="2"><button class="btn btn-primary ordersbtn" type="button" onclick="purchaseConfirm(${dto.order_detail_idx},${dto.lecture_idx})" disabled>구매 완료</button></td>
                                                            </c:if>
                                                            <c:if test="${dto.order_status == '환불 완료' }">
                                                                <td colspan="2"><button class="btn btn-primary ordersbtn" type="button" onclick="purchaseConfirm(${dto.order_detail_idx},${dto.lecture_idx})" disabled>환불 완료</button></td>
                                                            </c:if>
                                                            <c:if test="${dto.order_status == '구매 중' }">
                                                                <td>
                                                                    <button class="btn btn-primary ordersbtn" type="button" onclick="purchaseConfirm(${dto.order_detail_idx},${dto.lecture_idx})">구매 확정</button>
                                                                </td>
                                                            </c:if>
                                                        </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
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


    function purchaseConfirm(order_detail_idx,lecture_idx){
        $.ajax({
            url: "/mypage/purChaseConfirm.dox?",
            dataType: "json",
            type: "POST",
            data: {
                order_detail_idx:order_detail_idx,
                lecture_idx:lecture_idx,
                cart_status:"구매 완료",
            },
            success: function (data) {
                if (data.result == "success") {
                    alert(data.msg);
                    location.href = "/mypage/paymentList";
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
