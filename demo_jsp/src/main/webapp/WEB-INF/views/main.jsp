<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
    <h1>Main BBS</h1>
    <hr>
    <div>
        <span id="spnWelcome"></span>
        <button type="button" id="btnLogin"></button>
        <button type="button" id="btnMyPage">마이페이지</button>
        <button type="button" id="btnBooklist">도서 검색</button>
    </div>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   

    let sessionState = false;
    
    const spnWelcome = document.querySelector('#spnWelcome');

    const btns = document.querySelectorAll('.btns');
    const btnLogin = document.querySelector('#btnLogin');
    const btnMyPage = document.querySelector('#btnMyPage');

    const btnBooklist = document.querySelector('#btnBooklist');


    //////////////////////////////////////////////////////////

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

    const setMyPageBtn = function()
    {
        if (sessionState == true)
        {
            btnMyPage.style.display = 'block';
        }
        else
        {
            btnMyPage.style.display = 'none';
        }
    }
    

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////// 이벤트 핸들러 영역 //////////////////////////////
    
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

    btnMyPage.addEventListener('click', ()=>{
        location.href = '/mypage';
    });

    btnBooklist.addEventListener('click', ()=>{
        location.href = '/book/booklist';
    })


    //////////////////////////////////////////////////////////
    ///////////////////////// 호출부 /////////////////////////
    setsessionState();      // 세션이 있는지 없는지 상태값을 저장
    setWelcomeMsg();        // 웰컴 메세지 설정
    setLoginButton();       // 로그인-로그아웃 버튼 설정
    setMyPageBtn();         // 로그인 상태에만 마이페이지 버튼 활성화


})(); 
</script>
        
</body>
</html>