package com.example.demo.user;

import lombok.Data;

@Data
public class UserTblVO {
    
    private String userId;
    private String userPw;
    private String name;
    private String email;
    private String address;
    private String phoneNumber;
    private String birthDate;
    
}
