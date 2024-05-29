<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fashi | Template</title>

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
    <style>
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

        .pageInfo_wrap .pagination {
            display: flex;
            padding-left: 0;
            list-style: none;
            border-radius: .25rem;
            justify-content: center;
            margin-left: 300px;
            margin-top: 50px;
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


    </style>
</head>
<!-- Header End -->

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <a href="#"><i class="fa fa-home"></i> Home</a>
                    <span>Shop</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Product Shop Section Begin -->
<section class="product-shop spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                <div class="filter-widget">
                    <h4 class="fw-title">카테고리</h4>
                    <ul class="filter-catagories">
                        <li><a href="#" onclick="navigateWithSort('elementary')">🧑‍🌾 초등</a></li>
                        <li><a href="#" onclick="navigateWithSort('middle')">🕵️ 중등</a></li>
                        <li><a href="#" onclick="navigateWithSort('high')">👨‍🚀 고등</a></li>
                    </ul>
                </div>
                <div class="filter-widget">
                    <h4 class="fw-title">과목</h4>
                    <ul class="filter-catagories">
                        <li><a href="#" onclick="navigateWithSortSub('국어')">📗 국어</a></li>
                        <li><a href="#" onclick="navigateWithSortSub('수학')">⏲️ 수학</a></li>
                        <li><a href="#" onclick="navigateWithSortSub('영어')">🆖 영어</a></li>
                        <li><a href="#" onclick="navigateWithSortSub('과학')">🔎 과학</a></li>
                    </ul>
                </div>

            </div>
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
                            </div>

                        </div>
                    </div>
                </div>
                <div class="product-list">
                    <div class="row">
                        <c:forEach items="${list}" var="list">
                            <div class="col-lg-4 col-sm-6">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <img src="/resources/img/lecture/${list.lecture_image}" alt="">
                                        <div class="sale pp-sale">Sale</div>
                                        <div class="icon">
                                            <c:set var="flag" value="0"/>
                                            <c:forEach items="${jjimList}" var="jjim">
                                                <c:if test="${jjim.lecture_idx == list.lecture_idx}">
                                                    <c:set var="flag" value="1"/>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${flag == '0'}">
                                                <i class="icon_heart_alt" onclick="addJjim(${list.lecture_idx})"></i>
                                            </c:if>
                                            <c:if test="${flag == '1'}">
                                                <i class="icon_heart" onclick="addJjim(${list.lecture_idx})"></i>
                                            </c:if>
                                        </div>
                                        <ul>
                                            <li class="w-icon active"><a href="/order/order?lecture_idx=${list.lecture_idx}"><i class="icon_bag_alt"></i></a></li>
                                            <li class="quick-view"><a href="/lecture/view/?lecture_idx=${list.lecture_idx}"> 상품 상세보기</a></li>
                                            <li class="w-icon"><a href="#"><i class="fa fa-random" onclick="addCart(${list.lecture_idx})"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="pi-text">
                                        <div class="catagory-name">${list.lecture_category_school}</div>
                                        <a href="#">
                                            <h5>${list.lecture_title}</h5>
                                        </a>
                                        <div class="product-price">
                                                <fmt:formatNumber value="${list.lecture_sale_price}" pattern="#,###"/>원
                                            <span><fmt:formatNumber value="${list.lecture_price}" pattern="#,###"/>원</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
              
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
        <input type="hidden" name="subject"  value="${pageMaker.cri.subject}">
    </form>
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

<!-- Footer Section Begin -->
<footer class="footer-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="footer-left">
                    <div class="footer-logo">
                        <a href="#"><img src="/resources/img/footer-logo.png" alt=""></a>
                    </div>
                    <ul>
                        <li>Address: 60-49 Road 11378 New York</li>
                        <li>Phone: +65 11.188.888</li>
                        <li>Email: hello.colorlib@gmail.com</li>
                    </ul>
                    <div class="footer-social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 offset-lg-1">
                <div class="footer-widget">
                    <h5>Information</h5>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Checkout</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Serivius</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="footer-widget">
                    <h5>My Account</h5>
                    <ul>
                        <li><a href="#">My Account</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Shopping Cart</a></li>
                        <li><a href="#">Shop</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="newslatter-item">
                    <h5>Join Our Newsletter Now</h5>
                    <p>Get E-mail updates about our latest shop and special offers.</p>
                    <form action="#" class="subscribe-form">
                        <input type="text" placeholder="Enter Your Mail">
                        <button type="button">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright-reserved">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="copyright-text">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                    <div class="payment-pic">
                        <img src="/resources/img/payment-method.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->
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
        moveForm.action = "/lecture/list";
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
  /*  document.querySelector("#sorting").addEventListener("change", function (e){
        e.preventDefault();
        console.log("####");
        let sorting =  document.querySelector("#sorting").value;
        moveForm.querySelector("input[name='sorting']").value = sorting;
        moveForm.submit();
    });
*/
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
        moveForm.querySelector("input[name='subject']").value;
        moveForm.submit();
    }
    function  navigateWithSortSub(category) {
        let sort = document.getElementById("viewSorting").value;

        if(sort == null) {
            sort = 9;
        }
        moveForm.querySelector("input[name='viewSorting']").value = sort;
        moveForm.querySelector("input[name='sorting']").value ;
        moveForm.querySelector("input[name='type']").value;
        moveForm.querySelector("input[name='keyword']").value;
        moveForm.querySelector("input[name='pageNum']").value = 1;
        moveForm.querySelector("input[name='category']").value;
        moveForm.querySelector("input[name='subject']").value = category;
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

        if(sort == null) {
            sort = 9;
        }
        checkboxes.forEach((checkbox) => {
            moveForm.querySelector("input[name='viewSorting']").value = checkbox.value;
            console.log("###" + checkbox.value);
        });


    }

</script>
<script src="/resources/js/cart.js"></script>
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
</body>

</html>