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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            margin-right: 400px;
            margin-left: 100px;
            padding-bottom: 100px;
        }
        .image_container {
            border: 1px solid #e9ecef;
            border-radius: 5px;
            width: 355px;
            height: 405px;
            margin-left: 12px;
        }
        .fileDiv {
            margin-left: 20px;
            margin-top: 250px;
        }
        .teacher_intro {
            border: 1px solid #e9ecef;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/views/admin/common/adminSidebar.jsp"/>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10 pb-5">
        <!-- basic table  Start -->
        <form id="frmModify" method="post" action="/admin/member/view">
            <div class="pd-20 card-box mb-30" style="padding-bottom: 80px">
                <h4 class="h4">회원 상세</h4>
                <br>
                <div class="pl-30">

                        <div class="d-flex align-items-start align-items-sm-center mt-3">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700">아이디</label>
                            <div class="col-sm-12 col-md-5">
                                <input class="form-control" type="text" value="${memberList.member_id}" name="member_id" id="member_id" readonly>
                            </div>
                        </div>
                        <div class="d-flex align-items-start align-items-sm-center mt-3">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700">이름</label>
                            <div class="col-sm-12 col-md-5">
                                <input class="form-control" type="text" value="${memberList.member_name}" name="member_name" id="member_name" readonly>
                            </div>
                        </div>
                        <div class="d-flex align-items-start align-items-sm-center mt-3">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700">소셜 타입</label>
                            <div class="col-sm-12 col-md-5">
                                <input class="form-control" type="text" value="${memberList.member_oauth}" name="member_oauth" id="member_oauth" readonly>
                            </div>
                        </div>
                        <div class="d-flex align-items-start align-items-sm-center mt-3">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700">이메일</label>
                            <div class="col-sm-12 col-md-5">
                                <input class="form-control" type="text" value="${memberList.member_email}" name="member_email_addr" id="member_email_addr" readonly>
                            </div>
                        </div>

                        <div class="d-flex align-items-start align-items-sm-center mt-3">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700">휴대폰 번호</label>
                            <div class="col-sm-12 col-md-5">
                                <div class="form-control" name="member_phone" id="member_phone" readonly>
                                    ${fn:substring(memberList.member_phone, 0, 3)}-${fn:substring(memberList.member_phone, 3, 7)}-${fn:substring(memberList.member_phone, 7, 11)}
                                </div>
                            </div>
                        </div>


                        <div class="d-flex align-items-start align-items-sm-center mt-3">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700">주소</label>
                            <div class="col-sm-12 col-md-5">
                                <input class="form-control" type="text" value="${memberList.member_addr}" name="member_addr" id="member_addr" readonly>
                            </div>
                        </div>

                        <div class="d-flex align-items-start align-items-sm-center mt-3">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700">상세 주소</label>
                            <div class="col-sm-12 col-md-5">
                                <input class="form-control" type="text" value="${memberList.member_addr_detail}" name="member_addr_detail" id="member_addr_detail" readonly>
                            </div>
                        </div>


                        <div class="d-flex align-items-start align-items-sm-center mt-4">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700 mb-3">회원 구분</label>
                            <div class="col-md-2 col-sm-12">
                                <div class="form-group">
                                    <select class="selectpicker form-control" name="member_category" data-size="5" data-style="btn-outline-info">
                                        <c:if test="${memberList.member_category eq 'admin'}">
                                            <option value="admin">관리자</option>
                                            <option value="student">학생</option>
                                            <option value="teacher">선생님</option>
                                        </c:if>
                                        <c:if test="${memberList.member_category eq 'student'}">
                                            <option value="student">학생</option>
                                            <option value="teacher">선생님</option>
                                            <option value="admin">관리자</option>
                                        </c:if>
                                        <c:if test="${memberList.member_category eq 'teacher'}">
                                            <option value="teacher">선생님</option>
                                            <option value="student">학생</option>
                                            <option value="admin">관리자</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex align-items-start align-items-sm-center mt-3">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700">포인트</label>
                            <div class="col-sm-12 col-md-5">
                                <input class="form-control" type="text" value="${memberList.member_point}" name="member_point" id="member_point" readonly>
                            </div>
                        </div>

                        <div class="input-group mb-3 mt-3">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700">가입 날짜</label>

                            <div class="col-sm-12 col-md-3 d-flex">
                                <input type="date" class="form-control" id="member_reg_date" name="member_reg_date" value="${memberList.member_reg_date}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" readonly>
                            </div>
                        </div>

                        <div class="d-flex align-items-start align-items-sm-center mt-4" style="margin-bottom: 30px">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700 mb-3">탈퇴 상태</label>
                            <div class="col-md-2 col-sm-12">
                                <div class="form-group">
                                    <select class="selectpicker form-control" name="member_status" data-size="5" data-style="btn-outline-info">
                                        <c:if test="${memberList.member_status eq 'N'}">
                                            <option value="N">N</option>
                                            <option value="Y">Y</option>
                                        </c:if>
                                        <c:if test="${memberList.member_status eq 'Y'}">
                                            <option value="Y">Y</option>
                                            <option value="N">N</option>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="input-group mb-3 mt-3">
                            <label class="col-sm-12 col-md-2 col-form-label fontWe-700">탈퇴 날짜</label>

                            <div class="col-sm-12 col-md-3 d-flex">
                                <input type="date" class="form-control" id="member_leave_date" name="member_leave_date" value="${memberList.member_leave_date}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" readonly>
                            </div>
                        </div>

                        <div>
                            <div id="fileBox">
                                <div class="d-flex align-items-start align-items-sm-center gap-4">
                                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">선생님 이미지</label>
                                    <%--  <img src="/resources/uploads/${bbs.save_file}" alt="user-avatar" class="d-block rounded" height="100" width="100" id="preview"  />--%>
                                    <div id="image_container" class="image_container"></div>
                                    <div class="button-wrapper fileDiv">
                                        <input type="file" id="file" name="file" class="form-control" accept="image/png, image/jpeg" onchange="setThumbnail(event);"/>
                                        <p class="text-muted mb-0">JPG 또는 PNG 파일만 업로드 가능합니다.</p>
                                        <input type="hidden" name="upload" value="">
                                    </div>
                                </div>
                                <div class="d-flex align-items-start align-items-sm-center mt-3">
                                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">선생님 소개</label>
                                    <div class="col-sm-12 col-md-5">
                                        <textarea name="teacher_intro" class="teacher_intro" rows="10" cols="70"></textarea>
                                    </div>
                                </div>
                            </div>

                        </div>



                </div>

                <div class="d-flex align-items-start align-items-sm-center mt-3">
                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700"></label>
                    <div class="col-sm-12 col-md-5 mt-3 d-flex">
                        <button type="submit" name="modifyBtn" class="btn btn-primary" style="width: 300px; height: 50px; margin-left: 22px;">수정</button>
                        <button type="button" name="listBtn" class="btn btn-primary" onclick="location.href='/admin/member/list'" style="width: 300px; height: 50px; margin-left: 22px;">목록</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

</div>
<!-- js -->
<script>
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
            img.style.width = "350px"; // 원하는 너비로 설정
            img.style.height = "400px"; // 비율을 유지하려면 auto 사용
            imageContainer.appendChild(img);
        };

        reader.readAsDataURL(e.target.files[0]);
    }

    document.addEventListener('DOMContentLoaded', function() {
        var selectBox = document.querySelector('select[name="member_category"]');
        selectBox.addEventListener('change', function() {

            var fileBox = document.getElementById('fileBox');

            if(this.value === 'teacher') {
                fileBox.style.display = 'block';
            } else {
                fileBox.style.display = 'none';
            }
        });

        selectBox.dispatchEvent(new Event('change'));
    });





</script>
<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
