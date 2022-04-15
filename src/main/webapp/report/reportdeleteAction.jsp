<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="report.ReportDAO"%>
<%@ page import="report.Report"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp");
			script.println("</script>");
		}
		int rID = 0;
		if(request.getParameter("rID") != null){
			rID = Integer.parseInt(request.getParameter("rID"));
		}
		if(rID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href = 'report_list.jsp");
			script.println("</script>");
		}
		Report report = new ReportDAO().getReport(rID);
		if(!userID.equals(report.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'report_list.jsp");
			script.println("</script>");
		} else{
			ReportDAO reportDAO = new ReportDAO();
			int result = reportDAO.reportdelete(rID);
			if(result == -1){ 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'report_list.jsp'");
				script.println("</script>");
			}
		}	
	%>

</body>
</html>