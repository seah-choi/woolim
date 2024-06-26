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


    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-119386393-1');
    </script>

    <style>
        .card-box {
            margin-right: 500px;
            margin-left: 20px;
            padding-bottom: 100px;
        }
    </style>
    <

</head>
<body>

<jsp:include page="/WEB-INF/views/admin/common/adminSidebar.jsp"/>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
            <!-- basic table  Start -->
            <div class="pd-20 card-box mb-30" style="padding-bottom: 100px">
                <h4 class="h4">강좌 등록</h4>
                <br>

                <form name="frm" id="frm" enctype="multipart/form-data">


                    <div class="d-flex align-items-start align-items-sm-center mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강사 아이디</label>
                        <div class="col-sm-12 col-md-5">
                            <input class="form-control" type="text" name="member_id" placeholder="강사 아이디를 입력해주세요." value="${selectedMemberId}" id="member_id" readonly>
                        </div>
                        <button id="searchTeacher" type="button" style="width: 100px; height: 50px;"   class="btn btn-primary">찾기</button>
                    </div>
                    <div class="d-flex align-items-start align-items-sm-center mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700" >강사명</label>
                        <div class="col-sm-12 col-md-5">
                            <input class="form-control" type="text" placeholder="강사명을 입력해주세요." name="member_name" id="member_name" value="${selectedMemberName}" readonly>
                        </div>
                    </div>
                    <div class="d-flex align-items-start align-items-sm-center mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌명</label>
                        <div class="col-sm-12 col-md-5">
                            <input class="form-control" type="text" name="lecture_title" placeholder="강좌명을 입력해주세요.">
                        </div>
                    </div>
                    <div class="d-flex align-items-start align-items-sm-center mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700">수업내용 및 목표</label>
                        <div class="contentBox col-sm-12 col-md-8">
                            <div><textarea class="form-control" rows="15" cols="5"  id="content" name="lecture_content" placeholder="수업내용 및 목표를 입력해주세요."></textarea></div>
                        </div>
                    </div>
                    <div class="d-flex align-items-start align-items-sm-center mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700">커리큘럼</label>
                        <div class="contentBox col-sm-12 col-md-8">
                            <div><textarea class="form-control" rows="15" cols="5"  id="study" name="lecture_study" placeholder="커리큘럼을 입력해주세요."></textarea></div>
                        </div>
                    </div>
                    <div class="d-flex align-items-start align-items-sm-center mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700">수업상세 내용</label>
                        <div class="contentBox col-sm-12 col-md-8">
                            <div><textarea class="form-control" rows="15" cols="5" id="col" name="lecture_content_detail" placeholder="수업내용 및 목표를 입력해주세요."></textarea></div>
                        </div>
                    </div>
                    <div class="d-flex align-items-start align-items-sm-center mt-4">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700 mt-3">분류</label>
                        <div class="col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>과목</label>
                                <select class="selectpicker form-control" name="lecture_category_subject" data-size="5" data-style="btn-outline-info">
                                    <option>전체</option>
                                    <option>국어</option>
                                    <option>영어</option>
                                    <option>수학</option>
                                    <option>과학</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>초중고</label>
                                <select id="schoolSelect" name="lecture_category_school" class="selectpicker form-control school" data-size="5" data-style="btn-outline-info">
                                    <option value="all">전체</option>
                                    <option value="elementary">초등</option>
                                    <option value="middle">중등</option>
                                    <option value="high">고등</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>학년</label>
                                <select id="gradeSelect" name="lecture_category_grade" class="selectpicker form-control grade" data-size="5" data-style="btn-outline-info">
                                    <option value="all">전체</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="input-group mb-3 mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌 시작기간</label>

                        <div class="col-sm-12 col-md-10 d-flex">
                            <input type="date" class="form-control w-25" id="search_date1" name="lecture_start_date" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">

                            <span class="input-group-text"></span>
                            <label class="col-md-2 col-form-label fontWe-700">강좌 끝나는기간</label>
                            <input type="date" class="form-control w-25" id="search_date2" name="lecture_end_date" value="" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        </div>
                    </div>

             <div class="d-flex align-items-start align-items-sm-center mt-5">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700">유튜브 링크</label>
                        <div class="col-sm-12 col-md-10 ">
                            <input type="text" class="form-control-file form-control height-auto w-50" name="lecture_video">
                        </div>
                    </div>

                    <div class="d-flex align-items-start align-items-sm-center mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌 이미지 업로드</label>
                        <div class="col-sm-12 col-md-10">
                            <div id="image_container"></div>
                            <br>
                            <div>
                                <input type="file" name="file" class="form-control-file form-control height-auto w-50" onchange="setThumbnail(event);" accept="image/png, image/jpeg"  />
                                <p class="text-muted mb-0">JPG 또는 PNG 파일만 업로드 가능합니다.</p>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex align-items-start align-items-sm-center mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700" >가격</label>
                        <div class="col-sm-12 col-md-5">
                            <input class="form-control" type="text" placeholder="가격 입력해주세요." name="lecture_price" id="lecture_price" >
                        </div>
                    </div>
                    <div class="d-flex align-items-start align-items-sm-center mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700" >할인율</label>
                        <div class="col-sm-12 col-md-5">
                            <input class="form-control" type="text" placeholder="할인율을 입력해주세요." name="lecture_sale" id="lecture_sale"  >
                        </div>
                    </div>
                    <div class="d-flex align-items-start align-items-sm-center mt-3">
                        <label class="col-sm-12 col-md-2 col-form-label fontWe-700"></label>
                        <div class="col-sm-12 col-md-5 mt-3">
                            <button type="button" name="registBtn" id="registBtn"  class="btn btn-primary" style="width: 600px; height: 50px;">등록</button>

                        </div>
                    </div>
                </form>






        </div>
    </div>
</div>
<!-- js -->
<script>
    document.querySelector("#searchTeacher").addEventListener("click", function (e) {
        e.preventDefault();


        let popupUrl = "/admin/lecture/teacherList"; // 팝업 창에 표시할 내용에 대한 URL을 여기에 설정합니다.

        // 팝업 창 옵션 설정
        let popupOption = "width=900,height=400,scrollbars=yes,resizable=yes";

        // 팝업 창 열기
        window.open(popupUrl, "", popupOption);

    });

    //이미지 프리뷰
    function setThumbnail(e){
        var reader = new FileReader();

        reader.onload = function(e){
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
    document.getElementById('schoolSelect').addEventListener('change', function() {
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


    document.getElementById("member_id").value = getQueryParam("selectedMemberId");
    document.getElementById("member_name").value = getQueryParam("selectedMemberName");

    document.querySelector("#registBtn").addEventListener("click", function () {
        const frm = document.querySelector("#frm");
        console.log("####" + frm );
        frm.method = 'post';
        frm.action = '/admin/lecture/registLecture';
        frm.submit();
    });
</script>
<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
