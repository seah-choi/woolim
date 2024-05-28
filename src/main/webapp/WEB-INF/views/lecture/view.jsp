<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1&family=Noto+Sans+KR:wght@100..900&family=Poor+Story&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>lecture_detail</title>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | Template</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
    <style>
        *{
            font-family: "Gothic A1", sans-serif;
        }

        #back1 {
            background-color: navy;
            background: url("/resources/img/lecture/about_bg_basic01.png");
            color: white;
            height: 470px;
            width: 100%;
        }
        #id0 {
            height: 76px;
        }
        #id1 a{
            text-decoration: none;
            color: white;
            height: 30px;
            line-height: 30px;
        }
        #id2 {
            display: flex;
        }
        #id2_1 {
            float: left;
            width: 550px;
            padding: 30px;
        }
        #id2_2 {
            float:right;
            width: 550px;
            padding: 30px;
        }
        #id2_2 li{
            list-style:symbols(·);
        }
        #frm1 {

        }
        .cart{
            width: 58px;
            height: 56px;
            border-radius: 4px;
            background: #fff url("/resources/img/lecture/cart2.png") no-repeat center;
            vertical-align: middle;
            border: 2px solid #fff;
            cursor: pointer;
            background-size: contain;
        }
        .heart{
            width: 58px;
            height: 56px;
            border-radius: 4px;
            background: #fff url("/resources/img/lecture/ico_basic_view_03.png") no-repeat center;
            vertical-align: middle;
            border: 2px solid #fff;
            cursor: pointer;
        }
        .regist{
            height: 56px;
            font-size: 16px;
            font-weight: bold;
            line-height: 56px;
            border-radius: 4px;
            vertical-align: middle;
            text-align: center;
            background: #00A85D;
            color: #fff;
            width: 70%;
            border: 1px solid #00A85D;
            cursor: pointer;
        }
        .buyLoad{
            height: 56px;
            font-size: 16px;
            font-weight: bold;
            line-height: 56px;
            border-radius: 4px;
            vertical-align: middle;
            text-align: center;
            background: #00A85D;
            color: #fff;
            width: 70%;
            border: 1px solid #00A85D;
            cursor: pointer;
        }
        .watch{
            height: 56px;
            font-size: 16px;
            font-weight: bold;
            line-height: 56px;
            border-radius: 4px;
            vertical-align: middle;
            text-align: center;
            background: #00A85D;
            color: #fff;
            width: 70%;
            border: 1px solid #00A85D;
            cursor: pointer;
        }
        #cancel{
            height: 56px;
            font-size: 16px;
            font-weight: bold;
            line-height: 56px;
            border-radius: 4px;
            vertical-align: middle;
            text-align: center;
            background: #00A85D;
            color: #fff;
            width: 40%;
            border: 1px solid #00A85D;
            cursor: pointer;
        }
        #play{
            height: 56px;
            font-size: 16px;
            font-weight: bold;
            line-height: 56px;
            border-radius: 4px;
            vertical-align: middle;
            text-align: center;
            background: #00A85D;
            color: #fff;
            width: 40%;
            border: 1px solid #00A85D;
            cursor: pointer;
        }
        #id2  h3{
            font-size: 26px;
            font-weight: bold;
            line-height: 38px;
            word-break: keep-all;
            color: #fff;
            vertical-align: middle;
        }
     /*   ul {
            color:#fff;
            word-break: break-all;
            vertical-align: middle;
            font-size: 14px;
            line-height: 40px;
            font-weight: 300;
        }*/
        ul > li  > span{
            font-size: 12px;
        }

        #box {
            display: flex;
            width: 1200px;
            margin: 0 auto;
            margin-top: 50px;
            margin-bottom: 50px;
        }
        #leftNav{
            border-right: 1px solid #ccc;
            padding: 30px;
            width: 200px;
        }

        #leftNav a {
            padding-left: 0;
            color: #212529 !important;
        }
        #cancelHeart{
            background: #fff url("/resources/img/lecture/ico_basic_view_09.png") no-repeat center;  height: 56px;
            border-radius: 4px;
            width: 58px;
            vertical-align: middle;
            border: 2px solid #fff;
            cursor: pointer;
        }

        #reviewRegistFrm fieldset{
            display: inline-block;
            direction: rtl;
            border:0;
        }
        #reviewRegistFrm fieldset legend{
            text-align: left;
        }
        #reviewRegistFrm input[type=radio]{
            display: none;
        }
        #reviewRegistFrm label{
            font-size: 1.5em;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
        }
        #reviewRegistFrm label:hover{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #reviewRegistFrm label:hover ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #reviewRegistFrm input[type=radio]:checked ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #reviewContents {
            width: 100%;
            height: 150px;
            padding: 10px;
            box-sizing: border-box;
            border: solid 1.5px #D3D3D3;
            border-radius: 5px;
            font-size: 16px;
            resize: none;
        }
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<main>

    <div id="back1">

        <div id="id2" class="container">
            <div id="id2_1">
                <img src="/resources/img/lecture/${list.lecture_image}"style="background-color: grey; height: 300px; width: 500px;">
            </div>
            <div id="id2_2">
                <h3>${list.lecture_title}</h3>
                <ul>

                    <li style="margin-top:40px; margin-bottom: 20px;"><span>가격</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ₩${list.lecture_sale_price}원  <span style="text-decoration: line-through ;">₩${list.lecture_price}원</span></li>
                    <li style="margin-bottom: 20px;"><span>과목</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.lecture_category_subject}</li>
                    <li style="margin-bottom: 20px;"><span>해시태그</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #${list.lecture_category_subject} #${list.member_name} <c:choose>
                        <c:when test="${list.lecture_category_school eq'elementary'}">#초등</c:when>
                        <c:when test="${list.lecture_category_school eq'middle'}">#중등</c:when>
                        <c:otherwise>#고등</c:otherwise>
                    </c:choose></li>
                    <li style="margin-bottom: 50px;"><span >별점</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%-- ${lectureDetail[0].lecture_star} --%><span class="star">⭐⭐⭐⭐</span></li>
                </ul>

                <c:choose>
                    <c:when test="${order.order_status eq '구매 완료' && cart.cart_status eq 'N'}">

                        <form method="post" name="frm" id="frm">
                            <input type="button" id="cancelHeart" name="cancelHeart" value="" style="">
                            <input type="hidden" id="lecture_idx" value="${list.lecture_idx}">
                            <input type="hidden" id="heart" class="heart" value="" onclick="addJjim(${list.lecture_idx})">
                            <input type="button" id="cart" class="cart" value="" onclick="addCart(${list.lecture_idx})">
                            <input type="hidden" id="regist" class="regist" value="수강신청" >
                            <input type="hidden" id="buyLoad" class="buyLoad" value="구매 중" >
                            <input type="button" id="watch" class="watch" value="강의보기" >

                        </form>
                    </c:when>

                    <c:when test="${order.order_status eq '구매 중' && cart.cart_status eq 'N'}">

                        <form method="post" name="frm" id="frm">
                            <input type="button" id="cancelHeart" name="cancelHeart" value="" >

                          <input type="hidden" id="lecture_idx" value="${list.lecture_idx}">
                          <input type="hidden" id="heart" class="heart" value="" onclick="addJjim(${list.lecture_idx})">
                          <input type="button" id="cart" class="cart" value="" onclick="addCart(${list.lecture_idx})">
                          <input type="hidden" id="regist" class="regist" value="수강신청" >
                          <input type="button" id="buyLoad" class="buyLoad" value="구매 중" >
                          <input type="hidden" id="watch" class="watch" value="강의보기" >

                        </form>
                    </c:when>
                    <c:when test="${order.order_status eq '구매 완료'}">
                        <form method="post" name="frm" id="frm">
                            <input type="hidden" id="cancelHeart" name="cancelHeart" value="" >
                            <input type="hidden" id="lecture_idx" value="${list.lecture_idx}">
                            <input type="button" id="heart" class="heart" value="" onclick="addJjim(${list.lecture_idx})">
                            <input type="button" id="cart" class="cart" value="" onclick="addCart(${list.lecture_idx})">
                            <input type="hidden" id="regist" class="regist" value="수강신청" >
                            <input type="hidden" id="buyLoad" class="buyLoad" value="구매 중" >
                            <input type="button" id="watch" class="watch" value="강의보기" >
                        </form>
                    </c:when>
                    <c:when test="${order.order_status eq '구매 중'}">
                        <form method="post" name="frm" id="frm">
                            <input type="hidden" id="cancelHeart" name="cancelHeart" value="" >
                            <input type="hidden" id="lecture_idx" value="${list.lecture_idx}">
                            <input type="button" id="heart" class="heart" value="" onclick="addJjim(${list.lecture_idx})">
                            <input type="button" id="cart" class="cart" value="" onclick="addCart(${list.lecture_idx})">
                            <input type="hidden" id="regist" class="regist" value="수강신청" >
                            <input type="button" id="buyLoad" class="buyLoad" value="구매 중" >
                            <input type="hidden" id="watch" class="watch" value="강의보기" >
                        </form>
                    </c:when>
                    <c:when test="${cart.cart_status eq 'N'}">
                        <form method="post" name="frm" id="frm">
                            <input type="button" id="cancelHeart" name="cancelHeart" >
                            <input type="hidden" id="lecture_idx" value="${list.lecture_idx}">
                            <input type="hidden" id="heart" class="heart" value="" onclick="addJjim(${list.lecture_idx})">
                            <input type="button" id="cart" class="cart" value="" onclick="addCart(${list.lecture_idx})">
                            <input type="button" id="regist" class="regist" value="수강신청" >
                            <input type="hidden" id="buyLoad" class="buyLoad" value="구매 중" >
                            <input type="hidden" id="watch" class="watch" value="강의보기" >
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form method="post" name="frm" id="frm">
                            <input type="hidden" id="cancelHeart" name="cancelHeart" value="" >
                            <input type="hidden" id="lecture_idx" value="${list.lecture_idx}">
                            <input type="button" id="heart" class="heart" value="" onclick="addJjim(${list.lecture_idx})">
                            <input type="button" id="cart" class="cart" value="" onclick="addCart(${list.lecture_idx})">
                            <input type="button" id="regist" class="regist" value="수강신청" >
                            <input type="hidden" id="buyLoad" class="buyLoad" value="구매 중" >
                            <input type="hidden" id="watch" class="watch" value="강의보기" >
                        </form>
                    </c:otherwise>

                </c:choose>

            </div>
        </div>

    </div>

    <c:set var="lecture" value="}"></c:set>
<div id="box">
    <c:if test="${param.reviewNo == '1'}">
        <script>
            alert("리뷰는 수강신청 이후에 진행할 수 있습니다.");
        </script>
    </c:if>
    <div id="leftNav">
        <nav class="nav flex-column">
            <h4>강의</h4>
            <div style="border-bottom: 1px solid #000;width: 50px;padding: 10px;"></div>
            <div style="padding-top: 20px; line-height: unset;">
                <a class="nav-link" aria-current="page" href="/lecture/view?lecture_idx=${list.lecture_idx}">강의소개</a>
                <a class="nav-link" href="/lecture/boardList?bbs_type=bbs04&lecture_idx=${list.lecture_idx}">공지사항</a>
                <a class="nav-link" href="/lecture/boardList?bbs_type=bbs03&lecture_idx=${list.lecture_idx}">Q&A</a>
                <a class="nav-link" href="/lecture/boardList?bbs_type=bbs05&lecture_idx=${list.lecture_idx}">자료실</a>
                <c:if test="${sessionScope.member_id == list.member_id}">
                    <a class="nav-link" href="/lecture/studentList?lecture_idx=${list.lecture_idx}">수강생</a>
                </c:if>
            </div>
        </nav>
    </div>

    <div class="product-tab" style="margin-left: 100px;width: 800px;">
        <div class="tab-item">
            <ul class="nav" role="tablist">
                <li>
                    <a class="active tab-a" data-toggle="tab" id="scrollTarget" href="#tab-1" role="tab">강의소개</a>
                </li>
                <li>
                    <a class="tab-a" data-toggle="tab" href="#tab-2" role="tab">강의 목차</a>
                </li>
                <li>
                    <a class="tab-a" data-toggle="tab" href="#tab-3" role="tab">Customer Reviews (${responseDTO.total_count})</a>
                </li>
            </ul>
        </div>
        <div class="tab-item-content">
            <div class="tab-content">
                <div class="tab-pane fade-in active tab-div" id="tab-1" role="tabpanel">
                    <div class="product-content">
                        <div class="row">
                            <div class="col-lg-7">
                                <h5>강의소개</h5>
                                <p>${list.lecture_content}</p>
                                <h5>커리큘럼</h5>
                                <p>${list.lecture_content_detail} </p>
                                <h5>홍보/예시 영상</h5>
                                <p><iframe width="560" height="315" src="https://www.youtube.com/embed/czXTZJUDcE0?si=DjBhneKB4x1zMw0G" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                                </p>
                                <h5>상세 설명</h5>
                                <p>${list.lecture_study} </p>
                            </div>
                            <div class="col-lg-5">
                                <img src="img/product-single/tab-desc.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade tab-div" id="tab-2" role="tabpanel">
                    <div class="specification-table">
                        <table>
                            <div class="accordion" id="accordionPanelsStayOpenExample" style="width: 500px;">

                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                            ${video[0].video_content}
                                        </button>
                                    </h2>
                                    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                                        <div class="accordion-body">
                                            <c:forEach items="${video}" var="video">
                                                <div><a href="#">${video.video_title}</a></div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <%--<div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                            Accordion Item #2
                                        </button>
                                    </h2>
                                    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                                        <div class="accordion-body">
                                            <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                                            Accordion Item #3
                                        </button>
                                    </h2>
                                    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                                        <div class="accordion-body">
                                            <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade tab-div" id="tab-3" role="tabpanel">
                    <div class="customer-review-option">
                        <h4>${responseDTO.total_count} Comments</h4>
                        <div class="comment-option">
                            <c:choose>
                                <c:when test="${not empty responseDTO.dtolist}">
                                    <c:forEach var="review" items="${responseDTO.dtolist}">
                                        <div class="co-item">
                                            <div class="avatar-text">
                                                <div class="at-rating">
                                                    <c:forEach begin="1" end="${review.review_rank}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:forEach begin="${review.review_rank}" end="4">
                                                        <i class="fa fa-star-o"></i>
                                                    </c:forEach>

                                                </div>
                                                <h5>${review.member_id} <span>${review.review_reg_date}</span></h5>
                                                <div class="at-reply">${review.review_comment}</div>

                                            </div>
                                            <form action="/lecture/reviewDelete" method="post" name="frmRegistReview">
                                                <input type="hidden" value="${review.review_idx}" name="review_idx">
                                                <input type="hidden" value="${review.lecture_idx}" name="lecture_idx">
                                                <c:if test="${review.member_id == sessionScope.user_id}">
                                                    <button type="submit" class="btn btn-sm btnRemove">삭제</button>
                                                </c:if>
                                            </form>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    등록된 리뷰가 없습니다.
                                </c:otherwise>
                            </c:choose>
                            <nav class="blog-pagination justify-content-center d-flex">
                                <ul class="pagination">
                                    <li class="page-item <c:if test="${!responseDTO.prev_page_plag}">disabled</c:if>">
                                        <a class="page-link" href="/lecture/view?page_flag=1&page=${((responseDTO.page - responseDTO.page_block_size) >= 1) ? (responseDTO.page - responseDTO.page_block_size) : 1}${responseDTO.linkParams}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach var="li" begin="${responseDTO.page_block_start}" end="${responseDTO.page_block_end}">
                                        <li class="page-item <c:if test="${responseDTO.page eq li}">active</c:if> ">
                                            <a class="page-link" href="/lecture/view?page_flag=1&page=${li}${responseDTO.linkParams}">${li}</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item <c:if test="${!responseDTO.next_page_plag}">disabled</c:if>">
                                        <a class="page-link" href="/lecture/view?page_flag=1&page=${(responseDTO.page + responseDTO.page_block_size) <= responseDTO.total_page ? (responseDTO.page + responseDTO.page_block_size) : responseDTO.total_page}${responseDTO.linkParams}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <div class="leave-comment">
                            <h4>Leave A Comment</h4>
                            <form action="/lecture/reviewRegist" id="reviewRegistFrm" method="post" class="comment-form">
                            <div class="rating">
                                <span class="text-bold">별점을 선택해주세요</span>
                                <input type="radio" name="review_rank" value="5" id="rate1" class="star"><label
                                    for="rate1">★</label>
                                <input type="radio" name="review_rank" value="4" id="rate2" class="star"><label
                                    for="rate2">★</label>
                                <input type="radio" name="review_rank" value="3" id="rate3" class="star"><label
                                    for="rate3">★</label>
                                <input type="radio" name="review_rank" value="2" id="rate4" class="star"><label
                                    for="rate4">★</label>
                                <input type="radio" name="review_rank" value="1" id="rate5" class="star"><label
                                    for="rate5">★</label>
                            </div>

                                <input type="hidden" name="review_rank" value="3">
                                <input type="hidden" name="member_id" value="${sessionScope.user_id}">
                                <input type="hidden" name="lecture_idx" value="${list.lecture_idx}">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <textarea placeholder="Messages" name="review_comment" id="review_comment"></textarea>
                                        <button type="submit" id="reviewRegistBtn" class="site-btn" <c:if test="${sessionScope.user_id == null}">disabled</c:if>>
                                            <c:if test="${sessionScope.user_id == null}">로그인 후 가능합니다.</c:if>
                                            <c:if test="${sessionScope.user_id != null}">리뷰 등록</c:if>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer-left">
                        <div class="footer-logo">
                            <a href="#"><img src="/resources/img/footer-logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: hello.colorlib@gmail.com</li>
                        </ul>
                        <div class="footer-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <div class="footer-widget">
                        <h5>Information</h5>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Checkout</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Serivius</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="footer-widget">
                        <h5>My Account</h5>
                        <ul>
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Shopping Cart</a></li>
                            <li><a href="#">Shop</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="newslatter-item">
                        <h5>Join Our Newsletter Now</h5>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#" class="subscribe-form">
                            <input type="text" placeholder="Enter Your Mail">
                            <button type="button">Subscribe</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </div>
                        <div class="payment-pic">
                            <img src="/resources/img/payment-method.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</main>
<script>
    window.onload = function() {
        // 특정 조건 확인
        if (${param.registOK == '1'} || ${param.deleteOK == '1'} ||${param.page_flag == '1'} || ${param.reviewAgain == '1'}) {
            reviewTAB();
            if(${param.registOK == '1'}){
                alert("등록 되었습니다.");
            }
            if(${param.deleteOK == '1'}){
                alert("삭제 되었습니다.");
            }
            if(${param.reviewAgain == '1'}){
                alert("리뷰는 한번만 작성 가능합니다.");
            }
            if(${param.reviewNo == '1'}){
                alert("리뷰 등록은 수강신청 이후에 진행할 수 있습니다.");
            }
        }
    };

    let reviewRegistBtn = document.getElementById("reviewRegistBtn");
    reviewRegistBtn.addEventListener("click", function(e){
        e.preventDefault();
        let star = document.getElementsByClassName("star");
        let review_comment = document.getElementById("review_comment");
        let flag = 0;
        for(let i=0;i<star.length;i++){
            if(star[i].checked)
                flag = 1;
        }
        if(flag==0){
            alert("별점을 선택해주세요");
            return;
        }
        if(review_comment.value.trim()<10){
            alert("리뷰는 10자리 이상 작성해주세요");
            return;
        }

        let reviewRegistFrm = document.getElementById("reviewRegistFrm");
        reviewRegistFrm.submit();
    });
    let tabA = document.querySelectorAll('.tab-a');
    let tabDiv = document.querySelectorAll('.tab-div');
    function reviewTAB(){
        for(let i=0;i<tabA.length;i++){
            tabA[i].classList.remove('active');
        }
        tabA[2].classList.add('active');
        for(let i=0;i<tabDiv.length;i++){
            tabDiv[i].classList.remove('active', 'show');
        }
        tabDiv[2].classList.add('active');
        tabDiv[2].classList.add('show');
        var targetElement = document.getElementById('scrollTarget');
        var targetRect = targetElement.getBoundingClientRect();

        window.scrollTo({
            top: window.scrollY + targetRect.top
        });
        // document.querySelector('#review-tab').click();
    }
    document.querySelector("#regist").addEventListener("click", function() {
        const lectureIdx = document.querySelector("#lecture_idx").value;
        location.href = '/order/order?lecture_idx='+lectureIdx;
    });
    document.querySelector("#watch").addEventListener("click", function() {
        const lectureIdx = document.querySelector("#lecture_idx").value;
        let popupUrl = "/lecture/watchVideo?lectureIdx="+lectureIdx; // 팝업 창에 표시할 내용에 대한 URL을 여기에 설정합니다.

        // 팝업 창 옵션 설정
        let popupOption = "width=1200,height=480,scrollbars=yes,resizable=yes";

        // 팝업 창 열기
        window.open(popupUrl, "", popupOption);

    });
    document.querySelector("#cancelHeart").addEventListener("click", function() {
        const lectureIdx = document.querySelector("#lecture_idx").value;
        location.href = '/mypage/jjim';
    });

</script>
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
<script src="/resources/js/cart.js"></script>
</body>
</html>