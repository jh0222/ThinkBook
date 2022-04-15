<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/book_search.css"/>
<link rel="stylesheet" href="../css/head_all.css"/>
<link rel="stylesheet" href="../css/sidebar.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery.lightBox.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
        <header>
          <div class="headbar_logo">
            <a href="../index.jsp"><img src="../images/think.jpg" alt="logo"></a>
          </div>
          <div class="header_wrap">
            
            <div class="headbar_login">
              <a href="join.jsp"><input type="button" name="회원가입" value="회원가입" ></a>
              <a href="login.jsp"><input type="button" name="로그인" value="로그인"></a>
            </div> 
             
          </div>           
        </header>

        <!-- -->
        <div class="menu_box">
          <ul class="menu_box_list">

            <li>
              <a href="search/library.jsp">도서관 찾기</a>
            </li>
            <li>
              <a href="../booksc.jsp">도서 찾기</a>
            </li>
        	<li>
              <a href="">마이페이지</a>
              <ul class="sub01">
                  <li><a href="report/report_list.jsp">독후감</a></li>
                  <li><a href="wishlist.jsp">마이 찜목록</a></li>
                  <li><a href="myreport.jsp">마이 게시판</a></li>
                  <li><a href="myrank.jsp">마이 랭킹보기</a></li>
                </ul>
            </li>
            <li>
              <a href="">게시판</a>
              <ul class="sub01">
                  <li ><a href="discussionboard/list.jsp">독서토론게시판</a></li>
                  <li><a href="borrowboard/list.jsp">도서대출게시판</a></li>
                  <li><a href="freeboard/list.jsp">자유채팅게시판</a></li>
                </ul>
            </li>
    			</ul>
        </div>
        <div class="side_bar" style="background-image: url(../images/back.jpg);">
            <div class="side_bar_div">
                <a href="libsc.jsp"><p>도서관 찾기</p></a>
                <a href="../booksc.jsp"><p>도서 찾기</p></a>
            </div>
        </div>

        <div class="main">
          <div class="lib_sc">
              <h2>도서관 찾기</h2>
          </div>
          <div class="main_input">
              <input class="main_input_sb" type="text" name="검색">
              <input class="main_input_bt"type="button" name="searchbt" value="검색" >
          </div>
          
          <div class="main_book">
            <a href="#">
              <div class="book_name">
              	
              </div>
            </a>

            
          </div>
        </div>



    </div>
</body>
</html>