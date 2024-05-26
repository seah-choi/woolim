<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

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
    <style>
        .result{
            color:red;
            display: none;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:if test="${param.modifyOK == '1'}">
    <script>
        alert("개인정보가 수정되었습니다.");
    </script>
</c:if>
<c:if test="${param.modifyOK == '0'}">
    <script>
        alert("개인정보 수정 실패.");
    </script>
</c:if>
<section class="product-shop spad">
    <div class="container">
        <div class="row">
            <jsp:include page="/WEB-INF/views/common/mypageSide.jsp"/>
            <div class="col-lg-9 order-1 order-lg-2">
                <h5 style="font-weight: bold">회원 정보</h5>
                <hr>
                <div class="register-form">
                    <form id="frm" action="/mypage/view" method="post">
                        <input type="hidden" name="member_idx" value="${memberDTO.member_idx}">
                        <label for="member_id">아이디</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="member_id" id="member_id" value="${memberDTO.member_id}" readonly>
                        </div>
                        <br>
                        <label for="member_pwd">비밀번호</label>
                        <div class="input-group">
                            <input name="member_pwd" class="form-control" data-change = "N" data-orgPwd = "${memberDTO.member_pwd}" type="password" id="member_pwd" placeholder="비밀번호 변경 시에만 입력해주세요." <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>
                        </div>
                        <div class="result">영어 대소문자, 숫자, 특수 문자를 포함한 8자리~20자리로 입력해주세요</div>
                        <br>
                        <label for="member_pwd2">비밀번호 확인</label>
                        <div class="input-group">
                            <input type="password" disabled class="form-control" id="member_pwd2" name="member_pwd2" <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>
                        </div>
                        <div class="result">비밀번호가 일치하지 않습니다.</div>
                        <br>
                        <label for="member_name">이름</label>
                        <div class="input-group">
                            <input name="member_name" class="form-control" type="text" id="member_name" value="${memberDTO.member_name}" readonly>
                        </div>
                        <br>
                        <label for="member_email">이메일</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" data-change = "N" data-emailCheck="N" data-orgEmail="${memberDTO.member_email}@${memberDTO.member_email_addr}" name="member_email1" id="member_email1" value="${memberDTO.member_email}@${memberDTO.member_email_addr}" <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>
                            <input type="hidden" id="member_email" name="member_email">
                            <input type="hidden" id="member_email_addr" name="member_email_addr">
                            <button class="btn btn-outline-info" onclick="emailCheck(document.getElementById('member_email1').value, event)" <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>email 중복 확인</button>
                        </div>
                        <div class="result">이메일주소를 확인해주세요.</div>
                        <label for="member_phone">핸드폰</label>
                        <div class="input-group">
                            <input type="text" class="form-control" data-change = "N" id="member_phone" name="member_phone" value="${memberDTO.member_phone}">
                        </div>
                        <div class="result">핸드폰 번호를 확인해주세요.(-없이 숫자만 입력해주세요)</div>
                        <br>
                        <div class="group-input">
                            <label>주소</label>
                            <div>
                                <div class="mb-3">
                                    <div class="input-group">
                                        <input type="text" name="member_zonecode" style="border: 1px solid #ced4da; width: 373px" data-name="우편번호" readonly class="form-control" placeholder="우편번호" value="${memberDTO.member_zonecode}" id="sample4_postcode" aria-label="Recipient's username" aria-describedby="button-addon2"  onclick="sample4_execDaumPostcode()">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-info"  type="button" id="button-addon2" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
                                        </div>
                                    </div>
                                    <small id="err_zip_code" class="info text-danger"></small>
                                </div>
                                <div class="input-group">
                                    <input type="text" class="form-control" style="border: 1px solid #ced4da;" data-name="주소" readonly name="member_addr" value="${memberDTO.member_addr}" id="sample4_roadAddress" placeholder="도로명주소">
                                    <small id="err_addr1" class="info text-danger"></small>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="member_addr_detail" class="form-control" style="border: 1px solid #ced4da;" id="member_addr_detail" data-name="member_addr_detail" placeholder="상세주소" value="${memberDTO.member_addr_detail}">
                                    <small id="err_addr2" class="info text-danger"></small>
                                </div>
                                <span id="guide" style="color:#999;display:none"></span>
                            </div>
                        </div>
                        <input type="hidden" name="member_oauth" id="member_oauth" value="${memberDTO.member_oauth}">
                        <input type="hidden" name="social_flag" value="<c:if test="${memberDTO.member_oauth == null}">0</c:if><c:if test="${memberDTO.member_oauth != null}">1</c:if>">
                        <button type="submit" class="btn site-btn register-btn" id="regist" disabled>회원 정보 수정</button>
                    </form>
                    <div class="switch-login">
                        <a href="/member/leave?member_id=${sessionScope.user_id}" class="or-login">회원 탈퇴</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    let member_pwd = document.getElementById("member_pwd");
    let member_pwd2 = document.getElementById("member_pwd2");
    let member_email = document.getElementById("member_email1");
    let member_phone = document.getElementById("member_phone");
    let errMsg = document.querySelectorAll(".result");
    let frm = document.getElementById("frm");
    let pwd_reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
    let email_reg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    let tel_reg = /^[0-9]{10,11}$/;

    member_pwd.addEventListener("keyup",function(e){
        this.setAttribute("data-change","Y");
        document.getElementById("regist").disabled = false;
        document.getElementById("regist").style.backgroundColor = "#68afcb";
        member_pwd2.disabled = false;
        if(!pwd_reg.test(this.value)){
            errMsg[0].style.display = "block";
        }
        else
            errMsg[0].style.display = "none";

        if(this.value != member_pwd2.value){
            errMsg[1].style.display = "block";
        }
        else{
            errMsg[1].style.display = "none";
        }
    });
    member_pwd2.addEventListener("keyup",function(e){
        document.getElementById("regist").disabled = false;
        document.getElementById("regist").style.backgroundColor = "#68afcb";
        if(this.value != member_pwd.value){
            errMsg[1].style.display = "block";
        }
        else
            errMsg[1].style.display = "none";
    });
    member_email.addEventListener("keyup",function(e){
        this.setAttribute('data-change',"Y");
        this.setAttribute('data-emailCheck',"N");
        document.getElementById("regist").disabled = false;
        document.getElementById("regist").style.backgroundColor = "#68afcb";
        if(!email_reg.test(this.value)){
            errMsg[2].style.display = "block";
        }
        else
            errMsg[2].style.display = "none";
    });
    member_phone.addEventListener("keyup",function(e){
        document.getElementById("regist").disabled = false;
        document.getElementById("regist").style.backgroundColor = "#68afcb";
        if(!tel_reg.test(this.value)){
            errMsg[3].style.display = "block";
        }
        else
            errMsg[3].style.display = "none";
    });

    document.getElementById("regist").addEventListener("click", function (e){
        e.preventDefault();
        if(member_pwd.disabled == false) {
            if (member_pwd.getAttribute("data-change") == "Y" && !nullCheck(member_pwd)) {
                alert("비밀번호를 확인해주세요");
                return;
            }
            if (errMsg[0].style.display == "block") {
                alert("비밀번호를 확인해주세요");
                return;
            }
            if (errMsg[1].style.display == "block") {
                alert("비밀번호를 확인해주세요");
                return;
            }
            if (member_pwd.getAttribute("data-orgPwd") == member_pwd.value) {
                alert("이전 비밀번호랑 동일하게 수정할 수 없습니다.");
                return;
            }
            if (member_email.getAttribute("data-change") == "Y" && !nullCheck(member_email)) {
                alert("이메일을 확인해주세요");
                return;
            }
            if (errMsg[2].style.display == "block") {
                alert("이메일을 확인해주세요");
                return;
            }
            if (member_phone.getAttribute("data-change") == "Y" && !nullCheck(member_phone)) {
                alert("핸드폰번호를 확인해주세요");
                return;
            }
            if (errMsg[3].style.display == "block") {
                alert("핸드폰번호를 확인해주세요");
                return;
            }
            if (member_email.getAttribute("data-change") == "Y" && member_email.getAttribute("data-emailCheck") == "N") {
                if (member_email.getAttribute("data-orgEmail") != member_email.value) {
                    alert("이메일 중복 검사를 진행해주세요");
                    return;
                }
            }
            let member_email2 = document.getElementById("member_email");
            member_email2.value = member_email.value.split('@')[0];
            let member_email_addr = document.getElementById("member_email_addr");
            member_email_addr.value = member_email.value.split('@')[1];
            alert("수정 진행");
            if (member_pwd.getAttribute("data-change") == "N") {
                member_pwd.value = member_pwd.getAttribute("data-orgPwd");
            }
        }
        else{
            if (member_phone.getAttribute("data-change") == "Y" && !nullCheck(member_phone)) {
                alert("핸드폰번호를 확인해주세요");
                return;
            }
            if (errMsg[3].style.display == "block") {
                alert("핸드폰번호를 확인해주세요");
                return;
            }
        }
        frm.submit();

    });

    // document.addEventListener("DOMContentLoaded", function () {
    //     const pwd1 = document.querySelector("#member_pwd");
    //     const pwd2 = document.querySelector("#member_pwd2");
    //     const result = document.querySelector("#result2");
    //
    //     function checkPasswords() {
    //         const member_pwd = pwd1.value;
    //         const member_pwd2 = pwd2.value;
    //
    //         if (member_pwd === member_pwd2) {
    //             result.innerHTML = "비밀번호가 일치합니다.";
    //             result.style.color = "green";
    //         } else {
    //             result.innerHTML = "비밀번호가 동일하지 않습니다.";
    //             result.style.color = "red";
    //         }
    //     }
    //
    //     pwd1.addEventListener("keyup", checkPasswords);
    //     pwd2.addEventListener("keyup", checkPasswords);
    // });
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("member_addr_detail").value="";
                document.getElementById("regist").disabled = false;
                document.getElementById("regist").style.backgroundColor = "#68afcb";

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    function emailCheck(str, event){
        event.preventDefault();
        console.log(str);
        if(member_email.getAttribute("data-change")=="N"){
            alert("이메일 변경을 먼저 진행해주세요");
            return;
        }
        if(member_email.value == member_email.getAttribute("data-orgEmail")){
            alert("이메일 변경을 먼저 진행해주세요");
            return;
        }
        if(errMsg[2].style.display==="block" || !nullCheck(member_email)){
            alert("이메일주소를 확인해주세요.");
            return;
        } else {
            console.log(2);
        }

        console.log(str);
        $.ajax({
            url: "/member/emailCheck",
            method: 'get',
            dataType : 'text',
            data : {
                "member_email" : str
            },
            success: function (response){
                console.log(response);
                if(response == 1){
                    alert("중복된 이메일 입니다.");
                }
                else{
                    alert("사용가능한 이메일 입니다.");
                    member_email.setAttribute('data-emailCheck',"Y");
                }
            }
        })
    }
    function nullCheck(str) {
        if ($(str).val()) {
            if($(str).val().indexOf(" ") < 0) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
</script>
</body>
</html>
