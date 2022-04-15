<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="discussionboard.BoardBean"%> 
<jsp:useBean id="bMgr" class="discussionboard.BoardMgr" />
<%
	  request.setCharacterEncoding("EUC-KR");
	  int num = Integer.parseInt(request.getParameter("num"));
	  String nowPage = request.getParameter("nowPage");
	  String keyField = request.getParameter("keyField");
	  String keyWord = request.getParameter("keyWord");
	  bMgr.upCount(num);//조회수 증가
	  BoardBean bean = bMgr.getBoard(num);//게시물 가져오기
	  String name = bean.getName();
	  String subject = bean.getSubject();
      String regdate = bean.getRegdate();
	  String content = bean.getContent();
	  String filename = bean.getFilename();
	  int filesize = bean.getFilesize();
	  String ip = bean.getIp();
	  int count = bean.getCount();
	  session.setAttribute("bean", bean);//게시물을 세션에 저장
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
<script type="text/javascript">
	function list(){
	    document.listFrm.submit();
	 } 
	
	function down(filename){
		 document.downFrm.filename.value=filename;
		 document.downFrm.submit();
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
        <div align="center" class="main">
			<br/><br/>
			<table align="center" class="main_bar" cellspacing="3">
			 <tr>
			  <td bgcolor="#c8c8c8" height="25" align="center">글읽기</td>
			 </tr>
			 <tr>
			  <td colspan="2">
			   <table cellpadding="3" cellspacing="0" width="100%"> 
			    <tr> 
			  <td align="center" bgcolor="#c8c8c8" width="10%"> 이 름 </td>
			  <td bgcolor="#f7f7f7" style="border: 1.5px solid #c8c8c8;"><%=name%></td>
			  <td align="center" bgcolor="#c8c8c8" width="10%"> 등록날짜 </td>
			  <td bgcolor="#f7f7f7" style="border: 1.5px solid #c8c8c8;"><%=regdate%></td>
			 </tr>
			 <tr> 
			    <td align="center" bgcolor="#c8c8c8"> 제 목</td>
			    <td bgcolor="#f7f7f7" colspan="3"><%=subject%></td>
			   </tr>
			   <tr> 
			     <td align="center" bgcolor="#c8c8c8">첨부파일</td>
			     <td bgcolor="#f7f7f7" colspan="3">
			     <% if( filename !=null && !filename.equals("")) {%>
			  		<a href="javascript:down('<%=filename%>')"><%=filename%></a>
			  		 &nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)</font>  
			  		 <%} else{%> 등록된 파일이 없습니다.<%}%>
			     </td>
			   </tr>
			   <tr> 
			    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
			   </tr>
			   <tr>
			    <td colspan="4" align="right">
			     <%=ip%>로 부터 글을 남기셨습니다./  조회수  <%=count%>
			    </td>
			   </tr>
			   </table>
			  </td>
			 </tr>
			 <tr>
			  <td align="center" colspan="2"> 
			 <hr/>
			 [ <a href="javascript:list()" >리스트</a> | 
			 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>" >수 정</a> |
			 <a href="reply.jsp?nowPage=<%=nowPage%>" >답 변</a> |
			 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br/>
			  </td>
			 </tr>
			</table>
			
			<form name="downFrm" action="download.jsp" method="post">
				<input type="hidden" name="filename">
			</form>
			
			<form name="listFrm" method="post" action="list.jsp">
				<input type="hidden" name="nowPage" value="<%=nowPage%>">
				<%if(!(keyWord==null || keyWord.equals(""))){ %>
				<input type="hidden" name="keyField" value="<%=keyField%>">
				<input type="hidden" name="keyWord" value="<%=keyWord%>">
				<%}%>
		</form>
</div>
</div>
</body>
</html>