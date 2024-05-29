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
        #list a {
            color: #000 !important;
            text-decoration: none;
        }

        #list{
            padding: 50px;
            width: 900px;
            padding-top: 30px;
        }
        a {
            text-decoration: none !important;
        }
        #btn_modify{
            background: #68afcb;
            color: #fff;
        }
        #btn_back{
            background: #fff;
            color: #68afcb;
            border: 1px solid #68afcb;
            margin-right: 5px;
        }
        #btn1, #btn2{
            background: #68afcb;
            color: #fff;
            margin-right: 5px;
        }

        #btn_comment {
            width: 100px;
            background: #68afcb;
            color: #fff;
        }
        #btnModify, #cmDelete {
            background: #fff;
            color: #68afcb;
            border: 1px solid #68afcb;
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
                    <li style="margin-bottom: 20px;"><span>과목</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;국어</li>
                    <li style="margin-bottom: 20px;"><span>해시태그</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #국어 #정성훈</li>
                    <li style="margin-bottom: 50px;"><span >별점</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%-- ${lectureDetail[0].lecture_star} --%><span class="star">
                        <c:forEach begin="1" end="${list.lecture_star}">
                            ⭐
                        </c:forEach>
                    </span></li>
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

        <div class="product-tab" id="list">
            <h5 style="font-weight: bold;">${bbsDTO.bbs_title}</h5>
            <div style="border-bottom: 1px solid #ccc;margin-bottom: 10px;padding-top: 10px"></div>
            <div id="se">
                <div>
                    <span style="font-weight: bold">작성일</span><span id="date">${bbsDTO.bbs_reg_date}</span>
                </div>
                <div>
                    <span style="font-weight: bold">조회수</span><span id="count">${bbsDTO.bbs_read_cnt}</span>
                </div>
            </div>
            <div style="border-bottom: 1px solid #ccc;margin-bottom: 10px;padding-top: 10px"></div>
            <br>
            <div style="white-space: pre-wrap;margin-bottom: 100px;">${bbsDTO.bbs_content}</div>
            <div style="display: flex;justify-content: flex-end;">
                <span style="padding-top: 8px;">첨부파일 : </span>
                <c:if test="${fileList != null}">
                    <c:forEach var="file" items="${fileList}">
                        <a download href="/resources/upload/bbs/${file.saveFile}"  class="btn rounded-pill px-2 py-2 mb-4 text-primary"><i class="me-2 text-primary"></i>${file.orgFile}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${fileList == null}">등록된 파일이 없습니다.</c:if>
            </div>
            <br>

            <c:if test="${bbsDTO.bbs_category_code eq 'bbs03'}">
            <div id="comment">
                <form name="frm" id="frm_comment" action="/bbsReply/regist" method="post">
                    <input type="hidden" name="member_id" value="${sessionScope.member_id}">
                    <input type="hidden" name="bbs_idx" value="${bbs_idx}">
                    <input type="hidden" name="lecture_idx" value="${list.lecture_idx}">
                    <span>답변</span>&nbsp;<span id="cmCount">${bbs.bbs_reply_cnt}</span>
                    <div class="form-floating" style="display: flex;margin-top: 10px;margin-bottom: 40px;">
                        <textarea class="form-control" placeholder="Leave a comment here" name="reply_content" id="replyContent"></textarea>
                        <label for="reply_content">댓글</label>
                        <input type="hidden" name="lecture_YN" value="Y">
                        <button type="submit" class="btn" id="btn_comment">등록</button>
                    </div>
                </form>

                    <div>
                        <c:choose>
                            <c:when test="${not empty reply}">
                                <c:forEach items="${reply}" var="reply">
                                    <span style="font-weight: bold">${reply.member_id}</span>&nbsp;<span>${reply.reply_reg_date}</span>
                                    <br>
                                    <form name="frm" id="cmFrm" class="cmFrm" action="/bbsReply/delete" method="post">
                                        <input type="hidden" name="reply_idx" value="${reply.reply_idx}">
                                        <input type="hidden" name="bbs_idx" value="${reply.bbs_idx}">
                                    <p><input type="text" name="reply_content"  class="reply_content" style="border: 0" value="${reply.reply_content}" id="reply_content" readonly></p>

                                    <c:if test="${reply.member_id == sessionScope.member_id}">
                                        <div style="display: flex;justify-content: flex-end;border-bottom: 1px solid #ccc;padding-bottom: 10px;margin-bottom: 10px;">
                                            <button type="button" class="btnModify" id="btnModify">수정</button>
                                            <span>&nbsp;|&nbsp;</span>
                                                <%--                                    <button type="submit" id="cmDelete" onclick="cmDelete(event)">삭제</button>--%>
                                            <button type="button" class="cmDelete" id="cmDelete">삭제</button>
                                        </div>
                                    </c:if>
                                    </form>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div style="padding: 10px;">
                                    등록된 댓글이 없습니다.
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

            </div>
            </c:if>
            <br>
            <br>
            <div style="display: flex;justify-content: center;">
                <div>
                    <button type="button" class="btn" id="btn_back" onclick="location.href='/lecture/boardList?bbs_type=${bbs_type}&lecture_idx=${lecture_idx}'">목록</button>
                    <c:if test="${sessionScope.user_id == bbsDTO.member_id}">
                        <button type="button" class="btn" id="btn1" onclick="location.href='/lecture/boardModify?bbs_idx=${bbs_idx}&bbs_type=${bbs_type}&lecture_idx=${lecture_idx}'">수정</button>
                        <button type="button" class="btn" id="btn2" onclick="location.href='/lecture/boardDelete?bbs_idx=${bbs_idx}&bbs_type=${bbs_type}&lecture_idx=${lecture_idx}'">삭제</button>
                    </c:if>
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
<link href="/resources/css/summernote/summernote-lite.css" rel="stylesheet">
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script>
    $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 500,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['codeview', 'help']]
        ]

    });
    let btnModify = document.getElementsByClassName("btnModify");
    let cmDelete = document.getElementsByClassName("cmDelete");
    let reply_content = document.getElementsByClassName("reply_content");
    for(let i=0;i<btnModify.length;i++){
        btnModify[i].addEventListener("click",function(e){
            e.preventDefault();
            if(this.textContent=="수정"){
                let el = this.parentElement.previousElementSibling.firstElementChild
                this.textContent="등록";
                el.readOnly = false;
                el.focus();
                el.style.border = "1px solid black";
                cmDelete[i].textContent="취소";
                return;
            }
            if(this.textContent=="등록"){
                let cmFrm = document.getElementsByClassName("cmFrm");
                cmFrm[i].action = "/bbsReply/modify";
                cmFrm[i].submit();
            }
        });
    }
    for(let i=0;i<cmDelete.length;i++) {
        cmDelete[i].addEventListener("click", function (e) {
            let el = this.parentElement.previousElementSibling.firstElementChild
            e.preventDefault();
            if (this.textContent == "취소") {
                el.readOnly = true;
                this.textContent = "삭제";
                el.style.border = "0";
                btnModify[i].textContent = "수정";
                return;
            }
            if (this.textContent == "삭제") {
                if (confirm("해당 댓글을 삭제하시겠습니까?")) {
                    let cmFrm = document.getElementsByClassName("cmFrm");
                    cmFrm[i].action = "/bbsReply/delete";
                    cmFrm[i].submit();
                }
            }
        });
    }
    document.querySelector("#btn_comment").addEventListener("click", function (e){
        e.preventDefault();

        let member_id = `${member_id}`;
        let frm = document.querySelector("#frm_comment");
        let replyContent = document.querySelector("#replyContent");

        if(member_id == "") {
            alert("로그인 후 이용하세요.");
            return false;
        }
        if(${sessionScope.member_id != list.member_id}){
            alert("답변 댓글 등록은 선생님만 가능합니다.");
            return false;
        }

        if(replyContent.value == "" ||  replyContent.value.length < 2 || replyContent.value == null ){
            alert("댓글은 2자 이상 입력해주세요.");
            return false;
        }

        frm.submit();
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
</body>
</html>