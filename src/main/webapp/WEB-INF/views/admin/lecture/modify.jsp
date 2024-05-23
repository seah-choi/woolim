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


</head>
<body>

<jsp:include page="/WEB-INF/views/admin/common/adminSidebar.jsp"/>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <!-- basic table  Start -->
        <div class="pd-20 card-box mb-30" style="margin-bottom: 30px">
            <h4 class="h4">강좌 등록</h4>
            <br>

            <form>

                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌명</label>
                    <div class="col-sm-12 col-md-5">
                        <input class="form-control" type="text" placeholder="강좌명을 입력해주세요.">
                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강사명</label>
                    <div class="col-sm-12 col-md-5">
                        <input class="form-control" type="text" placeholder="강사명을 입력해주세요.">
                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">수업내용 및 목표</label>
                    <div class="contentBox col-sm-12 col-md-8">
                        <div><textarea class="form-control" rows="15" cols="5" name="content" id="content" placeholder="수업내용 및 목표를 입력해주세요."></textarea></div>
                    </div>
                </div>
                <div class="d-flex align-items-start align-items-sm-center mt-4">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700 mt-3">분류</label>
                    <div class="col-md-1 col-sm-12">
                        <div class="form-group">
                            <label>과목</label>
                            <select class="selectpicker form-control" name="search_type" data-size="5" data-style="btn-outline-info">
                                <option>전체</option>
                                <option>국어</option>
                                <option>영어</option>
                                <option>수학</option>
                                <option>과학</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-1 col-sm-12">
                        <div class="form-group">
                            <label>초중고</label>
                            <select id="schoolSelect" name="search_type" class="selectpicker form-control school" data-size="5" data-style="btn-outline-info">
                                <option>전체</option>
                                <option value="elementary">초등</option>
                                <option value="middle">중등</option>
                                <option value="high">고등</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-1 col-sm-12">
                        <div class="form-group">
                            <label>학년</label>
                            <select id="gradeSelect" name="search_type" class="selectpicker form-control grade" data-size="5" data-style="btn-outline-info">
                                <option>전체</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="input-group mb-3 mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌 시작기간</label>

                    <div class="col-sm-12 col-md-10 d-flex">
                        <input type="date" class="form-control" id="search_date1" name="search_date1" value="" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">

                        <span class="input-group-text"></span>
                        <label class="col-md-2 col-form-label fontWe-700">강좌 끝나는기간</label>
                        <input type="date" class="form-control" id="search_date2" name="search_date2" value="" class="form-control clearBtn" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>
                </div>

                <div class="d-flex align-items-start align-items-sm-center mt-5">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌 업로드</label>
                    <div class="col-sm-12 col-md-10 d-flex">
                        <input type="file" class="form-control-file form-control height-auto">
                    </div>
                </div>

                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">강좌 이미지 업로드</label>
                    <div class="col-sm-12 col-md-10">
                        <div id="image_container"></div>
                        <br>
                        <div>
                            <input type="file" name="upload" class="form-control-file form-control height-auto" onchange="setThumbnail(event);" accept="image/png, image/jpeg"  />
                            <p class="text-muted mb-0">JPG 또는 PNG 파일만 업로드 가능합니다. 최대 사이즈는 800K 입니다.</p>
                        </div>
                    </div>
                </div>

            </form>

            <div class="d-flex justify-content-sm-end">
                <button type="submit" name="regisBtn" class="btn btn-primary btn-lg btn-bloc">등록</button>
            </div>

        </div>
    </div>
</div>
<!-- js -->
<script>
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


    //분류 셀렉박스
    const gradeOptions = {
        elementary: ['전체', '1학년', '2학년', '3학년', '4학년', '5학년', '6학년'],
        middle: ['전체', '1학년', '2학년', '3학년'],
        high: ['전체', '1학년', '2학년', '3학년'],
    };

    document.getElementById('schoolSelect').addEventListener('change', function () {
        const schoolType = this.value;
        const gradeSelect = document.getElementById('gradeSelect');

        gradeSelect.innerHTML = '';

        if (schoolType in gradeOptions) {
            gradeOptions[schoolType].forEach(grade => {
                const option = document.createElement('option');
                option.value = grade;
                option.textContent = grade;
                gradeSelect.appendChild(option);
            });
        } else {
            const option = document.createElement('option');
            option.value = 'all';
            option.textContent = '전체';
            gradeSelect.appendChild(option);
        }

        $('.selectpicker').selectpicker('refresh');
    });

    document.getElementById('schoolSelect').dispatchEvent(new Event('change'));

</script>
<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
