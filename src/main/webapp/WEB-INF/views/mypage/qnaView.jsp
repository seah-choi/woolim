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
                        <textarea class="form-control" placeholder="Leave a comment here" style="resize: none"></textarea>

                    </div>
                    <br><br>
                    <div id="comment">
                        <span>답변</span>&nbsp;<span id="cmCount">1</span>
                        <div class="form-floating" style="display: flex;margin-top: 10px;margin-bottom: 40px;">
                            <textarea class="form-control" style="resize:none" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
                            <label for="floatingTextarea">댓글</label>
                            <button type="button" class="btn" id="btn_comment">등록</button>
                        </div>
                        <div>
                            <span style="font-weight: bold">babori</span>&nbsp;<span>2024-05-10</span>
                            <br>
                            <p>강의에서 알려드린 판다스로 진행 바랍니다.</p>
                        </div>
                        <div style="display: flex;justify-content: flex-end;">
                            <button type="button" id="cmModify">수정</button>
                            <span>&nbsp;|&nbsp;</span>
                            <button type="button" id="cmDelete">삭제</button>
                        </div>
                    </div>

                    <div style="display: flex;justify-content: center;">
                        <div>
                            <button type="button" class="btn" id="btn_back" onclick="location.href='/board/freeList'">목록</button>
                        </div>
                        <div>
                            <button type="button" class="btn" id="btn_modify">수정</button>
                            <button type="button" class="btn btn-secondary" id="btn_delete">삭제</button>
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
