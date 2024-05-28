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
        /* 전체 컨테이너를 플렉스 컨테이너로 설정 */
        .advanced-search {
            display: flex;
            align-items: center;
        }

        /* 카테고리 선택 버튼 스타일 */
        .category-btn {
            height: 40px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 0 15px;
            font-size: 16px;
            color: #495057;
            background-color: #fff;
            outline: none;
            transition: border-color 0.3s ease-in-out;
            margin-left: 18px;
        }

        .category-btn:focus {
            border-color: #80bdff;
        }

        /* 입력 그룹 컨테이너 스타일 */
        .input-group {
            display: flex;
            align-items: center;
        }

        /* 텍스트 입력 스타일 */
        .input-group input[type="text"] {
            height: 40px;
            padding: 0 15px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            font-size: 16px;
            color: #495057;
            outline: none;
            transition: border-color 0.3s ease-in-out;
        }

        .input-group input[type="text"]:focus {
            border-color: #80bdff;
        }

        /* 버튼 스타일 */
        .input-group button {
            height: 40px;
            padding: 0 20px;
            border: 1px solid #ced4da;
            background-color: #68afcb;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .input-group button i {
            font-size: 16px;
        }

        .input-group button:hover {
            background-color: #0056b3;
        }
        .select-option {
            display: flex;
        }

        .select-option .sorting {
            margin-right: 10px; /* 선택 상자 사이의 간격을 조절합니다. */
        }
        .pageInfo_wrap .pagination {
            display: flex;
            padding-left: 0;
            list-style: none;
            border-radius: .25rem;
            justify-content: center;
        }

        .pageInfo_wrap .page-link {
            position: relative;
            display: block;
            padding: .5rem .75rem;
            margin-left: -1px;
            line-height: 1;
            color: #327f9b;
            background-color: #fff;
            border: 1px solid #dee2e6;
        }

        .pageInfo_wrap .page-link:hover {
            z-index: 2;
            color: #327f9b;
            text-decoration: none;
            background-color: #e9ecef;
            border-color: #dee2e6;
        }

        .pageInfo_wrap .page-link:focus {
            z-index: 3;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .pageInfo_wrap .page-item:first-child .page-link {
            margin-left: 0;
            border-top-left-radius: .25rem;
            border-bottom-left-radius: .25rem;
        }

        .pageInfo_wrap .page-item:last-child .page-link {
            border-top-right-radius: .25rem;
            border-bottom-right-radius: .25rem;
        }

        .pageInfo_wrap .page-item.active .page-link {
            z-index: 3;
            color: #fff;
            background-color: #68afcb;
            border-color: #68afcb;
        }

        .pageInfo_wrap .page-item.disabled .page-link {
            color: #6c757d;
            pointer-events: none;
            cursor: auto;
            background-color: #fff;
            border-color: #dee2e6;
        }

        .pageInfo_wrap .pagination-lg .page-link {
            padding: .75rem 1.5rem;
            font-size: 1.25rem;
            line-height: 1.5;
        }

        .pageInfo_wrap .pagination-lg .page-item:first-child .page-link {
            border-top-left-radius: .3rem;
            border-bottom-left-radius: .3rem;
        }

        .pageInfo_wrap .pagination-lg .page-item:last-child .page-link {
            border-top-right-radius: .3rem;
            border-bottom-right-radius: .3rem;
        }

        .pageInfo_wrap .pagination-sm .page-link {
            padding: .25rem .5rem;
            font-size: .875rem;
            line-height: 1.5;
        }

        .pageInfo_wrap .pagination-sm .page-item:first-child .page-link {
            border-top-left-radius: .2rem;
            border-bottom-left-radius: .2rem;
        }

        .pageInfo_wrap .pagination-sm .page-item:last-child .page-link {
            border-top-right-radius: .2rem;
            border-bottom-right-radius: .2rem;
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
                            <%--<label class="ml-3 col-form-label fontWe-700 mt-4">검색 범위</label>

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
                            </div>--%>
                            <div class="col-lg-7 col-md-7">
                                <div class="select-option">
                                    <select class="sorting" id="sorting" onchange="redirectToList()">
                                        <option value="1" ${pageMaker.cri.sorting == '1' ? 'selected' : ''}>인기순</option>
                                        <option value="2" ${pageMaker.cri.sorting == '2' ? 'selected' : ''}>최신순</option>
                                        <option value="3" ${pageMaker.cri.sorting == '3' ? 'selected' : ''}>댓글순</option>
                                        <option value="4" ${pageMaker.cri.sorting == '4' ? 'selected' : ''}>좋아요순</option>
                                    </select>
                                    <select class="sorting" id="viewSorting" onchange="viewSortingFun()">
                                        <option value="9" ${pageMaker.cri.viewSorting == '9' ? 'selected' : ''}>9개씩 보기</option>
                                        <option value="12" ${pageMaker.cri.viewSorting == '12' ? 'selected' : ''}>12개씩 보기</option>
                                        <option value="24" ${pageMaker.cri.viewSorting == '24' ? 'selected' : ''}>24개씩 보기</option>
                                        <option value="36" ${pageMaker.cri.viewSorting == '36' ? 'selected' : ''}>36개씩 보기</option>
                                    </select>
                                </div>
                            </div>
                            <%--<div class="col-md-1 col-sm-12 ml-5" >
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
                            </div>--%>
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

                                <button type="button" id="searchBtn" style="height: 40px;
    padding: 0 20px;
    border: 1px solid #ced4da;
    background-color: #68afcb;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;"><i class="ti-search"></i></button>
                                <button type="button" id="resetBtn" style="height: 40px;
    padding: 0 20px;
    border: 1px solid #ced4da;
    background-color: #68afcb;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;">초기화</button>
                            </form>
                        </div>
                    </form>
                   <%-- <div class="mb-3 row" style="margin-left: 20px;">
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
                    </div>--%>
                </div>
                <br>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>
                            <div class="custom-control custom-checkbox mb-5">
                                <input type="checkbox" class="custom-control-input" id="c0" name="chkAll">
                                <label class="custom-control-label" for="c0">전체선택</label>
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
                    <c:forEach items="${list}" var="list" varStatus="status">
                    <tr>
                        <td>
                            <div class="custom-control custom-checkbox mb-5">
                                <input type="checkbox" class="custom-control-input" id="c${status.index + 1}">
                                <label class="custom-control-label" for="c${status.index + 1}"><span></span></label>
                            </div>
                        </td>
                        <input  type="hidden" class="lectureIdx" value="${list.lecture_idx}"/>
                        <td>${list.lecture_idx}</td>
                        <td><a href="/admin/lecture/modify?lecture_idx=${list.lecture_idx}">${list.lecture_title}</a></td>
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
                    <button class="btn" id="deleteBtn">삭제</button>
                </div>



        </div>
    </div>
        <div class="pageInfo_wrap">
            <ul class="pagination pageInfo_area">
                <!-- 이전페이지 버튼 -->
                <c:if test="${pageMaker.prev}">
                    <li class="page-item pageInfo_btn previous">
                        <a class="page-link" href="${pageMaker.startPage-1}"><<</a>
                    </li>
                </c:if>

                <!-- 각 번호 페이지 버튼 -->
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item pageInfo_btn ${pageMaker.cri.pageNum == num ? "active" : ""}">
                        <a class="page-link" href="${num}">${num}</a>
                    </li>
                </c:forEach>

                <!-- 다음페이지 버튼 -->
                <c:if test="${pageMaker.next}">
                    <li class="page-item pageInfo_btn next">
                        <a class="page-link" href="${pageMaker.endPage + 1}"> >></a>
                    </li>
                </c:if>
            </ul>
        </div>

        <form class="moveForm" method="get" id="moveForm">
        <input type="hidden" name="type" value="${pageMaker.cri.type }">
        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
        <input type="hidden" name="keyword" id="key" value="${pageMaker.cri.keyword }">
        <input type="hidden" name="sorting" value="${pageMaker.cri.sorting}">
        <input type="hidden" name="viewSorting"  value="${pageMaker.cri.viewSorting}">
        <input type="hidden" name="category"  value="${pageMaker.cri.category}">

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
    function viewSortingFun() {
        console.log("vieCOnsdif");
        let sortingValue = document.getElementById("viewSorting").value;
        moveForm.querySelector("input[name='viewSorting']").value = sortingValue;
        moveForm.querySelector("input[name='sorting']").value ;
        moveForm.querySelector("input[name='type']").value;
        moveForm.querySelector("input[name='keyword']").value;
        moveForm.querySelector("input[name='pageNum']").value = 1;
        moveForm.submit();
    }
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
        location.href= '/admin/lecture/list';
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

    const vr = document.querySelector('#c0');
    document.querySelectorAll('.custom-control-input').forEach(function(checkbox) {
        checkbox.addEventListener("click", function(e) {
            if (checkbox.id === 'c0') {
                if (checkbox.checked) {
                    document.querySelectorAll('.custom-control-input').forEach(function(checkbox) {
                        checkbox.checked = true;
                    });
                } else {
                    document.querySelectorAll('.custom-control-input').forEach(function(checkbox) {
                        checkbox.checked = false;
                    });
                }
            }
        });
    });

    document.querySelectorAll('.custom-control-input').forEach(function(checkbox) {
        checkbox.addEventListener("click", function(){

        })
    });
    document.querySelector('#deleteBtn').addEventListener("click", function(){
        document.querySelectorAll('input[type="checkbox"]').forEach(function(checkbox) {



        });
    });

    document.querySelector('#deleteBtn').addEventListener("click", function(){
        var selectedValues = [];

        document.querySelectorAll('.custom-control-input').forEach(function(checkbox) {
            if (checkbox.checked) {
                const selected = checkbox.closest('tr').querySelector('.lectureIdx');
                if (selected) {
                    selectedValues.push(selected.value);
                }
            }
        });

        console.log("선택된 값들:", selectedValues);
        location.href="/admin/lecture/delete?selectedValues=" + selectedValues;
    });

</script>
<!-- Js Plugins -->
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
<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
