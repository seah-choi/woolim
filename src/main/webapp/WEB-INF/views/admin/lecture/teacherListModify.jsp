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
            margin-right: 400px;
            margin-left: 20px;
            padding-bottom: 100px;
        }
    </style>

</head>
<body>

<div class="main-container">
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="min-height-200px">

            <!-- basic table  Start -->
            <div class="pd-20 card-box mb-30">
                <h4 class="h4">회원 목록</h4>
                <br>
                <form id="frm" name="frm" action="/admin/lecture/selectTeacher" method="post">
                    <input type="hidden" class="lecture_idx" id="lecture_idx" name="lecture_idx"value="${lecture_idx}"/>

                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>선택</th>
                            <th>NO.</th>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>회원 구분</th>
                            <th>가입일</th>
                            <th>탈퇴 여부</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="list">
                            <tr>
                                <td>
                                    <input type="radio" name="selectedMember" value="${list.member_idx}">
                                </td>
                                <td>${list.member_idx}</td>
                                <td>${list.member_name}</td>
                                <td>${list.member_id}</td>
                                <td style="width: 130px">
                                    <select name="member_type" class="selectpicker form-control grade" data-size="5" data-style="btn-outline-info">
                                        <c:if test="${list.member_category eq 'admin'}">
                                            <option value="admin">관리자</option>
                                            <option value="student">학생</option>
                                            <option value="teacher">선생님</option>
                                        </c:if>
                                        <c:if test="${list.member_category eq 'student'}">
                                            <option value="student">학생</option>
                                            <option value="teacher">선생님</option>
                                            <option value="admin">관리자</option>
                                        </c:if>
                                        <c:if test="${list.member_category eq 'teacher'}">
                                            <option value="teacher">선생님</option>
                                            <option value="student">학생</option>
                                            <option value="admin">관리자</option>
                                        </c:if>
                                    </select>
                                </td>
                                <td>${list.member_reg_date}</td>
                                <td>${list.member_status}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <input type="hidden" id="selectedMemberId" name="selectedMemberId" value="">
                    <input type="hidden" id="selectedMemberName" name="selectedMemberName" value="">
                    <button type="button" id="submitBtn" class="btn btn-primary" style="width: 100px; height: 50px; float: right;">선택</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- js -->
<script>
    document.querySelector("#submitBtn").addEventListener("click", function (e) {
        e.preventDefault();
        const selectedRadio = document.querySelector('input[name="selectedMember"]:checked');

        if (selectedRadio) {
            const member_name = selectedRadio.closest('tr').querySelector('td:nth-child(3)').innerText;
            const member_id = selectedRadio.closest('tr').querySelector('td:nth-child(4)').innerText;

            document.querySelector("#selectedMemberId").value = member_id;
            document.querySelector("#selectedMemberName").value = member_name;
            console.log("###" + member_name);
            console.log("###" + member_id);
            frm.method= "get";
            frm.action = '/admin/lecture/teacherChoiceModify'
            frm.submit();
        } else {
            alert("회원을 선택하세요.");
        }
    });
</script>

<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
