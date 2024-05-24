<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
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
            color: #000 !important;
            text-decoration: none;
        }

        #list{
            padding: 50px;
            width: 1000px;
            padding-top: 30px;
        }

        #search {
            background: #68afcb;
            color: #fff;
            border: none;
        }
        #drop{
            border: 1px solid #dee2e6;
        }

        #btn_regist {
            background: #68afcb;
            color: #fff;
        }

        .table{
            margin-bottom: 50px !important;
        }

        .page-item.active .page-link {
            background-color: #68afcb !important;
            color: #fff !important;
            border-color : #68afcb !important;
        }
        a {
            text-decoration: none !important;
        }
        #btn_regist {
            background: #68afcb;
            color: #fff;
        }
    </style>
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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div id="box">
    <div id="leftNav">
        <nav class="nav flex-column">
            <h4>나의 학습방</h4>
            <div style="border-bottom: 1px solid #000;width: 50px;padding: 10px;"></div>
            <div style="padding-top: 20px; line-height: unset;">
                <a class="nav-link" aria-current="page" href="/mystudy/classList">나의 강의실</a>
                <a class="nav-link" href="/mystudy/freeList">내가 쓴 글</a>
                <a class="nav-link" href="/mystudy/commentList">내가 남긴 댓글</a>
                <a class="nav-link" href="/mystudy/gradeList">성적표</a>
                <a class="nav-link" href="/mystudy/studyPlanList">학습계획표</a>
            </div>
        </nav>
    </div>
    <div id="list">
        <h5 style="font-weight: bold">내가 남긴 댓글</h5>
        <div>
            <img src="/resources/img/free-icon-bulletin-board-12094191.png">
            <a href="/mystudy/commentList"><span>자유게시판</span></a>
            <span>|</span>
            <img src="/resources/img/free-icon-play-video-7263679.png">
            <a href="/mystudy/commentList"><span>수강평</span></a>
        </div>
        <hr>
        <div class="input-group">
            <button class="btn btn-outline-secondary dropdown-toggle" id="drop" type="button" data-bs-toggle="dropdown" aria-expanded="false">전체</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">제목</a></li>
                <li><a class="dropdown-item" href="#">내용</a></li>
            </ul>
            <input type="text" class="form-control" aria-label="Text input with 2 dropdown buttons">
            <button class="btn btn-outline-secondary" type="button" id="search" aria-expanded="false">검색</button>
        </div>
        <br>
        <div style="border-bottom: 1px solid #ccc;padding: 20px;">
        <c:choose>
            <c:when test="${not empty reply.dtolist}">
                <c:forEach items="${reply.dtolist}" var="list">
                    <a href="/board/freeView?bbs_idx=${list.bbs_idx}"><p style="font-weight: 700;">[원문] ${list.bbs_title} </p></a>
                    <div style="display: flex;justify-content: space-between;">
                        <span style="color: #68afcb;font-weight: bold;">→ ${list.reply_content} </span>
                        <button type="button" class="btn" id="btn_regist" onclick="location.href='/board/freeView?bbs_idx=${list.bbs_idx}'">원문보기</button>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                남긴 댓글이 없습니다.
            </c:otherwise>
        </c:choose>
        </div>
        <nav class="blog-pagination justify-content-center d-flex" style="margin-top: 50px;">
            <ul class="pagination">
                <li class="page-item <c:if test="${reply.prev_page_plag == 'false'}"> disabled</c:if>" >
                    <a href="/mystudy/commentList?page=${responseDTO.page_block_start - responseDTO.page_block_size}${responseDTO.linkParams}"
                       class="page-link" aria-label="Previous">&laquo;
                    </a>
                </li>
                <c:forEach begin="${reply.page_block_start}"
                           end="${reply.page_block_end}"
                           var="page_num">
                    <li class="page-item <c:if test="${reply.page == page_num}">active</c:if>">
                        <a href="/mystudy/commentList?page=${page_num}${reply.linkParams}" class="page-link">${page_num}</a>
                    </li>
                </c:forEach>
                <li class="page-item <c:if test="${reply.next_page_plag == 'false'}"> disabled</c:if>" >
                    <a href="/mystudy/commentList?page=${reply.page_block_start + reply.page_block_size}${reply.linkParams}" class="page-link" aria-label="Previous">
                        &raquo;
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
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
</body>
</html>



