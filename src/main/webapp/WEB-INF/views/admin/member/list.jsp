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
                <h4 class="h4">회원 목록</h4>
                <br>
                <div class="searchBox">
                    <form role="search" id="frmSearch" class="searchForm" action="/admin/member/list">
                        <div class="mb-3 row d-flex">
                            <label class="col-sm-1 col-form-label fontWe-700 mt-4">검색 범위</label>

                            <div class="col-md-1 col-sm-12">
                                <div class="form-group">
                                    <label>구분</label>
                                    <select id="schoolSelect" name="search_type" class="selectpicker form-control school" data-size="5" data-style="btn-outline-info">
                                        <option>전체</option>
                                        <option value="t">아이디</option>
                                        <option value="c">이름</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-1 col-sm-12">
                                <div class="form-group">
                                    <label>회원 상태</label>
                                    <select id="gradeSelect" name="member_type" class="selectpicker form-control grade" data-size="5" data-style="btn-outline-info">
                                        <option>전체</option>
                                        <option value="admin">관리자</option>
                                        <option value="student">학생</option>
                                        <option value="teacher">선생님</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mt-4 ml-5" >
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
                        <th>
                            <div class="custom-control custom-checkbox mb-5">
                                <input type="checkbox" class="custom-control-input" id="chkAll" name="chkAll">
                                <label class="custom-control-label" for="chkAll">전체선택</label>
                            </div>
                        </th>
                        <th>NO.</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>회원 상태</th>
                        <th>가입일</th>
                        <th>탈퇴 여부</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${memberList.dtolist}" var="list">
                        <tr>
                            <td>
                                <div class="custom-control custom-checkbox mb-5">
                                    <input type="checkbox" class="custom-control-input" value="${list.member_idx}" name="member_idx" id="${list.member_idx}">
                                    <label class="custom-control-label" for="${list.member_idx}"><span></span></label>
                                </div>
                            </td>
                            <td>${list.member_idx}</td>
                            <td><a href="/admin/member/view?member_idx=${list.member_idx}">${list.member_name}</a></td>
                            <td>${list.member_id}</td>
                            <td>${list.member_category}</td>
                            <td>${list.member_reg_date}</td>
                            <td>${list.member_status}</td>
                        </tr>
                    </c:forEach>

                    </tbody>

                </table>
                <div class="d-flex justify-content-sm-end mt-2">
                    <div class="d-flex justify-content-sm-end mr-3 ">
                        <a class="btn btn-primary btn-lg btn-block" href="#" style="width: 100px; height: 40px; font-size: 15px;" >수정하기</a>
                    </div>
                    <div class="d-flex justify-content-sm-end ml-2 mr-3">
                        <a class="btn btn-primary btn-lg btn-block" href="#" style="width: 100px; height: 40px; font-size: 15px;" >탈퇴</a>
                    </div>
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
