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
        border: 1px solid red;
    }
    #thumbnail {
        float: left;
        width: 10%;
    }
    #list-body {
        width: 87%;
        float: right; 
        margin-left: 3%;
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
                            <a href="#">
                                <img src="${book.image}" alt="${book.title}" style="width:100px;">
                            </a>
                        </div>
                        <div id="list-body">
                            <div id="flexbox">
                                <!-- 책제목 -->
                                <a href="#" id="title">${book.title}</a>
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
                                <span>대출가능</span>
                                <label>예약가능여부: </label>
                                <span>예약불가</span>
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
    
    btnSearch.addEventListener('click', ()=>{
        let queryString = "?text=" + txtSearch.value;
        location.href = "/book/booklist" + queryString;
    });
        
})(); 
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
