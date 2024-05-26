<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>woolim</title>

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
        .inner-text h4 {
            background: #68afcb;
            color: #fff;
            border-radius: 100px;
            width: 200px;
            height: 70px;
            text-align: center;
            padding: 20px;
        }
        .studentDiv h4 {
            background: #eaeaea !important;
            color: #658bb0 !important;
        }
        .cateTile {
            text-align: center;
            background-color: #eaeaea;
            padding-top: 50px;
        }
        .cateTile h3 {
            font-weight: bold;
            color: #73695e;
        }
        .classMu {
            background-color: #eaeaea
        }
    </style>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- Header End -->

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="./home.html"><i class="fa fa-home"></i> Home</a>
                    <a href="./shop.html">Shop</a>
                    <span>Detail</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb Section Begin -->

<!-- Product Shop Section Begin -->
<section class="hero-section">
    <div class="hero-items owl-carousel">
        <div class="single-hero-items set-bg" data-setbg="/resources/img/main1.png">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
<%--                        <span>Bag,kids</span>--%>
<%--                        <h1>Black friday</h1>--%>
<%--                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor--%>
<%--                            incididunt ut labore et dolore</p>--%>
<%--                        <a href="#" class="primary-btn">Shop Now</a>--%>
                    </div>
                </div>
<%--                <div class="off-card">--%>
<%--                    <h2>Sale <span>50%</span></h2>--%>
<%--                </div>--%>
            </div>
        </div>
        <div class="single-hero-items set-bg" data-setbg="/resources/img/main.png">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5">
<%--                        <span>Bag,kids</span>--%>
<%--                        <h1>Black friday</h1>--%>
<%--                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor--%>
<%--                            incididunt ut labore et dolore</p>--%>
<%--                        <a href="#" class="primary-btn">Shop Now</a>--%>
                    </div>
                </div>
<%--                <div class="off-card">--%>
<%--                    <h2>Sale <span>50%</span></h2>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Banner Section Begin -->
<div class="cateTile"><h3>강좌 바로가기</h3></div>
<div class="banner-section spad classMu" >

    <div class="container-fluid">

        <div class="row d-flex justify-content-center">
            <div class="col-lg-2">
                <div class="single-banner">
                    <a href="/lecture/list?type=&pageNum=1&amount=9&keyword=&sorting=&viewSorting=9&category=30000">
<%--                        <img src="/resources/img/banner-1.jpg" alt="">--%>
                        <div class="inner-text studentDiv">
                            <h4>🎓고등학생</h4>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="single-banner">
                    <a href="/lecture/list?type=&pageNum=1&amount=9&keyword=&sorting=&viewSorting=9&category=20000">
<%--                        <img src="/resources/img/banner-2.jpg" alt="">--%>
                        <div class="inner-text studentDiv">
                            <h4>🤹중학생</h4>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="single-banner">
                    <a href="/lecture/list?type=&pageNum=1&amount=9&keyword=&sorting=&viewSorting=9&category=10000">
<%--                        <img src="/resources/img/banner-3.jpg" alt="">--%>
                        <div class="inner-text studentDiv">
                            <h4>🧸초등학생</h4>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Section End -->

<!-- Women Banner Section Begin -->
<section class="women-banner spad">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3">
                <div class="product-large set-bg" data-setbg="/resources/img/color.png">
                    <h2>강좌 리스트</h2>
                    <a href="/lecture/list">리스트 전체보기</a>
                </div>
            </div>
            <div class="col-lg-8 offset-lg-1">
                <div class="filter-control">
                    <ul>
                        <li value="1" <c:if test="${pageMaker.cri.sorting == '1'}">class="active"</c:if>><a href="/?sorting=1" class="text-dark">인기 강좌</a></li>
                        <li value="2" <c:if test="${pageMaker.cri.sorting == '2'}">class="active"</c:if>><a href="/?sorting=2" class="text-dark">최신 강좌</a></li>
                        <li value="3" <c:if test="${pageMaker.cri.sorting == '3'}">class="active"</c:if>><a href="/?sorting=3" class="text-dark">댓글순</a></li>
                        <li value="4" <c:if test="${pageMaker.cri.sorting == '4'}">class="active"</c:if>><a href="/?sorting=4" class="text-dark">좋아요순</a></li>
                    </ul>
                </div>
                <div class="product-slider owl-carousel">

                    <%--          /////////////////반복문/////////////////////////////////////--%>
                        <c:forEach items="${list}" var="list">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <img src="/resources/img/lecture/${list.lecture_image}" alt="">
                                        <div class="sale pp-sale">Sale</div>
                                        <div class="icon">
                                            <i class="icon_heart_alt" onclick="addJjim(${list.lecture_idx})"></i>
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
                                            ₩${list.lecture_sale_price}
                                            <span>₩${list.lecture_price}</span>
                                        </div>
                                    </div>
                                </div>
                        </c:forEach>
                    <%--          /////////////////반복문/////////////////////////////////////--%>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Women Banner Section End -->

<!-- Man Banner Section Begin -->
<section class="man-banner spad">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="filter-control">
                    <ul>
                        <li <c:if test="${responseDTO.search_word == 's01'}">class="active"</c:if>> <a href="/?search_type=u&search_word=s01" class="text-dark">국어</a></li>
                        <li <c:if test="${responseDTO.search_word == 's03'}">class="active"</c:if>><a href="/?search_type=u&search_word=s03" class="text-dark">수학</a></li>
                        <li <c:if test="${responseDTO.search_word == 's02'}">class="active"</c:if>><a href="/?search_type=u&search_word=s02" class="text-dark">영어</a></li>
                        <li <c:if test="${responseDTO.search_word == 's07'}">class="active"</c:if>><a href="/?search_type=u&search_word=s07" class="text-dark">과학</a></li>
                    </ul>
                </div>
                <div class="product-slider owl-carousel">
                    <!---------------------------반복 영역----------------------------->
                    <c:forEach items="${responseDTO.dtolist}" var="list">
                            <div class="product-item">
                                <div class="pi-pic">
                                    <img src="/resources/img/products/product-1.jpg" alt="">
                                    <ul>
                                        <li class="quick-view"><a href="/teacher/view?member_idx=${list.member_idx}">자세히 보기</a></li>
                                    </ul>
                                </div>
                                <div class="pi-text">
                                    <div class="catagory-name">${list.subject_category_code}</div>
                                    <a href="#">
                                        <h5>${list.member_name}</h5>
                                    </a>
                                    <div class="product-price">
                                        $14.00
                                        <span>$35.00</span>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                    <!---------------------------반복 영역----------------------------->
                </div>
            </div>
            <div class="col-lg-3 offset-lg-1">
                <div class="product-large set-bg m-large" data-setbg="/resources/img/color.png">
                    <h2>선생님</h2>
                    <a href="/teacher/list">리스트 전체보기</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Man Banner Section End -->

<!-- Instagram Section Begin -->
<div class="instagram-photo">
    <div class="insta-item set-bg" data-setbg="img/insta-1.jpg">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">colorlib_Collection</a></h5>
        </div>
    </div>
    <div class="insta-item set-bg" data-setbg="img/insta-2.jpg">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">colorlib_Collection</a></h5>
        </div>
    </div>
    <div class="insta-item set-bg" data-setbg="img/insta-3.jpg">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">colorlib_Collection</a></h5>
        </div>
    </div>
    <div class="insta-item set-bg" data-setbg="img/insta-4.jpg">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">colorlib_Collection</a></h5>
        </div>
    </div>
    <div class="insta-item set-bg" data-setbg="img/insta-5.jpg">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">colorlib_Collection</a></h5>
        </div>
    </div>
    <div class="insta-item set-bg" data-setbg="img/insta-6.jpg">
        <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">colorlib_Collection</a></h5>
        </div>
    </div>
</div>
<!-- Instagram Section End -->

<!-- Latest Blog Section Begin -->
<section class="latest-blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>인기 강좌 리뷰</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <!---------------반복 3개--------------------------->
            <div class="col-lg-4 col-md-6">
                <div class="single-latest-blog">
                    <img src="/resources/img/latest-1.jpg" alt="">
                    <div class="latest-text">
                        <div class="tag-list">
                            <div class="tag-item">
                                <i class="fa fa-calendar-o"></i>
                                날짜
                            </div>
                            <div class="tag-item">
                                <i class="fa fa-comment-o"></i>
                                댓글 수
                            </div>
                        </div>
                        <a href="#">
                            <h4>리뷰 이름</h4>
                        </a>
                        <p>리뷰 내용 </p>
                    </div>
                </div>
            </div>
            <!---------------반복 3개--------------------------->
        </div>
    </div>
</section>
<!-- Product Shop Section End -->

<!-- Related Products Section End -->
<div class="related-products spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>최근 구매한 강좌</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-sm-6">
                <div class="product-item">
                    <div class="pi-pic">
                        <img src="/resources/img/products/women-1.jpg" alt="">
                        <div class="sale">Sale</div>
                        <div class="icon">
                            <i class="icon_heart_alt"></i>
                        </div>
                        <ul>
                            <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                            <li class="quick-view"><a href="#">+ Quick View</a></li>
                            <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                        </ul>
                    </div>
                    <div class="pi-text">
                        <div class="catagory-name">Coat</div>
                        <a href="#">
                            <h5>Pure Pineapple</h5>
                        </a>
                        <div class="product-price">
                            $14.00
                            <span>$35.00</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="product-item">
                    <div class="pi-pic">
                        <img src="/resources/img/products/women-2.jpg" alt="">
                        <div class="icon">
                            <i class="icon_heart_alt"></i>
                        </div>
                        <ul>
                            <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                            <li class="quick-view"><a href="#">+ Quick View</a></li>
                            <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                        </ul>
                    </div>
                    <div class="pi-text">
                        <div class="catagory-name">Shoes</div>
                        <a href="#">
                            <h5>Guangzhou sweater</h5>
                        </a>
                        <div class="product-price">
                            $13.00
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="product-item">
                    <div class="pi-pic">
                        <img src="/resources/img/products/women-3.jpg" alt="">
                        <div class="icon">
                            <i class="icon_heart_alt"></i>
                        </div>
                        <ul>
                            <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                            <li class="quick-view"><a href="#">+ Quick View</a></li>
                            <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                        </ul>
                    </div>
                    <div class="pi-text">
                        <div class="catagory-name">Towel</div>
                        <a href="#">
                            <h5>Pure Pineapple</h5>
                        </a>
                        <div class="product-price">
                            $34.00
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6">
                <div class="product-item">
                    <div class="pi-pic">
                        <img src="/resources/img/products/women-4.jpg" alt="">
                        <div class="icon">
                            <i class="icon_heart_alt"></i>
                        </div>
                        <ul>
                            <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                            <li class="quick-view"><a href="#">+ Quick View</a></li>
                            <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                        </ul>
                    </div>
                    <div class="pi-text">
                        <div class="catagory-name">Towel</div>
                        <a href="#">
                            <h5>Converse Shoes</h5>
                        </a>
                        <div class="product-price">
                            $34.00
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Related Products Section End -->


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

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