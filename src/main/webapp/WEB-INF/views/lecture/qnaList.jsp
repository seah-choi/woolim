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

        #search {
            background: #68afcb;
            color: #fff;
            border: none;
        }
        #btn_regist {
            background: #68afcb;
            color: #fff;
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
                    <li style="margin-bottom: 50px;"><span >별점</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%-- ${lectureDetail[0].lecture_star} --%><span class="star">⭐⭐⭐⭐</span></li>
                </ul>

                <c:choose>
                    <c:when test="${checkHeart eq 1 && checkCart eq 1}">

                        <form method="post" name="frm" id="frm">
                            <input type="hidden" id="memberId" value="${memberId}">
                            <input type="hidden" id="heart" class="heart" value="">
                            <input type="hidden" id="regist" class="regist" value="수강신청">
                            <input type="hidden" id="idx" name="idx" value="${lectureDetail[0].lecture_idx}">
                            <input type="hidden" id="imgUrl" name="imgUrl" value="${lectureDetail[0].lecture_img}">
                            <input type="hidden" id="title" name="title" value="${lectureDetail[0].lecture_title}">
                            <input type="hidden" id="name" name="name" value="${lectureDetail[0].member_name}">
                            <input type="button" id="cancelHeart" name="cancelHeart" value="" style="background: #fff url(./img/ico_basic_view_09.png) no-repeat center;  height: 56px;
					    border-radius: 4px;
					width: 58px;
					    vertical-align: middle;
					    border: 2px solid #fff;
					    cursor: pointer;">
                            <input type="button" id="play" name="play" value="강좌듣기">
                            <input type="button" id="cancel" name="cancel" value="수강취소">

                        </form>
                    </c:when>

                    <c:when test="${checkHeart eq 1}">

                        <form method="post" name="frm" id="frm">
                            <input type="hidden" id="memberId" value="${memberId}">
                            <input type="hidden" id="heart" class="heart" value="">
                            <input type="button" id="cancelHeart" name="cancelHeart" value="" style="background: #fff url(./img/ico_basic_view_09.png) no-repeat center;  height: 56px;
					    border-radius: 4px;
					width: 58px;
					    vertical-align: middle;
					    border: 2px solid #fff;
					    cursor: pointer;">
                            <input type="button" id="regist" class="regist" value="수강신청">
                            <input type="hidden" id="idx" name="idx" value="${lectureDetail[0].lecture_idx}">
                            <input type="hidden" id="imgUrl" name="imgUrl" value="${lectureDetail[0].lecture_img}">
                            <input type="hidden" id="title" name="title" value="${lectureDetail[0].lecture_title}">
                            <input type="hidden" id="name" name="name" value="${lectureDetail[0].member_name}">

                            <input type="hidden" id="play" name="play" value="강좌듣기">
                            <input type="hidden" id="cancel" name="cancel" value="수강취소">

                        </form>
                    </c:when>

                    <c:when test="${checkCart eq 1}">
                        <form method="post" name="frm" id="frm">
                            <input type="hidden" id="memberId" value="${memberId}">
                            <input type="button" id="heart" class="heart" value="">
                            <input type="hidden" id="regist" class="regist" value="수강신청">
                            <input type="hidden" id="idx" name="idx" value="${lectureDetail[0].lecture_idx}">
                            <input type="hidden" id="imgUrl" name="imgUrl" value="${lectureDetail[0].lecture_img}">
                            <input type="hidden" id="title" name="title" value="${lectureDetail[0].lecture_title}">
                            <input type="hidden" id="name" name="name" value="${lectureDetail[0].member_name}">
                            <input type="button" id="play" name="play" value="강좌듣기">
                            <input type="button" id="cancel" name="cancel" value="수강취소">
                            <input type="hidden" id="cancelHeart" name="cancelHeart" value="">
                        </form>
                    </c:when>

                    <c:otherwise>
                        <form method="post" name="frm" id="frm">
                            <input type="hidden" id="memberId" value="${memberId}">
                            <input type="button" id="heart" class="heart" value="">
                            <input type="button" id="regist" class="regist" value="수강신청">
                            <input type="hidden" id="idx" name="idx" value="${lectureDetail[0].lecture_idx}">
                            <input type="hidden" id="imgUrl" name="imgUrl" value="${lectureDetail[0].lecture_img}">
                            <input type="hidden" id="title" name="title" value="${lectureDetail[0].lecture_title}">
                            <input type="hidden" id="name" name="name" value="${lectureDetail[0].member_name}">
                            <input type="hidden" id="play" name="play" value="강좌듣기">
                            <input type="hidden" id="cancel" name="cancel" value="수강취소">
                            <input type="hidden" id="cancelHeart" name="cancelHeart" value="">
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
            <h5 style="font-weight: bold">Q&A</h5>
            <hr>
            <div style="display: flex;justify-content: flex-end;">
                <button type="button" class="btn" id="btn_regist" onclick="location.href='/lecture/qnaRegist?lecture_idx=${list.lecture_idx}'">글쓰기</button>
            </div>
            <br>
            <div class="searchBox">
                <form role="search" id="frmSearch" class="searchForm" action="/board/freeList" method="get">
                    <input type="hidden" name="bbs_type" value="${bbs_type}" >
                    <div class="mb-3 row d-flex">
                        <div class="input-group">
                            <select id="schoolSelect" name="search_type" class="selectpicker form-control col-sm-1 school" data-size="5" data-style="btn-outline-info">
                                <option>전체</option>
                                <option value="t" ${search_type=="t" ? "selected" : ""}>제목</option>
                                <option value="c" ${search_type=="c" ? "selected" : ""}>내용</option>
                                <option value="u" ${search_type=="u" ? "selected" : ""}>작성자</option>
                            </select>
                            <input type="search" class="form-control" name="search_word"  id="search_word" value='<c:out value="${pageRequestDTO.search_word}"/>' placeholder="검색어를 입력하세요." aria-label="Text input with 2 dropdown buttons">
                            <button class="btn btn-outline-secondary" type="submit" id="search" aria-expanded="false">검색</button>
                        </div>
                    </div>
                </form>
            </div>
            <br>
            <table class="table">
                <thead>
                <tr class="table-secondary">
                    <th scope="col">#</th>
                    <th scope="col">제목</th>
                    <th scope="col">등록일</th>
                    <th scope="col">조회수</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">#</th>
                    <td><a href="/lecture/qnaView?lecture_idx=${list.lecture_idx}">질문과답변</a></td>
                    <td>2024-05-25</td>
                    <td>0</td>
                </tr>
                </tbody>
            </table>
            <nav class="blog-pagination justify-content-center d-flex" style="margin-top: 50px;">
                <ul class="pagination">
                    <li class="page-item <c:if test="${bbsList.prev_page_plag == 'false'}"> disabled</c:if>" >
                        <a href="/board/list?page=${bbsList.page_block_start - bbsList.page_block_size}${bbsList.linkParams}"
                           class="page-link" aria-label="Previous">&laquo;
                        </a>
                    </li>
                    <c:forEach begin="${bbsList.page_block_start}"
                               end="${bbsList.page_block_end}"
                               var="page_num">
                        <li class="page-item <c:if test="${bbsList.page == page_num}">active</c:if>">
                            <a href="/board/list?page=${page_num}${bbsList.linkParams}" class="page-link">${page_num}</a>
                        </li>
                    </c:forEach>
                    <li class="page-item <c:if test="${bbsList.next_page_plag == 'false'}"> disabled</c:if>" >
                        <a href="/board/list?page=${bbsList.page_block_start + bbsList.page_block_size}${bbsList.linkParams}" class="page-link" aria-label="Previous">
                            &raquo;
                        </a>
                    </li>
                </ul>
            </nav>

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
</body>
</html>