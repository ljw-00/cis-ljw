package com.study.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.board.bbs.BbsTblVO;
import com.study.board.common.GmailSender;
import com.study.board.common.SessionUtil;
import com.study.board.user.UserDAO;
import com.study.board.user.UserTblVO;

@Controller
public class MainController {
    
    @Autowired
    UserDAO userDAO;
    
    @GetMapping("/index")
    public String index(Model model) throws Exception
    {
        // 1. 요청한 놈이 세션이 있냐?
        UserTblVO userTblVO = (UserTblVO) SessionUtil.getAttribute("USER");

        // 2. 만약에 세션이 있다면 model에 사용자 정보를 저장해서 index.jsp로 보내준다.
        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);
        }

        return "index";
    }

    @GetMapping("/login")
    public String login()
    {
        return "login";
    }

    // 아이디 패스워드를 넘겨서 로그인을 실제로 처리해 달라는 요청
    @PostMapping("/login")
    @ResponseBody
    // public String login(@ModelAttribute("UserTblVO") UserTblVO vo, HttpServletRequest request) throws Exception
    public String login(@RequestBody UserTblVO vo, HttpServletRequest request) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOneUser(vo);

        if (resultVO == null)
        {
            return "FAIL";   
        }
        else
        {
            // 세션(로그인한 정보)을 저장한다.
            SessionUtil.set(request, "USER", resultVO);
            return "OK";
        }
    }

    @GetMapping("/logout")
    public void logout(HttpServletRequest request,
                        HttpServletResponse response) throws Exception
    {
        SessionUtil.remove(request, "USER");
        response.sendRedirect("index");
    }

    @GetMapping("/join")
    public String join()
    {
        return "join";
    }

    @PostMapping("/join")
    @ResponseBody
    public String join(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    {
        // DB에 insert 시켜준다.
        int insertCount = userDAO.insertOneUser(vo);

        if (insertCount == 1)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }
    }

    @PostMapping("/checkid")
    @ResponseBody
    public String checkId(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    {
        // 1. 넘어온 데이터(ID)와 일치하는 유저가 DB에 존재하는지 확인
        UserTblVO resultVO = userDAO.selectOneUser(vo);

        // 2. 일치하는 정보가 없다면 회원가입 허용
        if (resultVO == null)
        {
            return "OK";
        }
        else
        {
            return "FAIL";
        }
    }

    @GetMapping("/idinquiry")
    public String idInquiry()
    {
        return "idinquiry";
    }

    @PostMapping("/idinquiry")
    @ResponseBody
    // public String idInquiry(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    public String idInquiry(@RequestBody UserTblVO vo) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOneId(vo);

        if (resultVO != null)
        {
            String id = resultVO.getUserId();
            String editedId = id.substring(0, id.length() - 2) + "**";
            return editedId;
        }
        else
        {
            return "$FAIL";
        }
    }

    @GetMapping("/pwinquiry")
    public String pwInquiry()
    {
        return "pwinquiry";
    }

    @PostMapping("/pwinquiry")
    @ResponseBody
    // public String pwInquiry(@ModelAttribute("UserTblVO") UserTblVO vo) throws Exception
    public String pwInquiry(@RequestBody UserTblVO vo) throws Exception
    {
        UserTblVO resultVO = userDAO.selectOnePw(vo);

        String senderName = "jwuuuuu6363@gmail.com";
        String senderPasswd = "roulhlkadlzqvvsz";
        GmailSender gmailSender = null;
        
        if (resultVO != null)
        {
            // 비밀번호를 메일로 전송
            gmailSender = new GmailSender(senderName, senderPasswd);

            // 1param : 받을 사람의 이메일 주소
            // 2param : 메일 제목
            // 3param : 메일 내용
            gmailSender.sendEmail(resultVO.getEmail(), "비밀번호입니다.", "비밀번호 : " + resultVO.getUserPw());

            return "$OK";
        }
        else
        {
            return "$FAIL";
        }
        
    }

    @GetMapping("/bslogin")
    public String bsLogin()
    {
        return "bslogin";
    }

    @GetMapping("/bstable")
    public String bsTable()
    {
        return "bstable";
    }

}
