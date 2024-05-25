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
                <h4 class="h4">강좌 목록</h4>
                <br>
                <div class="searchBox">
                    <form role="search" id="frmSearch" class="searchForm">
                        <div class="mb-3 row d-flex">
                            <label class="ml-3 col-form-label fontWe-700 mt-4">검색 범위</label>

                            <div class="col-md-1 col-sm-12">
                                <div class="form-group selectDiv">
                                    <label>과목</label>
                                    <select class="selectpicker form-control" name="search_type" data-size="5" data-style="btn-outline-info">
                                        <option>전체</option>
                                        <option>국어</option>
                                        <option>영어</option>
                                        <option>수학</option>
                                        <option>과학</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-1 col-sm-12 ml-5" >
                                <div class="form-group selectDiv">
                                    <label>초중고</label>
                                    <select id="schoolSelect" name="search_type" class="selectpicker form-control school" data-size="5" data-style="btn-outline-info">
                                        <option>전체</option>
                                        <option value="elementary">초등</option>
                                        <option value="middle">중등</option>
                                        <option value="high">고등</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-1 col-sm-12 ml-5">
                                <div class="form-group selectDiv">
                                    <label>학년</label>
                                    <select id="gradeSelect" name="search_type" class="selectpicker form-control grade" data-size="5" data-style="btn-outline-info">
                                        <option>전체</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mt-4 ml-5">
                                <input class="searchInput ml-2" type="search" name="search_word"  id="search_word" placeholder="검색" aria-label="Search" value="">
                            </div>
                        </div>

                        <div class="mb-3 row">

                            <form action="/lecture/list" method="get" class="input-group" style="width: 500px;">
                                <select class="category-btn" name="type" id="search_area">
                                    <option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>전체</option>
                                    <option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : ''}>제목</option>
                                    <option value="W" ${pageMaker.cri.type eq 'W' ? 'selected' : ''}>강사</option>
                                    <option value="C" ${pageMaker.cri.type eq 'C' ? 'selected' : ''}>과목</option>
                                </select>
                                <c:choose>
                                    <c:when test="${pageMaker.cri.keyword != null && pageMaker.cri.keyword != ''}">
                                        <input type="text" name="keyword" id="keyword" value="${pageMaker.cri.keyword}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요.">
                                    </c:otherwise>
                                </c:choose>

                                <button type="button" id="searchBtn"><i class="ti-search"></i></button>
                                <button type="button" id="resetBtn">초기화</button>
                            </form>
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
                        <th>강좌명</th>
                        <th>과목명</th>
                        <th>강사명</th>
                        <th>강좌 기간</th>
                        <th>강좌 등록일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="list">
                    <tr>
                        <td>
                            <div class="custom-control custom-checkbox mb-5">
                                <input type="checkbox" class="custom-control-input" id="customCheck2">
                                <label class="custom-control-label" for="customCheck2"><span></span></label>
                            </div>
                        </td>
                        <td>${list.lecture_idx}</td>
                        <td>${list.lecture_title}</td>
                        <td>${list.lecture_category_subject}</td>
                        <td>${list.member_name}</td>
                        <td>${list.lecture_start_date} ~ ${list.lecture_end_date}</td>
                        <td>${list.lecture_reg_date}</td>
                    </tr>
                    </c:forEach>

                    </tbody>

                </table>
                <div class="d-flex justify-content-sm-end">
                    <a class="btn btn-primary btn-lg btn-block" href="/admin/lecture/regist" style="width: 100px; height: 40px; font-size: 15px;" >작성하기</a>
                </div>

                <div class="pageInfo_wrap">
                    <div class="pageInfo_area">
                        <!-- 이전페이지 버튼 -->
                        <c:if test="${pageMaker.prev}">
                            <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                        </c:if>

                        <!-- 각 번호 페이지 버튼 -->
                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                        </c:forEach>


                        <!-- 다음페이지 버튼 -->
                        <c:if test="${pageMaker.next}">
                            <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
                        </c:if>
                    </div>
                </div>

        </div>
    </div>
    <form class="moveForm" method="get" id="moveForm">
        <input type="hidden" name="type" value="${pageMaker.cri.type }">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="keyword" id="key" value="${pageMaker.cri.keyword }">
        <input type="hidden" name="sorting" value="${pageMaker.cri.sorting}">
        <input type="hidden" name="viewSorting"  value="${pageMaker.cri.viewSorting}">
        <input type="hidden" name="category"  value="${pageMaker.cri.category}">
        <input type="hidden" name="subject"  value="${pageMaker.cri.subject}">
    </form>
</div>
</div>
<!-- js -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script>
    const moveForm = document.querySelector("#moveForm");
    document.querySelector(".pageinfo")
    $(".pageInfo_area a").on("click", function(e){
        let sort = document.getElementById("viewSorting").value;

        if(sort == null) {
            sort = 9;
        }
        e.preventDefault();
        const key = document.querySelector("#key").value;
        console.log(key+"#");
        const pageNum = $(this).attr("href");
        moveForm.querySelector("input[name='pageNum']").value = pageNum;
        moveForm.querySelector("input[name='type']").value;
        moveForm.querySelector("input[name='keyword']").value = key;
        moveForm.querySelector("input[name='viewSorting']").value = sort;
        moveForm.querySelector("input[name='sorting']").value;
        moveForm.action = "/admin/lecture/list";
        moveForm.submit();
    });

    document.querySelector("#searchBtn").addEventListener("click", function (e) {
        e.preventDefault();

        let type =  document.querySelector("#search_area").value;
        console.log(type+"asd");
        let val = document.querySelector("#keyword").value;

        if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }

        if(!val){
            alert("키워드를 입력하세요.");
            return false;
        }
        moveForm.querySelector("input[name='viewSorting']").value;
        moveForm.querySelector("input[name='sorting']").value;
        moveForm.querySelector("input[name='type']").value = type;
        moveForm.querySelector("input[name='keyword']").value = val;
        moveForm.querySelector("input[name='pageNum']").value = 1;
        moveForm.submit();
    });

    function redirectToList() {
        let sortingValue = document.getElementById("sorting").value;
        let sort = document.getElementById("viewSorting").value;

        if(sort == null) {
            sort = 9;
        }
        moveForm.querySelector("input[name='viewSorting']").value=sort;
        moveForm.querySelector("input[name='sorting']").value = sortingValue;
        moveForm.querySelector("input[name='type']").value;
        moveForm.querySelector("input[name='keyword']").value;
        moveForm.querySelector("input[name='pageNum']").value = 1;
        moveForm.submit();

    }
    function viewSorting() {
        let sortingValue = document.getElementById("viewSorting").value;
        moveForm.querySelector("input[name='viewSorting']").value = sortingValue;
        moveForm.querySelector("input[name='sorting']").value ;
        moveForm.querySelector("input[name='type']").value;
        moveForm.querySelector("input[name='keyword']").value;
        moveForm.querySelector("input[name='pageNum']").value = 1;
        moveForm.submit();
    }
    function  navigateWithSort(category) {
        let sort = document.getElementById("viewSorting").value;

        if(sort == null) {
            sort = 9;
        }
        moveForm.querySelector("input[name='viewSorting']").value = sort;
        moveForm.querySelector("input[name='sorting']").value ;
        moveForm.querySelector("input[name='type']").value;
        moveForm.querySelector("input[name='keyword']").value;
        moveForm.querySelector("input[name='pageNum']").value = 1;
        moveForm.querySelector("input[name='category']").value = category;
        moveForm.submit();
    }
    document.querySelector("#resetBtn").addEventListener("click", function (){
        location.href= '/lecture/list';
    });

    document.querySelectorAll('input[name="subject"]').forEach(function (checkbox) {
        checkbox.addEventListener('change', function () {
            updateFormAndSubmit();
        });
    });

    function updateFormAndSubmit() {
        const checkboxes = document.querySelectorAll('input[name="subject"]:checked');
        let sort = document.getElementById("viewSorting").value;

        if (sort == null) {
            sort = 9;
        }
        checkboxes.forEach((checkbox) => {
            moveForm.querySelector("input[name='viewSorting']").value = checkbox.value;
            console.log("###" + checkbox.value);
        });
    }
    //분류 셀렉박스
    const gradeOptions = {
        elementary: ['전체', '1학년', '2학년', '3학년', '4학년', '5학년', '6학년'],
        middle: ['전체', '1학년', '2학년', '3학년'],
        high: ['전체', '1학년', '2학년', '3학년'],
    };

/*
    document.getElementById('schoolSelect').addEventListener('change', function () {
        const schoolType = this.value;
        const gradeSelect = document.getElementById('gradeSelect');

        gradeSelect.innerHTML = '';

        if (schoolType in gradeOptions) {
            gradeOptions[schoolType].forEach(grade => {
                const option = document.createElement('option');
                option.value = grade;
                option.textContent = grade;
                gradeSelect.appendChild(option);
            });
        } else {
            const option = document.createElement('option');
            option.value = 'all';
            option.textContent = '전체';
            gradeSelect.appendChild(option);
        }

        $('.selectpicker').selectpicker('refresh');
    });
*/

/*    document.getElementById('schoolSelect').dispatchEvent(new Event('change'));*/

/*

    let frm = document.querySelector("#frm");
    let chkAll = document.querySelector("#chkAll");*/
    // 체크박스 전체 선택/해제
/*    chkAll.addEventListener("click", (e) => {
        var check = document.querySelectorAll("input[type ='checkbox']");

        check.forEach((checkbox) => {
            checkbox.checked = chkAll.checked;
        });
    });*/

   /* // 삭제 버튼 눌렀을 때
    document.querySelector("#btnDelete").addEventListener("click", (e) => {
        var check = document.querySelectorAll("input[type ='checkbox']:checked");
        console.log(check);
        if (check.length == 0) {
            alert("하나 이상 선택하세요.");
            e.preventDefault();
            return false;
        } else {
                let deleteOk = confirm("삭제 하시겠습니까?");
                if (deleteOk) {

                console.log(check);
                frm.submit();

            } else {
                e.preventDefault();
                return false;
            }
        }
    });*/

</script>

<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
