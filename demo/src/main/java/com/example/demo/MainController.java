package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/index")
    public String index(Model model) throws Exception
    {
        // 1. index를 요청한 대상에 세션이 존재하는지 여부 확인
        //    USER라는 대상의 VO를 가져옴
        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        if (userTblVO != null)
        {
            // 2-1. 세션O : model에 사용자 정보 저장 후 index.jsp로 전송
            model.addAttribute("vo", userTblVO);
        }

        // 2-2. 세션X : 정보 전송 없이 index.jsp 전송
        return "index";
    }
    
}
