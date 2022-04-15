<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="freeboard.BoardBean"%>
<%
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  BoardBean bean = (BoardBean)session.getAttribute("bean");
	  String subject = bean.getSubject();
	  String name = bean.getName(); 
	  String content = bean.getContent(); 
%>
<html>
<head>
<title>JSP Board</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/freeboard_post.css"/>
<link rel="stylesheet" href="../css/sidebar.css"/>
<link rel="stylesheet" href="../css/head_all.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/jquery.lightBox.min.js"></script>
<script>
	function check() {
	   if (document.updateFrm.pass.value == "") {
		 alert("수정을 위해 패스워드를 입력하세요.");
		 document.updateFrm.pass.focus();
		 return false;
		 }
	   document.updateFrm.submit();
	}
</script>
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
            <a href="../index.jsp"><img src="images/think.jpg" alt="logo"></a>
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

		<!-- -->
		<div class="menu_box">
          <ul class="menu_box_list">

            <li>
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
                  <li><a href="../myreport.jsp">마이 채팅방</a></li>
                  <li><a href="../myrank.jsp">마이 랭킹보기</a></li>
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
	            <a><p>게시판</p></a>
	            <a href="../discussionboard/list.jsp"><p>독서토론게시판</p></a>
	            <a href="../borrowboard/list.jsp"><p>도서대출게시판</p></a>
	            <a href="../freeboard/list.jsp"><p>자유채팅게시판</p></a>
            </div>
        </div>
        
<div align="center" class="main"><br/><br/>
<table cellpadding="3" class="main_bar" style="border: 1.5px solid #c8c8c8;">
  <tr>
   <td bgcolor="#c8c8c8"  height="21" align="center">수정하기</td>
  </tr>
</table>
<form name="updateFrm" method="post" action="boardUpdate">
<table cellpadding="7" class="main_board" style="border: 1.5px solid #c8c8c8;">
 <tr>
  <td>
   <table>
    <tr>
     <td style="border-bottom: 1.5px solid #c8c8c8;">성 명</td>
     <td style="border-bottom: 1.5px solid #c8c8c8;">
	  <input name="name" value="<%=name%>" size="40" maxlength="20">
	 </td>
	</tr>
	<tr>
     <td style="border-bottom: 1.5px solid #c8c8c8;">제 목</td>
     <td style="border-bottom: 1.5px solid #c8c8c8;">
	  <input name="subject" size="40" value="<%=subject%>" maxlength="50">
	 </td>
    <tr>
     <td  style="border-bottom: 1.5px solid #c8c8c8;">내 용</td>
     <td  style="border-bottom: 1.5px solid #c8c8c8;">
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td>비밀 번호</td> 
     <td><input type="password" name="pass" size="50" maxlength="15">
      수정 시에는 비밀번호가 필요합니다.</td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="button" value="수정완료" onClick="check()">
      <input type="reset" value="다시수정"> 
      <input type="button" value="뒤로" onClick="history.go(-1)">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
 <input type="hidden" name="nowPage" value="<%=nowPage %>">
 <input type='hidden' name="num" value="<%=num%>">
</form> 
</div>
</div>
</body>
</html>