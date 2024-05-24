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

        .filter-catagories li a {
            text-decoration: none;
            font-size: 20px !important;
        }

        div.produts-sidebar-filter {
            border-right: 1px solid #ebebeb;
        }

        .teacherView {
            padding-bottom: 80px;
        }

        div.produts-sidebar-filter {
            padding-top: 80px;
        }
        div.imgDiv {
            padding-top: 80px;
        }

        div.teacher_intro {
            margin-top: 30px;
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
                        <li><a href="#" >📢 공지사항</a></li>
                        <li><a href="#" >💡 Q&A</a></li>
                        <li><a href="#" >🗂 자료실</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9 order-1 order-lg-2">

                <div class="product-list">
                    <div class="row imgDiv">
                        <div class="col-lg-6">
                            <div class="">
                                <img class="" src="/resources/img/teacher/teacher1.png" alt="">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="product-details">
                                <div class="pd-title">
                                    <span>국어 성적 향상의 핵심 키워드</span>
                                    <h3>박리나 선생님</h3>
                                </div>

                                <div class="teacher_intro">
                                    <h5>
                                        수능이 바뀐다면 우리의 공부도 바뀌어야 합니다. <br>
                                        기초 개념부터 빈틈없이 소화할 수 있도록, <br>
                                        국어의 원리를 자연스럽게 이해할 수 있도록 <br><br>
                                        🌟자사고 교사 출신 리나쌤의 노하우로 출제자의 관점에서
                                        생각하는 습관을 들인다. <br>
                                        🌟내신에 출제되는 내용에서 확장시켜 근본적인 수능형 사고력까지 기른다.
                                    </h5>

                                </div>
                                <div class="pd-share">
                                    <div class="pd-social">
                                        <a href="#"><i class="ti-facebook"></i></a>
                                        <a href="#"><i class="ti-twitter-alt"></i></a>
                                        <a href="#"><i class="ti-linkedin"></i></a>
                                    </div>
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
                                <li>
                                    <a data-toggle="tab" href="#tab-2" role="tab">공지사항</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-3" role="tab">선생님 Q&A</a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#tab-4" role="tab">자료실</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-item-content">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="tab-1" role="tabpanel">
                                    <div class="product-content">
                                        <div class="row">
                                            <div class="col-lg-7">
                                                <h5>Introduction</h5>
                                            </div>
                                            <div class="col-lg-5">
                                                <img src="img/product-single/tab-desc.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-2" role="tabpanel">
                                    <div class="specification-table">
                                        <table>
                                            <tr>
                                                <td class="p-catagory">Customer Rating</td>

                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab-3" role="tabpanel">
                                    <div class="customer-review-option">
                                        <h4>2 Comments</h4>
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
    $(document).ready(function(){
        // 카테고리 클릭 이벤트
        $(".filter-catagories li a").click(function(e){
            e.preventDefault(); // 기본 이벤트 방지

            // 활성화된 탭의 클래스를 제거
            $(".tab-item .nav li a").removeClass('active');
            $(".tab-pane").removeClass('active show'); // 'fade-in' 대신 'show' 클래스를 사용

            // 클릭된 카테고리의 인덱스를 가져옴
            var index = $(this).parent().index();

            // 해당하는 탭 활성화
            $(".tab-item .nav li").eq(index).find("a").addClass('active');
            $(".tab-content .tab-pane").eq(index).addClass('active show'); // 'fade-in' 대신 'show' 클래스를 사용하여 내용을 활성화하고 보여줌
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
