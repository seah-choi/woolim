<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        td a {
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
<section class="product-shop spad">
    <div class="container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/mypageSide.jsp"/>
            <div class="col-lg-9 order-1 order-lg-2">
                <h5 style="font-weight: bold">1 : 1 문의하기</h5>
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
                <table class="table">
                    <thead>
                    <tr class="table-secondary">
                        <th scope="col">no</th>
                        <th scope="col">답변 상태</th>
                        <th scope="col">제목</th>
                        <th scope="col">등록일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set value="${responseDTO.total_count}" var="total_count"/>

                    <c:choose>
                        <c:when test="${responseDTO.dtolist != null}">
                            <c:forEach var="qnaDTO" items="${responseDTO.dtolist}" varStatus="i">
                                <tr>
                                    <th scope="row">${total_count - i.index - responseDTO.page_skip_count}</th>
                                    <td>${qnaDTO.qna_answer_status}</td>
                                    <td><a href="/mypage/qnaView?qna_idx=${qnaDTO.qna_idx}">${qnaDTO.qna_title}</a></td>
                                    <td>${qnaDTO.qna_reg_date}</td>
                                </tr>
                            </c:forEach>

                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="4">작성한 게시글이 없습니다</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
                <div class="loading-more">
                    <!-- <i class="icon_loading"></i>
                    <a href="#">
                        Loading More
                    </a> -->
                </div>
                <nav class="blog-pagination justify-content-center d-flex">
                    <ul class="pagination">
                        <li class="page-item <c:if test="${!responseDTO.prev_page_plag}">disabled</c:if>">
                            <a class="page-link" href="/mypage/qnaList?page=${((responseDTO.page - responseDTO.page_block_size) >= 1) ? (responseDTO.page - responseDTO.page_block_size) : 1}${responseDTO.linkParams}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="li" begin="${responseDTO.page_block_start}" end="${responseDTO.page_block_end}">
                            <li class="page-item <c:if test="${responseDTO.page eq li}">active</c:if> ">
                                <a class="page-link" href="/mypage/qnaList?page=${li}${responseDTO.linkParams}">${li}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item <c:if test="${!responseDTO.next_page_plag}">disabled</c:if>">
                            <a class="page-link" href="/mypage/qnaList?page=${(responseDTO.page + responseDTO.page_block_size) <= responseDTO.total_page ? (responseDTO.page + responseDTO.page_block_size) : responseDTO.total_page}${responseDTO.linkParams}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <div style="display: flex;justify-content: flex-end;">
                    <button type="button" class="btn" id="btn_regist" onclick="location.href='/mypage/qnaRegist'">글쓰기</button>
                </div>
            </div>
        </div>
    </div>
</section>
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
