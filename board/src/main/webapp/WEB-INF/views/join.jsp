<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <h1>회원가입</h1>
    <table>
        <tr>
            <td><label for="txtUserId">아이디</label></td>
            <td><input type="text" id="txtUserId" name="userId"> <button type="button" id="btnCheckId">중복확인</button></td>
        </tr>
        <tr>
            <td><label for="txtUserPw">비밀번호</label></td>            
            <td><input id="txtUserPw" type="password" name="userPw"></td>            
        </tr>
        <tr>
            <td><label for="txtCheckPw">비밀번호확인</label></td>
            <td><input  id="txtCheckPw" type="password"></td>
        </tr>
        <tr>
            <td><label for="txtName">이름</label></td>
            <td><input type="text" id="txtName" name="name"></td>
        </tr>
        <tr>
            <td><label for="txtEmail">이메일</label></td>
            <td><input type="eamil" id="txtEmail" name="email"></td>
        </tr>
        <tr>
            <td><label for="sample6_postcode">주소</label></td>
            <td>
                <input type="text" id="sample6_postcode" placeholder="우편번호">
                <!-- onclick="sample6_execDaumPostcode()" -->
                <input type="button" id="btnFindNo" value="우편번호 찾기">
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="text" id="sample6_address" placeholder="주소"><br>
                <input type="text" id="sample6_detailAddress" placeholder="상세주소">
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="text" id="sample6_extraAddress" placeholder="참고항목">
            </td>
        </tr>
    </table>
    <br><br>
    <button type="button" style="width: 280px;" id="btnJoin">회원가입</button>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/JS/jquery-3.7.0.min.js"></script>

<script>
(()=>{  
    
    const txtUserId = document.querySelector('#txtUserId');
    const btnCheckId = document.querySelector('#btnCheckId');
    const txtUserPw = document.querySelector('#txtUserPw');
    const txtCheckPw = document.querySelector('#txtCheckPw');
    const txtName = document.querySelector('#txtName');
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

        // 3. 아이디부터 이메일까지 공백 확인
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

        if (txtEmail.value.length === 0){
            alert('이메일을 넣어주세요.');
            txtEmail.focus();
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
        txtEmail.value = '';

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

        $.ajax({
            url : '/checkid',
            type : 'POST',
            data : requestData, // 무조건 객체로 날려야 함(key-value 형식)
            success : function(data)    
            {
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
        });
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
            email : txtEmail.value,
            address : postcode.value + " " + address.value + " " + detailAddress.value + " " + extraAddress.value
        };

        $.ajax({
            url : '/join',
            type : 'POST',
            data : requestData,
            success : function(data)    
            {
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
        });
        
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