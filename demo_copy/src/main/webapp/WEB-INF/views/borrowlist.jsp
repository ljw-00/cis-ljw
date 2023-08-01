<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>borrow list</title>
</head>
<body>
    <h1>대출 목록</h1>
    <button type="button" id="btnBack">뒤로 가기</button>

    <table>
        <tr>
            <th>도서명</th>
            <th>대출일</th>
            <th>반납예정일</th>
            <th>연장</th>
            <th>반납</th>
        </tr>
        <c:forEach items="${book}" var="book">
            <tr>
                <td>${book.title}</td>
                <td>${book.brDate.split(' ')[0]}</td>
                <td>${book.dueDate.split(' ')[0]}</td>
                <td><button type="button" id="btnRenew" data-isbn="${book.isbn}">연장하기</button></td>
                <td><button type="button" id="btnReturn" data-isbn="${book.isbn}">반납하기</button></td>
            </tr>
        </c:forEach>
    </table>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   
    const btnBack = document.querySelector('#btnBack');
    const btnRenewList = document.querySelectorAll('#btnRenew');
    const btnReturnList = document.querySelectorAll('#btnReturn');
    

    ///////////////////////////////////////////////////////////////
    // 이벤트 핸들러

    // 연장
    btnRenewList.forEach((btnRenew) => {
        btnRenew.addEventListener('click', () => {
            const bookTitle = btnRenew.parentNode.parentNode.querySelector('td:first-child').textContent;

            if (confirm(bookTitle + "을(를) 연장하시겠습니까?"))
            {
                let isbn = btnRenew.getAttribute('data-isbn');

                let httpRequest = new XMLHttpRequest();
                httpRequest.open('POST', '/renew', true);
                httpRequest.setRequestHeader('content-type', 'application/json');
                    
                httpRequest.onreadystatechange = function()
                {
                    if(httpRequest.readyState !== XMLHttpRequest.DONE)
                        return;
        
                    if (httpRequest.status === 200)
                    {
                        let result = httpRequest.responseText;
        
                        if (result == "OK")
                        {
                            alert("연장에 성공하였습니다.");
                        }
                        else if (result === "$EXIST")
                        {
                            alert("이미 연장한 도서입니다.");
                        }
                        else
                        {
                            alert("연장에 실패하였습니다. 예약자가 있는 도서입니다.");
                        }
                    }
                    else
                    {
                        console.error(httpRequest.status, httpRequest.statusText);
                    }
                }
        
                let requestData = {
                    isbn : isbn,
                    renew : 'T',
                    userId : '${vo.userId}'
                }
        
                httpRequest.send(JSON.stringify(requestData));
            }
        });
    });

    // 반납
    btnReturnList.forEach((btnReturn) => {
        btnReturn.addEventListener('click', () => {
            const bookTitle = btnReturn.parentNode.parentNode.querySelector('td:first-child').textContent;

            if (confirm(bookTitle + "을(를) 반납하시겠습니까?"))
            {
                let isbn = btnReturn.getAttribute('data-isbn');

                let httpRequest = new XMLHttpRequest();
                httpRequest.open('POST', '/returnBook', true);
                httpRequest.setRequestHeader('content-type', 'application/json');
                    
                // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
                httpRequest.onreadystatechange = function()
                {
                    if(httpRequest.readyState !== XMLHttpRequest.DONE)
                        return;

                    if (httpRequest.status === 200)
                    {
                        let result = httpRequest.responseText;

                        if (result === "OK")
                        {
                            alert("반납에 성공하였습니다.");
                        }
                        else
                        {
                            alert("반납에 실패하였습니다.");
                        }
                    }
                    else
                    {
                        console.error(httpRequest.status, httpRequest.statusText);
                    }
                }

                let requestData = {
                    isbn : isbn,
                    userId : '${vo.userId}',
                    brCode : isbn + "-" + "${vo.userId}",
                    title : bookTitle,
                    renew : "F"
                }

                httpRequest.send(JSON.stringify(requestData));
            }

        });
    });

    btnBack.addEventListener('click', ()=>{
        history.back();
    });

})(); 
</script>
        
</body>
</html>