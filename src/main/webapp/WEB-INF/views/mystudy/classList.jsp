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
        #lecture {
            padding: 20px;
            display: flex;
            border-bottom: 1px solid #ccc;
            padding: 20px;
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
    <style>
        div.searchBox {
            padding: 30px;
            width: 100%;
            background-color: #f3f3f3;
            border-radius: 10px;
        }

        input.searchInput {
            width: 300px;
            margin-top: 2px;
            border-radius: 10px;
            height: 45px;
            border: 1px solid #54545480;

        }
    </style>
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
        <h5 style="font-weight: bold">나의 강의실</h5>
        <div>
            <img src="/resources/img/free-icon-play-video-7263679.png">
            <span>수강 중인 강좌</span>
        </div>
        <hr>
        <div class="searchBox">
            <form role="search" id="frmSearch" class="searchForm" action="/mystudy/classList" method="get">

                <div class="mb-3 d-flex">
                    <label class="ml-3 col-form-label fontWe-700 mt-4">검색 범위</label>

                    <div class="col-md-2 col-sm-12 ml-4">
                        <div class="form-group">
                            <label>구분</label>
                            <select id="schoolSelect" name="search_type" class="form-control" data-size="5" data-style="btn-outline-info">
                                <option value="">전체</option>
                                <option value="t">제목</option>
                                <option value="u">강사명</option>
                            </select>
                        </div>
                    </div>

                    <div class="col mt-4">
                        <input class="searchInput form-control" type="search" name="search_word"  id="search_word" placeholder="검색" aria-label="Search" value="">
                    </div>
                </div>

                <div class="mb-3 d-flex">
                    <label class="ml-3 col-form-label fontWe-700">검색 기간</label>
                    <div class="col-2 ml-4">
                        <input type="date" class="form-control searchDate" name="search_date1" id="search_date1" value="">
                    </div>
                    <div class="mt-2">
                        <span class="justify-content-center">~</span>
                    </div>
                    <div class="col-2">
                        <input type="date" class="form-control searchDate" name="search_date2" id="search_date2" value="">
                    </div>
                    <div class="col-sm-3 ml-5">
                        <button class="btn btn-warning" id="btnSearch" type="submit">검색</button>
                        <button class="btn btn-warning" id="btnReset" type="reset" onclick="location.href='/data/main'">초기화</button>
                    </div>
                </div>
            </form>
        </div>
        <br>
        <c:if test="${responseDTO.dtolist.size() == 0}">
            <div id="lecture">
                <p class="d-flex justify-content-center">수강중인 강좌가 없습니다.</p>
            </div>
        </c:if>
        <c:forEach items="${responseDTO.dtolist}" var="list">
        <div id="lecture">
            <div><a href="/lecture/view?lecture_idx=${list.lecture_idx}"><img src="/resources/img/lecture/${list.lecture_image}"></a></div>
            <div style="display: flex;flex-direction: column;margin-left: 20px;width: 1000px;">
                <h5>${list.lecture_title}</h5>
                <span>강사 : ${list.member_name} </span>
                <span>수강기간 : ${list.lecture_start_date} ~ ${list.lecture_end_date}</span>
                <div style="display: flex;justify-content: flex-end;">
                    <button type="button" class="btn" id="btn_regist" onclick="location.href='/lecture/view?lecture_idx=${list.lecture_idx}'">학습하러 가기</button>
                </div>
            </div>
        </div>
        </c:forEach>
        <nav class="blog-pagination justify-content-center d-flex" style="margin-top: 50px;">
            <ul class="pagination">
                <li class="page-item <c:if test="${responseDTO.prev_page_plag == 'false'}"> disabled</c:if>" >
                    <a href="/mystudy/classList?page=${responseDTO.page_block_start - responseDTO.page_block_size}${responseDTO.linkParams}"
                       class="page-link" aria-label="Previous">&laquo;
                    </a>
                </li>
                <c:forEach begin="${responseDTO.page_block_start}"
                           end="${responseDTO.page_block_end}"
                           var="page_num">
                    <li class="page-item <c:if test="${responseDTO.page == page_num}">active</c:if>">
                        <a href="/mystudy/classList?page=${page_num}${responseDTO.linkParams}" class="page-link">${page_num}</a>
                    </li>
                </c:forEach>
                <li class="page-item <c:if test="${responseDTO.next_page_plag == 'false'}"> disabled</c:if>" >
                    <a href="/mystudy/classList?page=${responseDTO.page_block_start + responseDTO.page_block_size}${responseDTO.linkParams}" class="page-link" aria-label="Previous">
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


