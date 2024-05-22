<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section class="product-shop spad">
    <div class="container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/mypageSide.jsp"/>
            <div class="col-lg-9 order-1 order-lg-2">
                <div class="register-form">
                    <h2>회원 정보 수정</h2>
                    <form action="#">
                        <input type="hidden" name="member_idx" value="">
                        <label for="member_id">아이디</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="member_id" id="member_id">
                        </div>
                        <br>
                        <label for="member_pwd">비밀번호</label>
                        <div class="input-group">
                            <input name="member_pwd" class="form-control" type="text" id="member_pwd">
                        </div>
                        <br>
                        <label for="member_pwd2">비밀번호 확인</label>
                        <div class="input-group">
                            <input type="text"  class="form-control" id="member_pwd2" name="member_pwd2">
                        </div>
                        <br>
                        <label for="member_name">이름</label>
                        <div class="input-group">
                            <input name="member_name" class="form-control" type="text" id="member_name">
                        </div>
                        <br>
                        <label for="member_email">이메일</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control"  name="member_email" id="member_email">
                            &nbsp;&nbsp;
                            <label> @ </label>
                            &nbsp;&nbsp;
                            <select class="form-control" name="member_email_addr">
                                <option>naver.com</option>
                                <option>daum.net</option>
                                <option>gmail.com</option>
                                <option>hanmail.net</option>
                            </select>
                        </div>
                        <label for="member_phone2">핸드폰</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="member_phone1" name="member_phone">
                            &nbsp;&nbsp;
                            <span>-</span>
                            &nbsp;&nbsp;
                            <input type="text" class="form-control" id="member_phone2" name="member_phone">
                            &nbsp;&nbsp;
                            <span>-</span>
                            &nbsp;&nbsp;
                            <input type="text" class="form-control" id="member_phone3" name="member_phone">
                        </div>
                        <br>
                        <div class="group-input">
                            <label>주소</label>
                            <div>
                                <div class="mb-3">
                                    <div class="input-group">
                                        <input type="text" name="member_zone_code" style="border: 1px solid #ced4da;" data-name="우편번호" class="form-control" placeholder="우편번호" value="" id="sample4_postcode" aria-label="Recipient's username" aria-describedby="button-addon2"  onclick="sample4_execDaumPostcode()">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-info"  type="button" id="button-addon2" onclick="">우편번호 찾기</button>
                                        </div>
                                    </div>
                                    <small id="err_zip_code" class="info text-danger"></small>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="addr1" class="form-control" style="border: 1px solid #ced4da;" data-name="주소" name="member_addr" value="" id="sample4_roadAddress" placeholder="도로명주소">
                                    <small id="err_addr1" class="info text-danger"></small>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="addr2" class="form-control" style="border: 1px solid #ced4da;" id="" data-name="member_addr_detail" placeholder="상세주소">
                                    <small id="err_addr2" class="info text-danger"></small>
                                </div>
                                <span id="guide" style="color:#999;display:none"></span>
                            </div>
                        </div>
                        <button type="submit" class="site-btn register-btn">회원 정보 수정</button>
                    </form>
                    <div class="switch-login">
                        <a href="./login.html" class="or-login">회원 탈퇴</a>
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
