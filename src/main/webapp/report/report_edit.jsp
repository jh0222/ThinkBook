<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="report.ReportDAO" %>
<%@ page import="report.Report" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/reporteditstyle.css"/>
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
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int rID = 0;
	if(request.getParameter("rID") != null){
		rID = Integer.parseInt(request.getParameter("rID"));
	}
	if(rID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다')");
		script.println("location.href = 'report_list.jsp");
		script.println("</script>");
	}
	Report report = new ReportDAO().getReport(rID);
	%>
<div class="wrap">
        <header>
          <div class="headbar_logo">
            <a href="index.jsp"><img src="../images/think.jpg" alt="logo"></a>
          </div>
          <div class="header_wrap">
            
            <div class="headbar_login">
              <a href="join.jsp"><input type="button" name="회원가입" value="회원가입" ></a>
              <a href="login.jsp"><input type="button" name="로그인" value="로그인"></a>
            </div> 
             
          </div>           
        </header>

       
        <div class="menu_box">
          <ul class="menu_box_list">
            <li>
              <a href="libsc.jsp">도서관 찾기</a>
            </li>
            <li>
              <a href="genre.jsp">장르</a>
              <ul class="sub01">
                  <li ><a href="#">소설</a></li>
                  <li><a href="#">철학</a></li>
                  <li><a href="#">에세이</a></li>
                </ul>
            </li>
        		<li>
              <a href="mychatroom.jsp">마이페이지</a>
              <ul class="sub01">
                  <li ><a href="#">내정보수정</a></li>
                  <li><a href="report_index.jsp">독후감</a></li>
                  
                </ul>
            </li>
            <li>
              <a href="chatRoom_list.jsp">채팅방</a>
              <ul class="sub01">
                  <li ><a href="#">도서대출채팅방</a></li>
                  <li><a href="#">독서토론채팅방</a></li>
                  <li><a href="#">자유채팅방</a></li>
                </ul>
            </li>
    			</ul>
        </div>

        <div class="side_bar" style="background-image: url(../images/back.jpg);">
          <div class="side_bar_div">
            <a href="#"><p>마이페이지</p></a>
            
          </div>
        </div>

        <div class="main">
            <p class="bookreporthead" style="width:30%; background: #c8c8c8;">독후감 보기</p>
            <table style="margin:20; border: solid 3px #c8c8c8;">
            <tr>
            	<td style="border: solid 3px #c8c8c8; ">제목</td>
            	<td style="border: solid 3px #c8c8c8; width: 380px;"><%= report.getrTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/n", "<br>") %></td>
            </tr>
            <tr>
            	<td style="border: solid 3px #c8c8c8;">내용</td>
            	<td style="border: solid 3px #c8c8c8; width: 380px;"><%= report.getrContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("/n", "<br>") %></td>
            </tr>
            <tr>
            	<td style="border: solid 3px #c8c8c8;">작성일자</td>
            	<td style="border: solid 3px #c8c8c8; width: 380px;"><%= report.getrDate().substring(0, 11) + report.getrDate().substring(11, 13) + "시" + report.getrDate().substring(14, 16) + "분" %></td>
            </tr>
            </table>
             
              <div class="edit">
              	<a href="report_list.jsp"><input type="button" class="listbutton" value="독후감 목록"></a>
              	<%
              		if(userID != null && userID.equals(report.getUserID())){
              	%>
              		<a href="reportupdate.jsp?rID=<%= rID %>"><input type="button" class="editbutton" value="독후감 수정하기"></a>
              		<a onClick="return confirm('정말로 삭제하시겠습니까?')" href="reportdeleteAction.jsp?rID=<%= rID %>"><input type="button" class="deletebutton" value="독후감 삭제하기"></a>
              	<%
              		}
              	%>      
              </div>
        </div> 
    </div>
</body>
</html>
