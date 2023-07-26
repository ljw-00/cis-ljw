<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
    <h1>Login</h1>

    <form action="/login" method="post" id="frmLogin">
        <table>
            <tr>
                <td><label for="userId">아이디</label></td>
                <td><input type="text" name="userId" id="userId"></td>
            </tr>
            <tr>
                <td><label for="userPw">비밀번호</label></td>
                <td><input type="password" name="userPw" id="userPw"></td>
            </tr>
        </table>
    </form>
    <br>

    <div>
        <!-- button의 default 기능 : submit -->
        <button type="button" id="btnLogin">로그인</button>
        <button type="button" id="btnIndex">첫화면</button>
    </div>
    <hr>

    <div>
        <button type="button" id="btnJoin">회원가입</button>
        <button type="button" id="btnFindId">아이디찾기</button>
        <button type="button" id="btnFindPw">비밀번호찾기</button>
    </div>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   

    const userId = document.querySelector('#userId');
    const userPw = document.querySelector('#userPw');
    const btnLogin  = document.querySelector('#btnLogin');
    const btnIndex  = document.querySelector('#btnIndex');
    const btnJoin   = document.querySelector('#btnJoin');
    const btnFindId = document.querySelector('#btnFindId');
    const btnFindPw = document.querySelector('#btnFindPw');

    ////////////////////////////////////////////////////////////////////
    // 이벤트 핸들러

    btnLogin.addEventListener('click', ()=>{
        // form DOM을 가지고온다.
        // const frmLogin  = document.querySelector('#frmLogin');
        // form DOM의 submit 함수를 호출한다.
        // frmLogin.submit();

        
        let requestData = {
            userId : userId.value,
            userPw : userPw.value
        };

        ////////////////////////////////////////////////////////////////////
        // 바닐라 JS
        // 서버와 통신을 수행하는 객체
        let xhr = new XMLHttpRequest();

        xhr.open('POST', '/login', true);
        // setRequestHeader에 이 정보들을 저장(세팅)
        xhr.setRequestHeader('Content-Type', 'application/json');

        xhr.onreadystatechange = function () 
        {
            // 서버와 통신하는 객체의 상태가 바뀌었다. ==> 서버에서 새로운 데이터가 왔다.
            if (xhr.readyState === XMLHttpRequest.DONE)
            {
                if (xhr.status === 200) 
                {
                    if (xhr.responseText === 'OK')
                    {
                        location.href = '/index';
                    } 
                    else 
                    {
                        alert('로그인 실패');
                        userId.value = '';
                        userPw.value = '';
                        userId.focus();
                    }
                } 
                else
                {
                    console.error('Request failed with status: ' + xhr.status);
                }
            }
        };

        xhr.send(JSON.stringify(requestData));

        ////////////////////////////////////////////////////////////////////
        // ajax

        // $.ajax({
        //     url : '/login',
        //     type : 'POST',
        //     data : requestData,
        //     success : function(data)
        //     {
        //         if (data === "OK")
        //         {
        //             location.href = '/index';
        //         }
        //         else
        //         {
        //             alert('로그인 실패');
        //             userId.value = '';
        //             userPw.value = '';
        //             userId.focus();
        //         }
        //     }
        // });

    });

    btnIndex.addEventListener('click', ()=>{
        location.href = '/index';
    });

    btnJoin.addEventListener('click', ()=>{
        location.href = '/join';
    });

    btnFindId.addEventListener('click', ()=>{
        location.href = '/idinquiry';
    });

    btnFindPw.addEventListener('click', ()=>{
        location.href = '/pwinquiry';
    });

})(); 
</script>
        
</body>