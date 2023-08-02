<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        .main-container {
            width: 100vh;
            height: 240px;
            display: block;
            margin: 0 auto;
            margin-top: 100px;
        }
        hr {
            width: 95vh;
            margin-left : auto;
            margin-right : auto;
        }
        .main-img {
            width: 100vh;
            margin-bottom: 50px;
        }

        a {
        text-decoration-line: none;
        }

        /* /////////////////////////// */
        .book-container {
            display: block;
            width: 95vh;
            height: 100vh;            
            margin: 0 auto;
            border: 1px solid red;
        }
        .book-summary {
            background-color: rgb(238, 242, 243);
            border-radius: 10px;
            height: 500px;            

            margin: 0 auto;
            border: 1px solid blue;
        }
        .book-summary-inbox {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .image-container {
            width: 25%;
            margin-left: auto;
            align-items: center;
            justify-content: center;
        }

        /* ////////////////////////// */
        .summary-container {
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

        <section>
            <div class="main-container">
                <div class="main-img">
                    <img src="assets/img/bookinfo/main.png" alt="">
                </div>
                <div>
                    <hr>
                </div>
            </div>
        </section>

        <section id="bookinfo-main" class="">
            <div class="book-container">
                <div class="full-view">
                    <!-- 책 요약 -->
                    <div class="book-summary">
                        <!-- 이미지 & 요약 -->
                        <div class="book-summary-inbox">
                            <div class="image-container">
                                <img src="${book.image}" alt="${book.title}" style="width:220px;" id="bookImage">
                                <!-- 이미지 -->
                            </div>
                            <div class="summary-container">
                                <span id="summary-title">${book.title}</span><hr>
                                <span class="summary-etc">저자 : ${book.author} | 출판사 : ${book.publisher} | 출간일 : ${book.pubdate}</span>
                                <!-- 요약 정보 --> <br><hr><br>
                                <span>대출 : ${brNum} / 5 | 예약 : ${rsNum} / 5</span>
                                <span></span>
                                <br>
                                <hr>
                                <br>
                                <button type="button" class="btn btn-success" id="btnBorrow"></button>
                                <button type="button" class="btn btn-warning" id="btnReserve">예약하기</button>
                                <button type="button" class="btn btn-secondary" id="btnReturn">반납하기</button>
                                <br>
                                <hr>
                                <br>
                                <hr>
                            </div>
                        </div>
                    </div>
    
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
    
                    <div id="book_info" class="tab_body active">
                        <!-- 작품 소개 -->
                        <a>"${book.description}"</a>
                    </div>
                    <div id="book_table" class="tab_body">
                        <!-- 목차 -->
                        <h2>목차</h2>
                    </div>
                    <div id="comments" class="tab_body">
                        <!-- 독자서평 -->
    
                        <!-- 한줄평 남기기 -->
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
                    <a href="/book/bookinfo?isbn=9788994407920">
                      <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000150223M.jpg" alt="나와 평등한 말">
                    </a>
                    <span id="bookTitle">나와 평등한 말</span>
                    <span id="bookAuthor">김보미</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9788969021960">
                    <img src="https://shopping-phinf.pstatic.net/main_3246692/32466929539.20230328165111.jpg" alt="스파이더맨 지퍼">
                  </a>
                  <span id="bookTitle">스파이더맨 지퍼</span>
                  <span id="bookAuthor">김점선</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9791197626739">
                    <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000150840M.jpg" alt="우리 지금, 썸머">
                  </a>
                  <span id="bookTitle">우리 지금, 썸머</span>
                  <span id="bookAuthor">김다은,장경혜,류시은,박산호,이현석,박다해,하고운,이병윤</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9788965464082">
                    <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000150913M.jpg" alt="메이슨 버틀이 말하는 진실">
                  </a>
                  <span id="bookTitle">메이슨 버틀이 말하는 진실</span>
                  <span id="bookAuthor">레슬리 코너</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9791189467876">
                    <img src="https://shopping-phinf.pstatic.net/main_4054675/40546756725.20230801122843.jpg" alt="8월의 빛">
                  </a>
                  <span id="bookTitle">8월의 빛</span>
                  <span id="bookAuthor">박시하</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9791188296606">
                    <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000151430M.jpg" alt="우아한 또라이로 살겠습니다">
                  </a>
                  <span id="bookTitle">우아한 또라이로 살겠습니다</span>
                  <span id="bookAuthor">민바람</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9791197317934">
                    <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000149451M.jpg" alt="심연의 빛">
                  </a>
                  <span id="bookTitle">심연의 빛</span>
                  <span id="bookAuthor">이창재</span>
                </li>
              </ul>

              <ul id="bestBookList">
                <li>
                  <a href="/book/bookinfo?isbn=9791198146113">
                      <img src="https://shopping-phinf.pstatic.net/main_4044377/40443770625.20230725122152.jpg" alt="화가가 사랑한 바다">
                    </a>
                    <span id="bookTitle">화가가 사랑한 바다</span>
                    <span id="bookAuthor">정우철</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9788937463686">
                    <img src="https://shopping-phinf.pstatic.net/main_3246693/32466939817.20230313183311.jpg" alt="여름">
                  </a>
                  <span id="bookTitle">여름</span>
                  <span id="bookAuthor">이디스 워튼</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9791193024188">
                    <img src="https://shopping-phinf.pstatic.net/main_4055277/40552776618.20230711112728.jpg" alt="당신이 사랑을 하면 우리는 복수를 하지 (범유진 장편소설)">
                  </a>
                  <span id="bookTitle">당신이 사랑을 하면 우리는 복수를 하지 (범유진 장편소설)</span>
                  <span id="bookAuthor">범유진</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9791156332602">
                    <img src="http://e-lib.sen.go.kr/OPENS/ECO/cover/PRD000133876M.jpg" alt="(10대를 위한) 나의 첫 소설 쓰기 수업">
                  </a>
                  <span id="bookTitle">(10대를 위한) 나의 첫 소설 쓰기 수업</span>
                  <span id="bookAuthor">문부일</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9791155424742">
                    <img src="http://e-lib.sen.go.kr/OPENS/IPAPRIKA/cover/9791155424742.jpg" alt="버리는 즐거움 (7:5:1 정리 법칙으로 일상이 행복해지는 기술)">
                  </a>
                  <span id="bookTitle">버리는 즐거움 (7:5:1 정리 법칙으로 일상이 행복해지는 기술)</span>
                  <span id="bookAuthor">야마시타 히데코</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9791187890164">
                    <img src="https://bookimg.bookcube.com/150/2007/200707039.jpg" alt="달콤한 나의 도시양봉">
                  </a>
                  <span id="bookTitle">달콤한 나의 도시양봉</span>
                  <span id="bookAuthor">어반비즈서울, 최우리</span>
                </li>
                <li>
                  <a href="/book/bookinfo?isbn=9791159920257">
                    <img src="http://e-lib.sen.go.kr/OPENS/IPAPRIKA/cover/9791159920370.jpg" alt="아내를 모자로 착각한 남자">
                  </a>
                  <span id="bookTitle">아내를 모자로 착각한 남자</span>
                  <span id="bookAuthor">올리버 색스,이정호</span>
                </li>
              </ul>
            </div><!-- End bookTab Container -->


      
        </main>
      
        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">
      
          <div class="container footer-top">
            <div class="row gy-4">
              <div class="col-lg-5 col-md-12 footer-about">
                <a href="index.html" class="logo d-flex align-items-center">
                  <span>Append</span>
                </a>
                <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus.</p>
                <div class="social-links d-flex mt-4">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
      
              <div class="col-lg-2 col-6 footer-links">
                <h4>Useful Links</h4>
                <ul>
                  <li><a href="#">Home</a></li>
                  <li><a href="#">About us</a></li>
                  <li><a href="#">Services</a></li>
                  <li><a href="#">Terms of service</a></li>
                  <li><a href="#">Privacy policy</a></li>
                </ul>
              </div>
      
              <div class="col-lg-2 col-6 footer-links">
                <h4>Our Services</h4>
                <ul>
                  <li><a href="#">Web Design</a></li>
                  <li><a href="#">Web Development</a></li>
                  <li><a href="#">Product Management</a></li>
                  <li><a href="#">Marketing</a></li>
                  <li><a href="#">Graphic Design</a></li>
                </ul>
              </div>
      
              <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start">
                <h4>Contact Us</h4>
                <p>A108 Adam Street</p>
                <p>New York, NY 535022</p>
                <p>United States</p>
                <p class="mt-4"><strong>Phone:</strong> <span>+1 5589 55488 55</span></p>
                <p><strong>Email:</strong> <span>info@example.com</span></p>
              </div>
      
            </div>
          </div>
      
          <div class="container copyright text-center mt-4">
            <p>&copy; <span>Copyright</span> <strong class="px-1">Append</strong> <span>All Rights Reserved</span></p>
            <div class="credits">
              <!-- All the links in the footer should remain intact. -->
              <!-- You can delete the links only if you've purchased the pro version. -->
              <!-- Licensing information: https://bootstrapmade.com/license/ -->
              <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
              Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
          </div>
      
        </footer><!-- End Footer -->
      
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

    const btnLogin = document.querySelector('#btnLogin');
    const btnMyLibrary = document.querySelector('#btnMyLibrary');

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

  ////////////////////////////////////////////////////////////////////////////
  // 네비바 픽스 시 로그인, 서재 버튼 체인지

//   window.addEventListener('scroll', function(){
//     if (window.scrollY >= 0)
//     {
//       btnLogin.classList.remove('btn-outline-light');
//       btnLogin.classList.add('btn-outline-dark');
//       btnMyLibrary.classList.remove('btn-outline-light');
//       btnMyLibrary.classList.add('btn-outline-dark');
//     }
//     else
//     {
//       btnLogin.classList.add('btn-outline-light');
//       btnLogin.classList.remove('btn-outline-dark');
//       btnMyLibrary.classList.add('btn-outline-light');
//       btnMyLibrary.classList.remove('btn-outline-dark');
//     }
//   });



  const newBook = document.querySelector('#newBook');
  const newBookList = document.querySelector('#newBookList');
  const bestBook = document.querySelector('#bestBook');
  const bestBookList = document.querySelector('#bestBookList');
    
  newBook.addEventListener('click', ()=>{
    newBookList.style.display = "flex";
    bestBookList.style.display = "none";
    document.querySelector('#newBook > a').classList.add('on');
    document.querySelector('#bestBook > a').classList.remove('on');
  });

  bestBook.addEventListener('click', ()=>{
    newBookList.style.display = "none";
    bestBookList.style.display = "flex";
    document.querySelector('#bestBook > a').classList.add('on');
    document.querySelector('#newBook > a').classList.remove('on');
  });


  ////////////////////////////////////////////////////

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

  //////////////////////////////////////////////////////
  setsessionState();
  setLoginButton();
  setMyPageBtn();
  setBtnDisplay();

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
</html>