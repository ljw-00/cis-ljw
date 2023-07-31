package com.example.demo.borrow;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.common.GmailSender;
import com.example.demo.reserve.ReserveDAO;
import com.example.demo.reserve.ReserveTblVO;
import com.example.demo.review.ReviewDAO;
import com.example.demo.review.ReviewTblVO;
import com.example.demo.user.UserDAO;
import com.example.demo.user.UserTblVO;

@Controller
public class BorrowController {

    @Autowired
    BorrowDAO borrowDAO;

    @Autowired
    ReviewDAO reviewDAO;

    @Autowired
    ReserveDAO reserveDAO;

    @Autowired
    UserDAO userDAO;

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
        rsVO = reserveDAO.selectOneReserveUser(rsVO);

        // 예약 없다면 바로 삭제
        if (rsVO == null)
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
            // 1. 대출테이블에서 해당 대출자의 정보 삭제
            int deleteCount = borrowDAO.deleteOneBorrow(brVO);

            if (deleteCount == 1)
            {
                // 가장 작은 SEQ 값에 해당하는 예약자의 정보를 brVO에 복사
                BeanUtils.copyProperties(rsVO, brVO);

                // 2. 복사된 예약자 정보를 대출테이블에 추가
                int insertCount = borrowDAO.insertOneBorrow(brVO);

                if (insertCount == 1)
                {
                    // 3. 자동대출 완료된 사용자는 예약테이블에서 삭제
                    int rsDeleteCount = reserveDAO.deleteOneReserve(rsVO);

                    if (rsDeleteCount == 1)
                    {
                        String senderName = "jwuuuuu6363@gmail.com";
                        String senderPasswd = "roulhlkadlzqvvsz";
                        GmailSender gmailSender = null;
                        
                        if (rsVO != null)
                        {
                            // UserTbl에서 이메일 가져오기
                            UserTblVO userTblVO = new UserTblVO();
                            userTblVO.setUserId(rsVO.getUserId());
                            userTblVO = userDAO.selectOnePw(userTblVO);
                            String userEmail = userTblVO.getEmail();

                            // BorrowTbl에서 책제목 가져오기
                            BorrowTblVO newBrVO = new BorrowTblVO();
                            newBrVO.setUserId(rsVO.getUserId());
                            newBrVO.setIsbn(rsVO.getIsbn());
                            newBrVO = borrowDAO.checkBorrowUser(newBrVO);
                            String title = newBrVO.getTitle();

                            // 자동대출 알림을 메일로 전송
                            gmailSender = new GmailSender(senderName, senderPasswd);

                            // 1param : 받을 사람의 이메일 주소
                            // 2param : 메일 제목
                            // 3param : 메일 내용
                            gmailSender.sendEmail(userEmail, "온라인 도서관", "예약하신 책 '" + title + "'이(가) 반납되어 자동 대출되었음을 알려드립니다.");

                            return "OK";
                        }
                        else
                        {
                            return "$FAIL";
                        }
                    }
                    else
                    {
                        return "$FAIL";
                    }
                }
                else
                {
                    return "$FAIL";
                }
            }
            else
            {
                return "$FAIL";
            }
        }        
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