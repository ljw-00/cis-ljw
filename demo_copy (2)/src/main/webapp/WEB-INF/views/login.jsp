<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Login</title>

    <style>
        h1 {
            margin-top: 30px;
            margin-bottom: 30px;
            text-align: center;
        }
        li {
            list-style-type: none;
        }
        li::before {
            display: inline-block;
            content: "";
            width: 1px;
            height: 10px;
            background-color: #e1e1e1;
            margin-right: 10px;
        }
        li::after {
            content: "";
            color: rgb(206, 212, 218);
        }
        li:last-child::after {
            content: "";
        }
        .login-container {
            border: 1px solid rgb(206, 212, 218);
            border-radius: 10px;
            width: 500px;
            margin: 0 auto;
            padding: 10px;
        }
        .my-button {
            width: 100%;
            height: 50px;
        }
        .sub-container {
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    
    <h1>LOGIN</h1>
    <div class="login-container">
        <div class="form-floating mb-2">
            <input type="text" class="form-control" name="userId" id="txtUserId" placeholder="#">
            <label for="txtUserId">ID</label>
        </div>
        <div class="form-floating mb-2">
            <input type="password" class="form-control" name="userPw" id="txtUserPw" placeholder="#">
            <label for="txtUserPw">Password</label>
        </div>

        <button type="button" class="btn btn-success my-button" id="btnLogin">LOGIN</button>
    </div>

    <div class="d-flex justify-content-between sub-container">
        <button type="button" class="btn btn-link" id="btnFindPw">비밀번호 찾기</button>
        <li></li>
        <button type="button" class="btn btn-link" id="btnFindId">아이디 찾기</button>
        <li></li>
        <button type="button" class="btn btn-link" id="btnJoin">회원가입</button>
    </div>


    <br>
    <br>

    <!-- ID/PW와 인풋 사이 마진 조절을 위해 table 테크닉-->
    <!-- <table>
        <tr>
            name은 서버에서 인식하는 이름, id는 jsp 내부 페이지 인식용
            <td><label for="userId">아이디</label></td>
            <td><input type="text" name="userId" id="userId"></td>
        </tr>

        <tr>
            <td><label for="userPw">패스워드</label></td>
            <td><input type="text" name="userPw" id="userPw"></td>
        </tr>
    </table> -->

    <!-- button의 디폴트 기능은 submit이기 때문에 사용자가 수동 핸들하기 위해서
         button이라고 명시적으로 하는 것이 좋음 -->
    <!-- <div>
        <button type="button" id="btnLogin">로그인</button>
        <button type="button" id="btnIndex">첫화면</button>
    </div>
    <hr>
    <div>
        <button type="button" id="btnJoin">회원가입</button>
        <button type="button" id="btnFindId">ID 찾기</button>
        <button type="button" id="btnFindPw">PW 찾기</button>
    </div> -->

<script src="/JS/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
(()=>{

    // 메세지 핸들러

    // 버튼에 대한 DOM 로딩
    const btnLogin = document.querySelector('#btnLogin');
    const btnIndex = document.querySelector('#btnIndex');
    const btnJoin = document.querySelector('#btnJoin');
    const btnFindId = document.querySelector('#btnFindId');
    const btnFindPw = document.querySelector('#btnFindPw');
    
    const frmLogin = document.querySelector('#frmLogin');
    const userId = document.querySelector('#txtUserId');
    const userPw = document.querySelector('#txtUserPw');
    
    const checkInputStatus = function()
    {
        if((userId.value.length > 0) && (userPw.value.length > 0))
        {
            return true;
        }
        else
        {
            alert("아이디와 패스워드를 입력해주세요.")
            return false;
        }
    }

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////// 이벤트 핸들러 영역 //////////////////////////////

    btnLogin.addEventListener('click', ()=>{

        if (false === checkInputStatus())
            return;

        let requestData = {
            userId : userId.value,
            userPw : userPw.value
        };

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


        // /////////////////////////////////
        
        // if (true == checkInputStatus())
        // {
        //     let requestData = {
        //         userId : userId.value,
        //         userPw : userPw.value
        //     };
    
        //     console.log(requestData);
    
        //     $.ajax({
        //         url : '/login',
        //         type : 'POST',
        //         data : requestData,
        //         success : function(data)
        //         {
        //             if (data === "OK")
        //             {
        //                 location.href = "/index";
        //             }
        //             else if ((data === "FAIL"))
        //             {
        //                 alert("존재하지 않는 계정입니다. 아이디와 패스워드를 확인해주세요.");
        //             }
        //             else
        //             {
        //                 return;
        //             }
        //         }
        //     });
        // }
    });

    // btnIndex.addEventListener('click', ()=>{
    //     location.href = '/index';
    // });

    btnJoin.addEventListener('click', ()=>{
        location.href = '/join';
    });

    btnFindId.addEventListener('click', ()=>{
        console.log("btnFindId");
        location.href = '/idinquiry';
    });

    btnFindPw.addEventListener('click', ()=>{
        location.href = '/pwinquiry';
    });


        
})(); 
</script>
        
</body>
</html>