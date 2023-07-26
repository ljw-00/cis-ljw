<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idInquiry</title>
</head>
<body>
    <h1>ID 찾기</h1>
    <hr>
    이메일 <input type="email" name="email" id="txtEmail">
    <button type="button" id="btnSubmit">확인</button>
    <button type="button" id="btnBack">뒤로가기</button>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   
    const txtEmail = document.querySelector('#txtEmail');
    const btnSubmit = document.querySelector('#btnSubmit');
    const btnBack = document.querySelector('#btnBack');

    btnSubmit.addEventListener('click', ()=>{
        
        let email = txtEmail.value;

        if (email.length === 0)
        {
            alert('이메일을 입력해주세요.');
            txtEmail.focus();
            return;
        }

        let requestData = {
            email : email
        };

        let xhr = new XMLHttpRequest();

        xhr.open('POST', '/idinquiry', true);
        // setRequestHeader에 이 정보들을 저장(세팅)
        xhr.setRequestHeader('Content-Type', 'application/json');

        xhr.onreadystatechange = function () 
        {
            // 서버와 통신하는 객체의 상태가 바뀌었다. ==> 서버에서 새로운 데이터가 왔다.
            if (xhr.readyState === XMLHttpRequest.DONE)
            {
                if (xhr.status === 200) 
                {
                    let data = xhr.responseText;
                    if (data === '$FAIL')
                    {
                        alert('이메일이 존재하지 않습니다.');
                    } 
                    else 
                    {
                        console.log(data);
                        alert(data);
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
        //     url : '/idinquiry',
        //     type : 'POST',
        //     data : requestData,
        //     success : function(data)
        //     {
        //         if (data === '$FAIL')
        //         {
        //             alert('이메일이 존재하지 않습니다.');
        //         }
        //         else
        //         {
        //             alert(data);
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