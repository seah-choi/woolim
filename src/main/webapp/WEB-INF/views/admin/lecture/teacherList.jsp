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


<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">

            <!-- basic table  Start -->
            <div class="pd-20 card-box mb-30">
                <h4 class="h4">회원 목록</h4>
                <br>
              <%--  <div class="searchBox">--%>
                    <%--<form role="search" id="frmSearch" class="searchForm" action="/admin/member/list">

                        <div class="mb-3 row d-flex">
                            <label class="ml-3 col-form-label fontWe-700 mt-4">검색 범위</label>

                            <div class="col-md-1 col-sm-12 ml-4">
                                <div class="form-group selectDiv">
                                    <label>구분</label>
                                    <select name="search_type" class="selectpicker form-control school" data-size="5" data-style="btn-outline-info">
                                        <option>전체</option>
                                        <option value="t">아이디</option>
                                        <option value="c">이름</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-1 col-sm-12 ml-2">
                                <div class="form-group selectDiv ml-4" >
                                    <label>회원 구분</label>
                                    <select name="member_type" class="selectpicker form-control grade" data-size="5" data-style="btn-outline-info">
                                        <option>전체</option>
                                        <option value="admin">관리자</option>
                                        <option value="student">학생</option>
                                        <option value="teacher">선생님</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mt-4" style="margin-left: 100px">
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
                                <button class="btn btn-warning" id="btnReset" type="reset" onclick="location.href='/admin/member/list'">초기화</button>
                            </div>
                        </div>
                    </form>--%>
          <%--      </div>--%>
                <br>
                <form id="frm" name="frm">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>
                            선택
                        </th>
                        <th>NO.</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>회원 구분</th>
                        <th>가입일</th>
                        <th>탈퇴 여부</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${list}" var="list">
                        <tr>
                            <td>
                                <input type="radio" value="${list.member_idx}">
                            </td>
                            <td>${list.member_idx}</td>
                            <td><a href="/admin/member/view?member_id=${list.member_id}">${list.member_name}</a></td>
                            <td>${list.member_id}</td>
                            <td style="width: 130px">
                                <select name="member_type" class="selectpicker form-control grade" data-size="5" data-style="btn-outline-info">
                                    <c:if test="${list.member_category eq 'admin'}">
                                        <option value="admin">관리자</option>
                                        <option value="student">학생</option>
                                        <option value="teacher">선생님</option>
                                    </c:if>
                                    <c:if test="${list.member_category eq 'student'}">
                                        <option value="student">학생</option>
                                        <option value="teacher">선생님</option>
                                        <option value="admin">관리자</option>
                                    </c:if>
                                    <c:if test="${list.member_category eq 'teacher'}">
                                        <option value="teacher">선생님</option>
                                        <option value="student">학생</option>
                                        <option value="admin">관리자</option>
                                    </c:if>
                                </select>
                            </td>
                            <td>${list.member_reg_date}</td>
                            <td>${list.member_status}</td>
                        </tr>
                    </c:forEach>

                    </tbody>

                </table>
                    <button type="button" id="submitBtn" class="btn btn-primary" style="width: 100px; height: 50px; float: right;">선택</button>
                </form>

              <%--  <div class="d-flex justify-content-center">
                    <!-- Pagination with icons -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item <c:if test="${memberList.prev_page_plag == 'false'}"> disabled</c:if>" >
                                <a href="/admin/member/list?page=${memberList.page_block_start - memberList.page_block_size}${memberList.linkParams}"
                                   class="page-link" aria-label="Previous">&laquo;
                                </a>
                            </li>
                            <c:forEach begin="${memberList.page_block_start}"
                                       end="${memberList.page_block_end}"
                                       var="page_num">
                                <li class="page-item <c:if test="${memberList.page == page_num}">active</c:if>">
                                    <a href="/admin/member/list?page=${page_num}${memberList.linkParams}" class="page-link">${page_num}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item <c:if test="${memberList.next_page_plag == 'false'}"> disabled</c:if>" >
                                <a href="/admin/member/list?page=${memberList.page_block_start + memberList.page_block_size}${memberList.linkParams}" class="page-link" aria-label="Previous">
                                    &raquo;
                                </a>
                            </li>
                        </ul>
                    </nav><!-- End Pagination with icons -->
                </div>--%>
            </div>

        </div>
    </div>
</div>
<!-- js -->
<script>
    let frm = document.querySelector("#frm");
    document.querySelector("#submitBtn").addEventListener("click",function (e){
       e.preventDefault();
       const radio = document.querySelectorAll('input[type="radio"]:checked');
        const memberId = radio.closest("tr").querySelector('td:nth-child(3)').innerText;
        const memberName = radio.closest("tr").querySelector('td:nth-child(4)').innerText;

        console.log("###ID" + memberId);
        console.log("##memberName" + memberName);

    });



</script>

<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
