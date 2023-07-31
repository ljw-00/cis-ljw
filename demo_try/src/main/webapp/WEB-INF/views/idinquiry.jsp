<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>idInquiry</title>
<style>
    #img-container {
        width: 70%;
        height: 969px;
        float: left;
        overflow: hidden;
    }
    #img-container img {
        width: 100%;
        height: auto;
    }
    #id-container {
        width: 30%;
        float: right;
        padding: 80px 40px;
    }
    h3 {
        font-size : 24px;
        font-weight : bold;
        margin-bottom: 28px;
    }
</style>
</head>
<body>
    <div id="img-container">
        <img src="https://cdn.pixabay.com/photo/2017/08/06/22/01/books-2596809_1280.jpg" alt="도서관">
    </div>

    <div id="id-container">
        <h3>ID 찾기</h3>

        <div class="form-floating mb-2">
            <input type="eamil" class="form-control" name="email" id="txtEmail" placeholder="#">
            <label for="txtEmail">이메일을 입력하세요</label>
        </div>

        <button type="button" id="btnSubmit" class="btn btn-warning">찾기</button>
    </div>


<script src="/JS/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
(()=>{   
    const txtEmail = document.querySelector('#txtEmail');
    const btnSubmit = document.querySelector('#btnSubmit');
    // const btnBack = document.querySelector('#btnBack');

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
                        alert(data);
                        location.href = "/login";
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

    // btnBack.addEventListener('click', ()=>{
    //     history.back();
    // });
        
})(); 
</script>
        
</body>