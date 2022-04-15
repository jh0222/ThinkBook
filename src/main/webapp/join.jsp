<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1.0">
<link rel="stylesheet" href="css/ID_bar.css" />
<link rel="stylesheet" href="css/sidebar.css" />
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
				<a href="join.jsp"><p>회원가입</p></a> 
				<a href="login.jsp"><p>로그인</p></a>

			</div>
		</div>

		<div class="main" style="background-image: url(images/back.jpg);">
			<div class="container">
				<center>
					<div class="jumbotron" style="padding-top: 20px;">
						<form method="post" action="joinAction.jsp">
							<h2 style="text-align: center;">회원가입 화면</h2>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20" required="required">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20" required="required">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
							</div>
							<div style="text-align: center;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
									</label>
									<label class="btn btn-primary">
										<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
									</label>
								</div>
								
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="생년월일" name="userBirthday" maxlength="20" required="required" style="">
							</div>
							<div class="form-group">
								<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20" required="required" style="">
							</div>
							<input type="submit" class="btn btn-primary form-control" value="회원가입" style="background-image: url(images/back.jpg); box-shadow: 1px 1px 1px 1px gray; width: 15%; height: 25px;">
						</form>
					</div>
				</center>
			</div>		
		</div>
	</div>

</body>
</html>