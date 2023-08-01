package com.example.demo.member;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class MemberVO 
{
    private String memberId;
    private String memberPw;
    private String email;
    private String name;
    private String fileCode;

    @JsonIgnore     // memberVO를 JSON으로 만들때 thumbnail은 생략하세요.
    private MultipartFile thumbnail;
    
}
