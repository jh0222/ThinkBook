<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1.0">
<link rel="stylesheet" href="css/ID_bar.css" />
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
            if(userID == null){ //�α��� �Ǿ����� ���� ��            	
        %>           
        <header>
          <div class="headbar_logo">
            <a href="index.jsp"><img src="images/think.jpg" alt="logo"></a>
          </div>
          <div class="header_wrap">
            
            <div class="headbar_login">
              <a href="join.jsp"><input type="button" name="ȸ������" value="ȸ������" ></a>
              <a href="login.jsp"><input type="button" name="�α���" value="�α���"></a>
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
              <a href="logoutAction.jsp"><input type="button" name="�α׾ƿ�" value="�α׾ƿ�" ></a>
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
              <a href="search/library.jsp.jsp">������ ã��</a>
            </li>
            <li>
              <a href="booksc.jsp">���� ã��</a>
            </li>
        	<li>
              <a href="">����������</a>
              <ul class="sub01">
                  <li><a href="report/report_list.jsp">���İ�</a></li>
                  <li><a href="wishlist.jsp">���� ����</a></li>
                  <li><a href="myreport.jsp">���� ä�ù�</a></li>
                  <li><a href="myrank.jsp">���� ��ŷ����</a></li>
                </ul>
            </li>
            <li>
              <a href="">�Խ���</a>
              <ul class="sub01">
                  <li ><a href="discussionboard/list.jsp">������аԽ���</a></li>
                  <li><a href="borrowboard/list.jsp">��������Խ���</a></li>
                  <li><a href="freeboard/list.jsp">����ä�ðԽ���</a></li>
                </ul>
            </li>
    			</ul>
        </div>

		<div class="side_bar" style="background-image: url(images/back.jpg);">
			<div class="side_bar_div">
				<a href="join.jsp"><p>ȸ������</p></a> 
				<a href="login.jsp"><p>�α���</p></a>

			</div>
		</div>

		<div class="main"  style="background-image: url(images/back.jpg);">
			<div class="container">
				<center>
					<div class="jumbotron" style="padding-top: 20px;">
						<form method="post" action="loginAction.jsp">
							<h2 style="text-align: center;">�α��� ȭ��</h2>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="���̵�" name="userID" maxlength="20" >
							</div>
							<div class="form-group">
								<input type="password" class="form-control" placeholder="��й�ȣ" name="userPassword" maxlength="20">
							</div>
							<input type="submit" class="btn btn-primary form-control" value="�α���" style="background-image: url(images/back.jpg); box-shadow: 1px 1px 1px 1px gray; width: 15%; height: 25px;">
						</form>
					</div>
				</center>
			</div>		
		</div>
	</div>

</body>
</html>