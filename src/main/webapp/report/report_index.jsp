<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/reprotfirststyle.css"/>
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
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<div class="wrap">
		<%
		if (userID == null) { //로그인 되어있지 않을 때
		%>
		<header>
			<div class="headbar_logo">
				<a href="../index.jsp" class="active"><img src="../images/think.jpg"
					alt="logo"></a>
			</div>
			<div class="header_wrap">
				<div class="headbar_login">
					<a href="join.jsp"><input type="button" name="회원가입"
						value="회원가입"></a> <a href="login.jsp"><input
						type="button" name="로그인" value="로그인"></a>
				</div>
				
			</div>
		</header>
		<%
		} else {
		%>
		<header>
			<div class="headbar_logo">
				<a href="../index.jsp" class="active"><img src="../images/think.jpg"
					alt="logo"></a>
			</div>
			<div class="header_wrap">
				<div class="headbar_login">
					<a href="logoutAction.jsp"><input type="button" name="로그아웃"
						value="로그아웃"></a>
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
              <a href="../booksc.jsp">도서 찾기</a>
            </li>
        	<li>
              <a href="">마이페이지</a>
              <ul class="sub01">
                  <li><a href="../report/report_list.jsp">독후감</a></li>
                  <li><a href="../wishlist.jsp">마이 찜목록</a></li>
                  <li><a href="report_index.jsp">마이 게시판</a></li><!-- index로 바꿔놓음 -->
                  <li><a href="../myrank.jsp">마이 랭킹보기</a></li>
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

		<div class="side_bar"  style="background-image: url(../images/back.jpg);">
			<div class="side_bar_div">
				<a href="#"><p>마이페이지</p></a> 
				
			</div>
		</div>

        <div class="main">
            <p class="bookreporthead" style=" background:#c8c8c8;">독후감</p>
            <div class="reportfirst" style="border: 3px solid #c8c8c8;">
                <p>사용자가 쓴 독후감이 없습니다.<br>
                    독후감을 작성해주세요.</p>
                <a href="report_send.jsp"><input type="button" value="독후감 작성하기"></a>
            </div>         

        </div> 
    </div>
</body>
</html>