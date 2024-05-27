<%--
  Created by IntelliJ IDEA.
  User: I
  Date: 2024-05-22
  Time: 오전 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>

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


</head>
<body>


<div class="left-side-bar">
    <div class="brand-logo">
        <a href="/">
            <img src="/resources/img/logo.png" alt="">
        </a>
        <div class="close-sidebar" data-toggle="left-sidebar-close">
            <i class="ion-close-round"></i>
        </div>
    </div>
    <div class="menu-block customscroll">
        <div class="sidebar-menu" style="margin-top: 40px">
            <ul id="accordion-menu">
                <li class="dropdown">
                    <a href="/admin/dashboard" class="noDropdown">
                        <span class="micon dw dw-house-1"></span><span class="mtext">대시보드</span>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
                        <span class="micon icon-copy fa fa-video-camera"></span><span class="mtext">강좌 관리</span>
                    </a>
                    <ul class="submenu">
                        <li><a href="/admin/lecture/list">강좌 목록</a></li>
                        <li><a href="/admin/lecture/regist">강좌 등록</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="/admin/member/list" class="noDropdown">
                        <span class="micon icon-copy fa fa-user-circle"></span><span class="mtext">회원 관리</span>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
                        <span class="micon icon-copy fa fa-calendar-minus-o"></span><span class="mtext">게시판 관리</span>
                    </a>
                    <ul class="submenu">
                        <li><a href="/admin/board/list?bbs_type=bbs04">공지사항 게시판</a></li>
                        <li><a href="/admin/board/list?bbs_type=bbs01">교육정보 게시판</a></li>
                        <li><a href="/admin/board/list?bbs_type=bbs05">자료실</a></li>
                        <li><a href="/admin/board/list?bbs_type=bbs02">자유게시판</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="/" class="noDropdown">
                        <span class="micon icon-copy fa fa-mail-reply"></span><span class="mtext">홈페이지로 돌아가기</span>
                    </a>
                </li>

            </ul>
        </div>
    </div>
</div>
<div class="mobile-menu-overlay"></div>
</body>
</html>
