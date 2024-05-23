<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<section class="product-shop spad">
    <div class="container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/mypageSide.jsp"/>
            <div class="col-lg-9 order-1 order-lg-2">
                <div id="list">
                    <h5 style="font-weight: bold">1 : 1 문의하기</h5>
                    <hr>
                    <br>
                    <form action="/mypage/qnaModify" id="frmModify" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="member_id" id="member_id" value="${sessionScope.member_id}">
                        <input type="hidden" name="qna_category" value="A">
                        <input type="hidden" name="qna_idx" value="${qnaDTO.qna_idx}" >
                        <div class="form-floating">
                            <textarea class="form-control" name="qna_title" placeholder="Leave a comment here" id="floatingTextarea">${qnaDTO.qna_title}</textarea>
                            <label for="floatingTextarea">제목</label>
                        </div>
                        <br>
                        <input type="file" class="form-control" name="files" id="file" multiple  onchange="fileList(this)">
                        <br>
                        <div class="row mb-3">
                            <label for="file-list" class="col-md-4 col-lg-2 col-form-label">파일 리스트</label>
                            <div class="col-md-8 col-lg-9">
                                <ul id="file-list" class="form-group d-flex flex-column m-0 p-0">
                                </ul>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="file-list" class="col-md-4 col-lg-2 col-form-label">기존 파일 리스트</label>
                            <div class="col-md-8 col-lg-9">
                                <ul id="org-file-list" class="form-group d-flex flex-column m-0 p-0" style="gap:5px">

                                    <c:forEach items="${fileList}" var="file">
                                        <li class="card shadow-none border border-gray d-flex flex-row justify-content-between p-2 fileListNodes"><span>${file.orgFile}</span><span><a id="deleteButton" data-fileIdx="idx" class="text-danger font-weight-bold pr-2" href="#" onclick="deleteThisFile(this)">X</a></span></li>
                                        <input id="file-idx" type="hidden" name="orgFiles" value="${file.idx}">
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div>
                            <textarea id="summernote" name="qna_content">${qnaDTO.qna_content}</textarea>
                        </div>
                        <br>
                        <div style="display: flex;justify-content: center;">
                            <div>
                                <button type="button" class="btn" id="btn_back" onclick="location.href='/mypage/qnaList'">목록</button>
                            </div>
                            <div>
                                <button type="submit" class="btn" id="btn_modify">수정</button>
                                <button type="button" class="btn btn-secondary" id="btn_delete" onclick="location.href='/mypage/qnaView?qna_idx='+${qnaDTO.qna_idx}">취소</button>
                            </div>
                        </div>
                    </form>
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
<link href="/resources/css/summernote/summernote-lite.css" rel="stylesheet">
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script>
    $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 500,
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['codeview', 'help']]
        ]

    });
    function fileList(element) {
        document.querySelector('#file-list').innerHTML = "";
        let fileList = document.querySelector('#file-list');
        console.log(element.files);
        for (let i=0; i < element.files.length; i++) {
            let list = document.createElement('li');
            list.classList.add('card','shadow-none', 'border', 'border-gray', 'd-flex', 'flex-row', 'justify-content-between', 'p-2', 'fileListNodes');
            list.dataset.idx = i;
            list.innerHTML = '<span>' + element.files.item(i).name + '</span><span><a id="deleteButton" class="text-danger font-weight-bold pr-2" href="#" onclick="deleteThisFile(this)">X</a></span>'
            fileList.append(list);
        }
    }
    function deleteThisFile(element) {
        event.preventDefault();
        element.parentElement.parentElement.remove();
        let input = document.getElementById("file-"+element.dataset.fileidx);
        $(input).remove();
        const dataTransfer = new DataTransfer();
        let target = element.dataset.idx;
        let files = document.querySelector('#file').files;
        let fileArray = Array.from(files);
        fileArray.splice(target, 1);
        fileArray.forEach(file => {dataTransfer.items.add(file);});
        document.querySelector('#file').files = dataTransfer.files;
    }
    let btn_modify = document.getElementById("btn_modify");
    btn_modify.addEventListener("click", function(e){
       e.preventDefault();
       let frmModify = document.getElementById("frmModify");
        frmModify.submit();
    });
</script>
</body>
</html>
