<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <h1>카카오 도서검색 api</h1>
    <input type="text" id="txtSearch">
    <button type="button" id="btnSearch">검색</button>
    <p></p>

    

 
<script src="https://code.jquery.com/jquery-3.7.0.js"
integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
crossorigin="anonymous"></script>
<script>
(()=>{   
    const txtSearch = document.querySelector('#txtSearch');
    const btnSearch = document.querySelector('#btnSearch');

    btnSearch.addEventListener('click', ()=>{
        $.ajax({
        method: "GET",
        url: "https://dapi.kakao.com/v3/search/book?target=title",
        data: { query : txtSearch.value, size : 50 },
        headers : {Authorization: "KakaoAK 27cc37decd437b74c8776ca9cc6cb4e0" }
    
    })
    .done(function( msg ) {
        console.log(msg)

        for (let i = 0; i < msg.documents.length; i++)
        {
            $( "\p" ).append( "<strong>"+msg.documents[i].title+"</strong>");
            $( "\p" ).append( "<img src='"+msg.documents[i].thumbnail+"'/>");
        }

    });
    });

    
})(); 
</script>
        
</body>