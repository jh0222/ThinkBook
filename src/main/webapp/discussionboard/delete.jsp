<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="discussionboard.BoardBean"%>
<jsp:useBean id="bMgr" class="discussionboard.BoardMgr" />
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
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	if (request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbPass = bean.getPass();
		if (inPass.equals(dbPass)) {
			bMgr.deleteBoard(num);
			String url = "list.jsp?nowPage=" + nowPage;
			response.sendRedirect(url);
		} else {
%>
<script type="text/javascript">
	alert("�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.");
	history.back();
</script>
<%}
	} else {
%>
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			alert("�н����带 �Է��ϼ���.");
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
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
            if(userID == null){ //�α��� �Ǿ����� ���� ��            	
        %>           
        <header>
          <div class="headbar_logo">
            <a href="../index.jsp"><img src="images/think.jpg" alt="logo"></a>
          </div>
          <div class="header_wrap">
            
            <div class="headbar_login">
              <a href="../join.jsp"><input type="button" name="ȸ������" value="ȸ������" ></a>
              <a href="../login.jsp"><input type="button" name="�α���" value="�α���"></a>
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
              <a href="../logoutAction.jsp"><input type="button" name="�α׾ƿ�" value="�α׾ƿ�" ></a>
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
              <a href="../search/library.jsp">������ ã��</a>
            </li>
            <li>
              <a href="../booksc.jsp">���� ã��</a>
            </li>
        	<li>
              <a href="">����������</a>
              <ul class="sub01">
                  <li><a href="../report/report_list.jsp">���İ�</a></li>
                  <li><a href="../wishlist.jsp">���� ����</a></li>
                  <li><a href="../myreport.jsp">���� ä�ù�</a></li>
                  <li><a href="../myrank.jsp">���� ��ŷ����</a></li>
                </ul>
            </li>
            <li>
              <a href="">�Խ���</a>
              <ul class="sub01">
                  <li ><a href="../discussionboard/list.jsp">������аԽ���</a></li>
                  <li><a href="../borrowboard/list.jsp">��������Խ���</a></li>
                  <li><a href="../freeboard/list.jsp">����ä�ðԽ���</a></li>
                </ul>
            </li>
    			</ul>
        </div>
		<div class="side_bar" style="background-image: url(../images/back.jpg);">
			<div class="side_bar_div">
	            <a><p>�Խ���</p></a>
	            <a href="../discussionboard/list.jsp"><p>������аԽ���</p></a>
	            <a href="../borrowboard/list.jsp"><p>��������Խ���</p></a>
	            <a href="../freeboard/list.jsp"><p>����ä�ðԽ���</p></a>
            </div>
        </div>
	<div align="center" class="main">
		<br/><br/>
		<table cellpadding="3" class="userpass">
			<tr>
				<td bgcolor=#c8c8c8  align="center" >
					������� ��й�ȣ�� �Է����ּ���.
				</td>
			</tr>
		</table>
		<form name="delFrm" method="post" action="delete.jsp">
			<table class="userpass" cellpadding="2">
				<tr>
					<td align="center">
						<table>
							<tr>
								<td align="center">
									<input type="password" name="pass" size="25" maxlength="15">
								</td>
							</tr>
							<tr>
								<td><hr size="1" color="#eeeeee"/></td>
							</tr>
							<tr>
								<td align="center">
									<input type="button" value="�����Ϸ�" onClick="check()" style="background: #c8c8c8;"> 
									<input type="reset" value="�ٽþ���" style="background: #c8c8c8;">
									<input type="button" value="�ڷ�" onClick="history.go(-1)" style="background: #c8c8c8;">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
			<input type="hidden" name="num" value="<%=num%>">
		</form>
	</div>
	<%}%>
	</div>
</body>
</html>