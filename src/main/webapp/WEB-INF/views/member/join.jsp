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
                                <input type="text" class="form-control" name="member_id" id="member_id">
                            </div>
                            <br>
                            <label for="member_pwd">비밀번호 *</label>
                            <div class="input-group">
                                <input name="member_pwd" class="form-control" type="text" id="member_pwd">
                            </div>
                            <br>
                            <label for="member_pwd2">비밀번호 확인 *</label>
                            <div class="input-group">
                                <input type="text"  class="form-control" id="member_pwd2" name="member_pwd2">
                            </div>
                            <br>
                            <label for="member_name">이름 *</label>
                            <div class="input-group">
                                <input name="member_name" class="form-control" type="text" id="member_name">
                            </div>
                            <br>
                            <label for="member_email">이메일 *</label>
                            <div class="input-group mb-3">
                                <input type="text" class="form-control"  name="member_email" id="member_email">
                                &nbsp;&nbsp;
                                <label> @ </label>
                                &nbsp;&nbsp;
                                <select class="form-control" name="member_email_addr">
                                    <option>naver.com</option>
                                    <option>daum.net</option>
                                    <option>gmail.com</option>
                                    <option>hanmail.net</option>
                                </select>
                            </div>
                            <label for="member_phone2">핸드폰 *</label>
                            <input type="hidden" name="member_phone" id="member_phone">
                            <div class="input-group">
                                <input type="text" class="form-control" id="member_phone1" name="member_phone1">
                                &nbsp;&nbsp;
                                <span>-</span>
                                &nbsp;&nbsp;
                                <input type="text" class="form-control" id="member_phone2" name="member_phone2">
                                &nbsp;&nbsp;
                                <span>-</span>
                                &nbsp;&nbsp;
                                <input type="text" class="form-control" id="member_phone3" name="member_phone3">
                            </div>
                            <br>
                            <div class="group-input">
                                <label>주소</label>
                                <div>
                                    <div class="mb-3">
                                        <div class="input-group mb-3">
                                            <input type="text" name="member_zonecode" style="border: 1px solid #ced4da;width: 390px" data-name="우편번호" class="form-control" placeholder="우편번호" value="" id="sample4_postcode" aria-label="Recipient's username" aria-describedby="button-addon2"  onclick="sample4_execDaumPostcode()">
                                            <button class="btn btn-outline-info"  type="button" id="button-addon2" onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
                                        </div>
                                        <small id="err_zip_code" class="info text-danger"></small>
                                    </div>
                                    <div class="input-group">
                                        <input type="text" name="member_addr" class="form-control" style="border: 1px solid #ced4da;" data-name="주소" value="" id="sample4_roadAddress" placeholder="도로명주소">
                                        <small id="err_addr1" class="info text-danger"></small>
                                    </div>
                                    <div class="input-group">
                                        <input type="text" name="member_addr_detail" class="form-control" style="border: 1px solid #ced4da;" id="" placeholder="상세주소">
                                        <small id="err_addr2" class="info text-danger"></small>
                                    </div>
                                    <span id="guide" style="color:#999;display:none"></span>
                                </div>
                            </div>
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

           let member_phone1 = document.getElementById("member_phone1");
           let member_phone2 = document.getElementById("member_phone2");
           let member_phone3 = document.getElementById("member_phone3");

           let member_phone = document.getElementById("member_phone");
           member_phone.value = member_phone1.value + member_phone2.value + member_phone3.value;

           let frmJoin = document.getElementById("frmJoin");
           frmJoin.submit();
        });
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
