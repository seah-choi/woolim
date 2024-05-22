<%@ page language="java" pageEncoding="UTF-8" %>
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
            border-bottom: 1px solid #ccc;
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
<div class="breacrumb-section" style="margin-top: 20px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text product-more">
                    <a href="/"><i class="fa fa-home"></i> Home</a>
                    <a href="/board/list">자유게시판</a>
                    <span>상세</span>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="box">
    <div id="leftNav">
        <nav class="nav flex-column">
            <h4>게시판</h4>
            <div style="border-bottom: 1px solid #000;width: 50px;padding: 10px;"></div>
            <div style="padding-top: 20px; line-height: unset;">
                <a class="nav-link" aria-current="page" href="/board/freeList">자유게시판</a>
                <a class="nav-link" href="/board/list">교육정보</a>
                <a class="nav-link" href="/board/list">자료실</a>
                <a class="nav-link" href="/board/list">공지사항</a>
            </div>
        </nav>
    </div>
    <div id="list">
        <h5 style="font-weight: bold">작업형1 모의문제2 6번</h5>
        <div id="se">
            <div>
                <span>seahchoi</span><span id="date">2024-05-07</span>
            </div>
            <div>
                <span style="font-weight: bold">조회수</span><span id="count">12</span>
            </div>
        </div>
        <hr>
        <div style="white-space: pre-wrap;">
            read버튼을 눌렀을 때 다른 항목들은 잘 찾아내나 id 1번 항목을 read할 경우 error 발생
            GangnamguPopulationService.cs파일 안의 GetDetail함수의 else로 잡힙니다.

            확인부탁드리겠습니다.
            감사합니다.
        </div>
        <br><br>
        <div id="comment">
            <span>답변</span>&nbsp;<span id="cmCount">1</span>
            <div class="form-floating" style="display: flex;margin-top: 10px;margin-bottom: 40px;">
                <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
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


