<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content</title>
</head>
<body>
    <input type="text" id="txtTitle" value="${vo.title}"> <span id="txtId">${vo.userId}</span>
    <br><br>
    <textarea name="" id="txtContent" cols="30" rows="10">${vo.content}</textarea>
    <br>
    <button type="button" id="btnList">목록으로</button>
    <button type="button" id="btnUpdate">수정</button>

<script src="/JS/jquery-3.7.0.min.js"></script>

<script>
(()=>{   

    let myContent = false;
    const txtTitle = document.querySelector('#txtTitle');
    const txtContent = document.querySelector('#txtContent');
    const btnList = document.querySelector('#btnList');
    const btnUpdate = document.querySelector('#btnUpdate');

    
    //////////////////////////////////////////////////////////////////////
    // 함수

    const checkMyContent = function()
    {
        // 현재 로그인한 아이디와 글의 아이디가 같을 때
        if ('${session.userId}' === '${vo.userId}')
        {
            myContent = true;
        }
        else
        {
            myContent = false;
        }
    }

    const setUiObject = function()
    {
        // 내 컨텐츠가 아니라면 읽기만 가능
        if (myContent === false)
        {
            // 타이틀과 컨텐츠를 readOnly.
            txtTitle.setAttribute('readonly', 'readonly');
            txtContent.setAttribute('readonly', 'readonly');

            // 수정버튼을 disable
            btnUpdate.setAttribute('disabled', 'disabled');
        }
    }

    //////////////////////////////////////////////////////////////////////
    // 이벤트 핸들러

    btnList.addEventListener('click', ()=>{
        location.href='/index';
        // history.back();
    });

    btnUpdate.addEventListener('click', ()=>{
        
        // 던질 데이터를 마련한다. (id, seq, title, content)
        let requestData = {
            userId : '${vo.userId}',
            seq : '${vo.seq}',
            title : txtTitle.value,
            content : txtContent.value
        };

        let xhr = new XMLHttpRequest();

        xhr.open('POST', '/bbs/content', true);
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
                        alert('수정되었습니다.');
                        location.href = '/index';
                    } 
                    else 
                    {
                        alert('수정에 실패하였습니다.');
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
        //     url : '/bbs/content',
        //     type : 'POST',
        //     data : requestData,
        //     success : function(data)    
        //     {
        //         if (data === "OK")
        //         {
        //             alert('수정되었습니다.');
        //         }
        //         else
        //         {
        //             alert('수정에 실패하였습니다.');
        //         }
        //     }

        // });

    });



    //////////////////////////////////////////////////////////////////////
    // 호출부

    checkMyContent(); // 내 컨텐츠니? 맞으면 myContent => true
    setUiObject();
    
        
})(); 
</script>
        
</body>