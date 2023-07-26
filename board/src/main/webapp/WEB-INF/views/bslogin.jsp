<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title></title>
<style>
    h1 {
        text-align: center;
        margin-top: 30px;
        margin-bottom : 20px;
    }
    .login-container {
        border: 1px solid gray;
        width: 500px;
        margin: 0 auto;
        padding: 10px;
        border-radius: 10px;
    }
    .my-button {
        width: 100%;
        height: 50px;
        margin: 10px auto 0;
    }
    .sub-container {
        width: 500px;
        margin: 20px auto;
    }
    
</style>
</head>
<body>
    <h1>Login</h1>
    <div class="login-container">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="txtUserId" placeholder="#">
            <label for="txtUserId">ID</label>
        </div>

        <div class="form-floating">
            <input type="password" class="form-control" id="txtUserPw" placeholder="#">
            <label for="txtUserPw">Password</label>
        </div>

        <button type="button" class="btn btn-success my-button">Login</button>
    </div>

    <div class="d-flex justify-content-between sub-container">
        <button type="button" class="btn btn-link">비밀번호 찾기</button>
        <button type="button" class="btn btn-link">아이디 찾기</button>
        <button type="button" class="btn btn-link">회원가입</button>
    </div>

    

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
(()=>{   
    
})(); 
</script>
        
</body>