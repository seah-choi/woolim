<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
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
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="shopping-cart spad">
    <div class="container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/mypageSide.jsp"/>
            <div class="col-lg-9 order-1 order-lg-2">
                <h5 style="font-weight: bold">찜한 강의</h5>
                <hr>
                <form action="/mypage/cart">
                    <div class="d-flex justify-content-end">
                        <input type="date" style="width: 20%" name="search_date1" class="form-control me-3">
                        <span class="me-3">~</span>
                        <input type="date" style="width: 20%" name="search_date2" class="me-3 form-control">
                        <button type="submit" class="btn btn-primary" >검색</button>
                    </div>
                </form>
                <br>
                <div class="cart-table">
                    <table>
                        <thead>
                        <tr>
                            <th><input id="checkAll" type="checkbox"></th>
                            <th>Image</th>
                            <th class="p-name">강의 명</th>
                            <th>가격</th>
                            <th>할인가</th>
                            <th>시작일</th>
                            <th>종료일</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${dtoList.size()==0}">
                            <tr>
                                <td colspan="4"><p class="d-flex justify-content-center">기록이 없습니다.</p></td>
                            </tr>
                        </c:if>
                        <c:forEach items="${dtoList}" var="list">
                            <tr>
                                <td><input class="checkEl" type="checkbox" value="${list.cart_idx}"></td>
                                <td class="cart-pic"><img src="/resources/img/lecture/${list.lecture_image}" alt=""></td>
                                <td class="cart-title">
                                    <h5>${list.lecture_title}</h5>
                                </td>
                                <td class="p-price1">${list.lecture_price}</td>
                                <td class="p-price">${list.lecture_sale_price}</td>
                                <td class="qua-col">${list.lecture_start_date}</td>
                                <td class="qua-col">${list.lecture_end_date}</td>
                                <td class="close-td"><i class="ti-close"></i></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
                <div class="row">
                    <div class="col-lg-4 offset-lg-4">
                        <div class="proceed-checkout d-flex justify-content-center">
                            <button class="proceed-btn" onclick="goCart()">장바구니로 이동</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
    let checkAll = document.getElementById("checkAll");
    let checkEl = document.getElementsByClassName("checkEl");
    let priceEl = document.getElementsByClassName("p-price");
    let cartAll = document.querySelectorAll(".cart_idx");
    checkAll.addEventListener("click",function(e){
        if(checkAll.checked==true){
            for(let i=0;i<checkEl.length;i++){
                checkEl[i].checked = true;
            }
        }
        else{
            for(let i=0;i<checkEl.length;i++){
                checkEl[i].checked = false;
            }
        }
    });

    function goCart(){
        let JjimList = [];

        for(let choose of checkEl){
            if(choose.checked){
                JjimList.push(choose.value);
            }
        }
        console.log(JjimList);
        $.ajax({
            url:"/mypage/addcart.dox?",
            dataType:"json",
            type : "POST",
            data : {
                JjimList:JSON.stringify(JjimList)
            },
            success : function(data) {
                if(data.result == "success") {
                    alert(data.msg);
                    location.href="/mypage/cart";
                }else if(data.result =="false"){
                    alert(data.msg);
                }else{
                    alert(data.msg);
                }
            },
            fail : function (data){

            }

        });
    }


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
