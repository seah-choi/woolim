<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #btnModify{
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
                <a class="nav-link" aria-current="page" href="/board/freeList?bbs_type=bbs02">자유게시판</a>
                <a class="nav-link" href="/board/list?bbs_type=bbs01">교육정보</a>
                <a class="nav-link" href="/board/list?bbs_type=bbs05">자료실</a>
                <a class="nav-link" href="/board/list?bbs_type=bbs04">공지사항</a>
            </div>
        </nav>
    </div>
    <div id="list">
        <h5 style="font-weight: bold">${bbs.bbs_title}</h5>
        <div id="se">
            <div>
                <span>${bbs.member_id}</span><span id="date">${bbs.bbs_reg_date}</span>
            </div>
            <div>
                <span style="font-weight: bold">조회수</span><span id="count">${bbs.bbs_read_cnt}</span>
            </div>
        </div>
        <hr>
        <br>
        <div>
            <c:if test="${not empty file}">
                <img src="/resources/upload/bbs/${file.saveFile}" width="700px" height="400px">
            </c:if>
        </div>
        <br>
        <div style="white-space: pre-wrap;">${bbs.bbs_content}</div>
        <br><br>
        <div id="comment">
            <form name="frm" action="/bbsReply/regist" method="post">
                <input type="hidden" name="member_id" value="${sessionScope.member_id}">
                <input type="hidden" name="bbs_idx" value="${bbs.bbs_idx}">
            <span>답변</span>&nbsp;<span id="cmCount">1</span>
            <div class="form-floating" style="display: flex;margin-top: 10px;margin-bottom: 40px;">
                <textarea class="form-control" placeholder="Leave a comment here" name="reply_content" id="floatingTextarea"></textarea>
                <label for="floatingTextarea">댓글</label>
                <button type="submit" class="btn" id="btn_comment">등록</button>
            </div>
            </form>
            <div>
            <c:choose>
                <c:when test="${not empty reply}">
                    <c:forEach items="${reply}" var="reply">
                        <span style="font-weight: bold">${reply.member_id}</span>&nbsp;<span>${reply.reply_reg_date}</span>
                        <br>
                        <form name="frm" id="cmFrm" class="cmFrm" action="/bbsReply/delete" method="post">
                        <p><input type="text" name="reply_content"  class="reply_content" style="border: 0" value="${reply.reply_content}" id="reply_content" readonly></p>
                        <c:if test="${reply.member_id == sessionScope.member_id}">
                                <input type="hidden" name="reply_idx" value="${reply.reply_idx}">
                                <input type="hidden" name="bbs_idx" value="${reply.bbs_idx}">
                                <div style="display: flex;justify-content: flex-end;">
                                    <button type="button" class="btnModify" id="btnModify">수정</button>
                                    <span>&nbsp;|&nbsp;</span>
<%--                                    <button type="submit" id="cmDelete" onclick="cmDelete(event)">삭제</button>--%>
                                    <button type="button" class="cmDelete" id="cmDelete">삭제</button>
                                </div>
                            </form>
                        </c:if>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div style="padding: 10px;">
                        등록된 댓글이 없습니다.
                    </div>
                </c:otherwise>
            </c:choose>
            </div>
        </div>

        <div style="display: flex;justify-content: center;">
            <div>
                <button type="button" class="btn" id="btn_back" onclick="location.href='/board/freeList'">목록</button>
            </div>
            <form name="frm" id="frm"  action="/board/delete" method="post">
                <input type="hidden" name="bbs_idx" id="bbs_idx" value="${bbs.bbs_idx}">
                <input type="hidden" name="bbs_category_code" value="${bbs.bbs_category_code}">

                <c:if test="${bbs.member_id eq sessionScope.member_id}">
                <div>
                    <button type="button" class="btn" id="btn_modify" onclick="location.href='/board/freeModify?bbs_idx=${bbs.bbs_idx}'">수정</button>
                    <button type="submit" class="btn btn-secondary" id="btn_delete" onclick="godelete(event)">삭제</button>
                </div>
                </c:if>
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
<script>
    let btnModify = document.getElementsByClassName("btnModify");
    let cmDelete = document.getElementsByClassName("cmDelete");
    let reply_content = document.getElementsByClassName("reply_content");
    for(let i=0;i<btnModify.length;i++){
        btnModify[i].addEventListener("click",function(e){
            e.preventDefault();
            if(this.textContent=="수정"){
                this.textContent="등록";
                reply_content[i].readOnly = false;
                reply_content[i].focus();
                reply_content[i].style.border = "1px solid black";
                cmDelete[i].textContent="취소";
                return;
            }
            if(this.textContent=="등록"){
                let cmFrm = document.getElementsByClassName("cmFrm");
                cmFrm[i].action = "/bbsReply/modify";
                cmFrm[i].submit();
            }
        });
    }
    for(let i=0;i<cmDelete.length;i++) {
        cmDelete[i].addEventListener("click", function (e) {
            e.preventDefault();
            if (this.textContent == "취소") {
                console.log(11);
                reply_content[i].readOnly = true;
                this.textContent = "삭제";
                reply_content[i].style.border = "0";
                btnModify[i].textContent = "수정";
                return;
            }
            if (this.textContent == "삭제") {
                if (confirm("해당 댓글을 삭제하시겠습니까?")) {
                    let cmFrm = document.getElementsByClassName("cmFrm");
                    cmFrm[i].action = "/bbsReply/delete";
                    cmFrm[i].submit();
                }
            }
        });
    }
    function godelete(e) {
        e.preventDefault();
        if(confirm("해당 글을 정말 삭제하시겠습니까?")) {
            alert("삭제되었습니다.");
            document.getElementById("frm").submit();
        } else {
            return false;
        }
    }

    // function cmDelete(e) {
    //     e.preventDefault();
    //     if(confirm("해당 댓글을 삭제하시겠습니까?")) {
    //         alert("삭제되었습니다.");
    //         document.getElementById("cmFrm").submit();
    //     } else {
    //         return false;
    //     }
    // }

    // document.querySelector("#cmDelete").addEventListener("click", function (){
    //     if(confirm("해당 댓글을 삭제하시겠습니까?")) {
    //         alert("삭제되었습니다.");
    //         document.getElementById("cmFrm").submit();
    //     } else {
    //         return false;
    //     }
    // })
</script>
</body>
</html>


