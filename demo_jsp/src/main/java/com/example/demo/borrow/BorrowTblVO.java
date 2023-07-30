package com.example.demo.borrow;

import lombok.Data;

@Data
public class BorrowTblVO {

    private String brCode;
    private String isbn;
    private String title;
    private String userId;
    private String brDate;
    private String dueDate;
    private String renew;

}
