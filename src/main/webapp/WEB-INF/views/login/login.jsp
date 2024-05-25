<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <c:if test="${param.joinOK == '1'}">
        <script>
            alert("회원가입 성공");
        </script>
    </c:if>
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="login-form">
                        <h2>로그인</h2>
                        <form name="frmLogin" method="post">
                            <label for="username">아이디</label>
                            <div class="input-group">
                                <input class="form-control" type="text" id="username" name="member_id">
                            </div>
                            <br>
                            <label for="pass">비밀번호</label>
                            <div class="input-group">
                                <input class="form-control" type="password" id="pass" name="member_pwd">
                            </div>
                            <%
                                String clientId = "407108558562-l8kdc02drjtq9qe6id97a5bm4gfubfvb.apps.googleusercontent.com"; // Google Cloud Platform에서 생성한 OAuth 2.0 클라이언트 ID를 입력하세요.
                                String redirectUri = "http://localhost:8080/login/oauth2/callback"; // Google Cloud Platform에 등록한 리디렉션 URI와 일치해야 합니다.
                                String responseType = "code";
                                String scope = "email%20profile"; // 인증 시 요청할 권한 범위입니다. 이메일과 프로필 정보에 접근합니다.
                                String authUrl = "https://accounts.google.com/o/oauth2/v2/auth?client_id=" + clientId
                                        + "&redirect_uri=" + redirectUri
                                        + "&response_type=" + responseType
                                        + "&scope=" + scope;
                            %>
                            <div class="group-input gi-check">
                                <div class="gi-more">
                                    <label for="save-pass">
                                        아이디 저장
                                        <input type="checkbox" id="save-pass">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                            </div>
                            <button type="button" class="border-0 flow-hidden w-100 bg-transparent p-0 m-0"
                                    onclick="location.href = '<%=authUrl%>'">
                                소셜
<%--                                <img class="w-200px" src="/resources/img/btnG_완성형.png" >--%>
                            </button>

                            <button type="button" class="site-btn login-btn" onclick="login()">로그인</button>
                        </form>
                        <div class="switch-login">
                            <a href="/member/join" class="or-login">회원가입</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    <script>
        function login() {
            let frmData = $("form[name=frmLogin]").serialize();
            frmData = decodeURIComponent(frmData);
            $.ajax({
                url:"/login/login.dox?"+frmData,
                dataType:"json",
                type : "POST",
                data : {

                },
                success : function(data) {
                    if(data.result == "success") {
                        alert(data.msg);
                        location.replace("/");
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
</body>
</html>
