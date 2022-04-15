<%@page contentType="application; charset=EUC-KR"%>
<jsp:useBean id="bMgr" class="borrowboard.BoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%> 