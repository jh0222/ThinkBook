<%@page contentType="application; charset=EUC-KR"%>
<jsp:useBean id="bMgr" class="discussionboard.BoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%> 