<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-05-21
  Time: 오후 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- Basic Page Info -->
    <meta charset="utf-8">
    <title>Admin</title>

    <!-- Site favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/vendors/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/vendors/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/vendors/images/favicon-16x16.png">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/vendors/styles/core.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/styles/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/adminStyle.css">


    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-119386393-1');
    </script>
    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
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
        }

        #leftNav a {
            padding-left: 0;
            color: #212529 !important;
        }

        #list a {
            padding-left: 0;
            color: #68afcb !important;
            text-decoration: none;
            font-weight: bold;
        }

        #list{
            padding: 50px;
            width: 100%;
            padding-top: 30px;
        }
        #date {
            color: #8b8686;
            margin-left: 10px;
        }
        #count {
            color: #8b8686;
            margin-left: 10px;
        }
        #se {
            display: flex;
            justify-content: space-between;
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
        a {
            text-decoration: none !important;
        }
        #cmCount {
            color:#68afcb;
            font-weight: bold;
        }
        #btn_comment{
            background: #68afcb;
            color: #fff;
            width: 100px;
            border-radius: 0;
        }

        #comment{
            border-bottom: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 50px;
        }
        #cmModify{
            border: none;
        }
        #cmDelete{
            border: none;
        }
        body {
            margin: 0;
            padding: 0;
            -webkit-font-smoothing: antialiased;
            font-family: 'Inter', sans-serif;
            font-weight: 400;
            width: 100%;
            min-height: 100%;
            color: #031e23;
            width: 100%;
            height: 100%;
            background: #ecf0f4;
        }
    </style>


</head>

<body>

<jsp:include page="/WEB-INF/views/admin/common/adminSidebar.jsp"/>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">
            <!-- basic table  Start -->
            <div class="pd-20 card-box mb-30" style="margin-bottom: 30px">
                <h4 class="h4">공지사항 게시판</h4>

                <div id="list">
                    <h5 style="font-weight: bold">작업형1 모의문제2 6번</h5>
                    <div id="se">
                        <div>
                            <span>seahchoi</span><span id="date">2024-05-07</span>
                        </div>
                        <div>
                            <span style="font-weight: bold">조회수</span><span id="count">12</span>
                        </div>
                    </div>
                    <hr>
                    <div class="align-items-start align-items-sm-center mt-3" style="white-space: pre-wrap;">
                        read버튼을 눌렀을 때 다른 항목들은 잘 찾아내나 id 1번 항목을 read할 경우 error 발생
                        GangnamguPopulationService.cs파일 안의 GetDetail함수의 else로 잡힙니다.

                        확인부탁드리겠습니다.
                        감사합니다.
                    </div>
                    <br><br>
                    <div id="comment" >
                        <span>답변</span>&nbsp;<span id="cmCount">1</span>
                        <div class="form-floating d-flex justify-content-center" style="margin-top: 10px;margin-bottom: 40px;">
                            <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
                            <label for="floatingTextarea">댓글</label>
                            <button type="button" class="btn" id="btn_comment">등록</button>
                        </div>
                        <div>
                            <span style="font-weight: bold">babori</span>&nbsp;<span>2024-05-10</span>
                            <br>
                            <p>강의에서 알려드린 판다스로 진행 바랍니다.</p>
                        </div>
                        <div style="display: flex;justify-content: flex-end;">
                            <button type="button" id="cmModify">수정</button>
                            <span>&nbsp;|&nbsp;</span>
                            <button type="button" id="cmDelete">삭제</button>
                        </div>
                    </div>

                    <div style="display: flex;justify-content: center;">
                        <div>
                            <button type="button" class="btn" id="btn_back" onclick="location.href='/admin/board/list'">목록</button>
                        </div>
                        <div>
                            <button type="button" class="btn" id="btn_modify" onclick="location.href='/admin/board/modify'">수정</button>
                            <button type="button" class="btn btn-secondary" id="btn_delete">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- js -->
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


    <script src="/resources/vendors/scripts/core.js"></script>
    <script src="/resources/vendors/scripts/script.min.js"></script>
    <script src="/resources/vendors/scripts/process.js"></script>
    <script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
