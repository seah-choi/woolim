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

        .button-wrapper .btn span {
            font-size: 1.25rem; /* 텍스트 크기를 늘립니다 */
            padding: 0.5rem 1rem; /* 패딩을 추가하여 버튼 크기를 늘립니다 */
        }
        .button-wrapper label {
            margin-left: 50px;
            margin-top: 200px;
        }

       .image_container {
            border: 1px solid #e9ecef;
            border-radius: 5px;
            width: 355px;
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
        <form id="frmModify" method="post" action="/admin/member/view" enctype="multipart/form-data">
            <input type="hidden" name="member_idx" value="${memberList.member_idx}">
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
                                        <option value="admin" <c:if test="${memberList.member_category eq 'admin'}"> selected</c:if>>관리자</option>
                                        <option value="student" <c:if test="${memberList.member_category eq 'student'}"> selected</c:if>>학생</option>
                                        <option value="teacher" <c:if test="${memberList.member_category eq 'teacher'}"> selected</c:if>>선생님</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div id="subjectCategory">
                            <div class="d-flex align-items-start align-items-sm-center mt-4" >
                                <label class="col-sm-12 col-md-2 col-form-label fontWe-700 mb-3">담당 과목</label>
                                <div class="col-md-2 col-sm-12">
                                    <div class="form-group">
                                        <select class="selectpicker form-control" name="subject_category_code" data-size="5" data-style="btn-outline-info">
                                            <option value="s01" <c:if test="${teacherDTO.subject_category_code eq 's01'}"> selected </c:if>>국어</option>
                                            <option value="s02" <c:if test="${teacherDTO.subject_category_code eq 's02'}"> selected </c:if>>영어</option>
                                            <option value="s03" <c:if test="${teacherDTO.subject_category_code eq 's03'}"> selected </c:if>>수학</option>
                                            <option value="s07" <c:if test="${teacherDTO.subject_category_code eq 's07'}"> selected </c:if>>과학</option>
                                        </select>
                                    </div>
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

                        <div class="mt-5">
                            <div id="fileBox">
                                <div class="d-flex align-items-start align-items-sm-center gap-4">
                                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">선생님 이미지</label>
                                    <div id="image_container" class="image_container">
                                        <img src="/resources/upload/teacher/${teacherDTO.teacher_image_file}"  alt="user-avatar" class="d-block rounded"  height="400" width="350" id="preview"  />
                                    </div>

                                    <div class="button-wrapper imgBtn">
                                        <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                                            <span class="d-none d-sm-block">이미지 업로드</span>
                                            <i class="bx bx-upload d-block d-sm-none"></i>
                                            <input type="file" id="upload" name="files" class="account-file-input" hidden  accept="image/png, image/jpeg" onchange="readURL(this)" />
                                        </label>
                                        <input type="hidden" name="teacher_image_file" value="${teacherDTO.teacher_image_file}">

                                    </div>
                                </div>
                                <div class="d-flex align-items-start align-items-sm-center mt-3">
                                    <label class="col-sm-12 col-md-2 col-form-label fontWe-700">선생님 소개</label>
                                    <div class="col-sm-12 col-md-5">
                                        <textarea name="teacher_intro" class="teacher_intro" rows="10" cols="70">${teacherDTO.teacher_intro}</textarea>
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

    //프로필 사진 미리보기
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
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

    document.addEventListener('DOMContentLoaded', function () {
        var selectBox2 = document.querySelector('select[name="member_category"]');
        selectBox2.addEventListener('change', function () {
            var subjectCategory = document.getElementById('subjectCategory');
            if(this.value === 'teacher') {
                subjectCategory.style.display = 'block';
            } else {
                subjectCategory.style.display = 'none';
            }
        });
        selectBox2.dispatchEvent(new Event('change'));
    });
</script>
<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
