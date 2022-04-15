<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookheart.bookheartDAO" %>
<%@ page import="bookheart.Bookheartlist" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/heartstyle.css"/>
<link rel="stylesheet" href="css/sidebar.css"/>
<link rel="stylesheet" href="css/head_all.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery.lightBox.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
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
                  <li><a href="wishlist.jsp">마이 찜목록</a></li>
                  <li><a href="myreport.jsp">마이 채팅방</a></li>
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

        <div class="side_bar" style="background-image: url(images/back.jpg);">
          <div class="side_bar_div">
            <a href="#"><p>마이페이지</p></a>
            <a href="report/report_list.jsp"><p>독후감</p></a>
            <a href="wishlist.jsp"><p>마이 찜목록</p></a>
            <a href="report/myreport.jsp"><p>마이 게시판</p></a>
            <a href="myrank.jsp"><p>마이 랭킹보기</p></a>
          </div>
        </div>

        <div class="main">
            <p class="booklist" style="width:30%; background: #c8c8c8; color:white;">관심도서목록</p>
            
           		${r }
           		<table>
           			<tr>
           				<td>책 찜 목록</td>
           			</tr>
           			<c:forEach var="l" items="${list }">
           			<tr>
           				<td>${l.booktitle }</td>
           			</tr>
           			</c:forEach>
           		</table>
           		
           	<!-- 예비  -->
            <p class="booklist" style="">관심도서목록</p>
            
            <ul>
                <li class="check" style="border: 3px solid #c8c8c8;"><a href="#">aa </a><input type="checkbox" name="heart"></li>
                <li class="check" style="border: 3px solid #c8c8c8;"><a href="#">aa </a><input type="checkbox" name="heart"></li>
                <li class="check" style="border: 3px solid #c8c8c8;"><a href="#">aa </a><input type="checkbox" name="heart"></li>
                <li class="check" style="border: 3px solid #c8c8c8;"><a href="#">aa </a><input type="checkbox" name="heart" checked></li>
            </ul>
            
        
           		
            
        </div> 
        
        
								
        
    </div>
</body>
</html>