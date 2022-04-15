<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Insert title here</title>

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/head_all.css"/>
      <link rel="stylesheet" href="css/book_search.css"/>
      <link rel="stylesheet" href="css/sidebar.css"/>
	  <link rel="preconnect" href="https://fonts.googleapis.com">
	  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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

		<!-- -->
		<div class="menu_box">
          <ul class="menu_box_list">

            <li>
              <a href="search/library.jsp">도서관 찾기</a>
            </li>
            <li>
              <a href="booksc.jsp">도서 찾기</a>
            </li>
        	<li>
              <a href="">마이페이지</a>
              <ul class="sub01">
                  <li><a href="report/report_list.jsp">독후감</a></li>
                  
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
		
		<div class="side_bar" style="background-image: url(images/back.jpg);">
            <div class="side_bar_div">
                <a href="search/library.jsp"><p>도서관 찾기</p></a>
                <a href="booksc.jsp"><p>도서 찾기</p></a>
            </div>
        </div>

	
        <div class="main">
        <form action="library" method="post">
          <div class="lib_sc">
              <h2>도서 찾기</h2>
          </div>
          
          <select name="library" class="lib">
				    <option value="MA" selected="selected">강남도서관</option>
				    <option value="MB">강동도서관</option>
				    <option value="MC">강서도서관</option>
				    <option value="MD">개포도서관</option>
				    <option value="ME">고덕평생학습관</option>
				    <option value="MF">고척도서관</option>
				    <option value="MG">구로도서관</option>
				    <option value="MH">남산도서관</option>
				    <option value="MV">노원평생학습관</option>
				    <option value="MJ">도봉도서관</option>
				    <option value="MK">동대문도서관</option>
				    <option value="ML">동작도서관</option>
				    <option value="MX">마포평생아현분관</option>
				    <option value="MM">마포평생학습관</option>
				    <option value="MP">서대문도서관</option>
				    <option value="MW">송파도서관</option>
				    <option value="MN">양천도서관</option>
				    <option value="MQ">어린이도서관</option>
				    <option value="MR">영등포평생학습관</option>
				    <option value="MS">용산도서관</option>
				    <option value="MT">정독도서관</option>
				    <option value="MU">종로도서관</option>
			  </select>
          	
          	<div class="main_input">          
              <input class="main_input_sb" type="text" name="search">
              <button class="main_input_bt">검색</button>
          </div>
          </form>


    </div>
    </body>
</html>