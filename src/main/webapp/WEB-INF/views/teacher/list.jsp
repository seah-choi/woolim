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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        a {
            text-decoration: none;
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
                    <a href="/"><i class="fa fa-home"></i> Home</a>
                    <span>선생님</span>
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
                    <h4 class="fw-title">과목</h4>
                    <div class="fw-brand-check">
                        <div class="bc-item">
                            <label for="bc-calvin">
                                📗 국어
                                <input type="radio" id="bc-calvin" class="subjectbtn" value="s01" name="search_type" onclick="viewSubject(this)">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="bc-item">
                            <label for="bc-diesel">
                                ⏲️ 수학
                                <input type="radio" id="bc-diesel" class="subjectbtn" value="s03" name="search_type" onclick="viewSubject(this)">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="bc-item">
                            <label for="bc-polo">
                                🆖 영어
                                <input type="radio" id="bc-polo" class="subjectbtn" value="s02" name="search_type" onclick="viewSubject(this)">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="bc-item">
                            <label for="bc-tommy">
                                🔎 과학
                                <input type="radio" id="bc-tommy" class="subjectbtn" value="s07" name="search_type" onclick="viewSubject(this)">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 order-1 order-lg-2">
                <div class="product-show-option">
                    <div class="row">
                        <div class="col-lg-7 col-md-7">
                            <div class="select-option">
                                <select class="sorting">
                                    <option value="1" ${responseDTO.sort_type == '1' ? 'selected' : ''}>인기순</option>
                                    <option value="2" ${responseDTO.sort_type == '2' ? 'selected' : ''}>최신순</option>
                                    <option value="3" ${responseDTO.sort_type == '3' ? 'selected' : ''}>댓글순</option>
                                    <option value="4" ${responseDTO.sort_type == '4' ? 'selected' : ''}>좋아요순</option>
                                </select>
                                <select class="sorting" onchange="viewSorting(this, '${responseDTO.linkParams}')">
                                    <option value="9" ${responseDTO.page_size == '9' ? 'selected' : ''}>9개씩 보기</option>
                                    <option value="12" ${responseDTO.page_size == '12' ? 'selected' : ''}>12개씩 보기</option>
                                    <option value="24" ${responseDTO.page_size == '24' ? 'selected' : ''}>24개씩 보기</option>
                                    <option value="36" ${responseDTO.page_size == '36' ? 'selected' : ''}>36개씩 보기</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-5 text-right">
                            <p>Show ${responseDTO.page_skip_count + 1} - ${responseDTO.page_skip_count +responseDTO.page_size} Of ${responseDTO.total_count} Product</p>
                        </div>
                    </div>
                </div>
                <div class="product-list">
                    <div class="row">
                        <c:forEach items="${responseDTO.dtolist}" var="list">
                        <div class="col-lg-4 col-sm-6">
                            <div class="product-item">
                                <div class="pi-pic">
<%--                                    <img src="/resources/img/products/product-1.jpg" alt="">--%>
                                    <img src="/resources/upload/teacher/${list.teacher_image_file}" alt="">
<%--                                    <div class="icon">--%>
<%--                                        <i class="icon_heart_alt"></i>--%>
<%--                                    </div>--%>
                                    <ul>
                                        <li class="quick-view"><a href="/teacher/view?member_idx=${list.member_idx}">자세히 보기</a></li>
                                    </ul>
                                </div>
                                <div class="pi-text">
                                    <div class="catagory-name">${list.subject_category_code}</div>
                                    <a href="/teacher/view?member_idx=${list.member_idx}">
                                        <h5>${list.member_name}<span style="font-size: large;color: #606060;">&nbsp;선생님</span></h5>
                                    </a>
<%--                                    <div class="product-price">--%>
<%--                                        $14.00--%>
<%--                                        <span>$35.00</span>--%>
<%--                                    </div>--%>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <!-- Pagination with icons -->
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item <c:if test="${responseDTO.prev_page_plag == 'false'}"> disabled</c:if>" >
                                <a href="/teacher/list?page=${responseDTO.page_block_start - responseDTO.page_block_size}${responseDTO.linkParams}"
                                   class="page-link" aria-label="Previous">&laquo;
                                </a>
                            </li>
                            <c:forEach begin="${responseDTO.page_block_start}"
                                       end="${responseDTO.page_block_end}"
                                       var="page_num">
                                        <li class="page-item <c:if test="${responseDTO.page == page_num}">active</c:if>">
                                            <a href="/teacher/list?page=${page_num}${responseDTO.linkParams}" class="page-link">${page_num}</a>
                                        </li>
                            </c:forEach>
                            <li class="page-item <c:if test="${responseDTO.next_page_plag == 'false'}"> disabled</c:if>" >
                                <a href="/teacher/list?page=${responseDTO.page_block_start + responseDTO.page_block_size}${responseDTO.linkParams}" class="page-link" aria-label="Previous">
                                    &raquo;
                                </a>
                            </li>
                        </ul>
                    </nav><!-- End Pagination with icons -->
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    function viewSorting(item, link) {
        let page_size = item.value;
        let param = link;
        console.log(page_size);
        location.href="/teacher/list?page_size="+page_size+param;
    }

    function viewSubject(item){
        let search_type = item.value;
        location.href="/teacher/list?search_type=u&search_word="+search_type;
    }
</script>
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
