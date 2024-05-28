<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-05-21
  Time: 오후 7:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .nav-item {
        background: #68afcb !important;
    }
    .nav-item .nav-depart .depart-btn {
        background: #68afcb !important;
    }
    .nav-item .nav-menu li a {
        border-right: 1px solid #fff !important;
    }
    .container{
        padding-top: 15px;

    }
    .nav-item .nav-menu li .dropdown {
        background: #dde5e7 !important;
    }
    .nav-item .nav-menu li .dropdown li a {
        color: #000000 !important;
    }
    .headerBtn {
        border-radius: 5px !important;
    }
    .adminA {
        font-size: 30px;
        color: #0c5460;
    }
    .adminA:hover {
        color: #197281;
    }
    .lan-selector {
        margin-top: 8px !important;
        margin-right: 25px;
    }
    a.login-panel {
        font-size: 18px !important;
        text-decoration: none !important;
    }
    .loginComment {
        width: 200px;
        margin-top: 18px;
        margin-right: 20px;
    }
    .inner-header .logo {
        padding: 0 0 !important;
    }
    .conDiv {
        text-align: center;
        padding: 20px 10px 10px 10px;
    }
    .conDiv a {
        text-decoration: none;
    }
</style>
    <header class="header-section">
        <div class="header-top">
            <div class="container conDiv">

                <div class="ht-right">

                    <c:if test="${sessionScope['user_id'] == null}">
                        <a href="/login/login" class="login-panel"><i class="fa fa-user"></i>Login</a>
                    </c:if>
                    <c:if test="${sessionScope['user_id'] != null}">
                        <a href="/login/logout" class="login-panel"><i class="fa fa-user"></i>Logout</a>
                    </c:if>
                    <div class="d-flex">
                        <c:if test="${sessionScope.member_category == 'admin'}">
                            <div class="lan-selector">
                                <a href="/admin/dashboard" class="adminA panel" ><i class="icon-copy fa fa-cog" aria-hidden="true"></i>︎</a>
                            </div>
                        </c:if>
                        <c:if test="${sessionScope['user_id'] != null}">
                            <div class="loginComment">
                                <div>🤗${sessionScope.member_name}님 환영합니다.</div>
                            </div>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2 ">
                        <div class="logo" style="margin-bottom: 30px">
                            <a href="/">
                                <img src="/resources/img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <select class="category-btn" name="category_code">
                                <option>전체</option>
                                <option>제목</option>
                                <option>강사</option>
                                <option>과목</option>
                            </select>


                            <form action="/lecture/list" method="get" class="input-group">
                                <input type="text" name="search_word" placeholder="What do you need?">
                                <button type="submit" class="headerBtn"><i class="ti-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                            <li class="heart-icon"><a href="/mypage/jjim">
                                <i class="icon_heart_alt"></i>
                                <span><c:if test="${sessionScope.jjimList != null}">${sessionScope.jjimList.size()}</c:if>
                                <c:if test="${sessionScope.jjimList == null}">0</c:if></span>
                            </a>
                            </li>
                            <li class="cart-icon"><a href="/mypage/cart">
                                <i class="icon_bag_alt"></i>
                                <span><c:if test="${sessionScope.cartList != null}">${sessionScope.cartList.size()}</c:if>
                                <c:if test="${sessionScope.cartList == null}">0</c:if></span>
                            </a>
<%--                                <div class="cart-hover">--%>
<%--                                    <div class="select-items">--%>
<%--                                        <table>--%>
<%--                                            <tbody>--%>
<%--                                            <tr>--%>
<%--                                                <td class="si-pic"><img src="/resources/img/select-product-1.jpg" alt=""></td>--%>
<%--                                                <td class="si-text">--%>
<%--                                                    <div class="product-selected">--%>
<%--                                                        <p>$60.00 x 1</p>--%>
<%--                                                        <h6>Kabino Bedside Table</h6>--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td class="si-close">--%>
<%--                                                    <i class="ti-close"></i>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td class="si-pic"><img src="/resources/img/select-product-2.jpg" alt=""></td>--%>
<%--                                                <td class="si-text">--%>
<%--                                                    <div class="product-selected">--%>
<%--                                                        <p>$60.00 x 1</p>--%>
<%--                                                        <h6>Kabino Bedside Table</h6>--%>
<%--                                                    </div>--%>
<%--                                                </td>--%>
<%--                                                <td class="si-close">--%>
<%--                                                    <i class="ti-close"></i>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            </tbody>--%>
<%--                                        </table>--%>
<%--                                    </div>--%>
<%--                                    <div class="select-total">--%>
<%--                                        <span>total:</span>--%>
<%--                                        <h5>$120.00</h5>--%>
<%--                                    </div>--%>
<%--                                    <div class="select-button">--%>
<%--                                        <a href="#" class="primary-btn view-card">VIEW CARD</a>--%>
<%--                                        <a href="#" class="primary-btn checkout-btn">CHECK OUT</a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </li>
<%--                            <li class="cart-price">$150.00</li>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container conDiv">
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="/lecture/list">강의</a>
                            <ul class="dropdown">
                                <li><a href="/lecture/list">강좌 리스트</a></li>
                            </ul>
                        </li>
                        <li><a href="/teacher/list">선생님</a>
                            <ul class="dropdown">
                                <li><a href="/teacher/list">선생님 정보</a></li>
                            </ul>
                        </li>
                        <li><a href="/mystudy/classList">나의 학습방</a>
                            <ul class="dropdown">
                                <li><a href="/mystudy/classList">나의 강의실</a></li>
                                <li><a href="/mystudy/freeList">내가 쓴 글</a></li>
                                <li><a href="/mystudy/commentList">내가 남긴 댓글</a></li>
                                <li><a href="/mystudy/gradeList">성적표</a></li>
                                <li><a href="/mystudy/studyPlanList">학습계획표</a></li>
                            </ul>
                        </li>
                        <li><a href="/board/freeList?bbs_type=bbs02">게시판</a>
                            <ul class="dropdown">
                                <li><a href="/board/freeList?bbs_type=bbs02">자유게시판</a></li>
                                <li><a href="/board/list?bbs_type=bbs01">교육정보</a></li>
                                <li><a href="/board/list?bbs_type=bbs05">자료실</a></li>
                                <li><a href="/board/list?bbs_type=bbs04">공지사항</a></li>
                            </ul>
                        </li>
                        <li><a href="/mypage/view">마이페이지</a>
                            <ul class="dropdown">
                                <li><a href="/mypage/view">회원 정보 수정</a></li>
                                <li><a href="/mystudy/freeList">작성글</a></li>
                                <li><a href="/mypage/paymentList">결제 내역</a></li>
                                <li><a href="/mypage/lecture">수강중인 강좌</a></li>
                                <li><a href="/mypage/jjim">찜 강의</a></li>
                                <li><a href="/mypage/qnaList">1 : 1 문의하기</a></li>
                                <li><a href="/mypage/cart">장바구니</a></li>
                                <li><a href="/mypage/pointcharge">포인트 충전</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>