<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 7:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>woolim</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="Gradient Able Bootstrap admin template made using Bootstrap 4. The starter version of Gradient Able is completely free for personal project." />
    <meta name="keywords" content="free dashboard template, free admin, free bootstrap template, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="codedthemes">

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

    <!--dashboard -->
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="/resources/css/dashboard/css/bootstrap/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="/resources/css/dashboard/icon/themify-icons/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/dashboard/icon/font-awesome/css/font-awesome.min.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="/resources/css/dashboard/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="/resources/css/dashboard/css/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/dashboard/css/jquery.mCustomScrollbar.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">


    <style>
        body {
            background-color: #ecf0f4 !important;
        }
        .pcoded-inner-content {
            margin-left: 300px;
        }
        .card .card-block {
            padding: 25px 25px;
        }
        .card {
            position: relative !important;
            display: -ms-flexbox !important;
            display: flex !important;
            -ms-flex-direction: column !important;
            flex-direction: column !important;
            min-width: 0 !important;
            word-wrap: break-word !important;
            background-color: #fff !important;
            background-clip: border-box !important;
            border: 1px solid rgba(0, 0, 0, .125) !important;
            border-radius: .25rem !important;
        }

        .order-card {
            color: #fff !important; }
        .order-card i {
            font-size: 26px !important; }

        .card-block {
            color: #fff;
        }
        .card-block h6,
        .card-block h2,
        .card-block p {
            color: #fff;
        }

         div.chartDiv {
             transition: box-shadow 0.3s ease-in-out;
             box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
             margin-left: 12px;
         }

        div.chartDiv:hover {
            box-shadow: 0 0 15px rgba(0, 0, 0.2, 0.3);
        }
        #sales_chart {
            margin-left: 40px;
        }

    </style>

</head>
<body>

<jsp:include page="/WEB-INF/views/admin/common/adminSidebar.jsp"/>
<div class="pcoded-inner-content">
    <div class="main-body">
        <div class="page-wrapper">

            <div class="page-body">
                <div class="row">

                    <!-- order-card start -->
                    <div class="col-md-6 col-xl-3">
                        <div class="card bg-c-blue order-card">
                            <div class="card-block">
                                <h6 class="m-b-20">총 주문수</h6>
                                <h2 class="text-right"><i class="ti-shopping-cart f-left"></i><span><fmt:formatNumber value="${totalOrders}" pattern="#,###"/>건</span></h2>
                                <p class="m-b-0"><span class="f-right">&nbsp;</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <div class="card bg-c-green order-card">
                            <div class="card-block">
                                <h6 class="m-b-20">총 매출액</h6>
                                <h2 class="text-right"><i class="ti-tag f-left"></i><span><fmt:formatNumber value="${totalSales}" pattern="#,###"/>원</span></h2>
                                <p class="m-b-0"><span class="f-right">&nbsp;</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <div class="card bg-c-yellow order-card">
                            <div class="card-block">
                                <h6 class="m-b-20">총 강의수</h6>
                                <h2 class="text-right"><i class="ti-reload f-left"></i><span><fmt:formatNumber value="${totalClass}" pattern="#,###"/>개</span></h2>
                                <p class="m-b-0"><span class="f-right">&nbsp;</span></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-xl-3">
                        <div class="card bg-c-pink order-card">
                            <div class="card-block">
                                <h6 class="m-b-20">총 회원수</h6>
                                <h2 class="text-right"><i class="ti-wallet f-left"></i><span><fmt:formatNumber value="${totalMembers}" pattern="#,###"/>명</span></h2>
                                <p class="m-b-0"><span class="f-right">&nbsp;</span></p>
                            </div>
                        </div>
                    </div>
                    <!-- order-card end -->

                    <div class="d-flex justify-content-center">
                        <div id="chart_div" class="chartDiv" style="width: 930px; height: 500px;"></div>
                        <div id="sales_chart" class="chartDiv" style="width: 930px; height: 500px;"></div>
                    </div>

        </div>
    </div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    //회원가입 수, 주문건 수 구글차트
    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['기간', '회원가입 수', '주문 건수'],
            ['이번 달', ${monthNewMembers}, ${monthOrders}],
            ['이번 주', ${weekNewMembers}, ${weekOrders}],
            ['오늘', ${todayNewMembers}, ${todayOrders}]
        ]);

        var options = {
            title: '회원가입 및 주문 건수 통계',
            curveType: 'function',
            legend: { position: 'bottom' },
            backgroundColor: '#FAFAFA', // 배경색 설정
            titleTextStyle: {
                color: '#1a237e', // 제목 색상
                fontSize: 23, // 제목 글꼴 크기
                bold: true, // 제목 굵기
            },
            hAxis: {
                title: '기간',
                titleTextStyle: {
                    color: '#3e2723',
                    italic: false
                },
                textStyle: {
                    color: '#3e2723'
                }
            },
            vAxis: {
                title: '건수',
                titleTextStyle: {
                    color: '#3e2723',
                    italic: false
                },
                textStyle: {
                    color: '#3e2723'
                }
            },
            colors: ['#e57373', '#64b5f6'], // 라인 색상
            lineWidth: 4, // 라인 두께
            pointsVisible: true, // 데이터 포인트 표시 여부
            pointSize: 6, // 데이터 포인트 크기
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

        chart.draw(data, options);


        //매출액 구글차트
        google.charts.setOnLoadCallback(drawChart2);

        function drawChart2() {
            // 차트 데이터 설정
            var data = google.visualization.arrayToDataTable([
                ['매출액', '기간'],
                ['이번달', ${monthSales}],
                ['이번주', ${weekSales}],
                ['오늘', ${todaySales}]
            ]);

            var options = {
                title: '매출액 통계',
                titleTextStyle: {
                    color: '#1a237e', // 제목의 색상 설정
                    fontSize: 23, // 제목의 폰트 크기 설정
                    bold: true // 제목을 굵게 설정
                },
                backgroundColor: '#FAFAFA', // 차트 배경색 설정
                colors: ['#9575CD', '#33AC71', '#D4E157'], // 차트 막대 색상 설정
                hAxis: {
                    title: '매출액',
                    titleTextStyle: {color: '#333'},
                    textStyle: {
                        color: '#333',
                        fontSize: 12
                    },
                    minValue: 0,
                    format: 'currency' // 가로축 값을 통화 형식으로 설정
                },
                vAxis: {
                    title: '기간',
                    titleTextStyle: {color: '#333'},
                    textStyle: {
                        color: '#333',
                        fontSize: 12
                    }
                },
                chartArea: {
                    width: '70%', // 차트 영역의 너비 설정
                    height: '70%' // 차트 영역의 높이 설정
                }
            }
            var chart = new google.visualization.BarChart(document.getElementById('sales_chart'));
            chart.draw(data, options);
        }
    }




</script>



<!-- Required Jquery -->
<script type="text/javascript" src="/resources/css/dashboard/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/css/dashboard/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/css/dashboard/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="/resources/css/dashboard/js/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="/resources/css/dashboard/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="/resources/css/dashboard/js/modernizr/modernizr.js"></script>
<!-- am chart -->
<script src="/resources/css/dashboard/pages/widget/amchart/amcharts.min.js"></script>
<script src="/resources/css/dashboard/pages/widget/amchart/serial.min.js"></script>
<!-- Chart js -->
<script type="text/javascript" src="/resources/css/dashboard/js/chart.js/Chart.js"></script>
<!-- Todo js -->
<script type="text/javascript " src="/resources/css/dashboard/pages/todo/todo.js "></script>
<!-- Custom js -->
<script type="text/javascript" src="/resources/css/dashboard/pages/dashboard/custom-dashboard.min.js"></script>
<script type="text/javascript" src="/resources/css/dashboard/js/script.js"></script>
<script type="text/javascript " src="/resources/css/dashboard/js/SmoothScroll.js"></script>
<script src="/resources/css/dashboard/js/pcoded.min.js"></script>
<script src="/resources/css/dashboard/js/vartical-demo.js"></script>
<script src="/resources/css/dashboard/js/jquery.mCustomScrollbar.concat.min.js"></script>



<script src="/resources/vendors/scripts/core.js"></script>
<script src="/resources/vendors/scripts/script.min.js"></script>
<script src="/resources/vendors/scripts/process.js"></script>
<script src="/resources/vendors/scripts/layout-settings.js"></script>
</body>
</html>
