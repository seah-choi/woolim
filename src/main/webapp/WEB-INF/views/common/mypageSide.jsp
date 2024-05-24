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
    #side {
        border-right: 1px solid #ccc;
        margin-right: 20px;
    }
    a {
        text-decoration: none;
    }
    #ul {
        padding-left: 0 !important;

    }

</style>
<div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter" id="side" style="float: left;width: 200px !important; position: sticky; left: 50px;">
    <div class="filter-widget">
        <h4 class="fw-title">마이 페이지</h4>
        <div style="border-bottom: 1px solid #000;width: 50px;margin-bottom: 10px"></div>
        <ul class="filter-catagories" id="ul">
            <li><a href="/mypage/view">회원 정보 수정</a></li>
            <li><a href="/mystudy/freeList">작성글</a></li>
            <li><a href="#">결제 내역</a></li>
            <li><a href="/mypage/jjim">찜 강의</a></li>
            <li><a href="/mypage/qnaList">1 : 1 문의하기</a></li>
            <li><a href="/mypage/cart">장바구니</a></li>
        </ul>
    </div>
</div>