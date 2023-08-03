<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
      <!-- 부트 스트랩 -->
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">


      <meta charset="utf-8">
      <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
      <title>Online Library</title>
      <meta content="" name="description">
      <meta content="" name="keywords">
    
      <!-- Favicons -->
      <link href="assets/img/favicon.png" rel="icon">
      <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    
      <!-- Fonts -->
      <link href="https://fonts.googleapis.com" rel="preconnect">
      <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
    
      <!-- Vendor CSS Files -->
      <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
      <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
      <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
      <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    
      <!-- Template Main CSS File -->
      <link href="assets/css/main.css" rel="stylesheet">

      <style>
        li {
          list-style: none;
        }
        a {
          text-decoration-line: none;
        }
        .bar {
        display: inline-block;
        width: 1px;
        height: 10px;
        margin: 0 5px;
        background-color: #ccc;
        vertical-align: middle;
        }

        .btn-light { 
          font-family : "Open Sans";
          font-size: 8px;
        }
        .global-nav {
          display: flex;
          justify-content: space-between;
          margin-left: 5%;
          margin-right: 5%;
        }
        .global-nav-btn {
          display: inline-flex;
        }
        .global-nav-link {
          display: flex;
          align-items: center;
          margin: 0 10px;
        }
        .global-nav-s {
          display: flex;
        }
        #btnLogin {
          margin-right: 20px;
        }
        .main-div {
          width: 60%;
          height: 100vh;
          margin: 0 auto;
        }
        /* /////////////////////////////// */

        .main-container {
          display: flex;
          flex-direction: column;
          align-items: center;
          width: 100%;
          height: 300px;
          margin-top: 100px;
        }

        .main-img {
          margin-bottom: 50px;
        }

        .hr-box {
          width: 75%;
        }

        /* /////////////////////////// */

        .book-container {
          width: 75%;
          height: 120vh;            
          margin: 0 auto;
        }


        .book-summary {
          display: flex;
          background-color: rgb(238, 242, 243);
          border-radius: 10px;
          height: 550px;            

          justify-content: center;
        }
        .image-container {
          display: flex;
          width: 25%;
          align-items: center;
        }
        .empty-box {
          width: 5%;
        }
        .summary-container {
          width: 40%;
          margin-top: 8%;
        }
        #summary-title {
          font-size: 150%;
        }

        .summary-tbl {
          width: 100%;

        }
        .summary-tbl th, .summary-tbl td {
          padding: 10px;
        }
        .sum-tbl-row td {
          border-style: dotted;
          border-bottom: 1px solid #dee2e6;
        }
        .summary-btn {
          display: flex;
          margin-top: 20px;
          justify-content: right;
        }
        /* .summary-container {
            margin-right: auto;
            font-size: 20px;
            align-items: center;
            justify-content: center;
        }
                .summary-container hr {
            border: 0;
            height: 1px;
            width: 600px;
            background-color: rgb(0, 0, 0);
        }
        .summary-etc {
            font-size: 85%;
        }
        /* ////////////////////////// */


        /* ////////////////////////// */

        .tabmenu {
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .tabmenu a {
            color: black;
        }
        .tab_active {
                background-color: #ccc;
        }
        .tab_body {
            display: none;
        }
        .tab_body.active {
            display: block;
        }
        .tab_body h2 {
            font-size: 20px;
        }
        #summary-title {
            font-size: 120%;
            font-weight: bold;
        }
        #book_info > a {
            font-size : 15px
        }
        #bookImage {
            box-shadow: 7px 7px 7px #898989;
        }
        .sec0_txt_title {
          width: 100%;
          height: 100%;
          animation: titleMoving 40s infinite linear;
          text-overflow: clip;
        }
        @keyframes titleMoving {
            from {
              -webkit-transform: translate3d(0, 0, 0);
              transform: translate3d(0, 0, 0);
            }
            to {
              -webkit-transform: translate3d(-100%, 0, 0);
              transform: translate3d(-100%, 0, 0);
            }
        }


      </style>
    </head>
      
    <body class="" data-bs-spy="scroll" data-bs-target="#navmenu">
    
      <!-- ======= Header ======= -->
      <header id="header" class="header fixed-top">
        <div class="global-nav">
          <div class="global-nav-s global-nav-logo">
            <a href="index.html" class="logo d-flex align-items-center me-auto me-xl-0 global-nav-link">
              <!-- Uncomment the line below if you also wish to use an image logo -->
              <!-- <img src="assets/img/logo.png" alt=""> -->
              <h1>cis-ljw</h1>
              <span>.</span>
            </a>
          </div>

          <div class="global-nav-s global-nav-links">
            <nav id="navmenu" class="navmenu">
              <ul>
                <li><a href="index.html#hero" class="active global-nav-link">Home</a></li>
                <li><a href="index.html#about" class="global-nav-link">About</a></li>
                <li><a href="index.html#services" class="global-nav-link">Search</a></li>
                <li class="dropdown has-dropdown"><a href="#" class="global-nav-link"><span>Community</span> <i class="bi bi-chevron-down"></i></a>
                  <ul class="dd-box-shadow">
                    <li><a href="#">Dropdown 1</a></li>
                    <li class="dropdown has-dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down"></i></a>
                      <ul class="dd-box-shadow">
                        <li><a href="#">Deep Dropdown 1</a></li>
                        <li><a href="#">Deep Dropdown 2</a></li>
                        <li><a href="#">Deep Dropdown 3</a></li>
                        <li><a href="#">Deep Dropdown 4</a></li>
                        <li><a href="#">Deep Dropdown 5</a></li>
                      </ul>
                    </li>
                    <li><a href="#">Dropdown 2</a></li>
                    <li><a href="#">Dropdown 3</a></li>
                    <li><a href="#">Dropdown 4</a></li>
                  </ul>
                </li>
                <li><a href="index.html#contact" class="global-nav-link">Notice</a></li>
              </ul>
      
              <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
            </nav><!-- End Nav Menu -->
          </div>
          <!-- Nav Menu -->

          <div class="global-nav-btn global-nav-s global-nav-link">
            <button type="button" class="btn btn-outline-light dropdowns" id="btnLogin"></button>
            <button type="button" class="btn btn-outline-light" id="btnMyLibrary">내 서재</button>
          </div>

        </div>
      </header><!-- End Header -->
      
      <main id="main">

        <div class="main-div">

          <section id="">
            <div class="main-container">
                <div class="main-img">
                    <img src="assets/img/bookinfo/main.png" alt="">
                </div>
                <div class="hr-box">
                    <hr>
                </div>
            </div>
          </section>
  
          <section id="bookinfo-main" class="">
              <div class="book-container">
                  <!-- 상단부 : 책 요약 -->
                  <div class="book-summary">
                      <!-- 이미지 & 요약 -->
                      <div class="image-container">
                          <img src="${book.image}" alt="${book.title}" style="width:220px;" id="bookImage">
                          <!-- 이미지 -->
                      </div>
                      <div class="empty-box">
                        <!-- 중간 공백 -->
                      </div>
                      <div class="summary-container">
                          <span id="summary-title"><strong>${book.title}</strong></span>
                          <hr style="border:0; height:2px; background: #000;">

                          <table class="summary-tbl">
                            <tr class="sum-tbl-row">
                              <td>저자</td>
                              <td style="padding: 5px 5px 5px 5px;">:</td>
                              <td><strong>${book.author}</td>
                            </tr>
                            <tr class="sum-tbl-row">
                              <td>출판사</td>
                              <td style="padding: 5px 5px 5px 5px;">:</td>
                              <td><strong>${book.publisher}</td>
                            </tr>
                            <tr class="">
                              <td>출간일</td>
                              <td style="padding: 5px 5px 5px 5px;">:</td>
                              <td><strong>${book.pubdate}</td>
                            </tr>
                          </table>

                          <hr style="border:0; height:1px; background: #000;">
                          <!-- 요약 정보 --> 
                          <table class="summary-tbl">
                            <tr class="sum-tbl-row">
                              <td>대출</td>
                              <td style="padding: 5px 5px 5px 5px;">:</td>
                              <td>${brNum} / 5</td>
                            </tr>
                            <tr class="sum-tbl-row">
                              <td>예약</td>
                              <td style="padding: 5px 5px 5px 5px;">:</td>
                              <td>${rsNum} / 5</td>
                            </tr>
                          </table>

                          <div class="summary-btn">
                            <button type="button" class="btn btn-success" id="btnBorrow"></button>
                            <button type="button" class="btn btn-warning" id="btnReserve">예약하기</button>
                            <button type="button" class="btn btn-secondary" id="btnReturn">반납하기</button>
                          </div>
                      </div>
                  </div>
  
                  <!-- 하단부: 탭 메뉴 -->
                  <div>
                    <!-- 게시판 버튼 -->
                    <div class="tabmenu">
                        <ul class="list-group list-group-horizontal">
                            <li class="list-group-item list-group-item-action">
                                <a href="#" data-target="book_info" onclick="showTab('book_info')">작품 소개</a>
                            </li>
                            <li class="list-group-item list-group-item-action">
                                <a href="#" data-target="book_table" onclick="showTab('book_table')">목차</a>
                            </li>
                            <li class="list-group-item list-group-item-action">
                                <a href="#" data-target="comments" onclick="showTab('comments')">독자 서평</a>
                            </li>
                        </ul>
                    </div>
    
                    <!-- 작품 소개 -->
                    <div id="book_info" class="tab_body active">
                        <a>"${book.description}"</a>
                    </div>
                    <!-- 목차 -->
                    <div id="book_table" class="tab_body">
                        <h2>목차</h2>
                    </div>
                    <!-- 한줄평 남기기 -->
                    <div id="comments" class="tab_body">
                      <div class="input-group mb-3">
                          <input type="text" class="form-control" placeholder="" aria-label="Recipient's username" aria-describedby="button-addon2" id="txtReview" maxlength="500">
                          <button class="btn btn-outline-secondary" type="button" id="button-addon2">한줄평 남기기</button>
                      </div>
  
                      <table class="table table-hover tblReview">
                          <thead class="table-light">
                          <tr>
                              <th scope="col">일자</th>
                              <th scope="col">작성자</th>
                              <th scope="col">서평</th>
                          </tr>
                          </thead>
                          <tbody>
                              <c:forEach items="${review}" var="reviewItem">
                                  <tr>
                                      <td>${reviewItem.regDate}</td>
                                      <td>${reviewItem.userId}</td>
                                      <td>${reviewItem.review}</td>
                                  </tr>
                              </c:forEach>
                          </tbody>
                      </table>
                    </div>
                  </div>
              </div>
          </section>

          <div>
            <img src="assets/img/bookinfo/main.png" alt="" class="sec0_txt_title">
          </div>

      
          <!-- Clients Section - Home Page -->
          <section id="clients" class="clients">
      
            <div class="container-fluid" data-aos="fade-up">
      
              <div class="row gy-4">
      
                <div class="col-xl-2 col-md-3 col-6 client-logo">
                </div><!-- End Client Item -->
      
                <div class="col-xl-2 col-md-3 col-6 client-logo">
                  <a href="/mypage"><img src="assets/img/icon-mypage.png" class="img-fluid" alt=""></a>
                </div><!-- End Client Item -->
      
                <div class="col-xl-2 col-md-3 col-6 client-logo">
                  <img src="assets/img/icon-search.png" class="img-fluid" alt="">
                </div><!-- End Client Item -->
      
                <div class="col-xl-2 col-md-3 col-6 client-logo">
                  <img src="assets/img/icon-wish.png" class="img-fluid" alt="">
                </div><!-- End Client Item -->
      
                <div class="col-xl-2 col-md-3 col-6 client-logo">
                  <img src="assets/img/icon-notice.png" class="img-fluid" alt="">
                </div><!-- End Client Item -->
      
                <div class="col-xl-2 col-md-3 col-6 client-logo">
                </div><!-- End Client Item -->
      
              </div>
      
            </div>
      
          </section><!-- End Clients Section -->
      
          <!-- About Section - Home Page -->
          <section id="about" class="about">
      
            <div class="container" data-aos="fade-up" data-aos-delay="100">
              <div class="row align-items-xl-center gy-5">
      
                <div class="col-xl-5 content">
                  <h3>About Us</h3>
                  <h2>Ducimus rerum libero reprehenderit cumque</h2>
                  <p>Ipsa sint sit. Quis ducimus tempore dolores impedit et dolor cumque alias maxime. Enim reiciendis minus et rerum hic non. Dicta quas cum quia maiores iure. Quidem nulla qui assumenda incidunt voluptatem tempora deleniti soluta.</p>
                  <a href="#" class="read-more"><span>Read More</span><i class="bi bi-arrow-right"></i></a>
                </div>
      
                <div class="col-xl-7">
                  <div class="row gy-4 icon-boxes">
      
                    <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                      <div class="icon-box">
                        <i class="bi bi-buildings"></i>
                        <h3>Eius provident</h3>
                        <p>Magni repellendus vel ullam hic officia accusantium ipsa dolor omnis dolor voluptatem</p>
                      </div>
                    </div> <!-- End Icon Box -->
      
                    <div class="col-md-6" data-aos="fade-up" data-aos-delay="300">
                      <div class="icon-box">
                        <i class="bi bi-clipboard-pulse"></i>
                        <h3>Rerum aperiam</h3>
                        <p>Autem saepe animi et aut aspernatur culpa facere. Rerum saepe rerum voluptates quia</p>
                      </div>
                    </div> <!-- End Icon Box -->
      
                    <div class="col-md-6" data-aos="fade-up" data-aos-delay="400">
                      <div class="icon-box">
                        <i class="bi bi-command"></i>
                        <h3>Veniam omnis</h3>
                        <p>Omnis perferendis molestias culpa sed. Recusandae quas possimus. Quod consequatur corrupti</p>
                      </div>
                    </div> <!-- End Icon Box -->
      
                    <div class="col-md-6" data-aos="fade-up" data-aos-delay="500">
                      <div class="icon-box">
                        <i class="bi bi-graph-up-arrow"></i>
                        <h3>Delares sapiente</h3>
                        <p>Sint et dolor voluptas minus possimus nostrum. Reiciendis commodi eligendi omnis quideme lorenda</p>
                      </div>
                    </div> <!-- End Icon Box -->
      
                  </div>
                </div>
      
              </div>
            </div>
      
          </section><!-- End About Section -->
      
          <!-- Stats Section - Home Page -->
          <section id="stats" class="stats">
      
            <img src="assets/img/stats-bg.jpg" alt="" data-aos="fade-in">
      
            <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">
      
              <div class="row gy-4">
      
                <div class="col-lg-3 col-md-6">
                  <div class="stats-item text-center w-100 h-100">
                    <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"></span>
                    <p>Clients</p>
                  </div>
                </div><!-- End Stats Item -->
      
                <div class="col-lg-3 col-md-6">
                  <div class="stats-item text-center w-100 h-100">
                    <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter"></span>
                    <p>Projects</p>
                  </div>
                </div><!-- End Stats Item -->
      
                <div class="col-lg-3 col-md-6">
                  <div class="stats-item text-center w-100 h-100">
                    <span data-purecounter-start="0" data-purecounter-end="1453" data-purecounter-duration="1" class="purecounter"></span>
                    <p>Hours Of Support</p>
                  </div>
                </div><!-- End Stats Item -->
      
                <div class="col-lg-3 col-md-6">
                  <div class="stats-item text-center w-100 h-100">
                    <span data-purecounter-start="0" data-purecounter-end="32" data-purecounter-duration="1" class="purecounter"></span>
                    <p>Workers</p>
                  </div>
                </div><!-- End Stats Item -->
      
              </div>
      
            </div>
      
          </section><!-- End Stats Section -->
  
          <!-- bookTab Section - Home Page -->
          <section id="bookTab">
      
            <div id="container">
      
              <ul id="bookType">
                <li id="newBook"><a href="javascript:;" class="on">신간 도서</a></li>
                <li id="bestBook"><a href="javascript:;">베스트 도서</a></li>
              </ul>
    
              <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">
    
                <ul id="newBookList">
                  <li>
                      <a href="/bookinfo?isbn=9788994407920">
                        <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000150223M.jpg" alt="나와 평등한 말">
                      </a>
                      <span id="bookTitle">나와 평등한 말</span>
                      <span id="bookAuthor">김보미</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9788969021960">
                      <img src="https://shopping-phinf.pstatic.net/main_3246692/32466929539.20230328165111.jpg" alt="스파이더맨 지퍼">
                    </a>
                    <span id="bookTitle">스파이더맨 지퍼</span>
                    <span id="bookAuthor">김점선</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9791197626739">
                      <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000150840M.jpg" alt="우리 지금, 썸머">
                    </a>
                    <span id="bookTitle">우리 지금, 썸머</span>
                    <span id="bookAuthor">김다은,장경혜,류시은,박산호,이현석,박다해,하고운,이병윤</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9788965464082">
                      <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000150913M.jpg" alt="메이슨 버틀이 말하는 진실">
                    </a>
                    <span id="bookTitle">메이슨 버틀이 말하는 진실</span>
                    <span id="bookAuthor">레슬리 코너</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9791189467876">
                      <img src="https://shopping-phinf.pstatic.net/main_4054675/40546756725.20230801122843.jpg" alt="8월의 빛">
                    </a>
                    <span id="bookTitle">8월의 빛</span>
                    <span id="bookAuthor">박시하</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9791188296606">
                      <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000151430M.jpg" alt="우아한 또라이로 살겠습니다">
                    </a>
                    <span id="bookTitle">우아한 또라이로 살겠습니다</span>
                    <span id="bookAuthor">민바람</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9791197317934">
                      <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000149451M.jpg" alt="심연의 빛">
                    </a>
                    <span id="bookTitle">심연의 빛</span>
                    <span id="bookAuthor">이창재</span>
                  </li>
                </ul>
  
                <ul id="bestBookList">
                  <li>
                    <a href="/bookinfo?isbn=9791198146113">
                        <img src="https://shopping-phinf.pstatic.net/main_4044377/40443770625.20230725122152.jpg" alt="화가가 사랑한 바다">
                      </a>
                      <span id="bookTitle">화가가 사랑한 바다</span>
                      <span id="bookAuthor">정우철</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9788937463686">
                      <img src="https://shopping-phinf.pstatic.net/main_3246693/32466939817.20230313183311.jpg" alt="여름">
                    </a>
                    <span id="bookTitle">여름</span>
                    <span id="bookAuthor">이디스 워튼</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9791193024188">
                      <img src="https://shopping-phinf.pstatic.net/main_4055277/40552776618.20230711112728.jpg" alt="당신이 사랑을 하면 우리는 복수를 하지 (범유진 장편소설)">
                    </a>
                    <span id="bookTitle">당신이 사랑을 하면 우리는 복수를 하지 (범유진 장편소설)</span>
                    <span id="bookAuthor">범유진</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9791156332602">
                      <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000133876M.jpg" alt="(10대를 위한) 나의 첫 소설 쓰기 수업">
                    </a>
                    <span id="bookTitle">(10대를 위한) 나의 첫 소설 쓰기 수업</span>
                    <span id="bookAuthor">문부일</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9791155424742">
                      <img src="http://e-lib.sen.go.kr/OPENS/IPAPRIKA/cover/9791155424742.jpg" alt="버리는 즐거움 (7:5:1 정리 법칙으로 일상이 행복해지는 기술)">
                    </a>
                    <span id="bookTitle">버리는 즐거움 (7:5:1 정리 법칙으로 일상이 행복해지는 기술)</span>
                    <span id="bookAuthor">야마시타 히데코</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9791187890164">
                      <img src="https://bookimg.bookcube.com/150/2007/200707039.jpg" alt="달콤한 나의 도시양봉">
                    </a>
                    <span id="bookTitle">달콤한 나의 도시양봉</span>
                    <span id="bookAuthor">어반비즈서울, 최우리</span>
                  </li>
                  <li>
                    <a href="/bookinfo?isbn=9791159920257">
                      <img src="http://e-lib.sen.go.kr/OPENS/IPAPRIKA/cover/9791159920370.jpg" alt="아내를 모자로 착각한 남자">
                    </a>
                    <span id="bookTitle">아내를 모자로 착각한 남자</span>
                    <span id="bookAuthor">올리버 색스,이정호</span>
                  </li>
                </ul>
              </div><!-- End bookTab Container -->
  
  
        
          </main>
        </div>

      

      
        <!-- Scroll Top Button -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
      
        <!-- Preloader -->
        <div id="preloader">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
      
        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
      
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

        <!-- 부트스트랩 src -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
      
      </body>
<script>
(()=>{

    let sessionState = false;
    
    const btns = document.querySelectorAll('.btns');
    const btnLogin = document.querySelector('#btnLogin');
    const btnMyLibrary = document.querySelector('#btnMyLibrary');

    const btnBorrow = document.querySelector('#btnBorrow');
    const btnReserve = document.querySelector('#btnReserve');
    const btnReturn = document.querySelector('#btnReturn');

    const btnReview = document.querySelector('#button-addon2');
    const txtReview = document.querySelector('#txtReview');

    const setsessionState = function()
    {
        if('${vo.userId}' == '')
        {
            sessionState = false;
        }
        else
        {
            sessionState = true;
        }
    }

    const setLoginButton = function()
    {
        if (sessionState == true)
        {
            btnLogin.textContent = 'LOGOUT'
        }
        else
        {
            btnLogin.textContent = 'LOGIN'
        }
    }

    const setMyPageBtn = function()
    {
        if (sessionState == true)
        {
            btnMyLibrary.style.display = 'block';
        }
        else
        {
            btnMyLibrary.style.display = 'none';
        }
    }

    const setBtnDisplay = function()
    {
      btnLogin.classList.remove('btn-outline-light');
      btnLogin.classList.add('btn-outline-dark');
      btnMyLibrary.classList.remove('btn-outline-light');
      btnMyLibrary.classList.add('btn-outline-dark');
    }

    // 대출 / 예약 / 반납 버튼 세팅
    const setBtnStatus = function()
    {

        // 이미 대출 중인 유저 : 반납하기
        if (('${brData}' != null) && ('${brData}' != ""))
        {
            btnBorrow.style.display = 'none';
            btnReserve.style.display = 'none';
            btnReturn.style.display = 'inline'
            return;
        }

        // 예약 중인 유저 : 예약 취소
        if (('${rsData}' != null) && ('${rsData}' != ""))
        {
            btnBorrow.style.display = 'none';
            btnReserve.style.display = 'inline';
            btnReserve.textContent = '예약 취소';
            btnReturn.style.display = 'none'
            return;            
        }

        // 현재 모든 책이 대출 중 > 예약버튼만 보이도록
        if ('${brNum}' == 5)
        {
            btnBorrow.style.display = 'none';
            btnReserve.style.display = 'inline';
            btnReserve.textContent = '예약하기';
            btnReturn.style.display = 'none'
            return;
        }
        // 대출 가능한 책일 경우
        else
        {
            btnBorrow.style.display = 'inline';
            btnBorrow.textContent = '대출하기';
            btnReserve.style.display = 'none';
            btnReturn.style.display = 'none'
            return;
        }
    }

  ////////////////////////////////////////////////////////////////////////////


  btnLogin.addEventListener('click', ()=>{

    // 로그인 상태일 시 로그아웃
    if (sessionState == true)
    {
        location.href = '/logout';
    }
    // 로그아웃 상태일 시 로그인
    else
    {
        location.href = '/login';
    }
  });

  btnMyLibrary.addEventListener('click', ()=>{
        location.href = '/mypage';
  });

  btnBorrow.addEventListener('click', ()=>{

  if (sessionState == false)
  {
      alert("로그인 후 이용 가능합니다.");
      return;
  }

  if ('${brData}' != null && ('${brData}' != ""))
  {
      alert("이미 대출 중인 책입니다.");
      return;
  }

  if ('${brNum}' == 5)
  {
      alert("모든 책이 대출 중입니다.");
      return;
  }

  if (confirm("${book.title}을(를) 대출하시겠습니까?"))
  {
      let httpRequest = new XMLHttpRequest();
      httpRequest.open('POST', '/borrowBook', true);
      httpRequest.setRequestHeader('content-type', 'application/json');
          
      // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
      httpRequest.onreadystatechange = function()
      {
          if(httpRequest.readyState !== XMLHttpRequest.DONE)
              return;

          if (httpRequest.status === 200)
          {
              let result = httpRequest.responseText;

              if (result == "OK")
              {
                  
                  if(confirm("대출되었습니다. 마이페이지에서 확인하시겠습니까?"))
                  {
                      location.href = '/mypage';
                      return;
                  }

                  location.reload();

              }
              else if (result == "$MAX")
              {
                  alert("대출 가능한 최대 권수를 초과하였습니다.");
              }
              else
              {
                  alert("대출에 실패하였습니다.");
              }
          }
          else
          {
              console.error(httpRequest.status, httpRequest.statusText);
          }
      }

      let requestData = {
          brCode : '${book.isbn}' + "-" + "${vo.userId}",
          isbn : '${book.isbn}',
          title : '${book.title}',
          userId : '${vo.userId}',
          renew : "F"
      }

      httpRequest.send(JSON.stringify(requestData));
  }
  else
  {
      return;
  }
  })

  // 반납
  btnReturn.addEventListener('click', ()=>{

  if (sessionState == false)
  {
      alert("로그인 후 이용 가능합니다.");
      return;
  }

  let httpRequest = new XMLHttpRequest();
  httpRequest.open('POST', '/returnBook', true);
  httpRequest.setRequestHeader('content-type', 'application/json');
      
  // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
  httpRequest.onreadystatechange = function()
  {
      if(httpRequest.readyState !== XMLHttpRequest.DONE)
          return;

      if (httpRequest.status === 200)
      {
          let result = httpRequest.responseText;

          if (result === "OK")
          {
              alert("반납에 성공하였습니다.");
          }
          else
          {
              alert("반납에 실패하였습니다.");
          }
      }
      else
      {
          console.error(httpRequest.status, httpRequest.statusText);
      }
  }

  let requestData = {
      isbn : '${book.isbn}',
      userId : '${vo.userId}',
  }

  httpRequest.send(JSON.stringify(requestData));

  })

  // 예약
  btnReserve.addEventListener('click', ()=>{

  if (sessionState == false)
  {
      alert("로그인 후 이용 가능합니다.");
      return;
  }

  // 예약 취소
  if (('${rsData}' != null) && ('${rsData}' != ""))
  {
      if (confirm("${book.title}을(를) 예약취소 하시겠습니까?"))
      {
          let httpRequest = new XMLHttpRequest();
          httpRequest.open('POST', '/cancelReservation', true);
          httpRequest.setRequestHeader('content-type', 'application/json');
              
          // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
          httpRequest.onreadystatechange = function()
          {
              if(httpRequest.readyState !== XMLHttpRequest.DONE)
                  return;

              if (httpRequest.status === 200)
              {
                  let result = httpRequest.responseText;

                  if (result === "OK")
                  {
                      alert("예약이 취소되었습니다. 감사합니다.");
                      location.reload();
                  }
                  else
                  {
                      alert("예약취소에 실패하였습니다.");
                  }
              }
              else
              {
                  console.error(httpRequest.status, httpRequest.statusText);
              }
          }

          let requestData = {
              userId : '${vo.userId}',
              isbn : '${book.isbn}'
          }

          httpRequest.send(JSON.stringify(requestData));
      }
  }
  // 예약하기
  else
  {
      if (confirm("${book.title}을(를) 예약하시겠습니까?"))
      {
          let httpRequest = new XMLHttpRequest();
          httpRequest.open('POST', '/reserveBook', true);
          httpRequest.setRequestHeader('content-type', 'application/json');
              
          // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
          httpRequest.onreadystatechange = function()
          {
              if(httpRequest.readyState !== XMLHttpRequest.DONE)
                  return;

              if (httpRequest.status === 200)
              {
                  let result = httpRequest.responseText;

                  if (result === "OK")
                  {
                      if (confirm("예약되었습니다. 내 서재에서 확인하시겠습니까?"))
                      {
                          location.href = '/main';
                          return;
                      }

                      location.reload();
                  }
                  else if (result === "$MAX")
                  {
                      alert("예약 가능 인원이 초과하여 예약이 불가능합니다.");
                  }
                  else
                  {
                      alert("예약에 실패하였습니다.");
                  }
              }
              else
              {
                  console.error(httpRequest.status, httpRequest.statusText);
              }
          }

          let requestData = {
              brCode : '${book.isbn}' + '-' + '${vo.userId}',
              userId : '${vo.userId}',
              isbn : '${book.isbn}'
          }

          httpRequest.send(JSON.stringify(requestData));
      }
  }
  })

  btnReview.addEventListener('click', ()=>{

    if (sessionState === false)
    {
        alert("로그인 후 이용가능합니다.");
        return;
    }

    let httpRequest = new XMLHttpRequest();
    httpRequest.open('POST', '/writeReview', true);
    httpRequest.setRequestHeader('content-type', 'application/json');
        
    // httpRequest의 상태가 바뀌었을 때 콜백함수 호출
    httpRequest.onreadystatechange = function()
    {
        if(httpRequest.readyState !== XMLHttpRequest.DONE)
            return;

        if (httpRequest.status === 200)
        {

            let result = httpRequest.responseText;

            if (result === "OK")
            {
                alert("한줄평을 등록하였습니다.");
                location.href = "/bookinfo?isbn=${book.isbn}";
            }
            else if (result === "$EXIST")
            {
                alert("한줄평은 한 개만 등록 가능합니다.");
                txtReview.value = "";
            }
            else
            {
                alert("등록에 실패하였습니다.");
                txtReview.value = "";
            }
        }
        else
        {
            console.error(httpRequest.status, httpRequest.statusText);
        }
    }

    let requestData = {
        userId : '${vo.userId}',
        review : txtReview.value,
        isbn : '${book.isbn}'
    }


    httpRequest.send(JSON.stringify(requestData));


  });

  //////////////////////////////////////////////////////
  setsessionState();
  setLoginButton();
  setMyPageBtn();
  setBtnDisplay();
  setBtnStatus();

  const txtSearch = document.querySelector('#txtSearch');
  const btnSearch = document.querySelector('#btnSearch');

  btnSearch.addEventListener('click', ()=>{
      event.preventDefault();

        let queryString = "?text=" + txtSearch.value;
        location.href = "/book/booklist" + queryString;
    });

  // 엔터 키 눌렀을 때 검색 화면으로 이동
  txtSearch.addEventListener('keydown', (event) => {
    // event.keyCode를 사용하여 엔터 키(키코드 13)를 확인합니다.
    if (event.keyCode === 13) {
      // 엔터 키를 눌렀을 때 실행할 코드를 작성합니다.
      event.preventDefault();

      let queryString = "?text=" + txtSearch.value;
      location.href = "/book/booklist" + queryString;
    }
  });


        
})(); 
</script>
<script>

  function showTab(tabId) {
      // 모든 탭 내용 숨기기
      const tabContents = document.getElementsByClassName('tab_body');
      for (let i = 0; i < tabContents.length; i++) {
          tabContents[i].classList.remove('active');
      }

      // 선택한 탭 내용 보이기
      const selectedTab = document.getElementById(tabId);
      if (selectedTab) {
          selectedTab.classList.add('active');
      }

      // 모든 탭 메뉴 클래스 초기화
      const tabLinks = document.querySelectorAll('.tabmenu a');
      for (let i = 0; i < tabLinks.length; i++) {
          tabLinks[i].classList.remove('tab_active');
      }

      // 선택한 탭 메뉴에 클래스 추가
      const selectedTabLink = document.querySelector(`[data-target="${tabId}"]`);
      if (selectedTabLink) {
          selectedTabLink.classList.add('tab_active');
      }
  }

  // <li> 태그 클릭 시 이벤트 처리
  const listItems = document.querySelectorAll('.list-group-item');
  for (let i = 0; i < listItems.length; i++) {
      listItems[i].addEventListener('click', function () {
          const target = this.querySelector('a').getAttribute('data-target');
          showTab(target);
      });
  }

</script>
</html>