<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <h1>비밀번호 찾기</h1>
    <hr>
    아이디 <input type="text" name="userId" id="txtUserId">
    <button type="button" id="btnSubmit">확인</button>
    <button type="button" id="btnBack">뒤로가기</button>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   
    const txtUserId = document.querySelector('#txtUserId');
    const btnSubmit = document.querySelector('#btnSubmit');
    const btnBack = document.querySelector('#btnBack');

    btnSubmit.addEventListener('click', ()=>{

        let userId = txtUserId.value;

        if (userId.length === 0)
        {
            alert('아이디를 입력해주세요.');
            txtUserId.focus();
            return;
        }

        let requestData = {
            userId  // 키와 밸류가 같을 때 이렇게 써도 됨
        };

        let xhr = new XMLHttpRequest();

        xhr.open('POST', '/pwinquiry', true);
        // setRequestHeader에 이 정보들을 저장(세팅)
        xhr.setRequestHeader('Content-Type', 'application/json');

        xhr.onreadystatechange = function () 
        {
            // 서버와 통신하는 객체의 상태가 바뀌었다. ==> 서버에서 새로운 데이터가 왔다.
            if (xhr.readyState === XMLHttpRequest.DONE)
            {
                if (xhr.status === 200) 
                {
                    if (xhr.responseText === '$FAIL')
                    {
                        alert('아이디가 존재하지 않습니다.');
                        txtUserId.value = '';
                        txtUserId.focus();
                    } 
                    else 
                    {
                        alert('비밀번호를 메일로 전송하였습니다.');
                        txtUserId.value = '';
                    }
                } 
                else
                {
                    console.error('Request failed with status: ' + xhr.status);
                }
            }
        };

        xhr.send(JSON.stringify(requestData));

        // $.ajax({
        //     url : '/pwinquiry',
        //     type : 'POST',
        //     data : requestData,
        //     success : function(data)
        //     {
        //         if (data === "$FAIL")
        //         {
        //             alert('아이디가 존재하지 않습니다.');
        //             txtUserId.value = '';
        //             txtUserId.focus();
        //         }
        //         else
        //         {
        //             alert('비밀번호를 메일로 전송하였습니다.');
        //         }
        //     }
        // });
    });

    btnBack.addEventListener('click', ()=>{
        history.back();
    });
    
})(); 
</script>
        
</body>