<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/head_all.css"/>
      <link rel="stylesheet" href="css/sidebar.css"/>
	  <link rel="preconnect" href="https://fonts.googleapis.com">
	  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="css/book_search.css"/>
      <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	    <script type="text/javascript" src="js/jquery.lightBox.min.js"></script>
     

      <script type="text/javascript">
        $(function(){
          $(".menu_box_list>li").mouseover(function(){
        
          $(this).children(".sub01").stop().slideDown();
        
          });		
    
          $(".menu_box_list>li").mouseleave(function(){
        
            $(this).children(".sub01").stop().slideUp();
        
          });		
        });
      </script>

      <!--라이트박스 
	<script type="text/javascript">
		$(document).ready(function(){
			$('a.fig_light').lightBox();
		});
	</script>
      -->

    </head>
    <body>
      <%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<div class="wrap">	
		<%
            if(userID == null){ //로그인 되어있지 않을 때            	
        %>           
        <header>
          <div class="headbar_logo">
            <a href="index.jsp"><img src="images/think.jpg" alt="logo"></a>
          </div>
          <div class="header_wrap">
            
            <div class="headbar_login">
              <a href="join.jsp"><input type="button" name="회원가입" value="회원가입" ></a>
              <a href="login.jsp"><input type="button" name="로그인" value="로그인"></a>
            </div> 
             
          </div>           
        </header>
        <%
           	}else{
        %>
        <header>
          <div class="headbar_logo">
            <a href="index.jsp" class="active"><img src="images/think.jpg" alt="logo"></a>
          </div>
          <div class="header_wrap">
          	<div class="headbar_login">
              <a href="logoutAction.jsp"><input type="button" name="로그아웃" value="로그아웃" ></a>
            </div> 
              
          </div>           
        </header>
        <%
           	}
        %>  

        
        <div class="menu_box">
          <ul class="menu_box_list">
            <li>
              <a href="libsc.html">도서관 찾기</a>
            </li>
            <li>
              <a href="genre.html">장르</a>
              <ul class="sub01">
                  <li ><a href="#">소설</a></li>
                  <li><a href="#">철학</a></li>
                  <li><a href="#">에세이</a></li>
                </ul>
            </li>
        		<li>
              <a href="mychatroom.html">마이페이지</a>
              <ul class="sub01">
                  <li ><a href="#">내정보수정</a></li>
                  <li><a href="report_index.html">독후감</a></li>
                  <li><a href="wishlist.jsp">마이 찜목록</a></li>
                  <li><a href="myreport.html">마이 독서분석</a></li>
                  <li><a href="mychatroom.html">마이 채팅방</a></li>
                  <li><a href="rank.html">마이 랭킹보기</a></li>
                </ul>
            </li>
            <li>
              <a href="chatRoom_list.html">채팅방</a>
              <ul class="sub01">
                  <li ><a href="#">도서대출 채팅방</a></li>
                  <li><a href="#">~~채팅방</a></li>
                  <li><a href="#">@@채팅방</a></li>
                </ul>
                </li>
                </ul>
                </div>

                <div class="side_bar" style="background-image: url(images/back.jpg);">
                  <div class="side_bar_div">
                    <a href="libsc.html"><p>도서관 찾기</p></a>
                    <a href="booksc.html"><p>도서 찾기</p></a>
                    
                  </div>
                </div>

        <div class="main">
          <div class="lib_sc">
              <h2>도서 찾기</h2>
          </div>
          <div class="main_input">
              <input class="main_input_sb" type="text" name="검색">
              <input class="main_input_bt"type="button" name="search" value="검색" >
          </div>
          		 
          <!-- 책 들어갈 자리-->
          <div class="main_book">
            <form action="bookheartController" method="post">
              <div class="book_name">
              <c:forEach var="b" items="${book }">		 	
		 		<p><input type="checkbox" name="bookheartcheck" value="책">
		 		   ${b.booktitle }<br>
		 		   ${b.author }<br>
		 		   ${b.libname }<br>
		 		   ${b.callno }<br>
		 		   ${b.publisher }<br>
		 		   ${b.pubyear }
		 		</p><br>
	 	      </c:forEach>
              </div>
              <button>찜 목록에 저장하기</button>
            </form>
		</div>
        </div>



    </div>
    </body>
</html>