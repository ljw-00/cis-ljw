<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title></title>
<style>
    a {
        text-decoration: none;
    }
    #book-container {
        width: 1200px;
        margin: 0 auto;
    }
    #frm {
        padding-top: 150px;
        width: 60%;
        margin: 0 auto;
    }
    #txtSearch, #btnSearch {
        height: 60px;
    }
    .bar {
        display: inline-block;
        width: 1px;
        height: 10px;
        margin: 0 5px;
        background-color: #ccc;
        vertical-align: middle;
    }
    #tblBook {
        margin-top: 150px;
        border-top: 1px solid #5e6062;
    }
    #tblBook tr td {
        padding: 20px 0;
        border-bottom: 1px solid #dedede;
        height: 180px;
    }
    #thumbnail {
        float: left;
        width: 10%;
    }
    #list-body {
        width: 87%;
        float: right; 
        margin-left: 3%;
        letter-spacing: -1px;
    }
    #title {
        font-size: 120%;
        color: #555;
        font-weight: bold;
    }
    #app {
        padding: 7px 0;
        color: #888;
        font-size: 90%;
    }
    #desc {
        color: #666;
        font-size: 90%;
        width: 100%;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2; /* 라인수 */
        height: 2.8em; /* 라인수에 맞춰 길이 정해줘야함 */
        -webkit-box-orient: vertical;
        /* word-wrap:break-word; */
        line-height: 1.2em;
        padding: 3px 0;
    }
    #meta {
        padding-top: 10px;
        color: #666;
        font-size: 90%;
    }
    #meta span {
        color: #888;
    }
</style>
</head>
<body>
    <div id="book-container">
        <form id="frm" class="d-flex" role="search">
            <input id="txtSearch" class="form-control me-2" type="text" placeholder="검색어를 입력하세요." aria-label="Search">
            <button id="btnSearch" class="btn btn-outline-success" type="button">Search</button>
        </form>
    
        <table id="tblBook">
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>
                        <div id="thumbnail">
                            <a href="/book/bookinfo?isbn=${book.isbn}">
                                <img src="${book.image}" alt="${book.title}" style="width:100px;">
                            </a>
                        </div>
                        <div id="list-body">
                            <div id="flexbox">
                                <!-- 책제목 -->
                                <a href="/book/bookinfo?isbn=${book.isbn}" id="title">${book.title}</a>
                                <!-- 작가, 출판사, 출간일 -->
                                <div id="app">
                                    <span>${book.author}</span>
                                    <span class="bar">&nbsp;</span>
                                    <span>${book.publisher}</span>
                                    <span class="bar">&nbsp;</span>
                                    <span>${book.pubdate}</span>
                                </div>
                                <!-- 책소개 -->
                                <span id="desc">${book.description}</span>
                            </div>
        
                            <div id="meta">
                                <label>대출가능여부: </label>
                                <span id="">${book.brCondition}</span>
                                <span class="bar">&nbsp;</span>
                                <label>예약가능여부: </label>
                                <span id="">${book.rsCondition}</span>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
<script>
(()=>{  

    const txtSearch = document.querySelector('#txtSearch');
    const btnSearch = document.querySelector('#btnSearch');
    const title = document.querySelector('#title');
    
    btnSearch.addEventListener('click', ()=>{
        let queryString = "?text=" + txtSearch.value;
        location.href = "/book/booklist" + queryString;
    });

    // 엔터 키 눌렀을 때 검색 화면으로 이동
    txtSearch.addEventListener('keydown', (event) => {
        // event.keyCode를 사용하여 엔터 키(키코드 13)를 확인합니다.
        if (event.keyCode === 13) {
        // 엔터 키를 눌렀을 때 실행할 코드를 작성합니다.
        event.preventDefault();

        let queryString = "?text=" + txtSearch.value;
        location.href = "/book/booklist" + queryString;
        }
    });
     
})(); 
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>