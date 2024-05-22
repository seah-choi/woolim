<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            color: #000 !important;
            text-decoration: none;
        }

        #list{
            padding: 50px;
            width: 1000px;
            padding-top: 30px;
        }

        .table{
            margin-bottom: 50px !important;
        }

        .page-item.active .page-link {
            background-color: #68afcb !important;
            color: #fff !important;
            border-color : #68afcb !important;
        }
        a {
            text-decoration: none !important;
        }

        #view {
            background: #68afcb;
            color: #fff;
        }

        #check {
            background: #68afcb;
            color: #fff;
        }
        #modify{
            border:1px solid #68afcb;
        }
        #regist {
            background: #68afcb;
            color: #fff;
        }

        #btn_regist{
            border:1px solid #68afcb;
            color: #68afcb;
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
<div id="box">
    <div id="leftNav">
        <nav class="nav flex-column">
            <h4>나의 학습방</h4>
            <div style="border-bottom: 1px solid #000;width: 50px;padding: 10px;"></div>
            <div style="padding-top: 20px; line-height: unset;">
                <a class="nav-link" aria-current="page" href="/mystudy/classList">나의 강의실</a>
                <a class="nav-link" href="/mystudy/freeList">내가 쓴 글</a>
                <a class="nav-link" href="/mystudy/commentList">내가 남긴 댓글</a>
                <a class="nav-link" href="/mystudy/gradeList">성적표</a>
                <a class="nav-link" href="/mystudy/studyPlanList">학습계획표</a>
            </div>
        </nav>
    </div>
    <div id="list">
        <h5 style="font-weight: bold">성적표</h5>
        <div>
            <img src="/resources/img/free-icon-report-card-5196199.png">
            <span>나의 성적표</span>
        </div>
        <hr>
        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1" id="btn_regist">성적표 입력</button>
        <br>
        <%--        성적표 모달창--%>
        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel1" style="font-weight: bold">성적표 입력</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form name="frm" action="" method="post">
                        <div class="modal-body">
                            <span>과목</span>
                            <select class="form-select form-select-sm" aria-label="Small select example" name="lecture_category_subject">
                                <option value="국어">국어</option>
                                <option value="수학">수학</option>
                                <option value="영어">영어</option>
                                <option value="과학">과학</option>
                            </select>
                            <br>
                            <span>강의명</span>
                            <select class="form-select form-select-sm" aria-label="Small select example" name="lecture_title">
                                <option value="만점왕 국어">만점왕 국어</option>
                            </select>
                            <br>
                            <span>점수 : </span>
                            <input type="text" name="grade" value="" style="width: 35px;color: #b80f0f">점
                        </div>
                        <div class="modal-footer" style="justify-content: center;">
                            <button type="button" class="btn" id="regist">등록</button>
                            <button type="button" class="btn btn-outline-secondary">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <br>
        <div>
            <table class="table">
                <thead class="table-primary">
                <tr>
                    <th scope="col">과목</th>
                    <th scope="col" colspan="2">강의명</th>
                    <th scope="col">점수</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">국어</th>
                    <td colspan="2">만점왕 국어 6-1</td>
                    <td>90</td>
                    <td style="width: 150px;"><button type="button" class="btn" id="view" data-bs-toggle="modal" data-bs-target="#exampleModal">상세보기</button></td>
                </tr>
                </tbody>
            </table>
        </div>
<%--        성적표 모달창--%>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel" style="font-weight: bold">성적표 상세보기</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form name="frm" id="frm" action="" method="post">
                        <div class="modal-body">
                            <span>[국어] 만점왕 국어 6-1</span>
                            <br>
                            <span>점수 : </span>
                            <input type="text" id="grade" name="grade" value="90" style="width: 35px;color: #b80f0f">점
                        </div>
                        <div class="modal-footer" style="justify-content: center;">
                            <button type="button" class="btn" id="modify">수정</button>
                            <button type="button" class="btn btn-outline-secondary" id="delete">취소</button>
                            <button type="reset" class="btn" id="check" data-bs-dismiss="modal">확인</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <nav class="blog-pagination justify-content-center d-flex" style="margin-top: 50px;">
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
<script>
    const myModal = document.getElementById('myModal')
    const myInput = document.getElementById('myInput')

    myModal.addEventListener('shown.bs.modal', () => {
        myInput.focus()
    })

    document.querySelector("#modify").addEventListener("click", function(e) {
        e.preventDefault();
        if(confirm("해당 글을 수정하시겠습니까?")){
            location.href='/myStudy/';
        };
    });

    document.querySelector("#delete").addEventListener("click", function (e) {
        e.preventDefault();
        if(confirm("해당 글을 정말 삭제하시겠습니까?")){
            document.querySelector("#frm").submit();
        }

    });
</script>
</body>
</html>



