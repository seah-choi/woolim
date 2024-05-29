<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 5:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <!-- Google Font -->
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


    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- CSS -->

    <link rel="stylesheet" type="text/css" href="/resources/vendors/styles/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/teacherView.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <style>
        .page-item.active .page-link {
            z-index: 3;
            color: #fff;
            background-color: #68afcb;
            border-color: #68afcb;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="#"><i class="fa fa-home"></i> Home</a>
                    <span>teacher</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Product Shop Section Begin -->
<section class="teacherView">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                <div class="filter-widget">
                    <h4 class="fw-title">카테고리</h4>
                    <ul class="filter-catagories">
                        <li><a href="#" >📹 최신강의</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9 order-1 order-lg-2">

                <div class="product-list">
                    <div class="row imgDiv">
                        <div class="col-lg-6">
                            <div class="">
                                <c:if test="${memberDTO.teacher_image_file != null}">
                                    <img src="/resources/upload/teacher/${memberDTO.teacher_image_file}"  alt="user-avatar" class="d-block rounded"  height="400" width="350" id="preview"  />
                                </c:if>
                                <c:if test="${memberDTO.teacher_image_file == null}">
                                    <img src="/resources/upload/teacher/default.png"  alt="user-avatar" class="d-block rounded"  height="400" width="350" id="preview"  />
                                </c:if>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-details">
                                <div class="pd-title">
                                    <span>국어 성적 향상의 핵심 키워드</span>
                                    <h3>${memberDTO.member_name} 선생님</h3>
                                </div>

                                <div class="teacher_intro">
                                    <h5>
                                        ${memberDTO.teacher_intro}
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="teacherTab">
                        <div class="tab-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a class="active" data-toggle="tab" href="#tab-1" role="tab">최신강의</a>
                                </li>
<%--                                <li>--%>
<%--                                    <a data-toggle="tab" href="#tab-2" role="tab">공지사항</a>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <a data-toggle="tab" href="?tab=3" role="tab">Q&A</a>--%>
<%--                                </li>--%>
<%--                                <li>--%>
<%--                                    <a data-toggle="tab" href="#tab-4" role="tab">자료실</a>--%>
<%--                                </li>--%>
                            </ul>
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="product-content ml-5 mt-3">
                                        <div class="row">
                                            <div class="col-lg-9 order-1 order-lg-2">
                                                <div class="product-show-option">
                                                    <div class="row">
                                                        <div class="col-lg-7 col-md-7">
                                                            <div class="select-option">
                                                                <select class="sorting" id="sorting" onchange="redirectToList()">
                                                                    <option value="1" ${pageMaker.cri.sorting == '1' ? 'selected' : ''}>인기순</option>
                                                                    <option value="2" ${pageMaker.cri.sorting == '2' ? 'selected' : ''}>최신순</option>
                                                                    <option value="3" ${pageMaker.cri.sorting == '3' ? 'selected' : ''}>댓글순</option>
                                                                    <option value="4" ${pageMaker.cri.sorting == '4' ? 'selected' : ''}>좋아요순</option>
                                                                </select>
                                                                <select class="sorting" id="viewSorting" onchange="viewSorting()">
                                                                    <option value="9" ${pageMaker.cri.viewSorting == '9' ? 'selected' : ''}>9개씩 보기</option>
                                                                    <option value="12" ${pageMaker.cri.viewSorting == '12' ? 'selected' : ''}>12개씩 보기</option>
                                                                    <option value="24" ${pageMaker.cri.viewSorting == '24' ? 'selected' : ''}>24개씩 보기</option>
                                                                    <option value="36" ${pageMaker.cri.viewSorting == '36' ? 'selected' : ''}>36개씩 보기</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-5 col-md-5 text-right" >
                                                            <div class="advanced-search">
                                                                <div class="flex-container">
                                                                    <form action="/lecture/list" method="get" class="input-group" style="width: 500px;">
                                                                        <select class="gubunBtn" name="type" id="search_area">
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
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="product-list">
                                                    <div class="row">
                                                        <c:forEach items="${responseDTO.dtolist}" var="list">
                                                        <div class="col-lg-4 col-sm-6">
                                                                <div class="product-item">
                                                                    <div class="pi-pic">
                                                                        <img src="/resources/img/lecture/${list.lecture_image}" alt="">
                                                                        <div class="sale pp-sale">Sale</div>
                                                                        <div class="icon">
                                                                            <i class="icon_heart_alt"></i>
                                                                        </div>
                                                                        <ul>
                                                                            <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                                                            <li class="quick-view"><a href="/lecture/view/?lecture_idx=${list.lecture_idx}"> 상품 상세보기</a></li>
                                                                            <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                                                        </ul>
                                                                    </div>
                                                                    <div class="pi-text">
                                                                        <div class="catagory-name">국어</div>
                                                                        <a href="/lecture/view/?lecture_idx=${list.lecture_idx}">
                                                                            <h5>${list.lecture_title}</h5>
                                                                        </a>
                                                                        <div class="product-price">
                                                                            ₩${list.lecture_price}
                                                                            <span>₩${list.lecture_price}</span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <nav class="blog-pagination justify-content-center d-flex mt-5">
                                                    <ul class="pagination">
                                                        <li class="page-item <c:if test="${responseDTO.prev_page_plag == 'false'}"> disabled</c:if>" >
                                                            <a href="/teacher/view?member_idx=${responseDTO.member_idx}&page=${responseDTO.page_block_start - responseDTO.page_block_size}${responseDTO.linkParams}"
                                                               class="page-link" aria-label="Previous">&laquo;
                                                            </a>
                                                        </li>
                                                        <c:forEach begin="${responseDTO.page_block_start}"
                                                                   end="${responseDTO.page_block_end}"
                                                                   var="page_num">
                                                            <li class="page-item <c:if test="${responseDTO.page == page_num}">active</c:if>">
                                                                <a href="/teacher/view?member_idx=${responseDTO.member_idx}&page=${page_num}${responseDTO.linkParams}" class="page-link">${page_num}</a>
                                                            </li>
                                                        </c:forEach>
                                                        <li class="page-item <c:if test="${responseDTO.next_page_plag == 'false'}"> disabled</c:if>" >
                                                            <a href="/teacher/view?member_idx=${responseDTO.member_idx}&page=${responseDTO.page_block_start + responseDTO.page_block_size}${responseDTO.linkParams}" class="page-link" aria-label="Previous">
                                                                &raquo;
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-2" role="tabpanel">
                                    <!-- basic table  Start -->
                                    <div class="pd-20 card-box mb-30">

                                        <c:if test="${bbsList.bbs_type eq 'bbs04'}">
                                            <h4 class="h4">공지사항 게시판</h4>
                                        </c:if>

                                        <br>
                                        <div class="searchBox">
                                            <form role="search" id="frmSearch" class="searchForm" action="" method="get">

                                                <div class="mb-3 d-flex">
                                                    <label class="ml-3 col-form-label fontWe-700 mt-4">검색 범위</label>

                                                    <div class="col-md-2 col-sm-12 ml-4">
                                                        <div class="form-group">
                                                            <label>구분</label>
                                                            <select id="schoolSelect" name="search_type" class="form-control" data-size="5" data-style="btn-outline-info">
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
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th style="width: 130px;">
                                                    <div class="custom-control custom-checkbox d-flex">
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


                                                <tr>
                                                    <td>
                                                        <div class="custom-control custom-checkbox ">
                                                            <input type="checkbox" class="custom-control-input" value="${list.bbs_idx}" name="bbs_idx" id="${list.bbs_idx}">
                                                            <label class="custom-control-label" for="${list.bbs_idx}"><span></span></label>
                                                        </div>
                                                    </td>
                                                    <td>1</td>
                                                    <td><a href="/teacher/view?" class="aTag">제목</a></td>
                                                    <td>test1</td>
                                                    <td>2024-05-24</td>
                                                    <td>12</td>
                                                </tr>

                                            </tbody>

                                        </table>
                                        <div class="d-flex justify-content-sm-end">
                                            <a class="btn btn-primary btn-lg btn-block" href="/admin/board/regist" style="width: 100px; height: 40px; font-size: 15px;" >작성하기</a>
                                        </div>


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
                                <div class="tab-pane fade" id="tab-3" role="tabpanel">
                                    <div class="customer-review-option">
                                        <h4>2 Comments</h4>
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th style="width: 130px;">
                                                    <div class="custom-control custom-checkbox d-flex">
                                                        <input type="checkbox" class="custom-control-input" id="chkAll2" name="chkAll">
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
                                            <tr>
                                                <td>
                                                    <div class="custom-control custom-checkbox ">
                                                        <input type="checkbox" class="custom-control-input" value="${list.bbs_idx}" name="bbs_idx" id="${list.bbs_idx}">
                                                        <label class="custom-control-label" for="${list.bbs_idx}"><span></span></label>
                                                    </div>
                                                </td>
                                                <td>1</td>
                                                <td><a href="/teacher/view?" class="aTag">제목</a></td>
                                                <td>test1</td>
                                                <td>2024-05-24</td>
                                                <td>12</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <div class="comment-option">
                                            <div class="co-item">
                                                <div class="avatar-pic">
                                                    <img src="img/product-single/avatar-1.png" alt="">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-4" role="tabpanel">
                                    <div class="customer-review-option">
                                        <h4>자료실</h4>
                                        <div class="comment-option">
                                            <div class="co-item">
                                                <div class="avatar-pic">
                                                    <img src="img/product-single/avatar-1.png" alt="">
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>

</section>
<!-- Product Shop Section End -->

<!-- Partner Logo Section Begin -->
<div class="partner-logo">
    <div class="container">
        <div class="logo-carousel owl-carousel">
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="img/logo-carousel/logo-1.png" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="img/logo-carousel/logo-2.png" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="img/logo-carousel/logo-3.png" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="img/logo-carousel/logo-4.png" alt="">
                </div>
            </div>
            <div class="logo-item">
                <div class="tablecell-inner">
                    <img src="img/logo-carousel/logo-5.png" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Partner Logo Section End -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    //카테고리 탭 이동
    $(document).ready(function(){
        $(".filter-catagories li a").click(function(e){
            e.preventDefault();

            // 활성화된 탭의 클래스를 제거
            $(".tab-item .nav li a").removeClass('active');
            $(".tab-pane").removeClass('active show');

            var index = $(this).parent().index();

            // 해당하는 탭 활성화
            $(".tab-item .nav li").eq(index).find("a").addClass('active');
            $(".tab-content .tab-pane").eq(index).addClass('active show');
        });
    });


    // 체크박스 전체 선택/해제
    let frm = document.querySelector("#frm");
    let chkAll = document.querySelector("#chkAll");

    chkAll.addEventListener("click", (e) => {
        var check = document.querySelectorAll("input[type ='checkbox']");

        check.forEach((checkbox) => {
            checkbox.checked = chkAll.checked;
        });
    });

</script>



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
