<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <!-- 부트 스트랩 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <meta charset="utf-8">
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
    hr {
        border: 0;
        height: 4px;
        background-color: rgb(0, 0, 0);
        margin-bottom: 10px;
    }
    ul, ol {
        list-style: none;
    }
    li {
        float: left;
        list-style: none;
    }
    a {
        text-decoration-line: none;
    }
    .book-container {
        width: 1200px;
        margin: 0 auto;
        margin-top: 50px;
    }
    .book-summary {
        background-color: rgb(246, 246, 246);
        height: 600px;
    }
    .image-container {
        width: 25%;
        margin-left: auto;
        margin-top: 30px;
    }
    .summary-container {
        width: 60%;
        margin-right: auto;
        margin-top: 50px;
        font-size: 20px;
    }
    .summary-container hr {
        border: 0;
        height: 1px;
        background-color: rgb(0, 0, 0);
        margin-bottom: 10px;
    }
    .imageAndSummary {
        display: flex;
    }
    .summary-etc {
        font-size: 85%;
    }
    .tabmenu {
        margin-top: 20px;
        margin-bottom: 20px;
    }
    .tabmenu a {
        color: black;
    }
    .tab_active {
            background-color: #ccc;
    }
    .tab_body {
        display: none;
    }
    .tab_body.active {
        display: block;
    }
    .tab_body h2 {
        font-size: 20px;
    }
    #summary-title {
        font-size: 120%;
        font-weight: bold;
    }
    #book_info > a {
        font-size : 15px
    }
    #bookTab #container {
    width: 1320px;
    margin: 0 auto;
    }
    #bookType {
    border-bottom: 2px solid #e84545;
    margin-bottom: 40px;
    display: flex;
    justify-content: flex-start;
    }
    #bookType li a{
    display:block;
    border: 2px solid #e84545;
    border-bottom : none;
    height: 38px;
    padding: 0 54px;
    line-height: 38px;
    margin-right: 10px;
    }
    #bookType li a.on {
    background-color: #e84545;
    color: #fff;
    }
    #newBookList, #bestBookList {
    display: flex;
    justify-content: space-around;
    }
    #newBookList li, #bestBookList li {
    width: 120px;
    }
    #newBookList li a, #bestBookList li a {
    display: block;
    width: 100%;
    }
    #newBookList li a img, #bestBookList li a img {
    width: 120px;
    height: 170px;
    }
    #bookTitle {
    display: block;
    padding-top: 10px;
    color: #2f2f2f;
    overflow: hidden;        
    text-overflow: ellipsis;     
    white-space: nowrap; 
    font-size: 14px;
    }
    #bookAuthor {
    display: block;
    color: #8d8d8d;
    overflow: hidden;        
    text-overflow: ellipsis;     
    white-space: nowrap; 
    font-size: 13px;
    }
    #bestBookList {
    display: none;
    }
    .btn-light { 
    font-family : "Open Sans";
    font-size: 8px;
    }
    .global-nav {
    display: flex;
    justify-content: space-between;
    margin-left: 5%;
    margin-right: 5%;
    }
    .global-nav-btn {
    display: inline-flex;
    }
    .global-nav-link {
    display: flex;
    align-items: center;
    margin: 0 10px;
    }
    .global-nav-s {
    display: flex;
    }
    #btnLogin {
    margin-right: 20px;
    }
    </style>
</head>
<body class="index-page" data-bs-spy="scroll" data-bs-target="#navmenu">
    
    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top">
      <div class="global-nav">
        <div class="global-nav-s global-nav-logo">
          <a href="index.html" class="logo d-flex align-items-center me-auto me-xl-0 global-nav-link">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <!-- <img src="assets/img/logo.png" alt=""> -->
            <h1>cis-ljw</h1>
            <span>.</span>
          </a>
        </div>

        <div class="global-nav-s global-nav-links">
          <nav id="navmenu" class="navmenu">
            <ul>
              <li><a href="index.html#hero" class="active global-nav-link">Home</a></li>
              <li><a href="index.html#about" class="global-nav-link">About</a></li>
              <li><a href="index.html#services" class="global-nav-link">Search</a></li>
              <li class="dropdown has-dropdown"><a href="#" class="global-nav-link"><span>Community</span> <i class="bi bi-chevron-down"></i></a>
                <ul class="dd-box-shadow">
                  <li><a href="#">Dropdown 1</a></li>
                  <li class="dropdown has-dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down"></i></a>
                    <ul class="dd-box-shadow">
                      <li><a href="#">Deep Dropdown 1</a></li>
                      <li><a href="#">Deep Dropdown 2</a></li>
                      <li><a href="#">Deep Dropdown 3</a></li>
                      <li><a href="#">Deep Dropdown 4</a></li>
                      <li><a href="#">Deep Dropdown 5</a></li>
                    </ul>
                  </li>
                  <li><a href="#">Dropdown 2</a></li>
                  <li><a href="#">Dropdown 3</a></li>
                  <li><a href="#">Dropdown 4</a></li>
                </ul>
              </li>
              <li><a href="index.html#contact" class="global-nav-link">Notice</a></li>
            </ul>
    
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
          </nav><!-- End Nav Menu -->
        </div>
        <!-- Nav Menu -->

        <div class="global-nav-btn global-nav-s global-nav-link">
          <button type="button" class="btn btn-outline-light dropdowns" id="btnLogin"></button>
          <button type="button" class="btn btn-outline-light" id="btnMyLibrary">내 서재</button>
        </div>

      </div>
    </header><!-- End Header -->

    <main id="main">
        <div class="book-container">
            <div>
                <span id="spnWelcome"></span>
                <button type="button" id="btnLogin"></button>
            </div>

            <div>
                <h3><strong>상세보기</strong></h3>
            </div>
            <div>
                <hr>
            </div>
            <div class="full-view">
                <!-- 책 요약 -->
                <div class="book-summary">
                    <!-- 이미지 & 요약 -->
                    <div class="imageAndSummary">
                        <div class="image-container">
                            <img src="${book.image}" alt="${book.title}" style="width:250px;">
                            <!-- 이미지 -->
                        </div>
                        <div class="summary-container">
                            <span id="summary-title">${book.title}</span><hr>
                            <span class="summary-etc">저자 : ${book.author} | 출판사 : ${book.publisher} | 출간일 : ${book.pubdate}</span>
                            <!-- 요약 정보 --> <br><hr><br>
                            <span>대출 : ${brNum} / 5 | 예약 : ${rsNum} / 5</span>
                            <span></span>
                            <br>
                            <hr>
                            <br>
                            <button type="button" class="btn btn-success" id="btnBorrow"></button>
                            <button type="button" class="btn btn-warning" id="btnReserve">예약하기</button>
                            <button type="button" class="btn btn-secondary" id="btnReturn">반납하기</button>
                        </div>
                    </div>
                    <!-- 대출 & 예약버튼 -->

                    <div>

                    </div>
                </div>

                <!-- 게시판 버튼 -->
                <div class="tabmenu">
                    <ul class="list-group list-group-horizontal">
                        <li class="list-group-item list-group-item-action">
                            <a href="#" data-target="book_info" onclick="showTab('book_info')">작품 소개</a>
                        </li>
                        <li class="list-group-item list-group-item-action">
                            <a href="#" data-target="book_table" onclick="showTab('book_table')">목차</a>
                        </li>
                        <li class="list-group-item list-group-item-action">
                            <a href="#" data-target="comments" onclick="showTab('comments')">독자 서평</a>
                        </li>
                    </ul>
                </div>

                <div id="book_info" class="tab_body active">
                    <!-- 작품 소개 -->
                    <a>"${book.description}"</a>
                </div>
                <div id="book_table" class="tab_body">
                    <!-- 목차 -->
                    <h2>목차</h2>
                </div>
                <div id="comments" class="tab_body">
                    <!-- 독자서평 -->

                    <!-- 한줄평 남기기 -->
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="" aria-label="Recipient's username" aria-describedby="button-addon2" id="txtReview" maxlength="500">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">한줄평 남기기</button>
                    </div>

                    <table class="table table-hover tblReview">
                        <thead class="table-light">
                        <tr>
                            <th scope="col">일자</th>
                            <th scope="col">작성자</th>
                            <th scope="col">서평</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${review}" var="reviewItem">
                                <tr>
                                    <td>${reviewItem.regDate}</td>
                                    <td>${reviewItem.userId}</td>
                                    <td>${reviewItem.review}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">

        <div class="container footer-top">
            <div class="row gy-4">
            <div class="col-lg-5 col-md-12 footer-about">
                <a href="index.html" class="logo d-flex align-items-center">
                <span>Append</span>
                </a>
                <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus.</p>
                <div class="social-links d-flex mt-4">
                <a href=""><i class="bi bi-twitter"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
            </div>
    
            <div class="col-lg-2 col-6 footer-links">
                <h4>Useful Links</h4>
                <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About us</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Terms of service</a></li>
                <li><a href="#">Privacy policy</a></li>
                </ul>
            </div>
    
            <div class="col-lg-2 col-6 footer-links">
                <h4>Our Services</h4>
                <ul>
                <li><a href="#">Web Design</a></li>
                <li><a href="#">Web Development</a></li>
                <li><a href="#">Product Management</a></li>
                <li><a href="#">Marketing</a></li>
                <li><a href="#">Graphic Design</a></li>
                </ul>
            </div>
    
            <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start">
                <h4>Contact Us</h4>
                <p>A108 Adam Street</p>
                <p>New York, NY 535022</p>
                <p>United States</p>
                <p class="mt-4"><strong>Phone:</strong> <span>+1 5589 55488 55</span></p>
                <p><strong>Email:</strong> <span>info@example.com</span></p>
            </div>
    
            </div>
        </div>
    
        <div class="container copyright text-center mt-4">
            <p>&copy; <span>Copyright</span> <strong class="px-1">Append</strong> <span>All Rights Reserved</span></p>
            <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you've purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
        </div>
    
    </footer><!-- End Footer -->
    
    <!-- Scroll Top Button -->
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Preloader -->
    <div id="preloader">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
    
    <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

    <!-- 부트스트랩 src -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script>
(()=>{   

    let sessionState = false;

    const spnWelcome = document.querySelector('#spnWelcome');
    const btns = document.querySelectorAll('.btns');
    const btnLogin = document.querySelector('#btnLogin');

    const btnBorrow = document.querySelector('#btnBorrow');
    const btnReserve = document.querySelector('#btnReserve');
    const btnReturn = document.querySelector('#btnReturn');

    const btnReview = document.querySelector('#button-addon2');
    const txtReview = document.querySelector('#txtReview');


    // ////////////////////////////////////////////////////////////

    // 현재 세션이 존재하는지 확인
    const setsessionState = function()
    {
        if('${vo.userId}' == '')
        {
            sessionState = false;
        }
        else
        {
            sessionState = true;
        }
    }

    // 웰컴 메세지 설절
    const setWelcomeMsg = function()
    {
        if (sessionState == true)
        {
            spnWelcome.textContent = '${vo.name}님 반갑습니다.';
        }
        else
        {
            spnWelcome.textContent = 'Guest Mode로 이용 중입니다.';
        }
    }

    const setLoginButton = function()
    {
        if (sessionState == true)
        {
            btnLogin.textContent = '로그아웃'
        }
        else
        {
            btnLogin.textContent = '로그인'
        }
    }

    // 대출 / 예약 / 반납 버튼 세팅
    const setBtnStatus = function()
    {

        // 이미 대출 중인 유저 : 반납하기
        if (('${brData}' != null) && ('${brData}' != ""))
        {
            btnBorrow.style.display = 'none';
            btnReserve.style.display = 'none';
            btnReturn.style.display = 'inline'
            return;
        }

        // 예약 중인 유저 : 예약 취소
        if (('${rsData}' != null) && ('${rsData}' != ""))
        {
            btnBorrow.style.display = 'none';
            btnReserve.style.display = 'inline';
            btnReserve.textContent = '예약 취소';
            btnReturn.style.display = 'none'
            return;            
        }

        // 현재 모든 책이 대출 중 > 예약버튼만 보이도록
        if ('${brNum}' == 5)
        {
            btnBorrow.style.display = 'none';
            btnReserve.style.display = 'inline';
            btnReserve.textContent = '예약하기';
            btnReturn.style.display = 'none'
            return;
        }
        // 대출 가능한 책일 경우
        else
        {
            btnBorrow.style.display = 'inline';
            btnBorrow.textContent = '대출하기';
            btnReserve.style.display = 'none';
            btnReturn.style.display = 'none'
            return;
        }
    }

    const setBtn = function()
    {
        // 유저가 현재 예약 중인지
        // 아니면 다른 사람이 예약 중인지
    }

    // ///////////////////////////////////////////////////////////

    btnLogin.addEventListener('click', ()=>{

        // 로그인 상태일 시 로그아웃
        if (sessionState == true)
        {
            location.href = '/logout';
        }
        // 로그아웃 상태일 시 로그인
        else
        {
            location.href = '/login';
        }
    })

    btnBorrow.addEventListener('click', ()=>{

        if (sessionState == false)
        {
            alert("로그인 후 이용 가능합니다.");
            return;
        }

        if ('${brData}' != null && ('${brData}' != ""))
        {
            alert("이미 대출 중인 책입니다.");
            return;
        }

        if ('${brNum}' == 5)
        {
            alert("모든 책이 대출 중입니다.");
            return;
        }

        if (confirm("${book.title}을(를) 대출하시겠습니까?"))
        {
            let httpRequest = new XMLHttpRequest();
            httpRequest.open('POST', '/borrowBook', true);
            httpRequest.setRequestHeader('content-type', 'application/json');
                
            // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
            httpRequest.onreadystatechange = function()
            {
                if(httpRequest.readyState !== XMLHttpRequest.DONE)
                    return;
    
                if (httpRequest.status === 200)
                {
                    let result = httpRequest.responseText;
    
                    if (result == "OK")
                    {
                        
                        if(confirm("대출되었습니다. 마이페이지에서 확인하시겠습니까?"))
                        {
                            location.href = '/mypage';
                            return;
                        }

                        location.reload();

                    }
                    else if (result == "$MAX")
                    {
                        alert("대출 가능한 최대 권수를 초과하였습니다.");
                    }
                    else
                    {
                        alert("대출에 실패하였습니다.");
                    }
                }
                else
                {
                    console.error(httpRequest.status, httpRequest.statusText);
                }
            }
    
            let requestData = {
                brCode : '${book.isbn}' + "-" + "${vo.userId}",
                isbn : '${book.isbn}',
                title : '${book.title}',
                userId : '${vo.userId}',
                renew : "F"
            }
    
            httpRequest.send(JSON.stringify(requestData));
        }
        else
        {
            return;
        }
    })

    // 반납
    btnReturn.addEventListener('click', ()=>{
        
        if (sessionState == false)
        {
            alert("로그인 후 이용 가능합니다.");
            return;
        }

        let httpRequest = new XMLHttpRequest();
        httpRequest.open('POST', '/returnBook', true);
        httpRequest.setRequestHeader('content-type', 'application/json');
            
        // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
        httpRequest.onreadystatechange = function()
        {
            if(httpRequest.readyState !== XMLHttpRequest.DONE)
                return;

            if (httpRequest.status === 200)
            {
                let result = httpRequest.responseText;

                if (result === "OK")
                {
                    alert("반납에 성공하였습니다.");
                }
                else
                {
                    alert("반납에 실패하였습니다.");
                }
            }
            else
            {
                console.error(httpRequest.status, httpRequest.statusText);
            }
        }

        let requestData = {
            isbn : '${book.isbn}',
            userId : '${vo.userId}',
        }

        httpRequest.send(JSON.stringify(requestData));

    })

    // 예약
    btnReserve.addEventListener('click', ()=>{
        
        if (sessionState == false)
        {
            alert("로그인 후 이용 가능합니다.");
            return;
        }

        // 예약 취소
        if (('${rsData}' != null) && ('${rsData}' != ""))
        {
            if (confirm("${book.title}을(를) 예약취소 하시겠습니까?"))
            {
                let httpRequest = new XMLHttpRequest();
                httpRequest.open('POST', '/cancelReservation', true);
                httpRequest.setRequestHeader('content-type', 'application/json');
                    
                // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
                httpRequest.onreadystatechange = function()
                {
                    if(httpRequest.readyState !== XMLHttpRequest.DONE)
                        return;
        
                    if (httpRequest.status === 200)
                    {
                        let result = httpRequest.responseText;
        
                        if (result === "OK")
                        {
                            alert("예약이 취소되었습니다. 감사합니다.");
                            location.reload();
                        }
                        else
                        {
                            alert("예약취소에 실패하였습니다.");
                        }
                    }
                    else
                    {
                        console.error(httpRequest.status, httpRequest.statusText);
                    }
                }
        
                let requestData = {
                    userId : '${vo.userId}',
                    isbn : '${book.isbn}'
                }
        
                httpRequest.send(JSON.stringify(requestData));
            }
        }
        // 예약하기
        else
        {
            if (confirm("${book.title}을(를) 예약하시겠습니까?"))
            {
                let httpRequest = new XMLHttpRequest();
                httpRequest.open('POST', '/reserveBook', true);
                httpRequest.setRequestHeader('content-type', 'application/json');
                    
                // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
                httpRequest.onreadystatechange = function()
                {
                    if(httpRequest.readyState !== XMLHttpRequest.DONE)
                        return;
        
                    if (httpRequest.status === 200)
                    {
                        let result = httpRequest.responseText;
        
                        if (result === "OK")
                        {
                            if (confirm("예약되었습니다. 내 서재에서 확인하시겠습니까?"))
                            {
                                location.href = '/main';
                                return;
                            }

                            location.reload();
                        }
                        else if (result === "$MAX")
                        {
                            alert("예약 가능 인원이 초과하여 예약이 불가능합니다.");
                        }
                        else
                        {
                            alert("예약에 실패하였습니다.");
                        }
                    }
                    else
                    {
                        console.error(httpRequest.status, httpRequest.statusText);
                    }
                }
        
                let requestData = {
                    brCode : '${book.isbn}' + '-' + '${vo.userId}',
                    userId : '${vo.userId}',
                    isbn : '${book.isbn}'
                }
        
                httpRequest.send(JSON.stringify(requestData));
            }
        }
    })

    btnReview.addEventListener('click', ()=>{

        if (sessionState === false)
        {
            alert("로그인 후 이용가능합니다.");
            return;
        }

        let httpRequest = new XMLHttpRequest();
        httpRequest.open('POST', '/writeReview', true);
        httpRequest.setRequestHeader('content-type', 'application/json');
            
        // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
        httpRequest.onreadystatechange = function()
        {
            if(httpRequest.readyState !== XMLHttpRequest.DONE)
                return;

            if (httpRequest.status === 200)
            {

                let result = httpRequest.responseText;

                if (result === "OK")
                {
                    alert("한줄평을 등록하였습니다.");
                    location.href = "/book/bookinfo?isbn=${book.isbn}";
                }
                else if (result === "$EXIST")
                {
                    alert("한줄평은 한 개만 등록 가능합니다.");
                    txtReview.value = "";
                }
                else
                {
                    alert("등록에 실패하였습니다.");
                    txtReview.value = "";
                }
            }
            else
            {
                console.error(httpRequest.status, httpRequest.statusText);
            }
        }

        let requestData = {
            userId : '${vo.userId}',
            review : txtReview.value,
            isbn : '${book.isbn}'
        }


        httpRequest.send(JSON.stringify(requestData));


    })

    // //////////////////////////////////////////////////////////
    setsessionState();      // 세션이 있는지 없는지 상태값을 저장
    setWelcomeMsg();        // 웰컴 메세지 설정
    setLoginButton();       // 로그인-로그아웃 버튼 설정
    setBtnStatus();

        
})(); 
</script>
<script>

    function showTab(tabId) {
        // 모든 탭 내용 숨기기
        const tabContents = document.getElementsByClassName('tab_body');
        for (let i = 0; i < tabContents.length; i++) {
            tabContents[i].classList.remove('active');
        }

        // 선택한 탭 내용 보이기
        const selectedTab = document.getElementById(tabId);
        if (selectedTab) {
            selectedTab.classList.add('active');
        }

        // 모든 탭 메뉴 클래스 초기화
        const tabLinks = document.querySelectorAll('.tabmenu a');
        for (let i = 0; i < tabLinks.length; i++) {
            tabLinks[i].classList.remove('tab_active');
        }

        // 선택한 탭 메뉴에 클래스 추가
        const selectedTabLink = document.querySelector(`[data-target="${tabId}"]`);
        if (selectedTabLink) {
            selectedTabLink.classList.add('tab_active');
        }
    }

    // <li> 태그 클릭 시 이벤트 처리
    const listItems = document.querySelectorAll('.list-group-item');
    for (let i = 0; i < listItems.length; i++) {
        listItems[i].addEventListener('click', function () {
            const target = this.querySelector('a').getAttribute('data-target');
            showTab(target);
        });
    }

</script>        

</html>