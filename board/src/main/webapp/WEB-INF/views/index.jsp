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
    </div>

    <table border="1" id="tblBBS">
        <thead>
            <th>순번</th>
            <th>제목</th>
            <th>아이디</th>
            <th>날짜</th>
        </thead>
        <tbody>
        </tbody>
    </table>

    <button type="button" id="btnPrev">이전</button>
    <button type="button" id="btn1">1</button>
    <button type="button" id="btn2">2</button>
    <button type="button" id="btn3">3</button>
    <button type="button" id="btn4">4</button>
    <button type="button" id="btn5">5</button>
    <button type="button" id="btnNext">다음</button>
    <button type="button" id="btnWrite">글작성</button>

<script src="/JS/jquery-3.7.0.min.js"></script>

<script>
(()=>{   
    let sessionState = false;

    // ROW
    let rowCount = 0;           // 전체 건수

    // PAGE
    let rowsPerPage = 5;        // 페이지 당 건수 (테이블에서 보여지는 최대 건수)
    let curPage = 0;

    // SECTION
    let curSection = 0;         // 현재섹션
    let pagesPerSection = 5;    // 섹션 당 페이지수 (버튼의 개수와 같음)    

    const spnWelcome = document.querySelector('#spnWelcome');
    const btnLogin   = document.querySelector('#btnLogin');

    const btnPrev = document.querySelector('#btnPrev');
    const btnNext = document.querySelector('#btnNext');
    const btn1 = document.querySelector('#btn1');
    const btn2 = document.querySelector('#btn2');
    const btn3 = document.querySelector('#btn3');
    const btn4 = document.querySelector('#btn4');
    const btn5 = document.querySelector('#btn5');
    const btnWrite = document.querySelector('#btnWrite');

    ///////////////////////////////////////////////////////////
    // 함수

    // 현재 세션이 있는지 없는지 설정해준다.
    const setSessionState = function()
    {
        if ('${vo.userId}' === '')
        {
            sessionState = false;
        }
        else
        {
            sessionState = true;
        }
    }

    const setWelcomeMsg = function()
    {
        if (sessionState === true)
        {
            spnWelcome.textContent = '${vo.name}님 반갑습니다.';
        }
        else
        {
            spnWelcome.textContent = '로그인 해주세요.';
        }
    }

    const setLoginButton = function()
    {
        if (sessionState === true)
        {
            btnLogin.textContent = '로그아웃';
        }
        else
        {
            btnLogin.textContent = '로그인';
        }
    }

    const setBBS = function(page)
    {
        let requestData = {
            divi : 'C',
            page : page,
            rowsPerPage : rowsPerPage
        };

        $.ajax({
            url : 'bbs/list',
            type : 'POST',
            data : requestData,
            success : function(data)    // data : rowCount, bbsList
            {
                let bstr = '';
                const tblBody = document.querySelector('#tblBBS > tbody');

                // 전체 카운트 저장
                rowCount = data.rowCount;

                // 테이블 body를 채워준다.
                tblBody.innerHTML = '';
                 
                for (let i = 0; i < data.bbsList.length; i++)
                {
                    bstr = '';
                    bstr += '<tr>';
                    bstr += '<td>' + data.bbsList[i].rowNum + '</td>';
                    bstr += '<td><a href=\"/bbs/content?userId=' + data.bbsList[i].userId + '&seq=' + data.bbsList[i].seq + '\">' + data.bbsList[i].title + '</a></td>';
                    bstr += '<td>' + data.bbsList[i].userId + '</td>';
                    bstr += '<td>' + data.bbsList[i].regDate + '</td>';
                    bstr += '</tr>';

                    tblBody.innerHTML += bstr;
                }
            }
        });        
    }

    // 실제 적용해야 할 페이지를 구한다.
    const getRealPage = function(pageOffset)
    {
        return (curSection * pagesPerSection) + pageOffset;
    }


    ///////////////////////////////////////////////////////////
    // 이벤트 핸들러
    btnLogin.addEventListener('click', ()=>{

        // 로그인 상태
        if (sessionState === true)
        {
            location.href = '/logout';
        }
        // 로그인 상태가 아님
        else
        {
            location.href = '/login';
        }
    });

    // Prev
    btnPrev.addEventListener('click', ()=>{
        if (curSection <= 0)
        {
            alert('이전 내용이 없습니다.');
            return;
        }

        curSection--;

        let realPage = getRealPage(0);
        setBBS(realPage);
    });

    // Next
    btnNext.addEventListener('click', ()=>{
        let rowsPerSection = rowsPerPage * pagesPerSection;
        let nextRowCount = rowCount - ((curSection + 1) * rowsPerSection);

        if (nextRowCount <= 0)
        {
            alert('다음 내용이 없습니다.');
            return;
        }

        curSection++;

        let realPage = getRealPage(0);
        setBBS(realPage);
    });

    // 숫자버튼
    btn1.addEventListener('click', ()=>{
        const offset = 0;

        const realPage = getRealPage(offset);
        setBBS(realPage);
    });

    btn2.addEventListener('click', ()=>{
        const offset = 1;

        const realPage = getRealPage(offset);
        setBBS(realPage);
    });

    btn3.addEventListener('click', ()=>{
        const offset = 2;

        const realPage = getRealPage(offset);
        setBBS(realPage);
    });

    btn4.addEventListener('click', ()=>{
        const offset = 3;

        const realPage = getRealPage(offset);
        setBBS(realPage);
    });

    btn5.addEventListener('click', ()=>{
        const offset = 4;

        const realPage = getRealPage(offset);
        setBBS(realPage);
    });

    btnWrite.addEventListener('click', ()=>{
 
        if (sessionState === true)
        {
            location.href="/bbs/newcontent";
        }
        else
        {
            alert('로그인을 해주세요.');
        }
        
    });

    ///////////////////////////////////////////////////////////
    // 호출부
    setSessionState();  // 세션이 있는지 없는지 상태값 저장
    setWelcomeMsg();    // 웰컴 메시지 설정
    setLoginButton();   // 로그인 버튼 설정

    setBBS(0);
    
})(); 
</script>
        
</body>