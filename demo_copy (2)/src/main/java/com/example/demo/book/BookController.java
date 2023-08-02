package com.example.demo.book;

import java.io.StringReader;
import java.net.URI;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.example.demo.borrow.BorrowDAO;
import com.example.demo.borrow.BorrowTblVO;
import com.example.demo.common.SessionUtil;
import com.example.demo.reserve.ReserveDAO;
import com.example.demo.reserve.ReserveTblVO;
import com.example.demo.review.ReviewDAO;
import com.example.demo.review.ReviewTblVO;
import com.example.demo.user.UserTblVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BookController {

    @Autowired
    ReviewDAO reviewDAO;

    @Autowired
    BorrowDAO borrowDAO;

    @Autowired
    ReserveDAO reserveDAO;

    @GetMapping("/book/booklist")
    public String bookList(String text, Model model) throws Exception 
    {      
        // 네이버 검색 API 요청
		String clientId = "48nxdPZ14ojZRBfJ7zW7"; 		
        String clientSecret = "tO37rq0RyH";

        if ((text == null) || (text.length() ==0))
        {
            return  "book/booklist";
        }
        
        //String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // JSON 결과
        URI uri = UriComponentsBuilder
        		  .fromUriString("https://openapi.naver.com")
        		  .path("/v1/search/book.json")
        		  .queryParam("query", text)
        		  .queryParam("display", 10)
        		  .queryParam("start", 1)
        		  .queryParam("sort", "sim")
        		  .encode()
        		  .build()
        		  .toUri();
        		  
        // Spring에서 HTTP 요청을 나타내는 클래스 : RequestEntity 
        RequestEntity<Void> req = RequestEntity
        						 .get(uri)
        						 .header("X-Naver-Client-Id", clientId)
        						 .header("X-Naver-Client-Secret", clientSecret)
        						 .build();

        // Spring 제공 restTemplate
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
        
        // JSON 파싱 (Json 문자열을 객체로 만듦, 문서화)
        ObjectMapper om = new ObjectMapper();
        NaverResultVO resultVO = null;
        
        try {
        	resultVO = om.readValue(resp.getBody(), NaverResultVO.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
        
        List<BookVO> books = resultVO.getItems();	// books를 list.html에 출력 -> model 선언

        for (int i = 0; i < books.size(); i++)
        {
            BookVO book = books.get(i);
            String isbn = book.getIsbn();

            ReserveTblVO reserveTblVO = new ReserveTblVO();
            reserveTblVO.setIsbn(isbn);
            Integer borrowCount = borrowDAO.selectBorrowCount(reserveTblVO);
            Integer reserveCount = reserveDAO.selectReserveCount(reserveTblVO);

            if (borrowCount < 5)
            {
                book.setBrCondition("대출가능");
            }
            else
            {
                book.setBrCondition("대출불가");
            }

            if (reserveCount < 5)
            {
                book.setRsCondition("예약가능");
            }
            else
            {
                book.setRsCondition("예약불가");
            }
        }

        model.addAttribute("books", books);

		return "book/booklist";
	}

    @GetMapping("/book/bookinfo")
    public String bookInfo(@ModelAttribute("BookVO") BookVO vo, @ModelAttribute("ReviewTblVO") ReviewTblVO reviewVO,
                           @ModelAttribute("BorrowVO") BorrowTblVO brVO, @ModelAttribute("ReserveTblVO") ReserveTblVO rsVO,
                           @RequestParam("isbn") String isbn, Model model) throws Exception
    {
        ////////////////////////////////// API 구현부 ///////////////////////////////////
        // 네이버 검색 API 요청
		String clientId = "48nxdPZ14ojZRBfJ7zW7"; 		
        String clientSecret = "tO37rq0RyH";

        if ((isbn == null) || (isbn.length() ==0))
        {
            return  "book/booklist";
        }
        
        //String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // JSON 결과
        URI uri = UriComponentsBuilder
        		  .fromUriString("https://openapi.naver.com")
        		  .path("/v1/search/book.json")
        		  .queryParam("query", isbn)
        		  .encode()
        		  .build()
        		  .toUri();
        		  
        // Spring에서 HTTP 요청을 나타내는 클래스 : RequestEntity 
        RequestEntity<Void> req = RequestEntity
        						 .get(uri)
        						 .header("X-Naver-Client-Id", clientId)
        						 .header("X-Naver-Client-Secret", clientSecret)
        						 .build();

        // Spring 제공 restTemplate
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
        
        // JSON 파싱 (Json 문자열을 객체로 만듦, 문서화)
        ObjectMapper om = new ObjectMapper();
        NaverResultVO resultVO = null;
        
        try {
        	resultVO = om.readValue(resp.getBody(), NaverResultVO.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
        
        List<BookVO> books = resultVO.getItems();
        if (books.size() > 0) {
            BookVO book = books.get(0);
            model.addAttribute("book", book);
        }

        ////////////////////////////////////////////////////////////////////////////

        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);

            // 유저가 대출한 상태인지 확인
            brVO.setUserId(userTblVO.getUserId());
            BorrowTblVO brTblVO = borrowDAO.checkBorrowUser(brVO);

            if (brTblVO != null)
            {
                model.addAttribute("brData", brTblVO);
            }

            // 유저가 예약한 책인지 확인
            rsVO.setUserId(userTblVO.getUserId());
            ReserveTblVO rsTblVO = reserveDAO.checkReserveUser(rsVO);

            if (rsTblVO != null)
            {
                model.addAttribute("rsData", rsTblVO);
            }

        }

        // 게시물 서평 정보 전송
        List<ReviewTblVO> list = reviewDAO.selectReview(reviewVO);
        if (list != null)
        {
            model.addAttribute("review", list);
        }

        // 대출 인원 수 전송
        Integer borrowNum = borrowDAO.selectBorrowData(brVO);
        model.addAttribute("brNum", borrowNum);

        // 예약 인원 수 전송
        Integer reserveNum = reserveDAO.selectReserveNum(rsVO);
        model.addAttribute("rsNum", reserveNum);

        return "book/bookinfo";
    }

    
    @GetMapping("/book/bookinfo/logout")
    public void login(HttpServletResponse response,
                        HttpServletRequest request) throws Exception
    {
        // 세션 삭제 후 인덱스로
        SessionUtil.remove(request, "USER");
        response.sendRedirect("book/booklist");
    }

    // /////////////////////////////////////////

    @GetMapping("/bookinfo")
    public String bookInfo2(@ModelAttribute("BookVO") BookVO vo, @ModelAttribute("ReviewTblVO") ReviewTblVO reviewVO,
                           @ModelAttribute("BorrowVO") BorrowTblVO brVO, @ModelAttribute("ReserveTblVO") ReserveTblVO rsVO,
                           @RequestParam("isbn") String isbn, Model model) throws Exception
    {
        ////////////////////////////////// API 구현부 ///////////////////////////////////
        // 네이버 검색 API 요청
		String clientId = "48nxdPZ14ojZRBfJ7zW7"; 		
        String clientSecret = "tO37rq0RyH";

        if ((isbn == null) || (isbn.length() ==0))
        {
            return  "book/booklist";
        }
        
        //String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // JSON 결과
        URI uri = UriComponentsBuilder
        		  .fromUriString("https://openapi.naver.com")
        		  .path("/v1/search/book.json")
        		  .queryParam("query", isbn)
        		  .encode()
        		  .build()
        		  .toUri();
        		  
        // Spring에서 HTTP 요청을 나타내는 클래스 : RequestEntity 
        RequestEntity<Void> req = RequestEntity
        						 .get(uri)
        						 .header("X-Naver-Client-Id", clientId)
        						 .header("X-Naver-Client-Secret", clientSecret)
        						 .build();

        // Spring 제공 restTemplate
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
        
        // JSON 파싱 (Json 문자열을 객체로 만듦, 문서화)
        ObjectMapper om = new ObjectMapper();
        NaverResultVO resultVO = null;
        
        try {
        	resultVO = om.readValue(resp.getBody(), NaverResultVO.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
        
        List<BookVO> books = resultVO.getItems();
        if (books.size() > 0) {
            BookVO book = books.get(0);
            model.addAttribute("book", book);
        }

        ////////////////////////////////////////////////////////////////////////////

        UserTblVO userTblVO = (UserTblVO)SessionUtil.getAttribute("USER");

        if (userTblVO != null)
        {
            model.addAttribute("vo", userTblVO);

            // 유저가 대출한 상태인지 확인
            brVO.setUserId(userTblVO.getUserId());
            BorrowTblVO brTblVO = borrowDAO.checkBorrowUser(brVO);

            if (brTblVO != null)
            {
                model.addAttribute("brData", brTblVO);
            }

            // 유저가 예약한 책인지 확인
            rsVO.setUserId(userTblVO.getUserId());
            ReserveTblVO rsTblVO = reserveDAO.checkReserveUser(rsVO);

            if (rsTblVO != null)
            {
                model.addAttribute("rsData", rsTblVO);
            }

        }

        // 게시물 서평 정보 전송
        List<ReviewTblVO> list = reviewDAO.selectReview(reviewVO);
        if (list != null)
        {
            model.addAttribute("review", list);
        }

        // 대출 인원 수 전송
        Integer borrowNum = borrowDAO.selectBorrowData(brVO);
        model.addAttribute("brNum", borrowNum);

        // 예약 인원 수 전송
        Integer reserveNum = reserveDAO.selectReserveNum(rsVO);
        model.addAttribute("rsNum", reserveNum);

        return "/bookinfo";
    }


    
}