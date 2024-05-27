<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video with Accordion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://vjs.zencdn.net/7.11.4/video-js.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }
        .video-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 20px;
        }
        .video-js {
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .accordion {
            width: 500px;
        }
        .accordion-button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .accordion-button:not(.collapsed) {
            background-color: #0056b3;
        }
        .accordion-body {
            background-color: #f1f1f1;
            border: 1px solid #ddd;
            border-top: none;
        }
        .accordion-body a {
            display: block;
            padding: 8px 16px;
            color: #007bff;
            text-decoration: none;
            transition: background-color 0.2s, color 0.2s;
        }
        .accordion-body a:hover {
            background-color: #007bff;
            color: white;
        }
        .controls-container {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .controls-container button {
            margin: 5px;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .controls-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="video-container">
    <video
            id="my-video"
            class="video-js"
            controls
            preload="auto"
            width="854"
            height="480"
            poster="http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg"
            data-setup="{}"
    >
        <source src="/resources/img/video/${list[0].video_file}" type="video/mp4"/>
        <p class="vjs-no-js">
            To view this video please enable JavaScript, and consider upgrading to a
            web browser that
            <a href="https://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
        </p>
    </video>

    <div class="accordion" id="accordionPanelsStayOpenExample">
        <div class="accordion-item">
            <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne"
                style="color: #fff;">
                    ${list[0].video_content}
                </button>
            </h2>
            <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                <div class="accordion-body">
                    <c:forEach items="${list}" var="list" varStatus="status">

                        <div><a href="#" class="video-link" data-index="${status.index}">${list.video_file}</a></div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="controls-container">
    <button id="audio-only-btn">오디오만 재생</button>
    <p>재생속도: <span id="playback-speed">1</span></p>
    <div>
        <button id="speed-0.25-btn">0.25</button>
        <button id="speed-0.5-btn">0.5</button>
        <button id="speed-0.75-btn">0.75</button>
        <button id="speed-normal-btn">1(기본)</button>
        <button id="speed-1.25-btn">1.25</button>
        <button id="speed-1.5-btn">1.5</button>
        <button id="speed-1.75-btn">1.75</button>
        <button id="speed-2-btn">2</button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://vjs.zencdn.net/7.11.4/video.min.js"></script>
<script>
    const video = document.getElementById('my-video');

    video.addEventListener('play', (event) => {
        console.log('play');
    });
    video.addEventListener('pause', (event) => {
        console.log('pause');
    });
    video.addEventListener('ended', (event) => {
        console.log('ended');
    });

    const player = videojs('my-video');


    const audioOnlyBtn = document.getElementById("audio-only-btn");
    audioOnlyBtn.addEventListener('click', function handleClick() {
        console.log('audio-only-btn-click');
        console.log('player.audioOnlyMode(): ' + player.audioOnlyMode());

        // 오디오만 재생 모드가 true 일 경우
        if (player.audioOnlyMode()) {
            player.audioOnlyMode(false); // 오디오만 재생 모드를 false 로 바꾸고
            audioOnlyBtn.textContent = '오디오만 재생'; // 버튼 이름 변경
        } else {
            player.audioOnlyMode(true); // 오디오만 재생 모드를 true 로 바꾸고
            audioOnlyBtn.textContent = '비디오도 재생'; // 버튼 이름 변경
        }

    });

    // 재생속도를 표시하는 <span> 요소
    const speed = document.getElementById('playback-speed');

    // 재생속도를 0.25로 바꾸는 버튼
    const speedBtn1 = document.getElementById("speed-0.25-btn");
    speedBtn1.addEventListener('click', function handleClick() { // 버튼에 클릭 리스너 달기
        console.log('speed-0.25-btn-click');
        video.playbackRate = 0.25; // 영상의 재생속도 변경
        speed.innerHTML = '0.25'; // 재생속도 html에 표시
    });

    // 재생속도를 0.5로 바꾸는 버튼
    const speedBtn2 = document.getElementById("speed-0.5-btn");
    speedBtn2.addEventListener('click', function handleClick() {
        console.log('speed-0.5-btn-click');
        video.playbackRate = 0.5;
        speed.innerHTML = '0.5';
    });

    // 재생속도를 0.75로 바꾸는 버튼
    const speedBtn3 = document.getElementById("speed-0.75-btn");
    speedBtn3.addEventListener('click', function handleClick() {
        console.log('speed-0.75-btn-click');
        video.playbackRate = 0.75;
        speed.innerHTML = '0.75';
    });

    // 재생속도를 기본(1)으로 설정하는 버튼
    const speedBtn4 = document.getElementById("speed-normal-btn");
    speedBtn4.addEventListener('click', function handleClick() {
        console.log('speed-normal-btn-click');
        video.playbackRate = 1;
        speed.innerHTML = '1';
    });

    // 재생속도를 1.25로 바꾸는 버튼
    const speedBtn5 = document.getElementById("speed-1.25-btn");
    speedBtn5.addEventListener('click', function handleClick() {
        console.log('speed-1.25-btn-click');
        video.playbackRate = 1.25;
        speed.innerHTML = '1.25';
    });

    // 재생속도를 1.5로 바꾸는 버튼
    const speedBtn6 = document.getElementById("speed-1.5-btn");
    speedBtn6.addEventListener('click', function handleClick() {
        console.log('speed-1.5-btn-click');
        video.playbackRate = 1.5;
        speed.innerHTML = '1.5';
    });

    // 재생속도를 1.75로 바꾸는 버튼
    const speedBtn7 = document.getElementById("speed-1.75-btn");
    speedBtn7.addEventListener('click', function handleClick() {
        console.log('speed-1.75-btn-click');
        video.playbackRate = 1.75;
        speed.innerHTML = '1.75';
    });

    // 재생속도를 2로 바꾸는 버튼
    const speedBtn8 = document.getElementById("speed-2-btn");
    speedBtn8.addEventListener('click', function handleClick() {
        console.log('speed-2-btn-click');
        video.playbackRate = 2;
        speed.innerHTML = '2';
    });
    const videoLinks = document.querySelectorAll('.video-link');
    const videoPlayer = document.getElementById('my-video');
    let videoFiles = []; // JavaScript 배열 선언


    window.onload = function() {
        <c:forEach items="${list}" var="list" varStatus="status">

        videoFiles.push("${list.video_file}");
        </c:forEach>


        console.log(videoFiles);
    };

    videoLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            const index = this.getAttribute('data-index');
            console.log("index" + index);

            const source = videoPlayer.querySelector('.vjs-tech');
            if (!source) {
                console.error("Source element not found!");
                return;
            }
            console.log(`Changing video source to: videoFile` +  videoFiles[index]);
            source.setAttribute('src', '/resources/img/video/' + videoFiles[index] );
            console.log("source" + source);
        });
    });
</script>
</body>
</html>
