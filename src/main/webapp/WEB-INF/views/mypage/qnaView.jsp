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
    <style>
        #box {
            display: flex;
            width: 1200px;
            margin: 0 auto;
            margin-top: 50px;
            margin-bottom: 50px;
        }
        #leftNav{
            border-right: 1px solid #ccc;
            padding: 30px;
        }

        #leftNav a {
            padding-left: 0;
            color: #212529 !important;
        }

        #list a {
            padding-left: 0;
            color: #68afcb !important;
            text-decoration: none;
            font-weight: bold;
        }

        #list{
            padding: 50px;
            width: 1000px;
            padding-top: 30px;
        }
        #date {
            color: #8b8686;
            margin-left: 10px;
        }
        #count {
            color: #8b8686;
            margin-left: 10px;
        }
        #se {
            display: flex;
            justify-content: space-between;
        }
        #btn_modify{
            background: #68afcb;
            color: #fff;
        }
        #btn_back{
            background: #fff;
            color: #68afcb;
            border: 1px solid #68afcb;
            margin-right: 5px;
        }
        a {
            text-decoration: none !important;
        }
        #cmCount {
            color:#68afcb;
            font-weight: bold;
        }
        #btn_comment{
            background: #68afcb;
            color: #fff;
            width: 100px;
            border-radius: 0;
        }
        #floatingTextarea{
            width: 700px;
        }
        #comment{
            padding: 10px;
            margin-bottom: 50px;
        }
        #cmModify{
            border: none;
        }
        #cmDelete{
            border: none;
        }

    </style>
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
                <div id="list">
                    <h5 style="font-weight: bold">먼지가 되어</h5>
                    <div id="se">
                        <div>
                            <span id="date">2024-05-07</span>
                        </div>
                    </div>
                    <hr>
                    <div style="white-space: pre-wrap;">
                        <textarea class="form-control" rows="15" placeholder="Leave a comment here" style="resize: none">바람에 날려간 나의 노래도 휘파람 소리로 돌아 오네요.
                            내 조그만 공간 속에 추억만 쌓이고 까닭 모를 눈물만이 아른거리네

                        </textarea>

                    </div>
                    <div style="display: flex;justify-content: center;">
                        <div>
                            <button type="button" class="btn" id="btn_back" onclick="location.href='/mypage/qnaList'">목록</button>
                        </div>
                        <div>
                            <button type="button" class="btn" id="btn_modify">수정</button>
                            <button type="button" class="btn btn-secondary" id="btn_delete">삭제</button>
                        </div>
                    </div>
                    <br><br>
                    <div id="comment">
                        <h5 style="font-weight: bold">답변</h5>
                        <div>
                            <div>
                                <span>2024-05-07</span>
                            </div>
                        </div>
                        <hr>
                        <div class="form-floating" style="margin-top: 10px;margin-bottom: 40px;white-space: pre-wrap;">
                            <textarea class="form-control" rows="15" style=" height:373px; resize:none" placeholder="Leave a comment here"></textarea>
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
