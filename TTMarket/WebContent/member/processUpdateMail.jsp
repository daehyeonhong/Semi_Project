<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp"%>
<%
	String sql = "update ttmember set mail=? where id=?";
	PreparedStatement preparedStatement = con.prepareStatement(sql);
	String id = (String) session.getAttribute("sessionId"),
	mail1 = request.getParameter("mail1"),
	mail2 = request.getParameter("mail2Val"),
	mail = mail1 + "@" + mail2;
	
	preparedStatement.setString(1, mail);
	preparedStatement.setString(2, id);
	int result = preparedStatement.executeUpdate();
	if (result > 0) {
		out.print("<script>alert('이메일 변경이 완료되었습니다!');location.href='../welcome.jsp'</script>");
	}
%>