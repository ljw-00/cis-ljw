<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div>
        <span id="spnMyPage"></span>
        <button type="button" id="btnLogout">로그아웃</button>
    </div>

    <table border="1">
        <tr>
            <th>기본 설정</th>
        </tr>
        <tr>
            <td><a href="#">내 정보 관리</a></td>
        </tr>

        <tr>
            <th>책 관리</th>
        </tr>
        <tr>
            <td><a href="#" id="brList">대출 목록</a></td>
        </tr>

        <tr>
            <th>서비스 안내</th>
        </tr>
        <tr>
            <td><a href="#">공지사항</a></td>
        </tr>
    </table>
    


<script src="/JS/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
(()=>{   

    const spnMyPage = document.querySelector('#spnMyPage');
    const brList = document.querySelector('#brList');


    ///////////////////////////////////////////////////////////////
    // 이벤트 핸들러

    brList.addEventListener('click', ()=>{
        location.href="/borrowlist";
    });


    ///////////////////////////////////////////////////////////////
    // 함수

    const setMyPageMsg = function()
    {
        spnMyPage.textContent = '${vo.name}님의 마이페이지';
    }

    btnLogout.addEventListener('click', ()=>{
        location.href = '/logout';
    })

    setMyPageMsg();

})(); 
</script>
        
</body>
</html>