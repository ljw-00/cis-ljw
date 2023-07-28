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
    


<script src="/JS/jquery-3.7.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
(()=>{   

    const spnMyPage = document.querySelector('#spnMyPage');

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