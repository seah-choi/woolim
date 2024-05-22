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
      color: #68afcb !important;
      text-decoration: none;
    }

    #list{
      padding: 50px;
      width: 1000px;
      padding-top: 30px;
    }

    #search {
      background: #68afcb;
      color: #fff;
      border: none;
    }
    #drop{
      border: 1px solid #dee2e6;
    }

    #btn_regist {
      background: #68afcb;
      color: #fff;
    }

    .page-item.active .page-link {
      background-color: #68afcb !important;
      color: #fff !important;
      border-color : #68afcb !important;
    }

    a {
      text-decoration: none !important;
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
          <span style="font-weight: bold">글쓰기</span>
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
        <a class="nav-link" aria-current="page" href="/board/list">자유게시판</a>
        <a class="nav-link" href="/board/list">교육정보</a>
        <a class="nav-link" href="/board/list">자료실</a>
        <a class="nav-link" href="/board/list">공지사항</a>
      </div>
    </nav>
  </div>
  <div id="list">
    <h5 style="font-weight: bold">자유게시판</h5>
    <hr>
    <br>
    <div>
      
    </div>
    <div style="display: flex;justify-content: center;">
      <div>
        <button type="button" class="btn" id="btn_back" onclick="location.href='/board/list'">목록</button>
      </div>
      <div>
        <button type="button" class="btn" id="btn_modify">등록</button>
        <button type="button" class="btn btn-secondary" id="btn_delete">취소</button>
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
