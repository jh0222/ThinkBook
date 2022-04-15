<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="report.ReportDAO" %>
<%@ page import="report.Report" %>
<%@ page import="popularbook.PB" %>
<%@ page import="popularbook.popular" %>
<%@ page import="popularboard.popularboardrank" %>
<%@ page import="popularboard.BoardBean" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/head_all.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery.lightBox.min.js"></script>
<title>Insert title here</title>
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
	<form method="post" action="indexAction.jsp?userID=<%= userID %>">
        
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

        <section>
        <div class="rank" style="background-image: url(images/back.jpg);">
       		<div class="rank_lib">
              <div class="rank_bar"><p>실시간 인기 도서순위</p></div>
			  
              <ul> 
              	<li class="lib_fig"><div style="width: 100%; height: 100%; box-shadow: 1.5px 1.5px 1.5px 1.5px gray;"><img src="images/eu.jpg" alt="eu" style="width: 100%; height: 100%;"></div></li>
                <li class="lib_fig"><div style="width: 100%; height: 100%; box-shadow: 1.5px 1.5px 1.5px 1.5px gray;"><img src="images/summer.jpg" alt="summer" style="width: 100%; height: 100%;"></div></li>
                <li class="lib_fig"><div style="width: 100%; height: 100%; box-shadow: 1.5px 1.5px 1.5px 1.5px gray;"><img src="images/nami.jpg" alt="nami" style="width: 100%; height: 100%;"></div></li>
              </ul>
            </div>
        </div>
        </section>

        <footer>
          <div class="room_div">
            <div class="room_div_bar">
              <p>최고 인기 게시판</p>
            </div>
            
              <ul>
                <%
                	popularboardrank pbr = new popularboardrank();
                %>
                <a href="#"><li class="room_list"><div><p>대출게시판 : <%= pbr.getborrowBoardRank()%></p></div></li></a>
                <a href="#"><li class="room_list"><div><p>독서토론게시판 : <%= pbr.getdiscussionBoardRank()%></p></div></li></a>
                <a href="#"><li class="room_list"><div><p>자유게시판 : <%= pbr.getfreeBoardRank()%></p></div></li></a>
                
              </ul>
          </div>
          
          <div class="user_rank" >
            <div class="user_rank_bar">
              <p>유저 랭킹</p>
            </div>
			
			
			
			
			<div class="user_wrap">
				<ul>
				<%
					ReportDAO reportDAO = new ReportDAO();
					ArrayList<Report> list = reportDAO.getRankList(pageNumber);
					for(int i = 0; i < list.size(); i++){
				%>

                <div class="user"><li><p><%= list.get(i).getRank() %>등 <%= list.get(i).getUserID() %></p></li></div>

                <%
					}
				%>
		            
	            </ul>
			</div>
			
		
            <a href="rank.jsp">
              <div class="all_rank">
                <p>전체 랭킹보기</p>
              </div>
            </a>
          </div>

        </footer>
        </form>
    </div>

</body>
</html>