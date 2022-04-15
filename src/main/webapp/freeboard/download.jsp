<%@page contentType="application; charset=EUC-KR"%>
<jsp:useBean id="bMgr" class="freeboard.BoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%> 