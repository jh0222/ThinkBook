<%@ page contentType="text/html; charset=EUC-KR" %>
<%@page import="freeboard.BoardBean"%> 
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="freeboard.BoardMgr" />
<%	
	  request.setCharacterEncoding("EUC-KR");
	  
      int totalRecord=0; //��ü���ڵ��
	  int numPerPage=10; // �������� ���ڵ� �� 
	  int pagePerBlock=15; //���� �������� 
	  
	  int totalPage=0; //��ü ������ ��
	  int totalBlock=0;  //��ü ���� 

	  int nowPage=1; // ����������
	  int nowBlock=1;  //�����
	  
	  int start=0; //����� select ���۹�ȣ
	  int end=10; //���۹�ȣ�� ���� ������ select ����
	  
	  int listSize=0; //���� �о�� �Խù��� ��

	String keyWord = "", keyField = "";
	Vector<BoardBean> vlist = null;
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  //��ü��������
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); //����� ���
	  
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  //��ü�����
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
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		 document.readFrm.submit();
	} 
	
	function read(num){
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
	
	function check() {
	     if (document.searchFrm.keyWord.value == "") {
	   alert("�˻�� �Է��ϼ���.");
	   document.searchFrm.keyWord.focus();
	   return;
	     }
	  document.searchFrm.submit();
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
	<br/>
	<h2>�����Խ���</h2>
	<br/>
	<table align="center" class="main_bar" >
			<tr>
				<td>Total : <%=totalRecord%>Articles(<font color="red">
				<%=nowPage%>/<%=totalPage%>Pages</font>)</td>
			</tr>
	</table>
	<table align="center" class="main_board" cellpadding="3" style="border: 1.5px solid #c8c8c8;">
		<tr>
			<td align="center" colspan="2">
			<%
				  vlist = bMgr.getBoardList(keyField, keyWord, start, end);
				  listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
				  if (vlist.isEmpty()) {
					out.println("��ϵ� �Խù��� �����ϴ�.");
				  } else {
			%>
				  <table width="100%" cellpadding="2" cellspacing="0">
					<tr align="center" bgcolor="#D0D0D0" height="120%">
						<td>�� ȣ</td>
						<td>�� ��</td>
						<td>�� ��</td>
						<td>�� ¥</td>
						<td>��ȸ��</td>
					</tr>
					<%
						  for (int i = 0;i<numPerPage; i++) {
							if (i == listSize) break;
							BoardBean bean = vlist.get(i);
							int num = bean.getNum();
							String name = bean.getName();
							String subject = bean.getSubject();
							String regdate = bean.getRegdate();
							int depth = bean.getDepth();
							int count = bean.getCount();
					%>
					<tr>
						<td align="center">
							<%=totalRecord-((nowPage-1)*numPerPage)-i%>
						</td>
						<td>
						<%
							  if(depth>0){
								for(int j=0;j<depth;j++){
									out.println("&nbsp;&nbsp;");
									}
								}
						%>
						  <a href="javascript:read('<%=num%>')"><%=subject%></a>
						</td>
						<td align="center"><%=name%></td>
						<td align="center"><%=regdate%></td>
						<td align="center"><%=count%></td>
						</tr>
					<%}//for%>
				</table> <%
 			}//if
 		%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><br /><br /></td>
		</tr>
		<tr>
			<td>
			<!-- ����¡ �� �� ó�� Start--> 
			<%
   				  int pageStart = (nowBlock -1)*pagePerBlock + 1 ; //�ϴ� ������ ���۹�ȣ
   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  (pageStart + pagePerBlock): totalPage+1; 
   				  //�ϴ� ������ ����ȣ
   				  if(totalPage !=0){
    			  	if (nowBlock > 1) {%>
    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp; 
    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
     			     	<a href="javascript:pageing('<%=pageStart %>')"> 
     					<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
     					[<%=pageStart %>] 
     					<%if(pageStart==nowPage) {%></font> <%}%></a> 
    					<%}//for%>&nbsp; 
    					<%if (totalBlock > nowBlock ) {%>
    					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
    				<%}%>&nbsp;  
   				<%}%>
 				<!-- ����¡ �� �� ó�� End-->
				</td>
				<td align="right">
					<a href="post.jsp">[�۾���]</a> 
					<a href="javascript:list()">[ó������]</a>
				</td>
			</tr>
		</table>
	<hr width="600"/>
	<form  name="searchFrm"  method="get" action="list.jsp">
	<table width="600" cellpadding="4" cellspacing="0">
 		<tr>
  			<td align="center" valign="bottom">
   				<select name="keyField" size="1" >
    				<option value="name"> �� ��</option>
    				<option value="subject"> �� ��</option>
    				<option value="content"> �� ��</option>
   				</select>
   				<input size="16" name="keyWord">
   				<input type="button"  value="ã��" onClick="javascript:check()">
   				<input type="hidden" name="nowPage" value="1">
  			</td>
 		</tr>
	</table>
	</form>
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> 
		<input type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="get">
		<input type="hidden" name="num"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="keyField" value="<%=keyField%>"> 
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
</div>
</div>
</body>
</html>