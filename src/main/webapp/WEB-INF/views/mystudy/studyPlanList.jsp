<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            color: #000 !important;
            text-decoration: none;
        }

        #list{
            padding: 50px;
            width: 1000px;
            padding-top: 30px;
        }

        .table{
            margin-bottom: 50px !important;
        }

        .page-item.active .page-link {
            background-color: #68afcb !important;
            color: #fff !important;
            border-color : #68afcb !important;
        }
        a {
            text-decoration: none !important;
        }

        #view {
            background: #68afcb;
            color: #fff;
        }

        #check {
            background: #68afcb;
            color: #fff;
        }

        .fc-button-primary {
            background-color: #68afcb !important;
            border-color: #68afcb !important;
        }

        .fc-unthemed td.fc-today {
            background: #bddded !important;
        }

        .fc-content {
            background: #3da4ff !important;
        }
        #btn_regist{
            border:1px solid #68afcb;
            color: #68afcb;
            margin-bottom: 10px;
        }

        #regist {
            background: #68afcb;
            color: #fff;
        }

        .date {
            width: 150px;
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
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
    <link href='/resources/fullcalendar/packages/core/main.css' rel='stylesheet' />
    <link href='/resources/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div id="box">
    <div id="leftNav">
        <nav class="nav flex-column">
            <h4>나의 학습방</h4>
            <div style="border-bottom: 1px solid #000;width: 50px;padding: 10px;"></div>
            <div style="padding-top: 20px; line-height: unset;">
                <a class="nav-link" aria-current="page" href="/mystudy/classList">나의 강의실</a>
                <a class="nav-link" href="/mystudy/freeList">내가 쓴 글</a>
                <a class="nav-link" href="/mystudy/commentList">내가 남긴 댓글</a>
                <a class="nav-link" href="/mystudy/gradeList">성적표</a>
                <a class="nav-link" href="/mystudy/studyPlanList">학습계획표</a>
            </div>
        </nav>
    </div>
    <div id="list">
        <h5 style="font-weight: bold">학습계획표</h5>
        <div>
            <img src="/resources/img/free-icon-report-card-5196199.png">
            <span>나의 학습계획표</span>
        </div>
        <hr style="border-top: 1px solid rgb(0 0 0);">
        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1" id="btn_regist">+ 학습일정 추가</button>
        <%--        성적표 모달창--%>
        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel1" style="font-weight: bold">학습일정 추가</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form name="frm" id="scheduleForm">
                        <div class="modal-body">
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a comment here" name="study_content" id="study_content"></textarea>
                                <label for="study_content">일정</label>
                            </div>
                            <br>
                            <span>기간 설정</span>
                            <div class="form-floating mb-3" style="display: flex">
                                <input type="date" class="form-control date" id="start_date" name="start_date" style="width: 180px;">
                                <span style="padding: 10px;">~</span>
                                <input type="date" class="form-control date" id="end_date" name="end_date" style="width: 180px;">
                            </div>
                        </div>
                        <div class="modal-footer" style="justify-content: center;">
                            <button type="button" class="btn" id="regist">등록</button>
                            <button type="button" class="btn btn-outline-secondary">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel2" style="font-weight: bold">학습일정 수정</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form name="frm" id="scheduleForm2">
                        <div class="modal-body">
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a comment here" name="study_content" id="study_content2"></textarea>
                                <label for="study_content">일정</label>
                            </div>
                            <br>
                            <input type="hidden" name="study_idx" id="study_idx" value="">
                            <span>기간 설정</span>
                            <div class="form-floating mb-3" style="display: flex">
                                <input type="date" class="form-control date" id="start_date2" name="start_date" style="width: 180px;">
                                <span style="padding: 10px;">~</span>
                                <input type="date" class="form-control date" id="end_date2" name="end_date" style="width: 180px;">
                            </div>
                        </div>
                        <div class="modal-footer" style="justify-content: center;">
                            <button type="button" class="btn" id="modifyBtn">수정</button>
                            <button type="button" class="btn" id="deleteBtn">삭제</button>
                            <button type="button" class="btn btn-outline-secondary">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <br>
        <div class="content">
            <div id='calendar'></div>
        </div>

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
<script src="/resources/js/popper.min.js"></script>

<script src='/resources/fullcalendar/packages/core/main.js'></script>
<script src='/resources/fullcalendar/packages/interaction/main.js'></script>
<script src='/resources/fullcalendar/packages/daygrid/main.js'></script>

<script>
    let study_idx=0;
    document.addEventListener('DOMContentLoaded', function() {
        let today = new Date();
        let year = today.getFullYear(); // 현재 연도
        let month = today.getMonth() + 1; // 월 (0부터 시작하므로 1을 더해줌)
        let day = today.getDate(); // 일

        month = month < 10 ? '0' + month : month;
        day = day < 10 ? '0' + day : day;

        let dateStr = year + '-' + month + '-' + day; // "년-월-일" 형식
        console.log(dateStr);

        var dtoList = [];
        <c:forEach var="list" items="${studyList}">
            var dto = {
                title : "${list.study_content}",
                start : "${list.start_date}",
                end : "${list.end_date}",
                customProperty : "${list.study_idx}"
            };
            dtoList.push(dto);
        </c:forEach>

        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            plugins: [ 'interaction', 'dayGrid' ],
            defaultDate: dateStr,
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            events: dtoList,
            eventClick: function(element){
                study_idx = element.event.extendedProps.customProperty;
                $('#exampleModal2').modal('show');
                document.getElementById("study_content2").value= element.event.title;
                document.getElementById("start_date2").value = formatDate(element.event.start);
                document.getElementById("end_date2").value = formatDate(element.event.end);
                document.getElementById("study_idx").value = study_idx;
            },
            eventResize: function(element) {
                console.log(element.event.title);
                console.log(formatDate(element.event.start));
                console.log(formatDate(element.event.end));
                console.log(element.event.extendedProps.customProperty);

                $.ajax({
                    url: "/events/modifyEvent",
                    method: 'post',
                    dataType : 'text',
                    data : {
                        "study_content" : element.event.title,
                        "start_date" : formatDate(element.event.start),
                        "end_date" : formatDate(element.event.end),
                        "study_idx" : element.event.extendedProps.customProperty
                    },
                    success: function (response){
                        if(response > 0){
                            var id = element.event.extendedProps.customProperty
                            calendar.getEvents().forEach(function(evt){
                                if(evt.extendedProps.customProperty == id)
                                    evt.remove();

                            });
                            calendar.addEvent({
                                title: element.event.title,
                                start: formatDate(element.event.start),
                                end: formatDate(element.event.end),
                                customProperty: response
                            });
                            $('#exampleModal2').modal('hide');
                            document.getElementById('scheduleForm2').reset();
                            calendar.render();
                        }
                        else{
                            alert("수정 실패");
                        }
                    }
                });
            },
            eventDrop: function(element) {
                $.ajax({
                    url: "/events/modifyEvent",
                    method: 'post',
                    dataType : 'text',
                    data : {
                        "study_content" : element.event.title,
                        "start_date" : formatDate(element.event.start),
                        "end_date" : formatDate(element.event.end),
                        "study_idx" : element.event.extendedProps.customProperty
                    },
                    success: function (response){
                        if(response > 0){
                            var id = element.event.extendedProps.customProperty
                            calendar.getEvents().forEach(function(evt){
                                if(evt.extendedProps.customProperty == id)
                                    evt.remove();

                            });
                            calendar.addEvent({
                                title: element.event.title,
                                start: formatDate(element.event.start),
                                end: formatDate(element.event.end),
                                customProperty: response
                            });
                            $('#exampleModal2').modal('hide');
                            document.getElementById('scheduleForm2').reset();
                            calendar.render();
                        }
                        else{
                            alert("수정 실패");
                        }
                    }
                });
            }
        });

        calendar.render();

        let deleteBtn = document.getElementById("deleteBtn");
        deleteBtn.addEventListener("click", function(e){
            $.ajax({
                url: "/events/deleteEvent",
                method: 'get',
                dataType : 'text',
                data : {
                    "study_idx" : study_idx
                },
                success: function (response){
                    if(response == 1){
                        alert("삭제 성공");
                        var id = document.getElementById("study_idx").value
                        calendar.getEvents().forEach(function(evt){
                            if(evt.extendedProps.customProperty == id)
                                evt.remove();
                        });
                        $('#exampleModal2').modal('hide');
                        document.getElementById('scheduleForm2').reset();
                        calendar.render();
                    }
                    else{
                        alert("삭제 실패");
                    }
                }
            })
        });
        document.getElementById("modifyBtn").addEventListener("click",function(e){
            e.preventDefault();
            $.ajax({
                url: "/events/modifyEvent",
                method: 'post',
                dataType : 'text',
                data : {
                    "study_content" : document.getElementById("study_content2").value,
                    "start_date" : document.getElementById("start_date2").value,
                    "end_date" : document.getElementById("end_date2").value,
                    "study_idx" : study_idx
                },
                success: function (response){
                    if(response > 0){
                        var id = document.getElementById("study_idx").value
                        calendar.getEvents().forEach(function(evt){
                            if(evt.extendedProps.customProperty == id)
                                evt.remove();
                        });
                        calendar.addEvent({
                            title: document.getElementById("study_content2").value,
                            start: document.getElementById("start_date2").value,
                            end: document.getElementById("end_date2").value,
                            customProperty: response
                        });
                        $('#exampleModal2').modal('hide');
                        document.getElementById('scheduleForm2').reset();
                        calendar.render();
                    }
                    else{
                        alert("수정 실패");
                    }
                }
            });
        });
        document.querySelector("#regist").addEventListener("click", function (){
            let study_content = document.getElementById("study_content").value;
            let start_date = document.getElementById("start_date").value;
            let end_date = document.getElementById("end_date").value || start;
            console.log(study_content);
            console.log(start_date);
            console.log(end_date);
            if(start_date > end_date){
                alert("일정을 다시 확인해주세요");
                return;
            }
            if(study_content && start_date){
                $.ajax({
                    url: "/events/addEvent",
                    method: 'post',
                    dataType : 'text',
                    data : {
                        "study_content" : study_content,
                        "start_date" : start_date,
                        "end_date" : end_date
                    },
                    success: function (response){
                        if(response >0){
                            alert("등록 성공");
                            calendar.addEvent({
                                title: study_content,
                                start: start_date,
                                end: end_date,
                                customProperty: response
                            });
                            $('#exampleModal1').modal('hide');
                            document.getElementById('scheduleForm').reset();
                        }
                        else{
                            alert("추가 실패");
                        }
                    }
                });
            } else {
                alert("일정과 시작 날짜는 필수입니다.");
            }
        });
    });
    function formatDate(dateString) {
        // 주어진 날짜 문자열을 Date 객체로 변환
        const date = new Date(dateString);

        // 년, 월, 일 추출
        const year = date.getFullYear();
        const month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더하고, 2자리로 맞춤
        const day = ('0' + date.getDate()).slice(-2); // 일도 2자리로 맞춤

        // 'yyyy-mm-dd' 형식으로 포맷팅
        return year+'-'+month+'-'+day;
    }

</script>

<script src="/resources/js/main.js"></script>
</body>
</html>




