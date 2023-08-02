package com.example.demo.reserve;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.borrow.BorrowDAO;

@Controller
public class ReserveController {

    @Autowired
    ReserveDAO reserveDAO;

    @Autowired
    BorrowDAO borrowDAO;
    
    @PostMapping("/reserveBook")
    @ResponseBody
    public String reserveBook(@RequestBody ReserveTblVO vo) throws Exception
    {
        int rsCount = reserveDAO.selectReserveCount(vo);
        
        if (rsCount == 5)
        {
            return "$MAX";
        }

        int resultCount = reserveDAO.insertOneReserve(vo);
        
        if (resultCount == 1)
        {
            return "OK";
        }
        else
        {
            return "$FAIL";
        }
    }

    @PostMapping("/cancelReservation")
    @ResponseBody
    public String cancelReservation(@RequestBody ReserveTblVO vo) throws Exception
    {
        int calcelCount = reserveDAO.deleteOneReserve(vo);

        if (calcelCount == 1)
        {
            return "OK";
        }
        else
        {
            return "$FAIL";
        }        
    }
}
