<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    
    <input type="text" name="" id="txtText">
    <button type="button" id="btnSubmit">SUBMIT</button>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   

    const txtText = document.querySelector('#txtText');
    const btnSubmit = document.querySelector('#btnSubmit');

    btnSubmit.addEventListener('click', ()=>{

        let xhr = new XMLHttpRequest();

        xhr.open('POST', '/test', true);
        // setRequestHeader에 이 정보들을 저장(세팅)
        xhr.setRequestHeader('Content-Type', 'application/json');

        xhr.onreadystatechange = function () 
        {
            // 서버와 통신하는 객체의 상태가 바뀌었다. ==> 서버에서 새로운 데이터가 왔다.
            if (xhr.readyState === XMLHttpRequest.DONE)
            {
                if (xhr.status === 200) 
                {
                    let rsNum = xhr.responseText;
                    console.log(rsNum);
                } 
                else
                {
                    console.error('Request failed with status: ' + xhr.status);
                }
            }
        };

        let requestData = {
            userId : txtText.value
        };

        console.log(requestData)

        xhr.send(JSON.stringify(requestData));

    })

        
})(); 
</script>
        
</body>
</html>