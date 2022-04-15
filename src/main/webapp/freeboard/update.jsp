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
		 alert("������ ���� �н����带 �Է��ϼ���.");
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
        
<div align="center" class="main"><br/><br/>
<table cellpadding="3" class="main_bar" style="border: 1.5px solid #c8c8c8;">
  <tr>
   <td bgcolor="#c8c8c8"  height="21" align="center">�����ϱ�</td>
  </tr>
</table>
<form name="updateFrm" method="post" action="boardUpdate">
<table cellpadding="7" class="main_board" style="border: 1.5px solid #c8c8c8;">
 <tr>
  <td>
   <table>
    <tr>
     <td style="border-bottom: 1.5px solid #c8c8c8;">�� ��</td>
     <td style="border-bottom: 1.5px solid #c8c8c8;">
	  <input name="name" value="<%=name%>" size="40" maxlength="20">
	 </td>
	</tr>
	<tr>
     <td style="border-bottom: 1.5px solid #c8c8c8;">�� ��</td>
     <td style="border-bottom: 1.5px solid #c8c8c8;">
	  <input name="subject" size="40" value="<%=subject%>" maxlength="50">
	 </td>
    <tr>
     <td  style="border-bottom: 1.5px solid #c8c8c8;">�� ��</td>
     <td  style="border-bottom: 1.5px solid #c8c8c8;">
	  <textarea name="content" rows="10" cols="50"><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td>��� ��ȣ</td> 
     <td><input type="password" name="pass" size="50" maxlength="15">
      ���� �ÿ��� ��й�ȣ�� �ʿ��մϴ�.</td>
    </tr>
	<tr>
     <td colspan="2" height="5"><hr/></td>
    </tr>
	<tr>
     <td colspan="2">
	  <input type="button" value="�����Ϸ�" onClick="check()">
      <input type="reset" value="�ٽü���"> 
      <input type="button" value="�ڷ�" onClick="history.go(-1)">
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