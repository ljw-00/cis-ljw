package com.example.demo.borrow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.reserve.ReserveDAO;
import com.example.demo.reserve.ReserveTblVO;
import com.example.demo.review.ReviewDAO;
import com.example.demo.review.ReviewTblVO;

@Controller
public class BorrowController {

    @Autowired
    BorrowDAO borrowDAO;

    @Autowired
    ReviewDAO reviewDAO;

    @Autowired
    ReserveDAO reserveDAO;

    @PostMapping("/borrowBook")
    @ResponseBody
    public String borrowBook(@RequestBody BorrowTblVO vo, Model model) throws Exception
    {
        // 이미 5권 이상 대출 중인 유저 = return $MAX;
        Integer borrowNum = borrowDAO.getBookCount(vo);
        if (borrowNum == 5)
        {
            return "$MAX";
        }
        
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

    // 반납
    @PostMapping("/returnBook")
    @ResponseBody
    public String returnBook(@RequestBody BorrowTblVO brVO) throws Exception
    {
        // 반납하려는 도서의 isbn으로 예약 테이블을 조회해서 가져온 목록 중 
        // 가장 작은 SEQ 값에 해당하는 유저 정보를 reserveTblVO에 저장
        ReserveTblVO rsVO = new ReserveTblVO();
        rsVO.setIsbn(brVO.getIsbn());
        ReserveTblVO reserveTblVO = reserveDAO.selectOneReserveUser(rsVO);

        // 예약 없다면 바로 삭제
        if (reserveTblVO == null)
        {
            int deleteCount = borrowDAO.deleteOneBorrow(brVO);
            
            if (deleteCount == 1)
            {
                return "OK";
            }
            else
            {
                return "$FAIL";
            }
        }
        // 예약 존재하는 경우
        else
        {

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