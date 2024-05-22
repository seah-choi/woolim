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

</head>
<body>


<div class="left-side-bar">
    <div class="brand-logo">
        <a href="index.html">
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
                    <a href="#" class="noDropdown">
                        <span class="micon dw dw-house-1"></span><span class="mtext">Home</span>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
                        <span class="micon icon-copy fa fa-video-camera"></span><span class="mtext">강좌 관리</span>
                    </a>
                    <ul class="submenu">
                        <li><a href="basic-table.html">강좌 목록</a></li>
                        <li><a href="datatable.html">강좌 추가</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="noDropdown">
                        <span class="micon icon-copy fa fa-user-circle"></span><span class="mtext">회원 관리</span>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
                        <span class="micon icon-copy fa fa-calendar-minus-o"></span><span class="mtext">게시판 관리</span>
                    </a>
                    <ul class="submenu">
                        <li><a href="ui-cards.html">공지사항 게시판</a></li>
                        <li><a href="ui-buttons.html">교육정보 게시판</a></li>
                        <li><a href="ui-cards.html">자료실 게시판</a></li>
                        <li><a href="ui-cards.html">자유게시판</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>
</div>
<div class="mobile-menu-overlay"></div>
</body>
</html>
