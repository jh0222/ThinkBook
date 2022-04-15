<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="report.ReportDAO" %>
<%@ page import="report.Report" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/reportsendstyle.css"/>
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
	if(userID == null){	//로그인 안됐을 때
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = 'login.jsp");
		script.println("</script>");
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
	if(!userID.equals(report.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'report_list.jsp");
		script.println("</script>");
	}
	%>
<div class="wrap">
        <header>
          <div class="headbar_logo">
            <a href="index.jsp"><img src="../images/think.jpg" alt="logo"></a>
          </div>
          <div class="header_wrap">
            
            <div class="headbar_login">
              <a href="../join.jsp"><input type="button" name="회원가입" value="회원가입" ></a>
              <a href="../login.jsp"><input type="button" name="로그인" value="로그인"></a>
            </div> 
             
          </div>           
        </header>

        <!-- -->
        <div class="menu_box">
      <ul class="menu_box_list"> <li>
              <a href="../search/library.jsp">도서관 찾기</a>
            </li>
            <li>
              <a href="../booksc.jsp">도서 찾기</a>
            </li>
        	<li>
              <a href="">마이페이지</a>
              <ul class="sub01">
                  <li><a href="report_list.jsp">독후감</a></li>
                 
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

            <a href="report_index.jsp"><p>독후감</p></a>
          
          </div>
        </div>

        <div class="main">
        <form method="post" action="reportupdateAction.jsp?rID=<%= rID %>">
            <p class="bookreporthead" style="width:30%; background: #c8c8c8;">독후감 수정</p>
            <div class="bookname">
              <p>제목</p>
              <input type="text" class="form-control" value="<%= report.getrTitle() %>" name="rTitle" maxlength="50" style="font-size: 20px; width:70%; border: solid 3px #c8c8c8;">
            </div>
            <div class="bookcontent">      
             <textarea class="form-control" name="rContent" maxlength="2048" style="font-size: 15px; height: 350px; margin: 1% 2%; width: 80%; border: solid 3px #c8c8c8;"><%= report.getrContent() %></textarea>
            </div>
              <div class="edit">
                <input type="submit" class="editbutton" value="독후감 수정하기">
              </div>
         </form>
        </div> 
    </div>
</body>
</html>