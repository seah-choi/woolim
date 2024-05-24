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

    <style>
        .card-box {
            margin-right: 400px;
            margin-left: 20px;
            padding-bottom: 100px;
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/admin/common/adminSidebar.jsp"/>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">

            <!-- basic table  Start -->
            <div class="pd-20 card-box mb-30">

                <c:if test="${bbsList.bbs_type eq 'bbs01'}">
                    <h4 class="h4">교육정보 게시판</h4>
                </c:if>
                <c:if test="${bbsList.bbs_type eq 'bbs02'}">
                    <h4 class="h4">자유 게시판</h4>
                </c:if>
                <c:if test="${bbsList.bbs_type eq 'bbs04'}">
                    <h4 class="h4">공지사항 게시판</h4>
                </c:if>
                <c:if test="${bbsList.bbs_type eq 'bbs05'}">
                    <h4 class="h4">자료실</h4>
                </c:if>

                <br>
                <div class="searchBox">
                    <form role="search" id="frmSearch" class="searchForm" action="/admin/board/list" method="get">
                        <input type="hidden" name="bbs_type" value="${bbsList.bbs_type}">
                        <div class="mb-3 row d-flex">
                            <label class="ml-3 col-form-label fontWe-700 mt-4">검색 범위</label>

                            <div class="col-md-2 col-sm-12 ml-4">
                                <div class="form-group">
                                    <label>구분</label>
                                    <select id="schoolSelect" name="search_type" class="selectpicker form-control school" data-size="5" data-style="btn-outline-info">
                                        <option value="">전체</option>
                                        <option value="t" <c:forEach var="type" items="${bbsList.search_types}"><c:if test="${type eq 't'}">selected</c:if></c:forEach>>제목</option>
                                        <option value="c" <c:forEach var="type" items="${bbsList.search_types}"><c:if test="${type eq 'c'}">selected</c:if></c:forEach>>내용</option>
                                        <option value="u" <c:forEach var="type" items="${bbsList.search_types}"><c:if test="${type eq 'u'}">selected</c:if></c:forEach>>작성자</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col mt-4">
                                <input class="searchInput" type="search" name="search_word"  id="search_word" placeholder="검색" aria-label="Search" value="">
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label class="ml-3 col-form-label fontWe-700">검색 기간</label>
                            <div class="col-2 ml-4">
                                <input type="date" class="form-control" name="search_date1" id="search_date1" value="">
                            </div>
                            <div class="mt-2">
                                <span class="justify-content-center">~</span>
                            </div>
                            <div class="col-2">
                                <input type="date" class="form-control" name="search_date2" id="search_date2" value="">
                            </div>
                            <div class="col-sm-3">
                                <button class="btn btn-warning" id="btnSearch" type="submit">검색</button>
                                <button class="btn btn-warning" id="btnReset" type="reset" onclick="location.href='/admin/board/list?bbs_type=${bbsList.bbs_type}'">초기화</button>
                            </div>
                        </div>
                    </form>
                </div>
                <br>
                <form action="/admin/board/delete" method="get" id="deleteForm">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th style="width: 130px;">
                                <div class="custom-control custom-checkbox mb-5 d-flex">
                                    <input type="checkbox" class="custom-control-input" id="chkAll" name="chkAll">
                                    <label class="custom-control-label" for="chkAll" style="font-weight: 700;">전체선택</label>
                                </div>
                            </th>
                            <th>NO.</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회수</th>
                        </tr>
                        </thead>

                        <tbody>

                        <c:forEach items="${bbsList.dtolist}" var="list" varStatus="status">
                            <tr>
                                <td>
                                    <div class="custom-control custom-checkbox mb-5">
                                        <input type="checkbox" class="custom-control-input" value="${list.bbs_idx}" name="bbs_idx" id="${list.bbs_idx}">
                                        <label class="custom-control-label" for="${list.bbs_idx}"><span></span></label>
                                    </div>
                                </td>
                                <td>${list.bbs_idx}</td>
                                <td><a href="/admin/board/view?bbs_idx=${list.bbs_idx}">${list.bbs_title}</a></td>
                                <td>${list.member_id}</td>
                                <td>${list.bbs_reg_date}</td>
                                <td>${list.bbs_read_cnt}</td>
                            </tr>
                        </c:forEach>

                        </tbody>

                    </table>
                    <div class="d-flex justify-content-sm-end">
                        <a class="btn btn-primary btn-lg btn-block" href="/admin/board/regist" style="width: 100px; height: 40px; font-size: 15px;" >작성하기</a>
                        <div class="d-flex justify-content-sm-end ml-2 mr-3">
                            <button type="button" id="btnDelete" name="btnDelete" class="btn btn-primary btn-lg btn-block" onclick="godelete();" style="width: 100px; height: 40px; font-size: 15px;">삭제하기</button>
                        </div>
                    </div>
                </form>


                <div class="d-flex justify-content-center">
                    <!-- Pagination with icons -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item <c:if test="${bbsList.prev_page_plag == 'false'}"> disabled</c:if>" >
                                <a href="/admin/board/list?page=${bbsList.page_block_start - bbsList.page_block_size}${bbsList.linkParams}"
                                   class="page-link" aria-label="Previous">&laquo;
                                </a>
                            </li>
                            <c:forEach begin="${bbsList.page_block_start}"
                                       end="${bbsList.page_block_end}"
                                       var="page_num">
                                <li class="page-item <c:if test="${bbsList.page == page_num}">active</c:if>">
                                    <a href="/admin/board/list?page=${page_num}${bbsList.linkParams}" class="page-link">${page_num}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item <c:if test="${bbsList.next_page_plag == 'false'}"> disabled</c:if>" >
                                <a href="/admin/board/list?page=${bbsList.page_block_start + bbsList.page_block_size}${bbsList.linkParams}" class="page-link" aria-label="Previous">
                                    &raquo;
                                </a>
                            </li>
                        </ul>
                    </nav><!-- End Pagination with icons -->
                </div>



            </div>

        </div>
    </div>
</div>
<!-- js -->
<script>
    let frm = document.querySelector("#frm");
    let chkAll = document.querySelector("#chkAll");
    // 체크박스 전체 선택/해제
    chkAll.addEventListener("click", (e) => {
        var check = document.querySelectorAll("input[type ='checkbox']");

        check.forEach((checkbox) => {
            checkbox.checked = chkAll.checked;
        });
    });

    // 삭제 버튼 눌렀을 때
    function godelete() {
        var check = document.querySelectorAll("input[type ='checkbox']:checked");
        console.log(check);
        if (check.length == 0) {
            alert("체크박스를 한 개 이상 선택하세요.");

            return false;
        } else {
            let deleteOk = confirm("정말 삭제하겠습니까?");
            if (deleteOk) {
                console.log(check);
                document.getElementById("deleteForm").submit();
            } else {
                return '/admin/board/list?bbs_type=${list.bbs_title}';
            }
        }
    }
</script>

<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
