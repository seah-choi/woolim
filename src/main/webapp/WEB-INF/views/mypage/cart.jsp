<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <h5 style="font-weight: bold">장바구니</h5>
                <hr>
                <div class="cart-table">
                    <table>
                        <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>Image</th>
                            <th class="p-name">강의 명</th>
                            <th>가격</th>
                            <th>수량</th>
                            <th>총액</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td class="cart-pic"><img src="/resources/img/cart-page/product-1.jpg" alt=""></td>
                            <td class="cart-title">
                                <h5>강의 명</h5>
                            </td>
                            <td class="p-price">$60.00</td>
                            <td class="qua-col">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="total-price">$60.00</td>
                            <td class="close-td"><i class="ti-close"></i></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td class="cart-pic"><img src="/resources/img/cart-page/product-1.jpg" alt=""></td>
                            <td class="cart-title">
                                <h5>Pure Pineapple</h5>
                            </td>
                            <td class="p-price">$60.00</td>
                            <td class="qua-col">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="total-price">$60.00</td>
                            <td class="close-td"><i class="ti-close"></i></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td class="cart-pic"><img src="/resources/img/cart-page/product-1.jpg" alt=""></td>
                            <td class="cart-title">
                                <h5>Pure Pineapple</h5>
                            </td>
                            <td class="p-price">$60.00</td>
                            <td class="qua-col">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="total-price">$60.00</td>
                            <td class="close-td"><i class="ti-close"></i></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td class="cart-pic"><img src="/resources/img/cart-page/product-2.jpg" alt=""></td>
                            <td class="cart-title">
                                <h5>American lobster</h5>
                            </td>
                            <td class="p-price">$60.00</td>
                            <td class="qua-col">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="total-price">$60.00</td>
                            <td class="close-td"><i class="ti-close"></i></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td class="cart-pic"><img src="/resources/img/cart-page/product-3.jpg" alt=""></td>
                            <td class="cart-title">
                                <h5>Guangzhou sweater</h5>
                            </td>
                            <td class="p-price">$60.00</td>
                            <td class="qua-col">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div>
                            </td>
                            <td class="total-price">$60.00</td>
                            <td class="close-td"><i class="ti-close"></i></td>
                        </tr>
                        </tbody>
                    </table>
                    <nav class="blog-pagination justify-content-center d-flex" style="margin-top: 50px">
                        <ul class="pagination">
                            <li class="page-item">
                                <a href="#" class="page-link" aria-label="Previous">&lt;</a>
                            </li>
                            <li class="page-item active">
                                <a href="#" class="page-link">1</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">2</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">3</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">4</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link">5</a>
                            </li>
                            <li class="page-item">
                                <a href="#" class="page-link" aria-label="Next">&gt;</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="row">
<%--                    <div class="col-lg-4">--%>
<%--                        <div class="cart-buttons">--%>
<%--                            <a href="#" class="primary-btn continue-shop">Continue shopping</a>--%>
<%--                            <a href="#" class="primary-btn up-cart">Update cart</a>--%>
<%--                        </div>--%>
<%--                        <div class="discount-coupon">--%>
<%--                            <h6>Discount Codes</h6>--%>
<%--                            <form action="#" class="coupon-form">--%>
<%--                                <input type="text" placeholder="Enter your codes">--%>
<%--                                <button type="submit" class="site-btn coupon-btn">Apply</button>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="col-lg-4 offset-lg-4">
                        <div class="proceed-checkout">
                            <ul>
                                <li class="subtotal">Subtotal <span>$240.00</span></li>
                                <li class="cart-total">Total <span>$240.00</span></li>
                            </ul>
                            <a href="#" class="proceed-btn">결제</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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
