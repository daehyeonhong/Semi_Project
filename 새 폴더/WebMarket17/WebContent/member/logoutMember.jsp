<%@ page contentType="text/html; charset=UTF-8"%>
<%
	session.invalidate();//접속한 세션정보 삭제
	response.sendRedirect("loginMember.jsp");
%>
