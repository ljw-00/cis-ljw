<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title></title>
</head>
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
</style>
<body>
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
                        <img src="${books.image}" alt="${books.title}" style="width:250px;">
                        <!-- 이미지 -->
                    </div>
                    <div class="summary-container">
                        <span id="summary-title">${books.title}</span><hr>
                        <span class="summary-etc">저자 : ${books.author} | 출판사 : ${books.publisher} | 출간일 : ${books.pubdate}</span>
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
                <a>"${books.description}"</a>
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

<script src="/JS/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

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

        if (confirm("${books.title}을(를) 대출하시겠습니까?"))
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
                        btnBorrow.style.display = 'none';
                        btnReserve.style.display = 'none';
                        btnReturn.style.display = 'inline'

                        if(confirm("대출되었습니다. 마이페이지에서 확인하시겠습니까?"))
                        {
                            location.href = '/mypage';
                        }

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
                brCode : '${books.isbn}' + "-" + "${vo.userId}",
                isbn : '${books.isbn}',
                title : '${books.title}',
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
            isbn : '${books.isbn}',
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
            if (confirm("${books.title}을(를) 예약취소 하시겠습니까?"))
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
                            btnBorrow.style.display = 'none';
                            btnReserve.style.display = 'inline';
                            btnReserve.textContent = '예약하기';
                            btnReturn.style.display = 'none'
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
                    isbn : '${books.isbn}'
                }
        
                httpRequest.send(JSON.stringify(requestData));
            }
        }
        // 예약하기
        else
        {
            if (confirm("${books.title}을(를) 예약하시겠습니까?"))
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
                            btnBorrow.style.display = 'none';
                            btnReserve.style.display = 'inline';
                            btnReserve.textContent = '예약 취소';
                            btnReturn.style.display = 'none'

                            if (confirm("예약되었습니다. 내 서재에서 확인하시겠습니까?"))
                            {
                                location.href = '/main';
                            }
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
                    brCode : '${books.isbn}' + '-' + '${vo.userId}',
                    userId : '${vo.userId}',
                    isbn : '${books.isbn}'
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
                    location.href = "/book/bookinfo?title=${books.title}&isbn=${books.isbn}&image=${books.image}&author=${books.author}&publisher=${books.publisher}&pubdate=${books.pubdate}&description=${books.description}";
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
            isbn : '${books.isbn}'
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
</body>
</html>