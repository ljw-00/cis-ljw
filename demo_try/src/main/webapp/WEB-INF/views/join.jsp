<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title></title>
<style>
    #img-container {
        width: 70%;
        height: 982px;
        float: left;
        overflow: hidden;
    }
    #img-container img {
        width: 100%;
        height: auto;
    }
    #join-container {
        width: 30%;
        float: right;
        padding: 40px;
    }
    h3 {
        font-size : 24px;
        font-weight : bold;
        margin-bottom: 28px;
    }
    #frmId{
        display: flex;
        justify-content: space-between;
        width: 100%;
    }
    #txtUserId {
        width: 80%;
    }
    #frmPostcode {
        display: flex;
        justify-content: space-between;
        width: 100%;
    }
    #sample6_postcode {
        width: 72%;
    }
    #btnJoin {
        width: 100%;
        height: 65px;
        margin-top: 40px;
    }
</style>
</head>
<body>
    <div id="img-container">
        <img src="https://cdn.pixabay.com/photo/2017/08/06/22/01/books-2596809_1280.jpg" alt="도서관">
    </div>
    <div id="join-container">
        <h3>회원가입</h3>

        <div id="frmId" class="form-floating mb-2">
            <input type="text" class="form-control" id="txtUserId" placeholder="#">
            <label for="txtUserId">아이디</label>
            <button type="button" id="btnCheckId" class="btn btn-warning">중복확인</button>
        </div>

        <div class="form-floating mb-2">
            <input type="password" class="form-control" id="txtUserPw" placeholder="#">
            <label for="txtUserPw">비밀번호</label>
        </div>

        <div class="form-floating mb-2">
            <input type="password" class="form-control" id="txtCheckPw" placeholder="#">
            <label for="txtCheckPw">비밀번호 확인</label>
        </div>

        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="txtName" placeholder="#">
            <label for="txtName">이름</label>
        </div>

        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="txtBirth" placeholder="#" value="EX)920727">
            <label for="txtBirth">생년월일</label>
        </div>

        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="txtPhone" placeholder="#" value="01012345678">
            <label for="txtPhone">핸드폰번호</label>
        </div>

        <div class="form-floating mb-2">
            <input type="eamil" class="form-control" id="txtEmail" placeholder="#">
            <label for="txtEmail">이메일</label>
        </div>

        <div id="frmPostcode" class="form-floating mb-2">
            <input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호">
            <label for="sample6_postcode">우편번호</label>
            <input type="button" id="btnFindNo" class="btn btn-warning" value="우편번호 찾기">
        </div>

        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="sample6_address" placeholder="주소">
            <label for="sample6_address">주소</label>
        </div>

        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
            <label for="sample6_detailAddress">상세주소</label>
        </div>

        <div class="form-floating mb-2">
            <input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목">
            <label for="sample6_extraAddress">참고항목</label>
        </div>

        <button type="button" id="btnJoin" class="btn btn-warning">회원가입</button>
    </div>
    
    

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/JS/jquery-3.7.0.min.js"></script>

<script>
(()=>{  
    
    const txtUserId = document.querySelector('#txtUserId');
    const btnCheckId = document.querySelector('#btnCheckId');
    const txtUserPw = document.querySelector('#txtUserPw');
    const txtCheckPw = document.querySelector('#txtCheckPw');
    const txtName = document.querySelector('#txtName');
    const txtBirth = document.querySelector('#txtBirth');
    const txtPhone = document.querySelector('#txtPhone');
    const txtEmail = document.querySelector('#txtEmail');
    
    // 주소
    const postcode = document.querySelector('#sample6_postcode');
    const address = document.querySelector('#sample6_address');
    const detailAddress = document.querySelector('#sample6_detailAddress');
    const extraAddress = document.querySelector('#sample6_extraAddress');

    const btnJoin = document.querySelector('#btnJoin');

    let idChecking = false;    // 중복확인을 통과하면 true로 변경
    let checkedId = '';

    /////////////////////////////////////////////////////////////////////////////////
    // 함수

    const checkJoinData = function()
    {
        // 1. 중복아이디 체크 여부 & 더블 체크
        if ((idChecking === false) || (checkedId != txtUserId.value))
        {
            alert('아이디 중복확인을 해주세요.');
            txtUserId.focus();
            return false;
        }

        // 2. 비밀번호, 비밀번호 확인 체크
        if (txtUserPw.value != txtCheckPw.value)
        {
            alert('비밀번호가 같지 않습니다.');
            txtCheckPw.focus();
            return false;
        }

        // 3. 공백 확인
        if (txtUserId.value.length === 0){
            alert('아이디를 넣어주세요.');
            txtUserId.focus();
            return false;
        }

        if (txtUserPw.value.length === 0){
            alert('비밀번호를 넣어주세요.');
            txtUserPw.focus();
            return false;
        }

        if (txtCheckPw.value.length === 0){
            alert('비밀번호 확인을 넣어주세요.');
            txtCheckPw.focus();
            return false;
        }

        if (txtName.value.length === 0){
            alert('이름을 넣어주세요.');
            txtName.focus();
            return false;
        }

        if (txtBirth.value.length === 0){
            alert('생년월일을 넣어주세요.');
            txtBirth.focus();
            return false;
        }

        if (txtPhone.value.length === 0){
            alert('핸드폰번호를 넣어주세요.');
            txtPhone.focus();
            return false;
        }

        if (txtEmail.value.length === 0){
            alert('이메일을 넣어주세요.');
            txtEmail.focus();
            return false;
        }

        if ((postcode.value.length === 0) || (address.value.length === 0) || (detailAddress.value.length === 0) || (extraAddress.value.length === 0)){
            alert('주소를 넣어주세요.');
            postcode.focus();
            return false;
        }

        return true;

    }

    const resetPage = function()
    {
        txtUserId.value = '';
        txtUserPw.value = '';
        txtCheckPw.value = '';
        txtName.value = '';
        txtBirth.value = '';
        txtPhone.value = '';
        txtEmail.value = '';
        postcode.value = '';
        address.value = '';
        detailAddress.value = '';
        extraAddress.value = '';

        idChecking = false;
        checkedId = '';
    }


    /////////////////////////////////////////////////////////////////////////////////
    // 이벤트 핸들러

    // 중복확인
    btnCheckId.addEventListener('click', ()=>{

        if (txtUserId.value.length === 0)
        {
            alert('아이디를 입력해주세요.');
            txtUserId.focus();
            return;
        }

        // 1. 아이디를 가지고 온다.
        // 2. 아이디를 서버에 전송한다.
        // 3. 결과를 받는다.
            // 3-1. 중복 O --> alert('존재하는 아이디입니다.');
                // checkId 값을 true;
            // 3-2. 중복 X --> alert('사용 가능한 아이디입니다.');

        let id = txtUserId.value;

        let requestData = {
            userId : id     // userId : VO에 있는 이름과 똑같아야 함
        };

        let xhr = new XMLHttpRequest();

        xhr.open('POST', '/checkid', true);
        xhr.setRequestHeader('Content-Type', 'application/json');

        xhr.onreadystatechange = function () 
        {
            if (xhr.readyState === XMLHttpRequest.DONE)
            {
                if (xhr.status === 200) 
                {
                    let data = xhr.responseText;
                    if (data === "OK")
                    {
                        alert('사용 가능한 아이디입니다.');
                        idChecking = true;
                        checkedId = txtUserId.value;
                        txtUserPw.focus();
                    } 
                    else 
                    {
                        alert('존재하는 아이디입니다.');
                        idChecking = false;
                        txtUserId.value = '';
                        txtUserId.focus();
                    }
                } 
                else
                {
                    console.error('Request failed with status: ' + xhr.status);
                }
            }
        };

        xhr.send(JSON.stringify(requestData));
    });

    btnJoin.addEventListener('click', ()=>{

        if (checkJoinData() === false)
        {
            return;
        }

        let requestData = {
            userId : txtUserId.value,
            userPw : txtUserPw.value,
            name : txtName.value,
            phoneNumber : txtPhone.value,
            birthDate : txtBirth.value,
            email : txtEmail.value,
            address : postcode.value + " " + address.value + " " + detailAddress.value + " " + extraAddress.value
        };

        let xhr = new XMLHttpRequest();

        xhr.open('POST', '/join', true);
        xhr.setRequestHeader('Content-Type', 'application/json');

        xhr.onreadystatechange = function () 
        {
            if (xhr.readyState === XMLHttpRequest.DONE)
            {
                if (xhr.status === 200) 
                {
                    let data = xhr.responseText;
                    if (data === "OK")
                    {
                        alert('회원가입 완료, 로그인 해주세요.');
                        location.href = '/login';
                    } 
                    else 
                    {
                        alert('회원가입 실패');
                        resetPage();
                    }
                } 
                else
                {
                    console.error('Request failed with status: ' + xhr.status);
                }
            }
        };

        xhr.send(JSON.stringify(requestData));
    });


})(); 
</script>
<script>
    const btnFindNo = document.querySelector('#btnFindNo');

    btnFindNo.addEventListener('click', ()=>{
        sample6_execDaumPostcode();
    });

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
        
</body>