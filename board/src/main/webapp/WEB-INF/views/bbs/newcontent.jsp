<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Content</title>
</head>
<body>
    <h1>New Content - ${session.userId}</h1>
    <input type="text" id="txtTitle" maxlength="150">
    <select name="divi" id="divi">
        <option value="C">C-일반</option>
        <option value="N">N-공지</option>
        <option value="R">R-필독</option>
    </select>
    <br><br>
    <textarea name="" id="txtContent" cols="30" rows="10" maxlength="1000"></textarea>
    <br>
    <button type="button" id="btnList">목록으로</button>
    <button type="button" id="btnInsert">저장</button>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{  
    
    const txtTitle = document.querySelector('#txtTitle');
    const divi = document.querySelector('#divi');
    const txtContent = document.querySelector('#txtContent');
    const btnList = document.querySelector('#btnList');
    const btnInsert = document.querySelector('#btnInsert');  
    
    //////////////////////////////////////////////////////////////////////
    // 함수

    const checkValues = function()
    {
        if ((txtTitle.value.length == 0) || (txtContent.value.length == 0))
        {
            return false;
        }

        return true;
    }


    //////////////////////////////////////////////////////////////////////
    // 이벤트 핸들러

    btnList.addEventListener('click', ()=>{
        location.href = '/index';
    });

    btnInsert.addEventListener('click', ()=>{

        // 서버에 전달할 데이터를 만든다.
        if (false == checkValues())
        {
            alert('제목과 내용을 다시 확인해주세요.');
            return;
        }

        let requestData = {
            userId : '${session.userId}',
            title : txtTitle.value,
            content : txtContent.value,
            divi : divi.options[divi.selectedIndex].value
        };

        let xhr = new XMLHttpRequest();

        xhr.open('POST', '/bbs/newcontent', true);
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
                    if (data === 'OK')
                    {
                        alert('글이 저장되었습니다.');
                        location.href = '/index';
                    } 
                    else 
                    {
                        alert('저장에 실패하였습니다.');
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
        //     url : '/bbs/newcontent',
        //     type : 'POST',
        //     data : requestData,
        //     success : function(data)    
        //     {
        //         if (data === "OK")
        //         {
        //             alert('글이 저장되었습니다.');
        //             location.href = '/index';
        //         }
        //         else
        //         {
        //             alert('저장에 실패하였습니다.');
        //         }
        //     }
        // });

    });

        
})(); 
</script>
        
</body>