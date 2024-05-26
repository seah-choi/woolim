<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 5:22
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
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <div class="register-login-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="register-form">
                        <h2>회원가입</h2>
                        <form action="/member/join" method="post" id="frmJoin">
                            <label for="member_id">아이디 *</label>
                            <div class="input-group">
                                <input type="text" data-name="아이디" class="form-control" name="member_id" data-idCheck="N" id="member_id" value="<c:if test="${memberDTO.member_oauth != null}">소셜로그인으로 진행한 회원입니다.</c:if>"
                                       <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>
                                <button id="id_check" class="btn btn-outline-info" onclick="idCheck(document.getElementById('member_id').value, event)" <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>id 중복 확인</button>
                            </div>
                            <small id="err_member_id" class="info text-danger err-text" style="display: none">영문 소문자, 숫자를 포함한 8자리~20자리로 입력해주세요</small>
                            <br><br>
                            <label for="member_pwd">비밀번호 *</label>
                            <div class="input-group">
                                <input type="password" name="member_pwd" data-name="비밀번호" class="form-control" id="member_pwd" value="" <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>
                            </div>
                            <small id="err_member_pwd" class="info text-danger err-text" style="display: none">영어 대소문자, 숫자, 특수 문자를 포함한 8자리~20자리로 입력해주세요</small>
                            <br><br>
                            <label for="member_pwd2">비밀번호 확인 *</label>
                            <div class="input-group">
                                <input type="password" data-name="비밀번호" class="form-control" id="member_pwd2" name="member_pwd2" <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>
                            </div>
                            <small id="err_member_pwd2" class="info text-danger err-text" style="display: none">비밀번호가 일치하지 않습니다.</small>
                            <br><br>
                            <label for="member_name">이름 *</label>
                            <div class="input-group">
                                <input name="member_name" data-name="이름" class="form-control" type="text" id="member_name" value="${memberDTO.member_name}" <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>
                            </div>
                            <small id="err_member_name" class="info text-danger err-text" style="display: none">이름은 한글로 2자리~20자리로 입력해주세요</small>
                            <br><br>
                            <label for="member_email">이메일 *</label>
                            <div class="input-group">
                                <input type="text" data-name="이메일" data-emailCheck="N" class="form-control" id="member_email1" value="<c:if test="${memberDTO.member_oauth != null}">${memberDTO.member_email}@${memberDTO.member_email_addr}</c:if>" <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>
                                <input type="hidden" id="member_email" name="member_email">
                                <input type="hidden" id="member_email_addr" name="member_email_addr">
                                <button class="btn btn-outline-info" onclick="emailCheck(document.getElementById('member_email1').value, event)" <c:if test="${memberDTO.member_oauth != null}">disabled</c:if>>email 중복 확인</button>
                            </div>
                            <small id="err_member_email" class="info text-danger err-text" style="display: none">이메일주소를 확인해주세요.</small>
                            <br><br>
                            <label for="member_phone">핸드폰 *</label>
                            <div class="input-group">
                                <input type="text" data-name="핸드폰 번호" class="form-control" name="member_phone" id="member_phone">
                            </div>
                            <small id="err_member_phone" class="info text-danger err-text" style="display: none">핸드폰 번호를 확인해주세요.(-없이 숫자만 입력해주세요)</small>
                            <br><br>
                            <div class="group-input">
                                <label>주소</label>
                                <div>
                                    <div class="mb-3">
                                        <div class="input-group mb-3">
                                            <input type="text" data-name="주소" name="member_zonecode" style="border: 1px solid #ced4da;width: 390px" readonly data-name="우편번호" class="form-control" placeholder="우편번호" value="" id="sample4_postcode" aria-label="Recipient's username" aria-describedby="button-addon2"  onclick="sample4_execDaumPostcode()">
                                            <button class="btn btn-outline-info"  type="button" id="button-addon2" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
                                        </div>
                                        <small id="err_zip_code" class="info text-danger"></small>
                                    </div>
                                    <div class="input-group">
                                        <input type="text" name="member_addr" class="form-control" style="border: 1px solid #ced4da;" readonly data-name="주소" value="" id="sample4_roadAddress" placeholder="도로명주소">
                                        <small id="err_addr1" class="info text-danger"></small>
                                    </div>
                                    <div class="input-group">
                                        <input type="text" name="member_addr_detail" class="form-control" style="border: 1px solid #ced4da;" id="" placeholder="상세주소">
                                        <small id="err_addr2" class="info text-danger"></small>
                                    </div>
                                    <span id="guide" style="color:#999;display:none"></span>
                                </div>
                                <small id="err_member_addr" class="info text-danger err-text"  style="display: none">주소를 입력해주세요.</small>
                            </div>
                            <input type="hidden" id="social_flag" name="flag" value="<c:if test="${memberDTO.member_oauth != null}">1</c:if><c:if test="${memberDTO.member_oauth == null}">0</c:if>">
                            <input type="hidden" name="member_category" value="student">
                            <button type="submit" id="btnJoin" class="site-btn register-btn">회원가입</button>
                        </form>
                        <div class="switch-login">
                            <a href="/login/login" class="or-login">로그인</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        let inputEl = document.getElementsByClassName("form-control");
        let errMsg = document.getElementsByClassName("err-text");
        let id_reg = /^(?=.*[a-z])(?=.*\d)[a-z\d]{8,20}$/;
        let pwd_reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
        let name_reg = /^[가-힣]{2,20}$/;
        let tel_reg = /^[0-9]{10,11}$/;
        let email_reg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;


        //아이디 유효성
        inputEl[0].addEventListener("keyup",function(e){
            this.setAttribute('data-idCheck',"N");
            if(!id_reg.test(this.value)){
                errMsg[0].style.display = "block";
            }
            else
                errMsg[0].style.display = "none";
        });
        //비밀번호 유효성
        inputEl[1].addEventListener("keyup",function(e){
            if(!pwd_reg.test(this.value)){
                errMsg[1].style.display = "block";
            }
            else
                errMsg[1].style.display = "none";

            if(this.value != inputEl[2].value){
                errMsg[2].style.display = "block";
            }
            else{
                errMsg[2].style.display = "none";
            }
        });
        //비밀번호 확인
        inputEl[2].addEventListener("keyup",function(e){
            if(this.value != inputEl[1].value){
                errMsg[2].style.display = "block";
            }
            else
                errMsg[2].style.display = "none";
        });
        //이름 유효성
        inputEl[3].addEventListener("keyup",function(e){
            if(!name_reg.test(this.value)){
                errMsg[3].style.display = "block";
            }
            else
                errMsg[3].style.display = "none";
        });
        //이메일 유효성
        inputEl[4].addEventListener("keyup",function(e){
            this.setAttribute('data-emailCheck',"N");
            if(!email_reg.test(this.value)){
                errMsg[4].style.display = "block";
            }
            else
                errMsg[4].style.display = "none";
        });
        //전화번호 유효성
        inputEl[5].addEventListener("keyup",function(e){
            if(!tel_reg.test(this.value)){
                errMsg[5].style.display = "block";
            }
            else
                errMsg[5].style.display = "none";
        });
        function idCheck(str, event){
            event.preventDefault();
            if(errMsg[0].style.display==="block"|| !nullCheck(inputEl[0])){
                alert("영문 소문자, 숫자를 포함한 8자리~20자리로 입력해주세요.");
                return;
            }else {
                console.log(2);
            }
            console.log(str);
            $.ajax({
                url: "/member/idCheck",
                method: 'get',
                dataType : 'text',
                data : {
                    "member_id" : str
                },
                success: function (response){
                    console.log(response);
                    if(response == 1){
                        alert("중복된 아이디 입니다.");
                    }
                    else{
                        alert("사용가능한 아이디 입니다.");
                        inputEl[0].setAttribute('data-idCheck',"Y");
                    }
                }
            })
        }
        function emailCheck(str, event){
            event.preventDefault();
            console.log(str);
            if(errMsg[4].style.display==="block" || !nullCheck(inputEl[4])){
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
                        inputEl[4].setAttribute('data-emailCheck',"Y");
                    }
                }
            })
        }



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

        let btnJoin = document.getElementById("btnJoin");
        btnJoin.addEventListener("click", function(e){
           e.preventDefault();
           let social_flag = document.getElementById("social_flag");
           if(social_flag==0) {

               //공백 체크
               for (let i = 0; i <= 6; i++) {
                   if (!nullCheck(inputEl[i])) {
                       alert("모든 항목은 필수사항입니다.");
                       console.log("err : " + i);
                       return;
                   }
               }
               for (let i = 0; i <= 6; i++) {
                   if (errMsg[i].style.display === "block") {
                       alert(inputEl[i].getAttribute('data-name') + '을(를) 확인해주세요');
                       return;
                   }
               }
               if (inputEl[0].getAttribute("data-idCheck") == 'N') {
                   alert("아이디 중복 확인을 진행해주세요");
                   return;
               }
               if (inputEl[4].getAttribute("data-emailCheck") == 'N') {
                   alert("이메일 중복 확인을 진행해주세요");
                   return;
               }

               let member_email = document.getElementById("member_email");
               member_email.value = inputEl[4].value.split('@')[0];
               let member_email_addr = document.getElementById("member_email_addr");
               member_email_addr.value = inputEl[4].value.split('@')[1];
           }
           else{
               for (let i = 5; i <= 6; i++) {
                   if (!nullCheck(inputEl[i])) {
                       alert(inputEl[i].getAttribute('data-name') + '을(를) 확인해주세요');
                       console.log("err : " + i);
                       return;
                   }
               }
               for (let i = 5; i <= 6; i++) {
                   if (errMsg[i].style.display === "block") {
                       alert(inputEl[i].getAttribute('data-name') + '을(를) 확인해주세요');
                       return;
                   }
               }

           }

            let frmJoin = document.getElementById("frmJoin");
            frmJoin.submit();
        });
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
        // 전부 공란인것만 체크
        function nullCheck2(str) {
            if ($(str).val()) {
                if($(str).val().trim()) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
    </script>
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
</body>
</html>
