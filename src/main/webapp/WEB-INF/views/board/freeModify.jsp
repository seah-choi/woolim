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
            <h5 style="font-weight: bold">게시판</h5>
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
        <h5 style="font-weight: bold">자유게시판</h5>
        <hr>
        <br>
        <form name="frm" id="frm" action="/board/freeModify" method="post" enctype="multipart/form-data">
            <input type="hidden" name="bbs_idx" id="bbs_idx" value="${bbs.bbs_idx}">
            <input type="hidden" name="member_id" id="member_id" value="${sessionScope.member_id}">
            <input type="hidden" name="bbs_category_code" id="bbs_category_code" value="bbs02">
            <div class="form-floating">
                <textarea class="form-control" name="bbs_title" placeholder="Leave a comment here" id="floatingTextarea">${bbs.bbs_title}</textarea>
                <label for="floatingTextarea">제목</label>
            </div>
            <br>
            <input type="file" class="form-control" name="files" id="file" multiple onchange="fileList(this)">
            <div class="ml-5">
                <label>파일 리스트</label>
                <ul id="file-list" class="form-group col-md-10 d-flex flex-column m-0 p-0" style="gap:5px">
                </ul>
            </div>
            <br>
            <div class="ml-5">
                <label>기존 파일 리스트</label>
                <ul id="org-file-list" class="form-group col-md-10 d-flex flex-column m-0 p-0" style="gap:5px">
                    <c:forEach items="${fileList}" var="file">
                        <li class="card d-flex flex-row justify-content-between p-2 fileListNodes"><span>${file.orgFile}</span><span><a id="deleteButton" data-fileIdx="${file.idx}" class="text-danger font-weight-bold pr-2" href="#" onclick="deleteThisFile2(this)">X</a></span></li>
                        <input id="file-${file.idx}" type="hidden" name="orgFiles" value="${file.idx}">
                    </c:forEach>
                </ul>
            </div>
            <br>
            <div>
                <textarea id="summernote" name="bbs_content">${bbs.bbs_content}</textarea>
            </div>
            <br>
            <div style="display: flex;justify-content: center;">
                <div>
                    <button type="button" class="btn" id="btn_back" onclick="location.href='/board/freeList?bbs_type=bbs02'">목록</button>
                </div>
                <div>
                    <button type="submit" class="btn" id="btn_modify">등록</button>
                    <button type="reset" class="btn btn-secondary" id="btn_delete">취소</button>
                </div>
            </div>
        </form>
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
            list.classList.add('card', 'd-flex', 'flex-row', 'justify-content-between', 'p-2', 'fileListNodes');
            list.setAttribute("data-idx", i);
            list.innerHTML = '<span>' + element.files.item(i).name + '</span><span><a id="deleteButton" class="text-danger font-weight-bold pr-2" href="#" onclick="deleteThisFile(this)">X</a></span>'
            fileList.append(list);
        }
    }
    // 파일 리스트 개별 삭제용
    function deleteThisFile(element) {
        event.preventDefault();
        let target = element.getAttribute("data-idx");
        element.parentElement.parentElement.remove();
        let input = document.getElementById("file-"+element.dataset.fileidx);
        $(input).remove();
        const dataTransfer = new DataTransfer();

        let files = document.querySelector('#file').files;
        let fileArray = Array.from(files);
        console.log(files);
        console.log(element);
        fileArray.splice(target, 1);
        fileArray.forEach(file => {dataTransfer.items.add(file);});
        document.querySelector('#file').files = dataTransfer.files;
    }
    function deleteThisFile2(element) {
        event.preventDefault();
        element.parentElement.parentElement.nextElementSibling.remove();
        element.parentElement.parentElement.remove();
    }
</script>
</body>
</html>



