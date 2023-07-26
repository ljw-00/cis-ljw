package com.study.board.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookController {
    
    @GetMapping("/book/search")
    public String search()
    {
        return "book/search";
    }
}
