package com.example.demo.borrow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.review.ReviewDAO;
import com.example.demo.review.ReviewTblVO;

@Controller
public class BorrowController {

    @Autowired
    BorrowDAO borrowDAO;

    @Autowired
    ReviewDAO reviewDAO;

    @PostMapping("/borrowBook")
    @ResponseBody
    public String borrowBook(@RequestBody BorrowTblVO vo, Model model) throws Exception
    {
        // 만약 사용자가 5권 이상 대출중이라면 return
        int borrowNum = borrowDAO.getBookCount(vo);

        if (borrowNum == 5)
        {
            return "$MAX";
        }

        // borrow 테이블에 존재하는지 확인
        // 존재한다면 BRSTATUS가 T(대출중)인지 F(대출가능)인지 확인
        BorrowTblVO resultVO = borrowDAO.selectBorrowData(vo);

        // borrow 테이블에 도서가 존재하는 경우
        if (resultVO != null)
        {
            // 1. 대출 가능 상태 : 대출 가능
            if (resultVO.getBrStatus() == "T")
            {
                int resultCount = borrowDAO.insertOneBorrow(vo);
        
                if (resultCount == 1)
                {
                    return "OK";
                }
                else
                {
                    return "$FAIL";
                }
            }
            // 2. 이미 대출 중인 책 : 대출 불가능
            else
            {
                return "$ALREADY";
            }
        }
        // borrow 테이블에 도서 존재하지 않는 경우
        else
        {
            int resultCount = borrowDAO.insertOneBorrow(vo);
        
            if (resultCount == 1)
            {
                return "OK";
            }
            else
            {
                return "$FAIL";
            }
        }
    }

    // 반납
    @PostMapping("/returnBook")
    @ResponseBody
    public String returnBook(@RequestBody BorrowTblVO vo) throws Exception
    {
        int updateVO = borrowDAO.updateBrStatus(vo);
        
        if (updateVO == 1)
        {
            // borrow 테이블에 존재하는지 확인
            // 존재한다면 BRSTATUS가 T(대출중)인지 F(반납)인지 확인
            BorrowTblVO resultVO = borrowDAO.selectBorrowData(vo);
            System.out.println(resultVO);

            if (resultVO != null)
            {
                if (resultVO.getBrStatus().equals("T"))
                {
                    int resultCount = borrowDAO.deleteOneBorrow(vo);
                    if (resultCount == 1)
                    {
                        return "OK";
                    }
                    else
                    {
                        return "$FAIL";
                    }
                }
            }
        }
        

        return "$FAIL";
    }

    @PostMapping("/writeReview")
    @ResponseBody
    public String writeReview(@RequestBody ReviewTblVO vo, Model model) throws Exception
    {
        ReviewTblVO isExistReview = reviewDAO.selectOneReviewById(vo);
        
        if (isExistReview != null)
        {
            return "$EXIST";
        }
        else
        {
            int resultCount = reviewDAO.insertOneReview(vo);
    
            if (resultCount == 1)
            {
                return "OK";
            }
            else
            {
                return "$FAIL";
            }
        }
    }
}