package com.example.demo.book;

import lombok.Data;

@Data
public class BookVO 
{
    private String title;	    //	책 제목
    private String link;        //	네이버 도서 정보 URL
    private String image;       //	섬네일 이미지의 URL
    private String author;	    //	저자 이름
    private String discount;	//	판매 가격. 가격이 없으면 값을 반환X
    private String publisher;	//	출판사
    private String isbn;	    //	ISBN
    private String description;	//	네이버 도서의 책 소개
    private String pubdate;	    //	출간일

}
