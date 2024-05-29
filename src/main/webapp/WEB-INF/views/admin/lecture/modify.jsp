<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2024-05-21
  Time: 오후 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- Basic Page Info -->
    <meta charset="utf-8">
    <title>Admin</title>

    <!-- Site favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/vendors/images/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/vendors/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/vendors/images/favicon-16x16.png">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/vendors/styles/core.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/styles/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/adminStyle.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <!-- Css Styles -->

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-119386393-1');
    </script>

    <style>
        .section {
            margin-bottom: 20px;
        }
        .section input, .section textarea {
            display: block;
            margin-bottom: 10px;
        }
        .card-box {
            margin-right: 500px;
            margin-left: 20px;
            padding-bottom: 100px;
        }
        .commonDeleteBtn1{
            background-color: transparent; /* 배경색 투명 설정 */
            border: none; /* 테두리 제거 */
            color: red; /* 텍스트 색상 지정 */
            font-size: 14px; /* 글꼴 크기 설정 */
            cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능한 것으로 나타냄 */
        }
        /* 삭제 버튼의 스타일 */
        .commonDeleteBtn {
            background-color: transparent; /* 배경색 투명 설정 */
            border: none; /* 테두리 제거 */
            color: red; /* 텍스트 색상 지정 */
            font-size: 14px; /* 글꼴 크기 설정 */
            cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능한 것으로 나타냄 */
        }

        /* 삭제 버튼에 호버 효과 추가 */
        .commonDeleteBtn:hover {
            color: #666; /* 호버 시 텍스트 색상 변경 */
        }
    </style>


</head>
<body>

<jsp:include page="/WEB-INF/views/admin/common/adminSidebar.jsp"/>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <!-- basic table  Start -->
        <div class="pd-20 card-box mb-30" style="padding-bottom: 100px">
            <h4 class="h4">강좌 수정</h4>
            <br>


            <div class="d-flex align-items-start align-items-sm-center mt-3">
                <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌 업로드</label>
                <div class="col-sm-12 col-md-5">
                    <form id="videoFrm" name="videoFrm" enctype="multipart/form-data">
                        <div>
                            <input type="file" name="files" id="file" multiple="multiple" class="form-control-file form-control height-auto w-50"   style="width: 150px;"/>
                            <p class="text-muted mb-0">mp4  파일만 업로드 가능합니다.</p>
                            <input name="lecture_idx"  type="hidden" value="${list.lecture_idx}">
                            <c:choose>
                                <c:when test="${video[0].video_content != null}">
                                    <input class="form-control" type="text" name="video_content"  value="${video[0].video_content}" placeholder="섹션 내용 입력" readonly >
                                </c:when>
                                <c:otherwise>
                                    <input class="form-control" type="text" name="video_content" placeholder="섹션 내용 입력"  >
                                </c:otherwise>
                            </c:choose>


                        </div>
                    </form>

                </div>
                <button id="addRegistVideo" type="button" style="width: 100px; height: 50px;"   class="btn btn-primary">등록</button>
                <div class="accordion" id="accordionPanelsStayOpenExample" style="width: 500px; margin-left: 50px;">

                    <div class="accordion-item">
                        <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                                ${video[0].video_content}
                            </button>
                        </h2>
                        <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                            <div class="accordion-body">
                                <c:forEach items="${video}" var="video">
                                    <c:choose>
                                        <c:when test="${video.video_title != null}">
                                            <div class="deleteImageDiv">
                                                <input type="hidden" value="${video.video_idx}" id="video_idx" />
                                                 <a href="#">${video.video_title}</a>
                                                <button type="button" class="commonDeleteBtn1">x</button>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="commonDeleteBtn" style="display: none;">x</button>
                                        </c:otherwise>
                                    </c:choose>

                                </c:forEach>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <form name="frm" id="frm" enctype="multipart/form-data" action="/admin/lecture/modifyLecture" method="post">
                <input type="hidden" class="lecture_idx" id="lecture_idx" name="lecture_idx"value="${list.lecture_idx}"/>

                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강사 아이디</label>
                    <div class="col-sm-12 col-md-5">

                        <input class="form-control" type="text" name="member_id" placeholder="강사 아이디를 입력해주세요." value="${selectedMemberId != null ? selectedMemberId : list.member_id}" id="member_id" readonly>
                    </div>
                    <button id="searchTeacher" type="button" style="width: 100px; height: 50px;"   class="btn btn-primary">찾기</button>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700" >강사명</label>
                    <div class="col-sm-12 col-md-5">
                        <input class="form-control" type="text" name="member_name" placeholder="강사 이름을 입력해주세요." value="${selectedMemberName != null ? selectedMemberName : list.member_name}" id="member_name" readonly>
                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌명</label>
                    <div class="col-sm-12 col-md-5">
                        <input class="form-control" type="text" name="lecture_title" placeholder="강좌명을 입력해주세요." value="${list.lecture_title}">
                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">수업내용 및 목표</label>
                    <div class="contentBox col-sm-12 col-md-8">
                        <textarea class="summernote" name="lecture_content"  placeholder="수업내용 및 목표를 입력해주세요.">
                            ${list.lecture_content}
                        </textarea>
                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">커리큘럼</label>
                    <div class="contentBox col-sm-12 col-md-8">

                      <textarea class="summernote" name="lecture_study"  placeholder="수업내용 및 목표를 입력해주세요.">
                          ${list.lecture_study}
                      </textarea>

                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">수업상세 내용</label>
                    <div class="contentBox col-sm-12 col-md-8">
                     <textarea class="summernote" name="lecture_content_detail"  placeholder="수업내용 및 목표를 입력해주세요.">
                         ${list.lecture_content_detail}
                     </textarea>


                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-4">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700 mt-3">분류</label>
                    <div class="col-md-2 col-sm-12">
                        <div class="form-group">
                            <label>과목</label>
                            <select class="selectpicker form-control" name="lecture_category_subject" data-size="5" data-style="btn-outline-info">
                                <option>전체</option>
                                <option ${list.lecture_category_subject == '국어' ? 'selected' : ''}>국어</option>
                                <option ${list.lecture_category_subject == '영어' ? 'selected' : ''}>영어</option>
                                <option ${list.lecture_category_subject == '수학' ? 'selected' : ''}>수학</option>
                                <option ${list.lecture_category_subject == '과학' ? 'selected' : ''}>과학</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12">
                        <div class="form-group">
                            <label>초중고</label>
                            <select id="schoolSelect" name="lecture_category_school" class="selectpicker form-control school" data-size="5" data-style="btn-outline-info">
                                <option value="all">전체</option>
                                <option value="elementary" ${list.lecture_category_school == 'elementary' ? 'selected' : ''}>초등</option>
                                <option value="middle" ${list.lecture_category_school == 'middle' ? 'selected' : ''}>중등</option>
                                <option value="high" ${list.lecture_category_school == 'high' ? 'selected' : ''}>고등</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-12">
                        <div class="form-group">
                            <label>학년</label>
                            <select id="gradeSelect" name="lecture_category_grade" class="selectpicker form-control grade" data-size="5" data-style="btn-outline-info">
                                <option value="${list.lecture_category_grade}">${list.lecture_category_grade} 학년</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="input-group mb-3 mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌 시작기간</label>

                    <div class="col-sm-12 col-md-10 d-flex">
                        <input type="date" class="form-control w-25" id="search_date1" name="lecture_start_date"  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                        value="${list.lecture_start_date}">

                        <span class="input-group-text"></span>
                        <label class="col-md-2 col-form-label fontWe-700">강좌 끝나는기간</label>
                        <input type="date" class="form-control w-25" id="search_date2" name="lecture_end_date"  aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
                               value="${list.lecture_end_date}">
                    </div>
                </div>

                <div class="d-flex align-items-start align-items-sm-center mt-5">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">유튜브 링크</label>
                    <div class="col-sm-12 col-md-10 ">
                        <input type="text" class="form-control-file form-control height-auto w-50" name="lecture_video" value="${list.lecture_video}">
                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌 이미지 업로드</label>
                    <div class="col-sm-12 col-md-10">
                        <div id="image_container"></div>
                        <br>
                        <div>

                            <input type="file" name="file" id="fileUpdate"class="form-control-file form-control height-auto w-50" onchange="setThumbnail(event);" accept="image/png, image/jpeg"  />
                            <p class="text-muted mb-0">JPG 또는 PNG 파일만 업로드 가능합니다.</p>
                            <input type="hidden" value="${list.lecture_image}" name="lectureImageValue" id="lectureImageValue"/>

                            <c:choose>
                                <c:when test="${list.lecture_image != null}">
                                    <div class="deleteImageDiv"><span>${list.lecture_image}</span>
                                        <button type="button" class="commonDeleteBtn">x</button>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <button type="button" class="commonDeleteBtn" style="display: none;">x</button>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </div>

                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700" >가격</label>
                    <div class="col-sm-12 col-md-5">
                        <input class="form-control" type="text" placeholder="가격 입력해주세요." name="lecture_price" id="lecture_price"  value=" ${list.lecture_price}">
                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700" >할인율</label>
                    <div class="col-sm-12 col-md-5">
                        <input class="form-control" type="text" placeholder="할인율을 입력해주세요." name="lecture_sale" id="lecture_sale"  value=" ${list.lecture_sale}" >
                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700"></label>
                    <div class="col-sm-12 col-md-5 mt-3">
                        <button type="submit" name="registBtn" id="registBtn"  class="btn btn-primary" style="width: 600px; height: 50px;">등록</button>

                    </div>
                </div>
            </form>


            <%--<div>
                <button type="button" id="addSectionBtn">섹션 추가</button>
            </div>
            <div id="sectionsContainer">
                <form id="videoFrm" name="videoFrm" enctype="multipart/form-data"></form>
            </div>
            <div>
                <button type="button" id="addRegistVideo" style="display: none;">등록</button>
            </div>
--%>

        </div>
    </div>
</div>
<script src="/media/jquery-1.12.4.min.js"></script>
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

    document.querySelector("#addRegistVideo").addEventListener("click", function (e){
        e.preventDefault();
        const videoFrm = document.querySelector("#videoFrm");
        const files = document.getElementById('file').files;
        const maxFileSize = 50 * 1024 * 1024; // 50MB
        let totalSize = 0;
        if (files.length === 0) {
            alert('파일이 선택되지 않았습니다.');
            return;
        }
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const fileName = file.name;
            const fileSize = file.size;
            totalSize += fileSize;
            if (!fileName.endsWith('.mp4')) {
                alert(`파일 ${fileName}은(는) .mp4 파일이 아닙니다.`);
                return;
            }

            if (fileSize > maxFileSize) {
                alert(`파일 ${fileName}은(는) 50MB를 초과합니다.`);
                return;
            }
        }
        console.log("size" + totalSize);
        if (totalSize > 10240000) {
            alert(`전체 파일용량이 50MB를 초과합니다.`);
            return;
        }

        alert('모든 파일이 유효합니다.');
        videoFrm.method = 'post';
        videoFrm.action ='/admin/lecture/videoRegist';
        videoFrm.submit();
    })
    document.querySelector("#searchTeacher").addEventListener("click", function (e) {
        e.preventDefault();

        let lecture_idx = document.querySelector("#lecture_idx").value;
        let popupUrl = "/admin/lecture/teacherListModify?lecture_idx=" + lecture_idx; // 팝업 창에 표시할 내용에 대한 URL을 여기에 설정합니다.

        // 팝업 창 옵션 설정
        let popupOption = "width=900,height=400,scrollbars=yes,resizable=yes";

        // 팝업 창 열기
        window.open(popupUrl, "", popupOption);

    });

    //이미지 프리뷰
    function setThumbnail(e) {
        var reader = new FileReader();

        reader.onload = function (e) {
            // 기존 이미지를 제거
            var imageContainer = document.querySelector("div#image_container");
            imageContainer.innerHTML = '';

            // 새로운 이미지 추가
            var img = document.createElement("img");

            img.setAttribute("src", e.target.result);
            //img.setAttribute("class", "col-lg-3");
            img.style.width = "300px"; // 원하는 너비로 설정
            img.style.height = "230px"; // 비율을 유지하려면 auto 사용
            imageContainer.appendChild(img);
        };

        reader.readAsDataURL(e.target.files[0]);
    }

    function getQueryParam(param) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(param);
    }

    document.getElementById('schoolSelect').addEventListener('change', function () {
        const gradeSelect = document.getElementById('gradeSelect');
        gradeSelect.innerHTML = ''; // 기존 옵션 제거

        const selectedSchool = this.value;
        let options = '<option value="all">전체</option>';

        if (selectedSchool === 'elementary') {
            options += '<option value="1">1학년</option>';
            options += '<option value="2">2학년</option>';
            options += '<option value="3">3학년</option>';
            options += '<option value="4">4학년</option>';
            options += '<option value="5">5학년</option>';
            options += '<option value="6">6학년</option>';
        } else if (selectedSchool === 'middle') {
            options += '<option value="1">1학년</option>';
            options += '<option value="2">2학년</option>';
            options += '<option value="3">3학년</option>';
        } else if (selectedSchool === 'high') {
            options += '<option value="1">1학년</option>';
            options += '<option value="2">2학년</option>';
            options += '<option value="3">3학년</option>';
        }

        gradeSelect.innerHTML = options;
        $('.selectpicker').selectpicker('refresh');
    });

/*

    document.getElementById("member_id").value = getQueryParam("selectedMemberId");
    document.getElementById("member_name").value = getQueryParam("selectedMemberName");
*/

/*
    document.querySelector("#registBtn").addEventListener("click", function () {
        const frm = document.querySelector("#frm");
        console.log("####" + frm);
        frm.method = 'post';
        frm.action = '/admin/lecture/modifyLecture';
        frm.submit();
    });
*/


    $('.summernote').summernote({
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
    document.querySelector(".commonDeleteBtn").addEventListener("click", function (e) {
        e.preventDefault();
        const lecture_idx = document.querySelector("#lecture_idx").value;

        if (lecture_idx) {
            fetch('/admin/lecture/deleteImage', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ lecture_idx: lecture_idx }),
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        const di = document.querySelector(".deleteImageDiv");
                        const lectureImageValue = document.querySelector("#lectureImageValue").value = '';
                        di.style.display = 'none';
                        console.log("lectureImageValue"+lectureImageValue);
                    } else {
                        // 실패 처리
                    }
                })
                .catch((error) => {
                    console.error('Error:', error);
                });
        }
    });


    document.querySelector("#fileUpdate").addEventListener("click" ,function (){

        const lectureImageValue = document.querySelector("#lectureImageValue").value;
        console.log("lectureImageValue"+lectureImageValue);
        if(lectureImageValue != ''){
            alert("기존 파일을 삭제 후 진행 해 주세요.");
            event.preventDefault(); // 이벤트의 기본 동작 중단
            event.stopPropagation(); // 이벤트의 상위 엘리먼트로의 전파 중단
        }
    });

    $(document).ready(function() {
        $('.commonDeleteBtn1').click(function() {
            var videoIdx = $(this).siblings('#video_idx').val();

            if(confirm('정말로 삭제하시겠습니까?')) {
                $.ajax({
                    url: '/admin/lecture/videoDelete', // 서버의 삭제 엔드포인트 URL
                    type: 'POST',
                    data: { video_idx: videoIdx },
                    success: function(response) {
                        alert('삭제되었습니다.');
                        location.reload(); // 페이지 새로고침
                    },
                    error: function(error) {
                        alert('삭제 중 오류가 발생했습니다.');
                    }
                });
            }
        });
    });
</script>
<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
