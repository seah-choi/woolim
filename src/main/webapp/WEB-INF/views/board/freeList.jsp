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
            <h5 style="font-weight: bold">게시판</h5>
            <div style="border-bottom: 1px solid #000;width: 50px;padding: 10px;"></div>
            <div style="padding-top: 20px; line-height: unset;">
                <a class="nav-link" aria-current="page" href="/board/freeList?bbs_type=bbs02">자유게시판</a>
                <a class="nav-link" href="/board/list?bbs_type=bbs01">교육정보</a>
                <a class="nav-link" href="/board/list?bbs_type=bbs05">자료실</a>
                <a class="nav-link" href="/board/list?bbs_type=bbs04">공지사항</a>
            </div>
        </nav>
    </div>
    <div id="list">
        <h5 style="font-weight: bold">자유게시판</h5>
        <hr>
        <div class="searchBox">
            <form role="search" id="frmSearch" class="searchForm" action="/board/freeList" method="get">
                <input type="hidden" name="bbs_type" value="${bbs_type}" >
                <div class="mb-3 row d-flex">
                    <div class="input-group col-md-1">
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
        <c:choose>
            <c:when test="${not empty bbsList.dtolist}">
                <c:forEach items="${bbsList.dtolist}" var="list">
                    <div style="border-bottom: 1px solid #ccc;padding: 20px;">
                        <a href="/board/freeView?bbs_idx=${list.bbs_idx}" style="font-weight: bold">${list.bbs_title}</a><br><br>
                        <a href="/board/freeView?bbs_idx=${list.bbs_idx}">${list.bbs_content}</a>
                        <div style="display: flex;justify-content: space-between;">
                            <div style="color: #76767f;padding-top: 5px;"><span>${list.member_id}</span>•<span>${list.bbs_reg_date}</span></div>
                            <div class="">
                                <img src="/resources/img/eye.png" width="16px" height="16px" style="margin-top: 6px;"> ${list.bbs_read_cnt}&nbsp;
                                <img src="/resources/img/free-icon-chat-9256384.png" width="16px" height="16px" style="margin-top: 6px"> ${list.bbs_reply_cnt}
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                등록된 글이 없습니다.
            </c:otherwise>
        </c:choose>
        <nav class="blog-pagination justify-content-center d-flex" style="margin-top: 50px;">
            <ul class="pagination">
                <li class="page-item <c:if test="${bbsList.prev_page_plag == 'false'}"> disabled</c:if>" >
                    <a href="/board/freeList?page=${bbsList.page_block_start - bbsList.page_block_size}${bbsList.linkParams}"
                       class="page-link" aria-label="Previous">&laquo;
                    </a>
                </li>
                <c:forEach begin="${bbsList.page_block_start}"
                           end="${bbsList.page_block_end}"
                           var="page_num">
                    <li class="page-item <c:if test="${bbsList.page == page_num}">active</c:if>">
                        <a href="/board/freeList?page=${page_num}${bbsList.linkParams}" class="page-link">${page_num}</a>
                    </li>
                </c:forEach>
                <li class="page-item <c:if test="${bbsList.next_page_plag == 'false'}"> disabled</c:if>" >
                    <a href="/board/freeList?page=${bbsList.page_block_start + bbsList.page_block_size}${bbsList.linkParams}" class="page-link" aria-label="Previous">
                        &raquo;
                    </a>
                </li>
            </ul>
        </nav>
        <c:if test="${not empty member_id}">
        <div style="display: flex;justify-content: flex-end;">
            <button type="button" class="btn" id="btn_regist" onclick="location.href='/board/freeRegist'">글쓰기</button>
        </div>
        </c:if>
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

