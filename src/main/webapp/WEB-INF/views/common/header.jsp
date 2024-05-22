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
    <header class="header-section">
        <div class="header-top">
            <div class="container">
                <div class="ht-left">
                    <div class="mail-service">
                        <i class=" fa fa-envelope"></i>
                        hello.colorlib@gmail.com
                    </div>
                    <div class="phone-service">
                        <i class=" fa fa-phone"></i>
                        +65 11.188.888
                    </div>
                </div>
                <div class="ht-right">
                    <a href="/login/login" class="login-panel"><i class="fa fa-user"></i>Login</a>
                    <div class="lan-selector">
                        <select class="language_drop" name="countries" id="countries" style="width:300px;">
                            <option value='yt' data-image="/resources/img/flag-1.jpg" data-imagecss="flag yt"
                                    data-title="English">English</option>
                            <option value='yu' data-image="/resources/img/flag-2.jpg" data-imagecss="flag yu"
                                    data-title="Bangladesh">German </option>
                        </select>
                    </div>
                    <div class="top-social">
                        <a href="#"><i class="ti-facebook"></i></a>
                        <a href="#"><i class="ti-twitter-alt"></i></a>
                        <a href="#"><i class="ti-linkedin"></i></a>
                        <a href="#"><i class="ti-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
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
                                <button type="submit"><i class="ti-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                            <li class="heart-icon"><a href="/mypage/jjim">
                                <i class="icon_heart_alt"></i>
                                <span>1</span>
                            </a>
                            </li>
                            <li class="cart-icon"><a href="/mypage/cart">
                                <i class="icon_bag_alt"></i>
                                <span>3</span>
                            </a>
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table>
                                            <tbody>
                                            <tr>
                                                <td class="si-pic"><img src="/resources/img/select-product-1.jpg" alt=""></td>
                                                <td class="si-text">
                                                    <div class="product-selected">
                                                        <p>$60.00 x 1</p>
                                                        <h6>Kabino Bedside Table</h6>
                                                    </div>
                                                </td>
                                                <td class="si-close">
                                                    <i class="ti-close"></i>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="si-pic"><img src="/resources/img/select-product-2.jpg" alt=""></td>
                                                <td class="si-text">
                                                    <div class="product-selected">
                                                        <p>$60.00 x 1</p>
                                                        <h6>Kabino Bedside Table</h6>
                                                    </div>
                                                </td>
                                                <td class="si-close">
                                                    <i class="ti-close"></i>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="select-total">
                                        <span>total:</span>
                                        <h5>$120.00</h5>
                                    </div>
                                    <div class="select-button">
                                        <a href="#" class="primary-btn view-card">VIEW CARD</a>
                                        <a href="#" class="primary-btn checkout-btn">CHECK OUT</a>
                                    </div>
                                </div>
                            </li>
                            <li class="cart-price">$150.00</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>All departments</span>
                        <ul class="depart-hover">
                            <li class="active"><a href="#">Women’s Clothing</a></li>
                            <li><a href="#">Men’s Clothing</a></li>
                            <li><a href="#">Underwear</a></li>
                            <li><a href="#">Kid's Clothing</a></li>
                            <li><a href="#">Brand Fashion</a></li>
                            <li><a href="#">Accessories/Shoes</a></li>
                            <li><a href="#">Luxury Brands</a></li>
                            <li><a href="#">Brand Outdoor Apparel</a></li>
                        </ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="/lecture/list">강의</a>
                            <ul class="dropdown">
                                <li><a href="lecture/list">강좌 리스트</a></li>
                            </ul>
                        </li>
                        <li><a href="#">선생님</a>
                            <ul class="dropdown">
                                <li><a href="teacher/list">선생님 정보</a></li>
                            </ul>
                        </li>
                        <li><a href="/mystudy/classList">나의 학습방</a>
                            <ul class="dropdown">
                                <li><a href="/mystudy/classList">나의 강의실</a></li>
                                <li><a href="/mystudy/boardList">내가 쓴 글</a></li>
                                <li><a href="/mystudy/replyList">내가 남긴 댓글</a></li>
                                <li><a href="/mystudy/gradeList">성적표</a></li>
                                <li><a href="/mystudy/studyPlanList">학습계획표</a></li>
                            </ul>
                        </li>
                        <li><a href="/board/list">게시판</a>
                            <ul class="dropdown">
                                <li><a href="/board/freeList">자유게시판</a></li>
                                <li><a href="/board/list">교육정보</a></li>
                                <li><a href="/board/list">자료실</a></li>
                                <li><a href="/board/list">공지사항</a></li>
                            </ul>
                        </li>
                        <li><a href="/mypage/view">마이페이지</a>
                            <ul class="dropdown">
                                <li><a href="/mypage/view">회원정보</a></li>
                                <li><a href="/mypage/writeList">작성글</a></li>
                                <li><a href="/mypage/paymentList">결제내역</a></li>
                                <li><a href="/mypage/jjim">찜한 강의</a></li>
                                <li><a href="/mypage/qna/list">1:1문의</a></li>
                                <li><a href="/mypage/cart">장바구니</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>