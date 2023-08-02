<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<!-- 부트 스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">


<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Online Library</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/main.css" rel="stylesheet">
<style>
    li {
        list-style: none;
    }
    #container {
        width: 1000px;
        margin: 0 auto;
    }
    #header {
        width: 100%;
        height: 100px;
        display: flex;
        justify-content: space-between;
        border-bottom: 4px solid #e84545;
    }
    #logo a {
        font-size:28px;
        font-weight: bold;
        line-height: 100px;
    }
    #spnMyPage {
        display: block;
        width: 100%;
        text-align: right;
        margin-top: 20px;
        font-size: 16px;
        font-weight: bold;
    }
    #utilMenu {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }
    #utilMenu li {
        margin-left: 10px;
    }
    #utilMenu li#logout {
        padding-right: 10px;
    }
    .bar {
        display: block;
        width: 1px;
        height: 10px;
        background-color: #666;
        margin-top: 9px;
    }
    #utilMenu li a {
        font-size: 12px;
        color: #666;
    }
    #leftArea {
        float: left;
        width: 180px;
        padding-top: 48px;
    }
    #lnbTitle {
        width: 180px;
        height: 53px;
        background-color: #e84545;
    }
    #lnbTitle span {
        display: block;
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        line-height: 53px;
        margin-left: 14px;
    }
    #lnb {
        width: 180px;
        border: 1px solid #d2d2d2;
        border-top: none;
        padding: 18px 0 33px 0;
    }
    #lnb li {
        width: 151px;
        padding: 0 8px 10px 19px;
    }
    #lnb li a {
        line-height: 18px;
        color: #555555;
        font-size: 14px;
    }
</style>
</head>
<body>
    <div id="container">
        <div id="header">
            <div id="logo">
                <a href="/index">
                    <span>cis-ljw</span>
                    <span>.</span>
                </a>
            </div>
        
            <div id="menu">
                <div class="msg">
                    <span id="spnMyPage"></span>
                </div>
                <ul id="utilMenu">
                    <li id="logout"><a href="#">로그아웃</a></li>
                    <span class="bar">&nbsp;</span>
                    <li><a href="javascript:;">게시판</a></li>
                    <li><a href="javascript:;">이용안내</a></li>
                </ul>
            </div>
        </div>
        
        <div id="leftArea">
            <div id="lnbTitle">
                <span>마이페이지</span>
            </div>
            <ul id="lnb">
                <li><a href="javascript:;" id="brList">대출 현황</a></li>
                <li><a href="javascript:;">예약 현황</a></li>
                <li><a href="javascript:;">등록한 리뷰</a></li>
                <li><a href="javascript:;">내 정보 관리</a></li>
            </ul>
        </div>
        
    </div>
    
    


<script src="/JS/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
(()=>{   

    const spnMyPage = document.querySelector('#spnMyPage');
    const brList = document.querySelector('#brList');
    const logout = document.querySelector('#logout');


    ///////////////////////////////////////////////////////////////
    // 이벤트 핸들러

    brList.addEventListener('click', ()=>{
        location.href="/borrowlist";
    });

    logout.addEventListener('click', ()=>{
        location.href = '/logout';
    })


    ///////////////////////////////////////////////////////////////
    // 함수

    const setMyPageMsg = function()
    {
        spnMyPage.textContent = '${vo.name}님의 마이페이지';
    }

    ///////////////////////////////////////////////////////////////
    // 호출

    setMyPageMsg();

})(); 
</script>
        
</body>
</html>