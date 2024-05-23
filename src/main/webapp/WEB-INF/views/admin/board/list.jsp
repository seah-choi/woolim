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
                        <input type="hidden" name="bbs_type" value="${responseDTO.bbs_type}">
                        <div class="mb-3 row d-flex">
                            <label class="col-sm-1 col-form-label fontWe-700">검색 범위</label>

                            <div class="col-md-1 col-sm-12">
                                <div class="form-group">
                                    <label>구분</label>
                                    <select id="schoolSelect" name="search_type" class="selectpicker form-control school" data-size="5" data-style="btn-outline-info">
                                        <option>전체</option>
                                        <option value="t">제목</option>
                                        <option value="c">내용</option>
                                        <option value="u">작성자</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col mt-4">
                                <input class="searchInput" type="search" name="search_word"  id="search_word" placeholder="검색" aria-label="Search" value="">
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label class="ml-3 col-form-label fontWe-700">검색 기간</label>
                            <div class="col-2">
                                <input type="date" class="form-control" name="search_date1" id="search_date1" value="">
                            </div>
                            <div class="mt-2">
                                <span class="justify-content-center">~</span>
                            </div>
                            <div class="col-2">
                                <input type="date" class="form-control" name="search_date2" id="search_date2" value="">
                            </div>
                            <div class="col-sm-2">
                                <button class="btn btn-warning" id="btnSearch" type="submit">검색</button>
                                <button class="btn btn-warning" id="btnReset" type="reset" onclick="location.href='/data/main'">초기화</button>
                            </div>
                        </div>
                    </form>
                </div>
                <br>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th style="width: 110px;">
                            <input type="checkbox" id="chkAll" name="chkAll"/>
                            <label for="chkAll"><span></span>전체선택</label>
                        </th>
                        <th>NO.</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>등록일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>

                    <tbody>

                    <c:forEach items="${bbsList.dtolist}" var="list">
                        <tr>
                            <td>
                                <input type="checkbox" id="${list.bbs_idx}" name="bbs_idx"
                                       value="${list.bbs_idx}"/>
                                <label for="${list.bbs_idx}"><span></span></label>
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
                </div>

                <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
                    <ul class="pagination">
                        <li class="paginate_button page-item previous disabled" id="DataTables_Table_0_previous">
                            <a href="#" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" class="page-link">
                                <i class="ion-chevron-left"></i></a></li>
                        <li class="paginate_button page-item active">
                            <a href="#" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0" class="page-link">1</a></li>
                        <li class="paginate_button page-item ">
                            <a href="#" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0" class="page-link">2</a></li>
                        <li class="paginate_button page-item next" id="DataTables_Table_0_next">
                            <a href="#" aria-controls="DataTables_Table_0" data-dt-idx="3" tabindex="0" class="page-link">
                                <i class="ion-chevron-right"></i></a></li>
                    </ul>
                </div>

            </div>

        </div>
    </div>
</div>
<!-- js -->
<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
