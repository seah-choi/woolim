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
        ul {
            color:#fff;
            word-break: break-all;
            vertical-align: middle;
            font-size: 14px;
            line-height: 40px;
            font-weight: 300;
        }
        ul > li  > span{
            font-size: 12px;
        }
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<main>

    <div id="back1">

        <div id="id2" class="container">
            <div id="id2_1">
                <img src=".${list.lecture_img}"style="background-color: grey; height: 300px; width: 500px;">
            </div>
            <div id="id2_2">
                <h3>${lectureDetail[0].lecture_title}</h3>
                <ul>
                    <li><span>분야</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${categoryDetail}</li>
                    <li><span>주관기관</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${lectureDetail[0].member_company}</li>
                    <li><span>학습기간</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${lectureDetail[0].lecture_start_date}  ~ ${lectureDetail[0].lecture_end_date}</li>
                    <li><span>전화번호</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${lectureDetail[0].member_phone }</li>
                    <li><span>별점</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%-- ${lectureDetail[0].lecture_star} --%><span class="star">⭐⭐⭐⭐</span></li>
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

    <div id="id3" class="container">
        <h3>강좌소개</h3>
        <h4>수업내용/목표</h4>
        <p>${lectureDetail[0].lecture_content}</p>

        <h4>홍보/예시 영상</h4>
        <p><iframe width="560" height="345" src="${lectureDetail[0].lecture_youtube_url}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </p>

        <h4>강좌 운영 계획</h4>
        <p>${lectureDetail[0].lecture_plan}</p>

        <h4>강좌 수강 정보</h4>
        <p>${lectureDetail[0].lecture_content_detail}</p>

        <h4>자주 묻는 질문</h4>
        <p>${lectureDetail[0].lecture_question}</p>
    </div>

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