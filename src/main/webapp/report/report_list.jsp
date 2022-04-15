<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="report.ReportDAO" %>
<%@ page import="report.Report" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/reportlist.css" />
<link rel="stylesheet" href="../css/sidebar.css"/>
<link rel="stylesheet" href="../css/head_all.css"/>
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
            <a href="../index.jsp"><img src="../images/think.jpg" alt="logo"></a>
          </div>
          <div class="header_wrap">
            
            <div class="headbar_login">
              <a href="../join.jsp"><input type="button" name="회원가입" value="회원가입" ></a>
              <a href="../login.jsp"><input type="button" name="로그인" value="로그인"></a>
            </div> 
             
          </div>           
        </header>
        <%
           	}else{
        %>
        <header>
          <div class="headbar_logo">
            <a href="../index.jsp" class="active"><img src="images/think.jpg" alt="logo"></a>
          </div>
          <div class="header_wrap">
          	<div class="headbar_login">
              <a href="../logoutAction.jsp"><input type="button" name="로그아웃" value="로그아웃" ></a>
            </div> 
              
          </div>           
        </header>
        <%
           	}
        %>  

		<div class="menu_box">
      <ul class="menu_box_list"> <li>
              <a href="../search/library.jsp">도서관 찾기</a>
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
                  <li ><a href="../discussionboard/list.jsp">독서토론게시판</a></li>
                  <li><a href="../borrowboard/list.jsp">도서대출게시판</a></li>
                  <li><a href="../freeboard/list.jsp">자유채팅게시판</a></li>
                </ul>
            </li>
    	</ul>
</div>

        <div class="side_bar" style="background-image: url(../images/back.jpg);">
          <div class="side_bar_div">
            <a href="#"><p>마이페이지</p></a>
            <a href="report_list.jsp"><p>독후감</p></a>
           
          </div>
        </div>

		<div class="main">
			<center>
				<div class="container">
					<div class="row">
						<table class="table table-striped"
							style="text-align: center; background-image: url(../images/back.jpg);border: 1.5px solid #c8c8c8;">
							<thead>
								<tr>
									<th style="background-color: #eeeee; text-align: center; border-bottom: 2px solid #c8c8c8; height: 30px;">번호</th>
									<th style="background-color: #eeeee; text-align: center; border-bottom: 2px solid #c8c8c8; height: 30px;">제목</th>
									<th style="background-color: #eeeee; text-align: center; border-bottom: 2px solid #c8c8c8; height: 30px;">작성자</th>
									<th style="background-color: #eeeee; text-align: center; border-bottom: 2px solid #c8c8c8; height: 30px;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<%
									ReportDAO reportDAO = new ReportDAO();
									ArrayList<Report> list = reportDAO.getList(pageNumber);
									for(int i = 0; i < list.size(); i++){
								%>
								<tr>
									<td><%= list.get(i).getrID() %></td>
									<td><a href="report_edit.jsp?rID=<%= list.get(i).getrID() %>"><%= list.get(i).getrTitle() %></a></td>
									<td><%= list.get(i).getUserID() %></td>
									<td><%= list.get(i).getrDate().substring(0, 11) + list.get(i).getrDate().substring(11, 13) + "시" + list.get(i).getrDate().substring(14, 16) + "분" %></td>
								</tr>
								<%
									}
								%>
							</tbody>
							
							</table>
					</div>
					<tfoot>
								<tr>
									<a href="report_send.jsp" class="btn-pull-right"><input type="button" value="글쓰기"  style=" background: silver; box-shadow: 1px 1px 1px 1px gray;" ></a>
								</tr>
							</tfoot>
				</div>
			</center>
			
		</div>
			
</body>
</html>